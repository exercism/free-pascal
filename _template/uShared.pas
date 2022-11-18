unit uShared;

// This file contains shared code between exercises
// Putting it right besides the project files ensures that a student can use the example right away,
// and dosnt need to build some third party project.
//
// If you change this file, please edit the source in _template/uShared.pas and update it then for
// all exercises by running bin/update-exercises.

interface

uses
  sysutils, classes, getopts,
  fpcunit, testregistry, testreport, testutils;

{$PUSH}
{$WARN 5024 OFF : Parameter "$1" not used}

type
  TCustomResultWriter = class(TNoRefCountObject, ITestListener)
  private
    fileOutput: TFileStream;
    lastNotSuccess: Boolean;
    procedure XmlWriteln(str: String);

  public
    constructor Create;
    destructor Destroy; override;

    procedure SetXMLOutput(aXmlOutputPath: String);
    procedure WriteHeader;
    procedure WriteResult(aResult: TTestResult);
  {ITestListener}
    procedure AddFailure(ATest: TTest; AFailure: TTestFailure);
    procedure AddError(ATest: TTest; AError: TTestFailure);
    procedure StartTest(ATest: TTest);
    procedure EndTest(ATest: TTest);
    procedure StartTestSuite(ATestSuite: TTestSuite);
    procedure EndTestSuite(ATestSuite: TTestSuite);
  end;

implementation

{$PUSH}
{$WARN 5024 OFF : Parameter "$1" not used}

constructor TCustomResultWriter.Create;
var
  c: char;
  optionindex: LongInt;
  theopts: array[1..1] of TOption;
begin
  fileOutput := Nil;
  lastNotSuccess := False;

  with theopts[1] do
  begin
    Name := 'xml';
    Has_arg := 1;
    Flag := nil;
    Value := #0;
  end;

  optionindex := 0;
  c := #0;
  repeat
    c := GetLongOpts('', @theopts[1], optionindex);
    case c of
      #0 : begin
        if optionindex = 1 then
          SetXMLOutput(OptArg);
      end;
    end; { case }
  until (c = EndOfOptions);

end;

destructor TCustomResultWriter.Destroy;
begin
  if (fileOutput <> Nil) then
  begin
    fileOutput.Destroy;
  end;
end;

procedure TCustomResultWriter.XmlWriteln(str: String);
var
  len: Cardinal;
  oString: UTF8String;
begin
  if (fileOutput <> Nil) then
  begin
    oString := UTF8String(str);
    len := length(oString);
    if len > 0 then
      fileOutput.WriteBuffer( oString[1], len );
    fileOutput.WriteByte(10); // newline
  end;
end;

procedure TCustomResultWriter.SetXMLOutput(aXmlOutputPath: String);
begin
  fileOutput := TFileStream.Create(aXmlOutputPath, fmCreate OR fmOpenWrite);
end;

procedure TCustomResultWriter.WriteHeader;
begin
  if (fileOutput <> Nil) then
  begin
    XmlWriteln('<testresults>');
    XmlWriteln('<testlisting>');
  end;
end;

procedure TCustomResultWriter.WriteResult(aResult: TTestResult);
begin
  WriteLn('');
  WriteLn('');
  WriteLn(TestResultAsPlain(aResult));

  if (fileOutput <> Nil) then
  begin
    XmlWriteln('</testlisting>');
    XmlWriteln(TestResultAsXML(aResult));
    XmlWriteln('</testresults>');
  end;
end;

procedure TCustomResultWriter.AddFailure(ATest: TTest; AFailure: TTestFailure);
begin
  Write('F');
  lastNotSuccess := True;

  if (fileOutput <> Nil) then
  begin
    XmlWriteln('<failure ExceptionClassName="' + AFailure.ExceptionClassName + '">');
    XmlWriteln('<message>' + AFailure.ExceptionMessage + '</message>');
    XmlWriteln('</failure>');
  end;
end;

procedure TCustomResultWriter.AddError(ATest: TTest; AError: TTestFailure);
begin
  Write('E');
  lastNotSuccess := True;

  if (fileOutput <> Nil) then
  begin
    XmlWriteln('<error ExceptionClassName="' + AError.ExceptionClassName + '">');
    XmlWriteln('<message>' + AError.ExceptionMessage + '</message>');
    XmlWriteln('<sourceunit>' + AError.SourceUnitName + '</sourceunit>');
    XmlWriteln('<methodname>' + AError.FailedMethodName + '</methodname>');
    XmlWriteln('<linenumber>' + IntToStr(AError.LineNumber) + '</linenumber>');
    XmlWriteln('</error>');
  end;
end;

procedure TCustomResultWriter.StartTest(ATest: TTest);
begin
  lastNotSuccess := False;

  if (fileOutput <> Nil) then
  begin
    XmlWriteln('<test name="' + ATest.TestSuiteName + '.' + ATest.TestName + '">');
  end;
end;

procedure TCustomResultWriter.EndTest(ATest: TTest);
begin
  if (NOT lastNotSuccess) then
    Write('.');

  if (fileOutput <> Nil) then
    XmlWriteln('</test>');
end;

procedure TCustomResultWriter.StartTestSuite(ATestSuite: TTestSuite);
begin
end;

procedure TCustomResultWriter.EndTestSuite(ATestSuite: TTestSuite);
begin
end;

{$POP}

end.