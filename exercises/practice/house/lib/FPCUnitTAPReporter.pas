unit FPCUnitTAPReporter;

{$mode ObjFPC}{$H+}

interface

uses FPCUnit, TestUtils;

type
  TCustomResultWriter = class(TNoRefCountObject, ITestListener)
    private
      FTestCasesCount  : integer;
      FTestCount       : integer;
      FTestPassed      : boolean;
    public
      constructor Create;
      destructor Destroy; override;
      procedure AddFailure(ATest: TTest; AFailure: TTestFailure);
      procedure AddError(ATest: TTest; AError: TTestFailure);
      procedure StartTest(ATest: TTest);
      procedure EndTest(ATest: TTest);
      procedure StartTestSuite(ATestSuite: TTestSuite);
      procedure EndTestSuite(ATestSuite: TTestSuite);
  end;

implementation

uses TestRegistry, SysUtils, FpJson, JSONParser, StrUtils, TypInfo;

constructor TCustomResultWriter.Create ;
begin
  FTestCasesCount := GetTestRegistry.CountTestCases;
  FTestCount      := 0;
  FTestPassed     := true;

  writeln('TAP version 14');
  writeln(format('1..%d', [FTestCasesCount]));
end;

destructor TCustomResultWriter.Destroy;
begin
end;

procedure TCustomResultWriter.AddFailure(ATest: TTest; AFailure: TTestFailure);
var
  JData                   : TJSONData;
  LMessage, LGot, LExpect : string;
begin

  FTestPassed := false;
  inc(FTestCount);

  try
    try
      JData     := GetJSON(AFailure.ExceptionMessage);
      LMessage  := JData.FindPath('message').AsString;
      case
        GetEnumName(
          TypeInfo(TJSONtype), ord(JData.FindPath('expect').JSONType)
        ) of
        'jtArray', 'jtObject' :
          LExpect := JData.FindPath('expect').FormatJSON;
        otherwise LExpect := JData.FindPath('expect').AsString;
      end;
      case
        GetEnumName(
           TypeInfo(TJSONtype), ord(JData.FindPath('actual').JSONType)
         ) of
        'jtArray', 'jtObject' :
          LGot := JData.FindPath('actual').FormatJSON
        otherwise LGot := JData.FindPath('actual').AsString;
      end;
    finally
      JData.Free;
    end
  except
    on E: Exception do
      begin
        writeln('[TestName] ', ATest.TestName);
        writeln('[Message] ', AFailure.ExceptionMessage);
        writeln('[ExceptionMessage] ', E.message);
        writeln('[FailureClass] ', AFailure.ExceptionClassName);
        writeln('[FailureMessage] ', AFailure.ExceptionMessage);
        exit;
      end
  end;

  writeln(format('not ok %d - %s', [FTestCount, ATest.TestName]));
  writeln('  ---');
  writeln(format('  message: "%s"', [LMessage]));
  writeln('  severity: fail');
  writeln('  data:');

  if pos(#10, LGot) > 0 then
    begin
      writeln('    got: |');
      writeln('      ' + ReplaceStr(LGot, #10, #10 + '      '));
    end
  else
    writeln('    got: ', LGot);

  if pos(#10, LExpect) > 0 then
    begin
      writeln('    expect: |');
      writeln('      ' + ReplaceStr(LExpect, #10, #10 + '      '));
    end
  else writeln('    expect: ', LExpect);

  writeln('  ...');
end;

procedure PrintDumpExceptionBackTrace;
var LTextFile : TextFile;
begin
  assign(LTextFile, '');
  rewrite(LTextFile);
  DumpExceptionBackTrace(LTextFile);
  close(LTextFile);
end;

procedure TCustomResultWriter.AddError(ATest: TTest; AError: TTestFailure);
begin
  inc(FTestCount);
  FTestPassed := false;
  if (AError.ExceptionClassName = 'ENotImplemented') and
     (AError.ExceptionMessage = 'Please implement your solution.') then
  begin
    writeln(format('not ok %d - %s', [0, AError.ExceptionMessage]));
    halt;
  end;

  writeln(format('not ok %d - %s', [FTestCount, ATest.TestName]));
  writeln('  ---');
  writeln('  message: |');
  writeln('    ' + 'An unhandled exception occurred:');
  writeln(
    format('    %s: %s', [AError.ExceptionClassName, AError.ExceptionMessage])
  );
  writeln('  severity: error');
  writeln('  ...');
  PrintDumpExceptionBackTrace;
end;

{$HINTS OFF} // - Hint: Parameter "ATest" not used
procedure TCustomResultWriter.StartTest(ATest: TTest);
begin
  FTestPassed := true;
end;
{$HINTS ON}

procedure TCustomResultWriter.EndTest(ATest: TTest);
begin
  if FTestPassed then
  begin
    inc(FTestCount);
    writeln(format('ok %d - %s', [FTestCount, ATest.TestName]));
  end
end;

{$HINTS OFF} // - Hint: Parameter "ATestSuite" not used
procedure TCustomResultWriter.StartTestSuite(ATestSuite: TTestSuite);
begin
end;
{$HINTS ON}

{$HINTS OFF} // - Hint: Parameter "ATestSuite" not used
procedure TCustomResultWriter.EndTestSuite(ATestSuite: TTestSuite);
begin
end;
{$HINTS ON}

end.
