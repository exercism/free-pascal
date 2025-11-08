program test;

{$mode ObjFPC}

uses
FPCUnit, FPCUnitTAPReporter, TestRegistry, TestCases, SysUtils;

var
  FResultWriter : TCustomResultWriter;
  TestResult    : TTestResult;
  RunAll        : boolean;
  TestNumber    : integer = 0;
  i             : integer;
begin

  RunAll := false;

  case ParamStr(1) of
    '-l', '--list' :
      begin
        for i := 0 to GetTestRegistry.CountTestCases - 1 do
          writeln(i + 1, ': ',
                  GetTestRegistry.Test[0].GetChildTest(i).TestName
          );
        exit;
      end;
    '-a', '--all', 'all', '-all' : RunAll := true;
    otherwise
    begin
      if TryStrToInt(ParamStr(1), TestNumber) then
        begin
          if (TestNumber < 1) or
             (TestNumber > GetTestRegistry.CountTestCases) then
            begin
              write('test number out of range. ');
              writeln(format('(1-%d)', [GetTestRegistry.CountTestCases]));
              exit;
            end
        end
      else
        begin
          writeln('unrecognized option ''' + ParamStr(1) + '''');
          exit;
        end;
    end;
  end;

  TestResult := TTestResult.Create;

  if (TestNumber > 0) then
    for i := 0 to GetTestRegistry.CountTestCases - 1 do
      begin
        if i + 1 = TestNumber then continue;
        TestResult.AddToSkipList(
          TTestCase(GetTestRegistry.Test[0].GetChildTest(i))
        );
      end
      else if not(RunAll) then
        begin
          for i := 1 to GetTestRegistry.CountTestCases - 1 do
            TestResult.AddToSkipList(
              TTestCase(GetTestRegistry.Test[0].GetChildTest(i))
            );
        end;

  FResultWriter := TCustomResultWriter.Create;
  try
    TestResult.AddListener(FResultWriter);
    GetTestRegistry.Run(TestResult);
  finally
    FResultWriter.Free;
    TestResult.Free;
end;

end.
