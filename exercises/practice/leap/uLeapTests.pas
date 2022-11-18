unit uLeapTests;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, fpcunit, testregistry;

type
  YearTest = class(TTestCase)
  published
    procedure year_not_divisible_by_4_common_year;
    procedure year_divisible_by_2_not_divisible_by_4_common_year;
    procedure year_divisible_by_4_not_divisible_by_100_leap_year;
    procedure year_divisible_by_4_and_5_still_leap_year;
    procedure year_divisible_by_100_not_divisible_by_400_common_year;
    procedure year_divisible_by_100_not_by_3_still_not_leap_year;
    procedure year_divisible_by_400_leap_year;
    procedure year_divisible_by_400_not_by_125_still_leap_year;
    procedure year_divisible_by_200_not_divisible_by_400_common_year;
  end;

implementation
uses uLeap;

procedure YearTest.year_not_divisible_by_4_common_year;
begin
  AssertFalse(
    'Expected ''false'', 2015 is not a leap year.',
    uLeap.IsLeapYear(2015)
  );
end;

procedure YearTest.year_divisible_by_2_not_divisible_by_4_common_year;
begin
  AssertFalse(
    'Expected ''false'', 1970 is not a leap year.',
    uLeap.IsLeapYear(1970)
  );
end;

procedure YearTest.year_divisible_by_4_not_divisible_by_100_leap_year;
begin
  AssertTrue(
    'Expected ''true'', 1996 is a leap year.',
    uLeap.IsLeapYear(1996)
  );
end;

procedure YearTest.year_divisible_by_4_and_5_still_leap_year;
begin
  AssertTrue(
    'Expected ''false'', 1960 is a leap year.',
    uLeap.IsLeapYear(1960)
  );
end;

procedure YearTest.year_divisible_by_100_not_divisible_by_400_common_year;
begin
  AssertFalse(
    'Expected ''false'', 2100 is not a leap year.',
    uLeap.IsLeapYear(2100)
  );
end;

procedure YearTest.year_divisible_by_100_not_by_3_still_not_leap_year;
begin
  AssertFalse(
    'Expected ''false'', 1900 is not a leap year.',
    uLeap.IsLeapYear(1900)
  );
end;

procedure YearTest.year_divisible_by_400_leap_year;
begin
  AssertTrue(
    'Expected ''true'', 2000 is a leap year.',
    uLeap.IsLeapYear(2000)
  );
end;

procedure YearTest.year_divisible_by_400_not_by_125_still_leap_year;
begin
  AssertTrue(
    'Expected ''true'', 2400 is a leap year.',
    uLeap.IsLeapYear(2400)
  )
end;

procedure YearTest.year_divisible_by_200_not_divisible_by_400_common_year;
begin
  AssertFalse(
    'Expected ''false'', 1800 is not a leap year.',
    uLeap.IsLeapYear(1800)
  );
end;

initialization
  RegisterTest(YearTest);
end.

