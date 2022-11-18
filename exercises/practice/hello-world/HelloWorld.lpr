program HelloWorld;

uses
  uHelloWorld, uHelloWorldTests, uShared,
  fpcunit, testregistry;

var
  FResultWriter: TCustomResultWriter;
  testResult: TTestResult;

begin
  testResult := TTestResult.Create;
  FResultWriter := TCustomResultWriter.Create('HelloWorld');
  try
    testResult.AddListener(FResultWriter);
    FResultWriter.WriteHeader;

    GetTestRegistry.Run(testResult);

    FResultWriter.WriteResult(testResult);
  finally
    testResult.Free;
    FResultWriter.Free;
  end;
end.
