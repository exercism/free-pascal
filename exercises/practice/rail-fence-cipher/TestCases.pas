unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RailFenceCipherTest = class(TTestCase)
  published
    procedure encode_with_two_rails;
    procedure encode_with_three_rails;
    procedure encode_with_ending_in_the_middle;
    procedure decode_with_three_rails;
    procedure decode_with_five_rails;
    procedure decode_with_six_rails;
  end;

implementation

uses RailFenceCipher;

// 46dc5c50-5538-401d-93a5-41102680d068
procedure RailFenceCipherTest.encode_with_two_rails;
const
  phrase : String = 'XOXOXOXOXOXOXOXOXO';
  expect : String = 'XXXXXXXXXOOOOOOOOO';
begin
  TapAssertTrue(Self, 'encode with two rails', expect, RailFenceCipher.encode(phrase, 2));
end;

// 25691697-fbd8-4278-8c38-b84068b7bc29
procedure RailFenceCipherTest.encode_with_three_rails;
const
  phrase : String = 'WEAREDISCOVEREDFLEEATONCE';
  expect : String = 'WECRLTEERDSOEEFEAOCAIVDEN';
begin
  TapAssertTrue(Self, 'encode with three rails', expect, RailFenceCipher.encode(phrase, 3));
end;

// 384f0fea-1442-4f1a-a7c4-5cbc2044002c
procedure RailFenceCipherTest.encode_with_ending_in_the_middle;
const
  phrase : String = 'EXERCISES';
  expect : String = 'ESXIEECSR';
begin
  TapAssertTrue(Self, 'encode with ending in the middle', expect, RailFenceCipher.encode(phrase, 4));
end;

// cd525b17-ec34-45ef-8f0e-4f27c24a7127
procedure RailFenceCipherTest.decode_with_three_rails;
const
  phrase : String = 'TEITELHDVLSNHDTISEIIEA';
  expect : String = 'THEDEVILISINTHEDETAILS';
begin
  TapAssertTrue(Self, 'decode with three rails', expect, RailFenceCipher.decode(phrase, 3));
end;

// dd7b4a98-1a52-4e5c-9499-cbb117833507
procedure RailFenceCipherTest.decode_with_five_rails;
const
  phrase : String = 'EIEXMSMESAORIWSCE';
  expect : String = 'EXERCISMISAWESOME';
begin
  TapAssertTrue(Self, 'decode with five rails', expect, RailFenceCipher.decode(phrase, 5));
end;

// 93e1ecf4-fac9-45d9-9cd2-591f47d3b8d3
procedure RailFenceCipherTest.decode_with_six_rails;
const
  phrase : String = '133714114238148966225439541018335470986172518171757571896261';
  expect : String = '112358132134558914423337761098715972584418167651094617711286';
begin
  TapAssertTrue(Self, 'decode with six rails', expect, RailFenceCipher.decode(phrase, 6));
end;

initialization
RegisterTest(RailFenceCipherTest);

end.
