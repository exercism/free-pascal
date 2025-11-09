unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RomanNumeralsTest = class(TTestCase)
  published
    procedure t_1_is_I;
    procedure t_2_is_II;
    procedure t_3_is_III;
    procedure t_4_is_IV;
    procedure t_5_is_V;
    procedure t_6_is_VI;
    procedure t_9_is_IX;
    procedure t_16_is_XVI;
    procedure t_27_is_XXVII;
    procedure t_48_is_XLVIII;
    procedure t_49_is_XLIX;
    procedure t_59_is_LIX;
    procedure t_66_is_LXVI;
    procedure t_93_is_XCIII;
    procedure t_141_is_CXLI;
    procedure t_163_is_CLXIII;
    procedure t_166_is_CLXVI;
    procedure t_402_is_CDII;
    procedure t_575_is_DLXXV;
    procedure t_666_is_DCLXVI;
    procedure t_911_is_CMXI;
    procedure t_1024_is_MXXIV;
    procedure t_1666_is_MDCLXVI;
    procedure t_3000_is_MMM;
    procedure t_3001_is_MMMI;
    procedure t_3888_is_MMMDCCCLXXXVIII;
    procedure t_3999_is_MMMCMXCIX;
  end;

implementation

uses RomanNumerals;

// 19828a3a-fbf7-4661-8ddd-cbaeee0e2178
procedure RomanNumeralsTest.t_1_is_I;
begin
  TapAssertTrue(Self, '1 is I', 'I', RomanNumerals.roman(1));
end;

// f088f064-2d35-4476-9a41-f576da3f7b03
procedure RomanNumeralsTest.t_2_is_II;
begin
  TapAssertTrue(Self, '2 is II', 'II', RomanNumerals.roman(2));
end;

// b374a79c-3bea-43e6-8db8-1286f79c7106
procedure RomanNumeralsTest.t_3_is_III;
begin
  TapAssertTrue(Self, '3 is III', 'III', RomanNumerals.roman(3));
end;

// 05a0a1d4-a140-4db1-82e8-fcc21fdb49bb
procedure RomanNumeralsTest.t_4_is_IV;
begin
  TapAssertTrue(Self, '4 is IV', 'IV', RomanNumerals.roman(4));
end;

// 57c0f9ad-5024-46ab-975d-de18c430b290
procedure RomanNumeralsTest.t_5_is_V;
begin
  TapAssertTrue(Self, '5 is V', 'V', RomanNumerals.roman(5));
end;

// 20a2b47f-e57f-4797-a541-0b3825d7f249
procedure RomanNumeralsTest.t_6_is_VI;
begin
  TapAssertTrue(Self, '6 is VI', 'VI', RomanNumerals.roman(6));
end;

// ff3fb08c-4917-4aab-9f4e-d663491d083d
procedure RomanNumeralsTest.t_9_is_IX;
begin
  TapAssertTrue(Self, '9 is IX', 'IX', RomanNumerals.roman(9));
end;

// 6d1d82d5-bf3e-48af-9139-87d7165ed509
procedure RomanNumeralsTest.t_16_is_XVI;
begin
  TapAssertTrue(Self, '16 is XVI', 'XVI', RomanNumerals.roman(16));
end;

// 2bda64ca-7d28-4c56-b08d-16ce65716cf6
procedure RomanNumeralsTest.t_27_is_XXVII;
begin
  TapAssertTrue(Self, '27 is XXVII', 'XXVII', RomanNumerals.roman(27));
end;

// a1f812ef-84da-4e02-b4f0-89c907d0962c
procedure RomanNumeralsTest.t_48_is_XLVIII;
begin
  TapAssertTrue(Self, '48 is XLVIII', 'XLVIII', RomanNumerals.roman(48));
end;

// 607ead62-23d6-4c11-a396-ef821e2e5f75
procedure RomanNumeralsTest.t_49_is_XLIX;
begin
  TapAssertTrue(Self, '49 is XLIX', 'XLIX', RomanNumerals.roman(49));
end;

// d5b283d4-455d-4e68-aacf-add6c4b51915
procedure RomanNumeralsTest.t_59_is_LIX;
begin
  TapAssertTrue(Self, '59 is LIX', 'LIX', RomanNumerals.roman(59));
end;

// 4465ffd5-34dc-44f3-ada5-56f5007b6dad
procedure RomanNumeralsTest.t_66_is_LXVI;
begin
  TapAssertTrue(Self, '66 is LXVI', 'LXVI', RomanNumerals.roman(66));
end;

// 46b46e5b-24da-4180-bfe2-2ef30b39d0d0
procedure RomanNumeralsTest.t_93_is_XCIII;
begin
  TapAssertTrue(Self, '93 is XCIII', 'XCIII', RomanNumerals.roman(93));
end;

// 30494be1-9afb-4f84-9d71-db9df18b55e3
procedure RomanNumeralsTest.t_141_is_CXLI;
begin
  TapAssertTrue(Self, '141 is CXLI', 'CXLI', RomanNumerals.roman(141));
end;

// 267f0207-3c55-459a-b81d-67cec7a46ed9
procedure RomanNumeralsTest.t_163_is_CLXIII;
begin
  TapAssertTrue(Self, '163 is CLXIII', 'CLXIII', RomanNumerals.roman(163));
end;

// 902ad132-0b4d-40e3-8597-ba5ed611dd8d
procedure RomanNumeralsTest.t_166_is_CLXVI;
begin
  TapAssertTrue(Self, '166 is CLXVI', 'CLXVI', RomanNumerals.roman(166));
end;

// cdb06885-4485-4d71-8bfb-c9d0f496b404
procedure RomanNumeralsTest.t_402_is_CDII;
begin
  TapAssertTrue(Self, '402 is CDII', 'CDII', RomanNumerals.roman(402));
end;

// 6b71841d-13b2-46b4-ba97-dec28133ea80
procedure RomanNumeralsTest.t_575_is_DLXXV;
begin
  TapAssertTrue(Self, '575 is DLXXV', 'DLXXV', RomanNumerals.roman(575));
end;

// dacb84b9-ea1c-4a61-acbb-ce6b36674906
procedure RomanNumeralsTest.t_666_is_DCLXVI;
begin
  TapAssertTrue(Self, '666 is DCLXVI', 'DCLXVI', RomanNumerals.roman(666));
end;

// 432de891-7fd6-4748-a7f6-156082eeca2f
procedure RomanNumeralsTest.t_911_is_CMXI;
begin
  TapAssertTrue(Self, '911 is CMXI', 'CMXI', RomanNumerals.roman(911));
end;

// e6de6d24-f668-41c0-88d7-889c0254d173
procedure RomanNumeralsTest.t_1024_is_MXXIV;
begin
  TapAssertTrue(Self, '1024 is MXXIV', 'MXXIV', RomanNumerals.roman(1024));
end;

// efbe1d6a-9f98-4eb5-82bc-72753e3ac328
procedure RomanNumeralsTest.t_1666_is_MDCLXVI;
begin
  TapAssertTrue(Self, '1666 is MDCLXVI', 'MDCLXVI', RomanNumerals.roman(1666));
end;

// bb550038-d4eb-4be2-a9ce-f21961ac3bc6
procedure RomanNumeralsTest.t_3000_is_MMM;
begin
  TapAssertTrue(Self, '3000 is MMM', 'MMM', RomanNumerals.roman(3000));
end;

// 3bc4b41c-c2e6-49d9-9142-420691504336
procedure RomanNumeralsTest.t_3001_is_MMMI;
begin
  TapAssertTrue(Self, '3001 is MMMI', 'MMMI', RomanNumerals.roman(3001));
end;

// 2f89cad7-73f6-4d1b-857b-0ef531f68b7e
procedure RomanNumeralsTest.t_3888_is_MMMDCCCLXXXVIII;
begin
  TapAssertTrue(Self, '3888 is MMMDCCCLXXXVIII', 'MMMDCCCLXXXVIII', RomanNumerals.roman(3888));
end;

// 4e18e96b-5fbb-43df-a91b-9cb511fe0856
procedure RomanNumeralsTest.t_3999_is_MMMCMXCIX;
begin
  TapAssertTrue(Self, '3999 is MMMCMXCIX', 'MMMCMXCIX', RomanNumerals.roman(3999));
end;

initialization
RegisterTest(RomanNumeralsTest);

end.
