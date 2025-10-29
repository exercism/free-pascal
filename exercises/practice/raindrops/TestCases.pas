unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RaindropsTest = class(TTestCase)
  published
    procedure the_sound_for_1_is_1;
    procedure the_sound_for_3_is_pling;
    procedure the_sound_for_5_is_plang;
    procedure the_sound_for_7_is_plong;
    procedure the_sound_for_6_is_pling_as_it_has_a_factor_3;
    procedure two_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base;
    procedure the_sound_for_9_is_pling_as_it_has_a_factor_3;
    procedure the_sound_for_10_is_plang_as_it_has_a_factor_5;
    procedure the_sound_for_14_is_plong_as_it_has_a_factor_of_7;
    procedure the_sound_for_15_is_plingplang_as_it_has_factors_3_and_5;
    procedure the_sound_for_21_is_plingplong_as_it_has_factors_3_and_7;
    procedure the_sound_for_25_is_plang_as_it_has_a_factor_5;
    procedure the_sound_for_27_is_pling_as_it_has_a_factor_3;
    procedure the_sound_for_35_is_plangplong_as_it_has_factors_5_and_7;
    procedure the_sound_for_49_is_plong_as_it_has_a_factor_7;
    procedure the_sound_for_52_is_52;
    procedure the_sound_for_105_is_plingplangplong_as_it_has_factors_3_5_and_7;
    procedure the_sound_for_3125_is_plang_as_it_has_a_factor_5;
  end;

implementation

uses Raindrops;

// 1575d549-e502-46d4-a8e1-6b7bec6123d8
procedure RaindropsTest.the_sound_for_1_is_1;
const expected = '1';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(1);
  message := EncodeJsonMessage('the sound for 1 is 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 1f51a9f9-4895-4539-b182-d7b0a5ab2913
procedure RaindropsTest.the_sound_for_3_is_pling;
const expected = 'Pling';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(3);
  message := EncodeJsonMessage('the sound for 3 is Pling', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2d9bfae5-2b21-4bcd-9629-c8c0e388f3e0
procedure RaindropsTest.the_sound_for_5_is_plang;
const expected = 'Plang';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(5);
  message := EncodeJsonMessage('the sound for 5 is Plang', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d7e60daa-32ef-4c23-b688-2abff46c4806
procedure RaindropsTest.the_sound_for_7_is_plong;
const expected = 'Plong';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(7);
  message := EncodeJsonMessage('the sound for 7 is Plong', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 6bb4947b-a724-430c-923f-f0dc3d62e56a
procedure RaindropsTest.the_sound_for_6_is_pling_as_it_has_a_factor_3;
const expected = 'Pling';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(6);
  message := EncodeJsonMessage('the sound for 6 is Pling as it has a factor 3', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ce51e0e8-d9d4-446d-9949-96eac4458c2d
procedure RaindropsTest.two_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base;
const expected = '8';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(8);
  message := EncodeJsonMessage('2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 0dd66175-e3e2-47fc-8750-d01739856671
procedure RaindropsTest.the_sound_for_9_is_pling_as_it_has_a_factor_3;
const expected = 'Pling';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(9);
  message := EncodeJsonMessage('the sound for 9 is Pling as it has a factor 3', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 022c44d3-2182-4471-95d7-c575af225c96
procedure RaindropsTest.the_sound_for_10_is_plang_as_it_has_a_factor_5;
const expected = 'Plang';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(10);
  message := EncodeJsonMessage('the sound for 10 is Plang as it has a factor 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 37ab74db-fed3-40ff-b7b9-04acdfea8edf
procedure RaindropsTest.the_sound_for_14_is_plong_as_it_has_a_factor_of_7;
const expected = 'Plong';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(14);
  message := EncodeJsonMessage('the sound for 14 is Plong as it has a factor of 7', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 31f92999-6afb-40ee-9aa4-6d15e3334d0f
procedure RaindropsTest.the_sound_for_15_is_plingplang_as_it_has_factors_3_and_5;
const expected = 'PlingPlang';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(15);
  message := EncodeJsonMessage('the sound for 15 is PlingPlang as it has factors 3 and 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ff9bb95d-6361-4602-be2c-653fe5239b54
procedure RaindropsTest.the_sound_for_21_is_plingplong_as_it_has_factors_3_and_7;
const expected = 'PlingPlong';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(21);
  message := EncodeJsonMessage('the sound for 21 is PlingPlong as it has factors 3 and 7', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d2e75317-b72e-40ab-8a64-6734a21dece1
procedure RaindropsTest.the_sound_for_25_is_plang_as_it_has_a_factor_5;
const expected = 'Plang';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(25);
  message := EncodeJsonMessage('the sound for 25 is Plang as it has a factor 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a09c4c58-c662-4e32-97fe-f1501ef7125c
procedure RaindropsTest.the_sound_for_27_is_pling_as_it_has_a_factor_3;
const expected = 'Pling';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(27);
  message := EncodeJsonMessage('the sound for 27 is Pling as it has a factor 3', expected, actual);
  AssertTrue(message, expected = actual);
end;

// bdf061de-8564-4899-a843-14b48b722789
procedure RaindropsTest.the_sound_for_35_is_plangplong_as_it_has_factors_5_and_7;
const expected = 'PlangPlong';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(35);
  message := EncodeJsonMessage('the sound for 35 is PlangPlong as it has factors 5 and 7', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c4680bee-69ba-439d-99b5-70c5fd1a7a83
procedure RaindropsTest.the_sound_for_49_is_plong_as_it_has_a_factor_7;
const expected = 'Plong';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(49);
  message := EncodeJsonMessage('the sound for 49 is Plong as it has a factor 7', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 17f2bc9a-b65a-4d23-8ccd-266e8c271444
procedure RaindropsTest.the_sound_for_52_is_52;
const expected = '52';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(52);
  message := EncodeJsonMessage('the sound for 52 is 52', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e46677ed-ff1a-419f-a740-5c713d2830e4
procedure RaindropsTest.the_sound_for_105_is_plingplangplong_as_it_has_factors_3_5_and_7;
const expected = 'PlingPlangPlong';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(105);
  message := EncodeJsonMessage('the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 13c6837a-0fcd-4b86-a0eb-20572f7deb0b
procedure RaindropsTest.the_sound_for_3125_is_plang_as_it_has_a_factor_5;
const expected = 'Plang';
var
  actual  : string;
  message : string;
begin
  actual  := Raindrops.convert(3125);
  message := EncodeJsonMessage('the sound for 3125 is Plang as it has a factor 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(RaindropsTest);

end.
