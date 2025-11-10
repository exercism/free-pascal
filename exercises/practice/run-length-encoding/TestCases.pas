unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RunLengthEncodingTest = class(TTestCase)
  published
    procedure encode_empty_string;
    procedure encode_single_characters_only_are_encoded_without_count;
    procedure encode_string_with_no_single_characters;
    procedure encode_single_characters_mixed_with_repeated_characters;
    procedure encode_multiple_whitespace_mixed_in_string;
    procedure encode_lowercase_characters;
    procedure decode_empty_string;
    procedure decode_single_characters_only;
    procedure decode_string_with_no_single_characters;
    procedure decode_single_characters_with_repeated_characters;
    procedure decode_multiple_whitespace_mixed_in_string;
    procedure decode_lowercase_string;
    procedure encode_followed_by_decode_gives_original_string;
  end;

implementation

uses RunLengthEncoding;

// ad53b61b-6ffc-422f-81a6-61f7df92a231
procedure RunLengthEncodingTest.encode_empty_string;
begin
  TapAssertTrue(Self, 'empty string', '', RunLengthEncoding.encode(''));
end;

// 52012823-b7e6-4277-893c-5b96d42f82de
procedure RunLengthEncodingTest.encode_single_characters_only_are_encoded_without_count;
begin
  TapAssertTrue(Self, 'single characters only are encoded without count', 'XYZ', RunLengthEncoding.encode('XYZ'));
end;

// b7868492-7e3a-415f-8da3-d88f51f80409
procedure RunLengthEncodingTest.encode_string_with_no_single_characters;
begin
  TapAssertTrue(Self, 'string with no single characters', '2A3B4C', RunLengthEncoding.encode('AABBBCCCC'));
end;

// 859b822b-6e9f-44d6-9c46-6091ee6ae358
procedure RunLengthEncodingTest.encode_single_characters_mixed_with_repeated_characters;
begin
  TapAssertTrue(Self, 'single characters mixed with repeated characters', '12WB12W3B24WB', RunLengthEncoding.encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'));
end;

// 1b34de62-e152-47be-bc88-469746df63b3
procedure RunLengthEncodingTest.encode_multiple_whitespace_mixed_in_string;
begin
  TapAssertTrue(Self, 'multiple whitespace mixed in string', '2 hs2q q2w2 ', RunLengthEncoding.encode('  hsqq qww  '));
end;

// abf176e2-3fbd-40ad-bb2f-2dd6d4df721a
procedure RunLengthEncodingTest.encode_lowercase_characters;
begin
  TapAssertTrue(Self, 'lowercase characters', '2a3b4c', RunLengthEncoding.encode('aabbbcccc'));
end;

// 7ec5c390-f03c-4acf-ac29-5f65861cdeb5
procedure RunLengthEncodingTest.decode_empty_string;
begin
  TapAssertTrue(Self, 'empty string', '', RunLengthEncoding.decode(''));
end;

// ad23f455-1ac2-4b0e-87d0-b85b10696098
procedure RunLengthEncodingTest.decode_single_characters_only;
begin
  TapAssertTrue(Self, 'single characters only', 'XYZ', RunLengthEncoding.decode('XYZ'));
end;

// 21e37583-5a20-4a0e-826c-3dee2c375f54
procedure RunLengthEncodingTest.decode_string_with_no_single_characters;
begin
  TapAssertTrue(Self, 'string with no single characters', 'AABBBCCCC', RunLengthEncoding.decode('2A3B4C'));
end;

// 1389ad09-c3a8-4813-9324-99363fba429c
procedure RunLengthEncodingTest.decode_single_characters_with_repeated_characters;
begin
  TapAssertTrue(Self, 'single characters with repeated characters', 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB', RunLengthEncoding.decode('12WB12W3B24WB'));
end;

// 3f8e3c51-6aca-4670-b86c-a213bf4706b0
procedure RunLengthEncodingTest.decode_multiple_whitespace_mixed_in_string;
begin
  TapAssertTrue(Self, 'multiple whitespace mixed in string', '  hsqq qww  ', RunLengthEncoding.decode('2 hs2q q2w2 '));
end;

// 29f721de-9aad-435f-ba37-7662df4fb551
procedure RunLengthEncodingTest.decode_lowercase_string;
begin
  TapAssertTrue(Self, 'lowercase string', 'aabbbcccc', RunLengthEncoding.decode('2a3b4c'));
end;

// 2a762efd-8695-4e04-b0d6-9736899fbc16
procedure RunLengthEncodingTest.encode_followed_by_decode_gives_original_string;
begin
  TapAssertTrue(Self, 'encode followed by decode gives original string', 'zzz ZZ  zZ', RunLengthEncoding.consistency('zzz ZZ  zZ'));
end;

initialization
RegisterTest(RunLengthEncodingTest);

end.
