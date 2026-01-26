unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  BinaryTest = class(TTestCase)
  published
     procedure binary_1_is_decimal_1;
  end;

implementation

uses Binary;

// c0824fb1-6a0a-4e9a-a262-c6c00af99fa8
procedure BinaryTest.binary_1_is_decimal_1;
begin
  TapAssertTrue(Self, 'binary 1 is decimal 1', 1, Binary.Decimal('1'));
end;

initialization
RegisterTest(BinaryTest);

end.
