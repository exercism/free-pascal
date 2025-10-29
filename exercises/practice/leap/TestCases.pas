unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  LeapTest = class(TTestCase)
  published
    procedure year_not_divisible_by_4_in_common_year;
    procedure year_divisible_by_2_not_divisible_by_4_in_common_year;
    procedure year_divisible_by_4_not_divisible_by_100_in_leap_year;
    procedure year_divisible_by_4_and_5_is_still_a_leap_year;
    procedure year_divisible_by_100_not_divisible_by_400_in_common_year;
    procedure year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year;
    procedure year_divisible_by_400_is_leap_year;
    procedure year_divisible_by_400_but_not_by_125_is_still_a_leap_year;
    procedure year_divisible_by_200_not_divisible_by_400_in_common_year;
  end;

implementation

uses Leap;

// 6466b30d-519c-438e-935d-388224ab5223
procedure LeapTest.year_not_divisible_by_4_in_common_year;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(2015);
  message := EncodeJsonMessage('year not divisible by 4 in common year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ac227e82-ee82-4a09-9eb6-4f84331ffdb0
procedure LeapTest.year_divisible_by_2_not_divisible_by_4_in_common_year;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(1970);
  message := EncodeJsonMessage('year divisible by 2, not divisible by 4 in common year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 4fe9b84c-8e65-489e-970b-856d60b8b78e
procedure LeapTest.year_divisible_by_4_not_divisible_by_100_in_leap_year;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(1996);
  message := EncodeJsonMessage('year divisible by 4, not divisible by 100 in leap year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7fc6aed7-e63c-48f5-ae05-5fe182f60a5d
procedure LeapTest.year_divisible_by_4_and_5_is_still_a_leap_year;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(1960);
  message := EncodeJsonMessage('year divisible by 4 and 5 is still a leap year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 78a7848f-9667-4192-ae53-87b30c9a02dd
procedure LeapTest.year_divisible_by_100_not_divisible_by_400_in_common_year;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(2100);
  message := EncodeJsonMessage('year divisible by 100, not divisible by 400 in common year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9d70f938-537c-40a6-ba19-f50739ce8bac
procedure LeapTest.year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(1900);
  message := EncodeJsonMessage('year divisible by 100 but not by 3 is still not a leap year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 42ee56ad-d3e6-48f1-8e3f-c84078d916fc
procedure LeapTest.year_divisible_by_400_is_leap_year;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(2000);
  message := EncodeJsonMessage('year divisible by 400 is leap year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 57902c77-6fe9-40de-8302-587b5c27121e
procedure LeapTest.year_divisible_by_400_but_not_by_125_is_still_a_leap_year;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(2400);
  message := EncodeJsonMessage('year divisible by 400 but not by 125 is still a leap year', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c30331f6-f9f6-4881-ad38-8ca8c12520c1
procedure LeapTest.year_divisible_by_200_not_divisible_by_400_in_common_year;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Leap.LeapYear(1800);
  message := EncodeJsonMessage('year divisible by 200, not divisible by 400 in common year', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(LeapTest);

end.
