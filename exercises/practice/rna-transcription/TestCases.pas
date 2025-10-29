unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RnaTranscriptionTest = class(TTestCase)
  published
    procedure empty_rna_sequence;
    procedure rna_complement_of_cytosine_is_guanine;
    procedure rna_complement_of_guanine_is_cytosine;
    procedure rna_complement_of_thymine_is_adenine;
    procedure rna_complement_of_adenine_is_uracil;
    procedure rna_complement;
  end;

implementation

uses RnaTranscription;

// b4631f82-c98c-4a2f-90b3-c5c2b6c6f661
procedure RnaTranscriptionTest.empty_rna_sequence;
const expected = '';
var
  actual  : string;
  message : string;
begin
  actual  := RnaTranscription.ToRna('');
  message := EncodeJsonMessage('Empty RNA sequence', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a9558a3c-318c-4240-9256-5d5ed47005a6
procedure RnaTranscriptionTest.rna_complement_of_cytosine_is_guanine;
const expected = 'G';
var
  actual  : string;
  message : string;
begin
  actual  := RnaTranscription.ToRna('C');
  message := EncodeJsonMessage('RNA complement of cytosine is guanine', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 6eedbb5c-12cb-4c8b-9f51-f8320b4dc2e7
procedure RnaTranscriptionTest.rna_complement_of_guanine_is_cytosine;
const expected = 'C';
var
  actual  : string;
  message : string;
begin
  actual  := RnaTranscription.ToRna('G');
  message := EncodeJsonMessage('RNA complement of guanine is cytosine', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 870bd3ec-8487-471d-8d9a-a25046488d3e
procedure RnaTranscriptionTest.rna_complement_of_thymine_is_adenine;
const expected = 'A';
var
  actual  : string;
  message : string;
begin
  actual  := RnaTranscription.ToRna('T');
  message := EncodeJsonMessage('RNA complement of thymine is adenine', expected, actual);
  AssertTrue(message, expected = actual);
end;

// aade8964-02e1-4073-872f-42d3ffd74c5f
procedure RnaTranscriptionTest.rna_complement_of_adenine_is_uracil;
const expected = 'U';
var
  actual  : string;
  message : string;
begin
  actual  := RnaTranscription.ToRna('A');
  message := EncodeJsonMessage('RNA complement of adenine is uracil', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 79ed2757-f018-4f47-a1d7-34a559392dbf
procedure RnaTranscriptionTest.rna_complement;
const expected = 'UGCACCAGAAUU';
var
  actual  : string;
  message : string;
begin
  actual  := RnaTranscription.ToRna('ACGTGGTCTTAA');
  message := EncodeJsonMessage('RNA complement', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(RnaTranscriptionTest);

end.
