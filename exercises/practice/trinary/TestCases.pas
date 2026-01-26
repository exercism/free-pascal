unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TrinaryTest = class(TTestCase)
  published
     procedure trinary_1_is_decimal_1;
  end;

implementation

uses Trinary;

// a7a79a9e-5606-454c-9cdb-4f3c0ca46931
procedure TrinaryTest.trinary_1_is_decimal_1;
begin
  TapAssertTrue(Self, 'trinary 1 is decimal 1', 1, Trinary.ToDecimal('1'));
end;

initialization
RegisterTest(TrinaryTest);

end.
