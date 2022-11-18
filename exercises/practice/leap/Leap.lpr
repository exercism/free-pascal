program Leap;

uses
  uLeap, uLeapTests, uShared,
  fpcunit, testregistry;

var
  FResultWriter: TCustomResultWriter;
  testResult: TTestResult;

begin
  testResult := TTestResult.Create;
  FResultWriter := TCustomResultWriter.Create('Leap');
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
