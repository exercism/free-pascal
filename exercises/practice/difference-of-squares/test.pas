program test;

{$mode ObjFPC}

uses
FPCUnit, FPCUnitTAPReporter, TestRegistry, TestCases;

var
  FResultWriter : TCustomResultWriter;
  TestResult    : TTestResult;
  RunAll        : boolean;
  i             : integer;
begin

  RunAll := false;

  case ParamStr(1) of
    '-l', '--list' :
      begin
        for i := 0 to GetTestRegistry.CountTestCases - 1 do
          writeln(
            i + 1, ': ',
            GetTestRegistry.Test[0].GetChildTest(i).TestName
          );
        exit;
      end;
    '-a', '--all', 'all', '-all' : RunAll := true;
    otherwise
      if ParamCount > 0 then
      begin
        writeln('unrecognized option ''' + ParamStr(1) + '''');
        exit;
      end;
  end;

  TestResult := TTestResult.Create;

  if not(RunAll) then
    for i := 1 to GetTestRegistry.CountTestCases - 1 do
      TestResult.AddToSkipList(
        TTestCase(GetTestRegistry.Test[0].GetChildTest(i))
      );

  FResultWriter := TCustomResultWriter.Create;
  try
    TestResult.AddListener(FResultWriter);
    GetTestRegistry.Run(TestResult);
  finally
    FResultWriter.Free;
    TestResult.Free;
  end;

end.
