unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ZebraPuzzleTest = class(TTestCase)
  published
    procedure resident_who_drinks_water;
    procedure resident_who_owns_zebra;
  end;

implementation

uses ZebraPuzzle;

function NationalityToStr(person : Nationality) : String;
begin
  case person of
    Englishman: result := 'Englishman';
    Japanese: result := 'Japanese';
    Norwegian: result := 'Norwegian';
    Spaniard: result := 'Spaniard';
    Ukrainian: result := 'Ukrainian';
  end;
end;

// 16efb4e4-8ad7-4d5e-ba96-e5537b66fd42
procedure ZebraPuzzleTest.resident_who_drinks_water;
begin
  TapAssertTrue(Self, 'resident who drinks water', 'Norwegian', NationalityToStr(ZebraPuzzle.drinksWater));
end;

// 084d5b8b-24e2-40e6-b008-c800da8cd257
procedure ZebraPuzzleTest.resident_who_owns_zebra;
begin
  TapAssertTrue(Self, 'resident who owns zebra', 'Japanese', NationalityToStr(ZebraPuzzle.ownsZebra));
end;

initialization
RegisterTest(ZebraPuzzleTest);

end.
