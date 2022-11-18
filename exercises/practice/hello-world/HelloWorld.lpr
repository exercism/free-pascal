program HelloWorld;

uses
  uHelloWorld, uHelloWorldTests,
  fpcunit, testregistry, testreport;

var
  FPlainResultsWriter: TPlainResultsWriter;
  testResult: TTestResult;

begin
  testResult := TTestResult.Create;
  FPlainResultsWriter := TPlainResultsWriter.Create;
  try
    testResult.AddListener(FPlainResultsWriter);
    FPlainResultsWriter.WriteHeader;

    GetTestRegistry.Run(testResult);

    FPlainResultsWriter.WriteResult(testResult);
  finally
    testResult.Free;
    FPlainResultsWriter.Free;
  end;
end.

