{
	Partial implementation of TAP version 14 producer.
	https://testanything.org/tap-version-14-specification.html

	Features:
	- outputs valid TAP
	- minimal interface with a few helpers for basic Pascal types
	- configurable output destination
	- keeps track of suite / subtest state (passed / executed)
	- simple and small, easy to extend

	Missing TAP v14 features:
	- YAML diagnostics

	This unit contains the internals of this TAP implementation. For normal
	usage, see TAP unit.
}
unit TAPCore;

{$mode objfpc}{$H+}{$J-}

interface

uses sysutils;

type
	TSkippedType = (stNoSkip, stSkip, stTodo, stSkipAll);
	TFatalType = (ftNoFatal, ftFatalSingle, ftFatalAll);
	TBailoutType = (btHalt, btException, btExceptionNoOutput);
	TTAPPrinter = procedure(const GLine: String; GDiag: Boolean) of Object;

	EBailout = class(Exception);

	{
		TTAPContext is the main class which keeps track of tests performed and
		outputs TAP. It can be used directly, but this is considered advanced
		usage. Instead, use the helper procedures provided by TAPHelpers unit to
		manipulate the global object.
	}
	TTAPContext = class
	const
		cTAPOk = 'ok ';
		cTAPNot = 'not ';
		cTAPComment = '# ';
		cTAPSubtest = 'Subtest: ';
		cTAPSubtestIndent = '    ';
		cTAPTodo = 'TODO ';
		cTAPSkip = 'SKIP ';
		cTAPBailOut = 'Bail out! ';
		cTAPPragma = 'pragma ';

	strict private
		FParent: TTAPContext;
		FNested: UInt32;
		FName: String;

		FExecuted: UInt32;
		FPassed: UInt32;
		FPlanned: Boolean;
		FPlan: UInt32;

		FSkipped: TSkippedType;
		FSkippedReason: String;
		FFatal: TFatalType;

		FPrinter: TTAPPrinter;
		FBailoutBehavior: TBailoutType;

		procedure PrintToStandardOutput(const Line: String; Diag: Boolean);

		procedure Print(Vals: Array of String; Diag: Boolean = False);
		procedure PrintDiag(const TestName, Expected, Got: String);

	public
		constructor Create(Parent: TTAPContext = nil); virtual;

		procedure Skip(Skip: TSkippedType; const Reason: String); virtual;
		procedure Ok(Passed: Boolean; const TestName, Expected, Got: String); virtual;

		procedure Comment(const Text: String; Diag: Boolean = False); virtual;
		procedure Pragma(const Pragma: String; Status: Boolean = True); virtual;
		procedure Plan(Number: UInt32; const Reason: String = ''; SkipIfPlanned: Boolean = False); virtual;
		procedure BailOut(const Reason: String); virtual;

		function SubtestBegin(const TestName: String): TTAPContext; virtual;
		function SubtestEnd(): TTAPContext; virtual;

		property TestsExecuted: UInt32 read FExecuted;
		property TestsPassed: UInt32 read FPassed;
		property Fatal: TFatalType read FFatal write FFatal;
		property Printer: TTAPPrinter read FPrinter write FPrinter;
		property BailoutBehavior: TBailoutType read FBailoutBehavior write FBailoutBehavior;
	end;

	TTAPContextClass = class of TTAPContext;

var
	TAPGlobalContext: TTAPContext;

implementation

// Hidden helpers

function Escaped(const Val: String): String;
begin
	result := StringReplace(Val, '\', '\\', [rfReplaceAll]);
	result := StringReplace(result, '#', '\#', [rfReplaceAll]);
end;

// Object interface

procedure TTAPContext.PrintToStandardOutput(const Line: String; Diag: Boolean);
begin
	if Diag then
		writeln(StdErr, Line)
	else
		writeln(Line);
end;

procedure TTAPContext.Print(Vals: Array of String; Diag: Boolean = False);
var
	LStr: String;
	LInd: Int32;
begin
	LStr := '';
	for LInd := 1 to FNested do
		LStr += cTAPSubtestIndent;

	for LInd := low(Vals) to high(Vals) do begin
		LStr += Vals[Int32(LInd)];
	end;

	FPrinter(LStr, Diag);
end;

procedure TTAPContext.PrintDiag(const TestName, Expected, Got: String);
begin
	if length(TestName) > 0 then
		self.Comment('Failed test ''' + TestName + '''', True)
	else
		self.Comment('Failed test', True);

	self.Comment('expected: ' + Expected, True);
	self.Comment('     got: ' + Got, True);
	self.Comment('', True);
end;

constructor TTAPContext.Create(Parent: TTAPContext = nil);
begin
	FParent := Parent;
	FName := '';

	FPassed := 0;
	FExecuted := 0;
	FPlanned := False;
	FPlan := 0;

	if Parent <> nil then begin
		FNested := Parent.FNested + 1;
		FSkipped := Parent.FSkipped;
		FSkippedReason := Parent.FSkippedReason;
		FFatal := Parent.FFatal;

		FPrinter := Parent.FPrinter;
		FBailoutBehavior := Parent.FBailoutBehavior;
	end
	else begin
		FNested := 0;
		FSkipped := stNoSkip;
		FSkippedReason := '';
		FFatal := ftNoFatal;

		FPrinter := @self.PrintToStandardOutput;
		FBailoutBehavior := btHalt;
	end;
end;

procedure TTAPContext.Comment(const Text: String; Diag: Boolean = False);
begin
	if FSkipped = stSkipAll then exit;

	if length(Text) > 0 then
		self.Print([cTAPComment, Text], Diag)
	else
		self.Print([], Diag);
end;

procedure TTAPContext.Skip(Skip: TSkippedType; const Reason: String);
begin
	if FSkipped = stSkipAll then exit;

	if Skip = stSkipAll then begin
		if FExecuted > 0 then
			self.BailOut('cannot skip a running test');

		self.Plan(0, cTAPSkip + Reason);
	end;

	FSkipped := Skip;
	FSkippedReason := Reason;
end;

procedure TTAPContext.Ok(Passed: Boolean; const TestName, Expected, Got: String);
var
	LResult: String;
	Skipped: Boolean;
begin
	if FSkipped = stSkipAll then exit;
	Skipped := FSkipped <> stNoSkip;

	FExecuted += 1;
	FPassed += Integer(Passed);

	LResult := cTAPOk;
	if not Passed then
		LResult := cTAPNot + LResult;

	LResult += IntToStr(FExecuted);

	if length(TestName) > 0 then
		LResult += ' - ' + Escaped(TestName);

	case FSkipped of
		stSkip: LResult += ' ' + cTAPComment + cTAPSkip + FSkippedReason;
		stTodo: LResult += ' ' + cTAPComment + cTAPTodo + FSkippedReason;
	else
	end;

	self.Print([LResult]);
	if (not Passed) and (not Skipped) then begin
		self.PrintDiag(TestName, Expected, Got);
	end;

	self.Skip(stNoSkip, '');

	if FFatal <> ftNoFatal then begin
		if FFatal = ftFatalSingle then FFatal := ftNoFatal;
		if (not Passed) and (not Skipped) then self.BailOut('fatal test failure');
	end;
end;

procedure TTAPContext.Pragma(const Pragma: String; Status: Boolean = True);
var
	PragmaStatus: Char;
begin
	if FSkipped = stSkipAll then exit;

	if Status then
		PragmaStatus := '+'
	else
		PragmaStatus := '-';

	self.Print([cTAPPragma, PragmaStatus, Pragma]);
end;

procedure TTAPContext.Plan(Number: UInt32; const Reason: String = ''; SkipIfPlanned: Boolean = False);
var
	LFullReason: String;
begin
	if FSkipped = stSkipAll then exit;

	if FPlanned then begin
		if SkipIfPlanned then exit;
		self.BailOut('cannot plan twice');
	end;

	FPlan := Number;
	FPlanned := True;

	if length(Reason) > 0 then
		LFullReason := ' ' + cTAPComment + Escaped(Reason)
	else
		LFullReason := '';

	self.Print(['1..', IntToStr(Number), LFullReason]);
end;

procedure TTAPContext.BailOut(const Reason: String);
begin
	if FSkipped = stSkipAll then exit;

	// not using self.Print causes bailout to be printed at top TAP
	// level (compatibility with TAP 13)
	if FBailoutBehavior <> btExceptionNoOutput then
		FPrinter(cTAPBailOut + Escaped(Reason), False);

	case FBailoutBehavior of
		btHalt: halt(255);
		btException, btExceptionNoOutput: raise EBailout.Create(Reason);
	end;
end;

function TTAPContext.SubtestBegin(const TestName: String): TTAPContext;
begin
	result := TTAPContextClass(self.ClassType).Create(self);
	result.FName := TestName;

	self.Comment(cTAPSubtest + TestName);
end;

function TTAPContext.SubtestEnd(): TTAPContext;
begin
	if FParent = nil then
		self.BailOut('no subtest to end');

	result := FParent;

	self.Plan(FExecuted, '', True);
	if FSkipped = stSkipAll then result.Skip(stSkip, FSkippedReason);
	result.Ok(FPlan = FPassed, FName, 'pass', 'fail');
	Free;
end;

initialization
	TAPGlobalContext := TTAPContext.Create;

finalization
	if TAPGlobalContext <> nil then
		TAPGlobalContext.Free;

end.

