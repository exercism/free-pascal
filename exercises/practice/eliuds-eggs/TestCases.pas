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

var message : string;

procedure EliudsEggsTest.zero_eggs;
const expected = 0;
var actual : uint32;
begin
  // 559e789d-07d1-4422-9004-3b699f83bca3
  actual  := EliudsEggs.EggCount(0);
  message := EncodeJsonMessage('0 eggs', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure EliudsEggsTest.one_egg;
const expected = 1;
var actual : uint32;
begin
  // 97223282-f71e-490c-92f0-b3ec9e275aba
  actual  := EliudsEggs.EggCount(16);
  message := EncodeJsonMessage('1 egg', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure EliudsEggsTest.four_eggs;
const expected = 4;
var actual : uint32;
begin
  // 1f8fd18f-26e9-4144-9a0e-57cdfc4f4ff5
  actual  := EliudsEggs.EggCount(89);
  message := EncodeJsonMessage('4 eggs', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure EliudsEggsTest.thirteen_eggs;
const expected = 13;
var actual : uint32;
begin
  // 0c18be92-a498-4ef2-bcbb-28ac4b06cb81
  actual  := EliudsEggs.EggCount(2000000000);
  message := EncodeJsonMessage('13 eggs', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(EliudsEggsTest);

end.
