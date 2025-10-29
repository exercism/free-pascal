unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  NucleotideCountTest = class(TTestCase)
  published
    procedure empty_strand;
    procedure can_count_one_nucleotide_in_single_character_input;
    procedure strand_with_repeated_nucleotide;
    procedure strand_with_multiple_nucleotides;
    procedure strand_with_invalid_nucleotides;
  end;

implementation

uses NucleotideCount;

var message : string;

// 3e5c30a8-87e2-4845-a815-a49671ade970
procedure NucleotideCountTest.empty_strand;
const expected = 'A: 0' + #10 + 'C: 0' + #10 + 'G: 0' + #10 + 'T: 0';
var actual : string;
begin
  actual  := NucleotideCount.NucleotideCounts('');
  message := EncodeJsonMessage('empty strand', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a0ea42a6-06d9-4ac6-828c-7ccaccf98fec
procedure NucleotideCountTest.can_count_one_nucleotide_in_single_character_input;
const expected = 'A: 0' + #10 + 'C: 0' + #10 + 'G: 1' + #10 + 'T: 0';
var actual : string;
begin
  actual  := NucleotideCount.NucleotideCounts('G');
  message := EncodeJsonMessage('can count one nucleotide in single-character input', expected, actual);
  AssertTrue(message, expected = actual);
end;

// eca0d565-ed8c-43e7-9033-6cefbf5115b5
procedure NucleotideCountTest.strand_with_repeated_nucleotide;
const expected = 'A: 0' + #10 + 'C: 0' + #10 + 'G: 7' + #10 + 'T: 0';
var actual : string;
begin
  actual  := NucleotideCount.NucleotideCounts('GGGGGGG');
  message := EncodeJsonMessage('strand with repeated nucleotide', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 40a45eac-c83f-4740-901a-20b22d15a39f
procedure NucleotideCountTest.strand_with_multiple_nucleotides;
const expected = 'A: 20' + #10 + 'C: 12' + #10 + 'G: 17' + #10 + 'T: 21';
var actual : string;
begin
  actual  := NucleotideCount.NucleotideCounts('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC');
  message := EncodeJsonMessage('strand with multiple nucleotides', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b4c47851-ee9e-4b0a-be70-a86e343bd851
procedure NucleotideCountTest.strand_with_invalid_nucleotides;
const expected = 'Invalid nucleotide in strand';
var actual : string;
begin
  actual := '';
  try
    NucleotideCount.NucleotideCounts('AGXXACT');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('strand with invalid nucleotides', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(NucleotideCountTest);

end.
