unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  LineUpTest = class(TTestCase)
  published
    procedure format_smallest_non_exceptional_ordinal_numeral_4;
    procedure format_greatest_single_digit_non_exceptional_ordinal_numeral_9;
    procedure format_non_exceptional_ordinal_numeral_5;
    procedure format_non_exceptional_ordinal_numeral_6;
    procedure format_non_exceptional_ordinal_numeral_7;
    procedure format_non_exceptional_ordinal_numeral_8;
    procedure format_exceptional_ordinal_numeral_1;
    procedure format_exceptional_ordinal_numeral_2;
    procedure format_exceptional_ordinal_numeral_3;
    procedure format_smallest_two_digit_non_exceptional_ordinal_numeral_10;
    procedure format_non_exceptional_ordinal_numeral_11;
    procedure format_non_exceptional_ordinal_numeral_12;
    procedure format_non_exceptional_ordinal_numeral_13;
    procedure format_exceptional_ordinal_numeral_21;
    procedure format_exceptional_ordinal_numeral_62;
    procedure format_exceptional_ordinal_numeral_100;
    procedure format_exceptional_ordinal_numeral_101;
    procedure format_non_exceptional_ordinal_numeral_112;
    procedure format_exceptional_ordinal_numeral_123;
  end;

implementation

uses LineUp;

// 7760d1b8-4864-4db4-953b-0fa7c047dbc0
procedure LineUpTest.format_smallest_non_exceptional_ordinal_numeral_4;
begin
  TapAssertTrue(Self, 'format smallest non-exceptional ordinal numeral 4', 'Gianna, you are the 4th customer we serve today. Thank you!', LineUp.FormatMessage('Gianna', 4));
end;

// e8b7c715-6baa-4f7b-8fb3-2fa48044ab7a
procedure LineUpTest.format_greatest_single_digit_non_exceptional_ordinal_numeral_9;
begin
  TapAssertTrue(Self, 'format greatest single digit non-exceptional ordinal numeral 9', 'Maarten, you are the 9th customer we serve today. Thank you!', LineUp.FormatMessage('Maarten', 9));
end;

// f370aae9-7ae7-4247-90ce-e8ff8c6934df
procedure LineUpTest.format_non_exceptional_ordinal_numeral_5;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 5', 'Petronila, you are the 5th customer we serve today. Thank you!', LineUp.FormatMessage('Petronila', 5));
end;

// 37f10dea-42a2-49de-bb92-0b690b677908
procedure LineUpTest.format_non_exceptional_ordinal_numeral_6;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 6', 'Attakullakulla, you are the 6th customer we serve today. Thank you!', LineUp.FormatMessage('Attakullakulla', 6));
end;

// d8dfb9a2-3a1f-4fee-9dae-01af3600054e
procedure LineUpTest.format_non_exceptional_ordinal_numeral_7;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 7', 'Kate, you are the 7th customer we serve today. Thank you!', LineUp.FormatMessage('Kate', 7));
end;

// 505ec372-1803-42b1-9377-6934890fd055
procedure LineUpTest.format_non_exceptional_ordinal_numeral_8;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 8', 'Maximiliano, you are the 8th customer we serve today. Thank you!', LineUp.FormatMessage('Maximiliano', 8));
end;

// 8267072d-be1f-4f70-b34a-76b7557a47b9
procedure LineUpTest.format_exceptional_ordinal_numeral_1;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 1', 'Mary, you are the 1st customer we serve today. Thank you!', LineUp.FormatMessage('Mary', 1));
end;

// 4d8753cb-0364-4b29-84b8-4374a4fa2e3f
procedure LineUpTest.format_exceptional_ordinal_numeral_2;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 2', 'Haruto, you are the 2nd customer we serve today. Thank you!', LineUp.FormatMessage('Haruto', 2));
end;

// 8d44c223-3a7e-4f48-a0ca-78e67bf98aa7
procedure LineUpTest.format_exceptional_ordinal_numeral_3;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 3', 'Henriette, you are the 3rd customer we serve today. Thank you!', LineUp.FormatMessage('Henriette', 3));
end;

// 6c4f6c88-b306-4f40-bc78-97cdd583c21a
procedure LineUpTest.format_smallest_two_digit_non_exceptional_ordinal_numeral_10;
begin
  TapAssertTrue(Self, 'format smallest two digit non-exceptional ordinal numeral 10', 'Alvarez, you are the 10th customer we serve today. Thank you!', LineUp.FormatMessage('Alvarez', 10));
end;

// e257a43f-d2b1-457a-97df-25f0923fc62a
procedure LineUpTest.format_non_exceptional_ordinal_numeral_11;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 11', 'Jacqueline, you are the 11th customer we serve today. Thank you!', LineUp.FormatMessage('Jacqueline', 11));
end;

// bb1db695-4d64-457f-81b8-4f5a2107e3f4
procedure LineUpTest.format_non_exceptional_ordinal_numeral_12;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 12', 'Juan, you are the 12th customer we serve today. Thank you!', LineUp.FormatMessage('Juan', 12));
end;

// 60a3187c-9403-4835-97de-4f10ebfd63e2
procedure LineUpTest.format_non_exceptional_ordinal_numeral_13;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 13', 'Patricia, you are the 13th customer we serve today. Thank you!', LineUp.FormatMessage('Patricia', 13));
end;

// 2bdcebc5-c029-4874-b6cc-e9bec80d603a
procedure LineUpTest.format_exceptional_ordinal_numeral_21;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 21', 'Washi, you are the 21st customer we serve today. Thank you!', LineUp.FormatMessage('Washi', 21));
end;

// 74ee2317-0295-49d2-baf0-d56bcefa14e3
procedure LineUpTest.format_exceptional_ordinal_numeral_62;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 62', 'Nayra, you are the 62nd customer we serve today. Thank you!', LineUp.FormatMessage('Nayra', 62));
end;

// b37c332d-7f68-40e3-8503-e43cbd67a0c4
procedure LineUpTest.format_exceptional_ordinal_numeral_100;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 100', 'John, you are the 100th customer we serve today. Thank you!', LineUp.FormatMessage('John', 100));
end;

// 0375f250-ce92-4195-9555-00e28ccc4d99
procedure LineUpTest.format_exceptional_ordinal_numeral_101;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 101', 'Zeinab, you are the 101st customer we serve today. Thank you!', LineUp.FormatMessage('Zeinab', 101));
end;

// 0d8a4974-9a8a-45a4-aca7-a9fb473c9836
procedure LineUpTest.format_non_exceptional_ordinal_numeral_112;
begin
  TapAssertTrue(Self, 'format non-exceptional ordinal numeral 112', 'Knud, you are the 112th customer we serve today. Thank you!', LineUp.FormatMessage('Knud', 112));
end;

// 06b62efe-199e-4ce7-970d-4bf73945713f
procedure LineUpTest.format_exceptional_ordinal_numeral_123;
begin
  TapAssertTrue(Self, 'format exceptional ordinal numeral 123', 'Yma, you are the 123rd customer we serve today. Thank you!', LineUp.FormatMessage('Yma', 123));
end;

initialization
RegisterTest(LineUpTest);

end.
