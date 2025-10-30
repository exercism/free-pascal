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
begin
  TapAssertTrue(Self, 'Empty RNA sequence', '', RnaTranscription.ToRna(''));
end;

// a9558a3c-318c-4240-9256-5d5ed47005a6
procedure RnaTranscriptionTest.rna_complement_of_cytosine_is_guanine;
begin
  TapAssertTrue(Self, 'RNA complement of cytosine is guanine', 'G', RnaTranscription.ToRna('C'));
end;

// 6eedbb5c-12cb-4c8b-9f51-f8320b4dc2e7
procedure RnaTranscriptionTest.rna_complement_of_guanine_is_cytosine;
begin
  TapAssertTrue(Self, 'RNA complement of guanine is cytosine', 'C', RnaTranscription.ToRna('G'));
end;

// 870bd3ec-8487-471d-8d9a-a25046488d3e
procedure RnaTranscriptionTest.rna_complement_of_thymine_is_adenine;
begin
  TapAssertTrue(Self, 'RNA complement of thymine is adenine', 'A', RnaTranscription.ToRna('T'));
end;

// aade8964-02e1-4073-872f-42d3ffd74c5f
procedure RnaTranscriptionTest.rna_complement_of_adenine_is_uracil;
begin
  TapAssertTrue(Self, 'RNA complement of adenine is uracil', 'U', RnaTranscription.ToRna('A'));
end;

// 79ed2757-f018-4f47-a1d7-34a559392dbf
procedure RnaTranscriptionTest.rna_complement;
begin
  TapAssertTrue(Self, 'RNA complement', 'UGCACCAGAAUU', RnaTranscription.ToRna('ACGTGGTCTTAA'));
end;

initialization
RegisterTest(RnaTranscriptionTest);

end.
