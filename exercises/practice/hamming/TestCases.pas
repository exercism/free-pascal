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

procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const Expected : string    ;
  const strand1  : string    ;
  const strand2  : string
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    Hamming.distance(strand1, strand2);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// f6dcb64f-03b0-4b60-81b1-3c9dbf47e887
procedure HammingTest.empty_strands;
begin
  TapAssertTrue(Self, 'empty strands', 0, Hamming.distance('', ''));
end;

// 54681314-eee2-439a-9db0-b0636c656156
procedure HammingTest.single_letter_identical_strands;
begin
  TapAssertTrue(Self, 'single letter identical strands', 0, Hamming.distance('A', 'A'));
end;

// 294479a3-a4c8-478f-8d63-6209815a827b
procedure HammingTest.single_letter_different_strands;
begin
  TapAssertTrue(Self, 'single letter different strands', 1, Hamming.distance('G', 'T'));
end;

// 9aed5f34-5693-4344-9b31-40c692fb5592
procedure HammingTest.long_identical_strands;
begin
  TapAssertTrue(Self, 'long identical strands', 0, Hamming.distance('GGACTGAAATCTG', 'GGACTGAAATCTG'));
end;

// cd2273a5-c576-46c8-a52b-dee251c3e6e5
procedure HammingTest.long_different_strands;
begin
  TapAssertTrue(Self, 'long different strands', 9, Hamming.distance('GGACGGATTCTG', 'AGGACGGATTCT'));
end;

// b9228bb1-465f-4141-b40f-1f99812de5a8
procedure HammingTest.disallow_first_strand_longer;
begin
  TapAssertExpectionMessage(Self, 'disallow first strand longer', 'strands must be of equal length', 'AATG', 'AAA');
end;

// dab38838-26bb-4fff-acbe-3b0a9bfeba2d
procedure HammingTest.disallow_second_strand_longer;
begin
  TapAssertExpectionMessage(Self, 'disallow second strand longer', 'strands must be of equal length', 'ATA', 'AGTG');
end;

// b764d47c-83ff-4de2-ab10-6cfe4b15c0f3
procedure HammingTest.disallow_empty_first_strand;
begin
  TapAssertExpectionMessage(Self, 'disallow empty first strand', 'strands must be of equal length', '', 'G');
end;

// 9ab9262f-3521-4191-81f5-0ed184a5aa89
procedure HammingTest.disallow_empty_second_strand;
begin
  TapAssertExpectionMessage(Self, 'disallow empty second strand', 'strands must be of equal length', 'G', '');
end;

initialization
RegisterTest(HammingTest);

end.
