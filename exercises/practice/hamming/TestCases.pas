unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  HammingTest = class(TTestCase)
  published
    procedure empty_strands;
    procedure single_letter_identical_strands;
    procedure single_letter_different_strands;
    procedure long_identical_strands;
    procedure long_different_strands;
    procedure disallow_first_strand_longer;
    procedure disallow_second_strand_longer;
    procedure disallow_empty_first_strand;
    procedure disallow_empty_second_strand;
  end;

implementation

uses Hamming;

// f6dcb64f-03b0-4b60-81b1-3c9dbf47e887
procedure HammingTest.empty_strands;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := Hamming.distance('', '');
  message := EncodeJsonMessage('empty strands', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 54681314-eee2-439a-9db0-b0636c656156
procedure HammingTest.single_letter_identical_strands;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := Hamming.distance('A', 'A');
  message := EncodeJsonMessage('single letter identical strands', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 294479a3-a4c8-478f-8d63-6209815a827b
procedure HammingTest.single_letter_different_strands;
const expected = 1;
var
  actual  : integer;
  message : string;
begin
  actual  := Hamming.distance('G', 'T');
  message := EncodeJsonMessage('single letter different strands', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9aed5f34-5693-4344-9b31-40c692fb5592
procedure HammingTest.long_identical_strands;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := Hamming.distance('GGACTGAAATCTG', 'GGACTGAAATCTG');
  message := EncodeJsonMessage('long identical strands', expected, actual);
  AssertTrue(message, expected = actual);
end;

// cd2273a5-c576-46c8-a52b-dee251c3e6e5
procedure HammingTest.long_different_strands;
const expected = 9;
var
  actual  : integer;
  message : string;
begin
  actual  := Hamming.distance('GGACGGATTCTG', 'AGGACGGATTCT');
  message := EncodeJsonMessage('long different strands', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b9228bb1-465f-4141-b40f-1f99812de5a8
procedure HammingTest.disallow_first_strand_longer;
const expected = 'strands must be of equal length';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    Hamming.distance('AATG', 'AAA');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('disallow first strand longer', expected, actual);
  AssertTrue(message, expected = actual);
end;

// dab38838-26bb-4fff-acbe-3b0a9bfeba2d
procedure HammingTest.disallow_second_strand_longer;
const expected = 'strands must be of equal length';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    Hamming.distance('ATA', 'AGTG');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('disallow second strand longer', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b764d47c-83ff-4de2-ab10-6cfe4b15c0f3
procedure HammingTest.disallow_empty_first_strand;
const expected = 'strands must be of equal length';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    Hamming.distance('', 'G');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('disallow empty first strand', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9ab9262f-3521-4191-81f5-0ed184a5aa89
procedure HammingTest.disallow_empty_second_strand;
const expected = 'strands must be of equal length';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    Hamming.distance('G', '');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('disallow empty second strand', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(HammingTest);

end.
