unit uShared;

// This file contains shared code between exercises
// Putting it right besides the project files ensures that a student can use the example right away,
// and dosnt need to build some third party project.
//
// If you change this file, please edit the source in _template/uShared.pas and update it then for
// all exercises by running bin/update-exercises.

interface

uses
  sysutils, classes, getopts, dom, xmlwrite, dateutils,
  fpcunit, testregistry, testreport, testutils;

type
  TCustomResultWriter = class(TNoRefCountObject, ITestListener)
  private
    fileOutput: TFileStream;
    lastNotSuccess: Boolean;
    doc: TXMLDocument;
    rootNode: TDOMElement;
    curTestCaseNode: TDOMElement;
    testCount: Integer;
    suiteName: String;

  public

    constructor Create(aSuiteName: String);
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

constructor TCustomResultWriter.Create(aSuiteName: String);
var
  c: char;
  optionindex: LongInt;
  theopts: array[1..1] of TOption;
begin
  fileOutput := Nil;
  doc := Nil;
  lastNotSuccess := False;
  testCount := 0;
  suiteName := aSuiteName;

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
  if (doc <> Nil) then
  begin
    fileOutput.Destroy;
    doc.Free;
  end;
end;

procedure TCustomResultWriter.SetXMLOutput(aXmlOutputPath: String);
begin
  fileOutput := TFileStream.Create(aXmlOutputPath, fmCreate OR fmOpenWrite);
  doc := TXMLDocument.Create;

  rootNode := doc.CreateElement('testsuite');
  doc.AppendChild(rootNode);
end;

procedure TCustomResultWriter.WriteHeader;
begin
end;

procedure TCustomResultWriter.WriteResult(aResult: TTestResult);
begin
  WriteLn('');
  WriteLn('');
  WriteLn(TestResultAsPlain(aResult));

  if (doc <> Nil) then
  begin
    rootNode.SetAttribute('failures', UnicodeString(IntToStr(aResult.NumberOfFailures)));
    rootNode.SetAttribute('errors', UnicodeString(IntToStr(aResult.NumberOfErrors)));
    rootNode.SetAttribute('skipped', UnicodeString(IntToStr(aResult.NumberOfSkippedTests)));
    rootNode.SetAttribute('tests', UnicodeString(IntToStr(testCount)));
    rootNode.SetAttribute('timestamp', UnicodeString(DateToISO8601(aResult.StartingTime, False)));
    rootNode.SetAttribute('name', UnicodeString(suiteName));

    WriteXMLFile(doc, fileOutput);
  end;
end;

procedure TCustomResultWriter.AddFailure(ATest: TTest; AFailure: TTestFailure);
var
  failureNode: TDOMElement;
begin
  Write('F');
  lastNotSuccess := True;

  if (doc <> Nil) then
  begin
    failureNode := doc.CreateElement('failure');
    curTestCaseNode.AppendChild(failureNode);

    failureNode.SetAttribute('message', UnicodeString(AFailure.ExceptionMessage));
    failureNode.SetAttribute('type', UnicodeString(AFailure.ExceptionClassName));
    failureNode.AppendChild( doc.CreateCDATASection(' ') );
  end;
end;

procedure TCustomResultWriter.AddError(ATest: TTest; AError: TTestFailure);
var
  errorNode: TDOMElement;
begin
  Write('E');
  lastNotSuccess := True;

  if (doc <> Nil) then
  begin
    errorNode := doc.CreateElement('error');
    curTestCaseNode.AppendChild(errorNode);

    errorNode.SetAttribute('message', UnicodeString(AError.ExceptionMessage));
    errorNode.SetAttribute('type', UnicodeString(AError.ExceptionClassName));
    errorNode.AppendChild( doc.CreateCDATASection(' ') );
  end;
end;

procedure TCustomResultWriter.StartTest(ATest: TTest);
begin
  lastNotSuccess := False;
  testCount := testCount + 1;

  if (doc <> Nil) then
  begin
    curTestCaseNode := doc.CreateElement('testcase');
    rootNode.AppendChild(curTestCaseNode);

    curTestCaseNode.SetAttribute('name', UnicodeString(ATest.TestSuiteName + '.' + ATest.TestName));
    curTestCaseNode.SetAttribute('classname', UnicodeString(ATest.UnitName + '.' + ATest.ClassName));
  end;
end;

procedure TCustomResultWriter.EndTest(ATest: TTest);
begin
  if (NOT lastNotSuccess) then
    Write('.');
end;

procedure TCustomResultWriter.StartTestSuite(ATestSuite: TTestSuite);
begin
end;

procedure TCustomResultWriter.EndTestSuite(ATestSuite: TTestSuite);
begin
end;

{$POP}

end.