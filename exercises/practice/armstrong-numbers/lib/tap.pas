{
	This unit provides helpers for producing TAP output. Using its code you can
	easily add your own helpers in the same manner in another unit like
	CustomTAP.
}
unit TAP;

{$mode objfpc}{$H+}{$J-}

interface

uses TAPCore, sysutils;

{
	Adds a note to the TAP output as a comment in a new line
}
procedure Note(const Text: String);

{
	Adds diagnostics to the TAP output as a comment. Will be outputed to standard error.
}
procedure Diag(const Text: String);

{
	Marks the next test fatal. Not passing the test will cause the bailout.
}
procedure Fatal();
procedure FatalAll(Enabled: Boolean = True);

{
	Skips the next test executed (just one). Can also todo the next test or
	skip all tests.
}
procedure Skip(const Reason: String = '');
procedure Todo(const Reason: String = '');
procedure SkipAll(const Reason: String = '');

{
	Adds a new unconditionally passing testpoint to the output
}
procedure TestPass(const TestName: String = '');

{
	Adds a new unconditionally failing testpoint to the output
}
procedure TestFail(const TestName: String = ''; const Diag: String = '(nothing)');

{
	Tests whether the boolean passed as first argument is a true value. Adds a
	testpoint to the output depending on that test. In case of a failure, extra
	diagnostics may be added as comments.
}
procedure TestOk(Passed: Boolean; const TestName: String = '');

{
	Compares two first arguments and adds a testpoint to the output based on
	comparison result, much like TestOk. Can compare Integers, Strings,
	Booleans and Object classes. Comparing Floats for equality is flawed on the
	basic level, so no Float variant is provided.
}
procedure TestIs(Got, Expected: Int64; const TestName: String = '');
procedure TestIs(const Got, Expected: String; const TestName: String = '');
procedure TestIs(Got, Expected: Boolean; const TestName: String = '');
procedure TestIs(Got: TObject; Expected: TClass; const TestName: String = '');

{
	Same as TestIs, but fails if the arguments are equal.
}
procedure TestIsnt(Got, Expected: Int64; const TestName: String = '');
procedure TestIsnt(const Got, Expected: String; const TestName: String = '');
procedure TestIsnt(Got, Expected: Boolean; const TestName: String = '');
procedure TestIsnt(Got: TObject; Expected: TClass; const TestName: String = '');

{
	Compares two numbers to determine whether one is greater than the other.
}
procedure TestGreater(Got, Expected: Int64; const TestName: String = '');
procedure TestGreater(Got, Expected: Double; const TestName: String = '');
procedure TestGreaterOrEqual(Got, Expected: Int64; const TestName: String = '');
procedure TestLesser(Got, Expected: Int64; const TestName: String = '');
procedure TestLesser(Got, Expected: Double; const TestName: String = '');
procedure TestLesserOrEqual(Got, Expected: Int64; const TestName: String = '');

{
	Tests whether two floating point values are within the precision of each other.
}
procedure TestWithin(Got, Expected, Precision: Double; const TestName: String = '');

{
	Outputs a pragma. Since pragmas are implementation-specific, no predefined
	list exists and full string name of the pragma must be specified.
}
procedure Pragma(const Pragma: String; Status: Boolean = True);

{
	Adds an explicit plan to the output. Best run before running other tests.
	If you don't want to count tests manually you can finish your test with
	DoneTesting instead.
}
procedure Plan(Number: UInt32; const Reason: String = '');

{
	Outputs a plan based on the number of tests ran (if it was not printed
	already)
}
procedure DoneTesting();

{
	Bails out of the test. By default, it will be done by halting the program
	with exit code 255.
}
procedure BailOut(const Reason: String);

{
	Starts a subtest. All subtests must be closed with SubtestEnd for valid
	output to be produced.
}
procedure SubtestBegin(const TestName: String);
procedure SubtestEnd();

implementation

// Hidden helpers

function Quoted(const Val: String): String;
begin
	result := '''' + Val + '''';
end;

function BoolToReadableStr(Bool: Boolean): String;
begin
	if Bool then
		result := 'True'
	else
		result := 'False';
end;

// TAP Interface

procedure Note(const Text: String);
begin
	TAPGlobalContext.Comment(Text);
end;

procedure Diag(const Text: String);
begin
	TAPGlobalContext.Comment(Text, True);
end;

procedure Fatal();
begin
	if TAPGlobalContext.Fatal <> ftFatalAll then
		TAPGlobalContext.Fatal := ftFatalSingle;
end;

procedure FatalAll(Enabled: Boolean = True);
begin
	if Enabled then
		TAPGlobalContext.Fatal := ftFatalAll
	else
		TAPGlobalContext.Fatal := ftNoFatal;
end;


procedure Skip();
begin
	TAPGlobalContext.Skip(stSkip, '');
end;

procedure Skip(const Reason: String = '');
begin
	TAPGlobalContext.Skip(stSkip, Reason);
end;

procedure Todo(const Reason: String = '');
begin
	TAPGlobalContext.Skip(stTodo, Reason);
end;

procedure SkipAll(const Reason: String = '');
begin
	TAPGlobalContext.Skip(stSkipAll, Reason);
end;

procedure TestPass(const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		True,
		TestName,
		'',
		''
	);
end;

procedure TestFail(const TestName: String = ''; const Diag: String = '(nothing)');
begin
	TAPGlobalContext.Ok(
		False,
		TestName,
		Diag,
		'failure'
	);
end;

procedure TestOk(Passed: Boolean; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Passed,
		TestName,
		BoolToReadableStr(True),
		BoolToReadableStr(False)
	);
end;

procedure TestIs(Got, Expected: Int64; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got = Expected,
		TestName,
		IntToStr(Expected),
		IntToStr(Got)
	);
end;

procedure TestIs(const Got, Expected: String; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got = Expected,
		TestName,
		Quoted(Expected),
		Quoted(Got)
	);
end;

procedure TestIs(Got, Expected: Boolean; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got = Expected,
		TestName,
		BoolToReadableStr(Expected),
		BoolToReadableStr(Got)
	);
end;

procedure TestIs(Got: TObject; Expected: TClass; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got is Expected,
		TestName,
		'object of class ' + Expected.ClassName,
		'object of class ' + Got.ClassName
	);
end;

procedure TestIsnt(Got, Expected: Int64; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		not(Got = Expected),
		TestName,
		'not ' + IntToStr(Expected),
		IntToStr(Got)
	);
end;

procedure TestIsnt(const Got, Expected: String; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		not(Got = Expected),
		TestName,
		'not ' + Quoted(Expected),
		Quoted(Got)
	);
end;

procedure TestIsnt(Got, Expected: Boolean; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		not(Got = Expected),
		TestName,
		'not ' + BoolToReadableStr(Expected),
		BoolToReadableStr(Got)
	);
end;

procedure TestIsnt(Got: TObject; Expected: TClass; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		not(Got is Expected),
		TestName,
		'not object of class ' + Expected.ClassName,
		'object of class ' + Got.ClassName
	);
end;

procedure TestGreater(Got, Expected: Int64; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got > Expected,
		TestName,
		'more than ' + IntToStr(Expected),
		IntToStr(Got)
	);
end;

procedure TestGreater(Got, Expected: Double; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got > Expected,
		TestName,
		'more than ' + FloatToStr(Expected),
		FloatToStr(Got)
	);
end;

procedure TestGreaterOrEqual(Got, Expected: Int64; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got >= Expected,
		TestName,
		'at least ' + IntToStr(Expected),
		IntToStr(Got)
	);
end;

procedure TestLesser(Got, Expected: Int64; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got < Expected,
		TestName,
		'less than ' + IntToStr(Expected),
		IntToStr(Got)
	);
end;

procedure TestLesser(Got, Expected: Double; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got < Expected,
		TestName,
		'less than ' + FloatToStr(Expected),
		FloatToStr(Got)
	);
end;

procedure TestLesserOrEqual(Got, Expected: Int64; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		Got <= Expected,
		TestName,
		'at most ' + IntToStr(Expected),
		IntToStr(Got)
	);
end;

procedure TestWithin(Got, Expected, Precision: Double; const TestName: String = '');
begin
	TAPGlobalContext.Ok(
		abs(Got - Expected) < Precision,
		TestName,
		FloatToStr(Expected) + ' +-' + FloatToStr(Precision),
		FloatToStr(Got)
	);
end;

procedure Pragma(const Pragma: String; Status: Boolean = True);
begin
	TAPGlobalContext.Pragma(Pragma, Status);
end;

procedure Plan(Number: UInt32; const Reason: String = '');
begin
	TAPGlobalContext.Plan(Number, Reason);
end;

procedure DoneTesting();
begin
	TAPGlobalContext.Plan(TAPGlobalContext.TestsExecuted, '', True);
end;

procedure BailOut(const Reason: String);
begin
	TAPGlobalContext.BailOut(Reason);
end;

procedure SubtestBegin(const TestName: String);
begin
	TAPGlobalContext := TAPGlobalContext.SubtestBegin(TestName);
end;

procedure SubtestEnd();
begin
	TAPGlobalContext := TAPGlobalContext.SubtestEnd;
end;

end.

