unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  EliudsEggsTest = class(TTestCase)
  published
     procedure zero_eggs;
     procedure one_egg;
     procedure four_eggs;
     procedure thirteen_eggs;
  end;

implementation

uses EliudsEggs;

// 559e789d-07d1-4422-9004-3b699f83bca3
procedure EliudsEggsTest.zero_eggs;
begin
  TapAssertTrue(Self, '0 eggs', 0, EliudsEggs.EggCount(0));
end;

// 97223282-f71e-490c-92f0-b3ec9e275aba
procedure EliudsEggsTest.one_egg;
begin
  TapAssertTrue(Self, '1 egg', 1, EliudsEggs.EggCount(16));
end;

// 1f8fd18f-26e9-4144-9a0e-57cdfc4f4ff5
procedure EliudsEggsTest.four_eggs;
begin
  TapAssertTrue(Self, '4 eggs', 4, EliudsEggs.EggCount(89));
end;

// 0c18be92-a498-4ef2-bcbb-28ac4b06cb81
procedure EliudsEggsTest.thirteen_eggs;
begin
  TapAssertTrue(Self, '13 eggs', 13, EliudsEggs.EggCount(2000000000));
end;

initialization
RegisterTest(EliudsEggsTest);

end.
