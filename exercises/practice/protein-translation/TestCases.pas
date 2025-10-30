unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ProteinTranslationTest = class(TTestCase)
  published
    procedure empty_rna_sequence_results_in_no_proteins;
    procedure methionine_rna_sequence;
    procedure phenylalanine_rna_sequence_1;
    procedure phenylalanine_rna_sequence_2;
    procedure leucine_rna_sequence_1;
    procedure leucine_rna_sequence_2;
    procedure serine_rna_sequence_1;
    procedure serine_rna_sequence_2;
    procedure serine_rna_sequence_3;
    procedure serine_rna_sequence_4;
    procedure tyrosine_rna_sequence_1;
    procedure tyrosine_rna_sequence_2;
    procedure cysteine_rna_sequence_1;
    procedure cysteine_rna_sequence_2;
    procedure tryptophan_rna_sequence;
    procedure stop_codon_rna_sequence_1;
    procedure stop_codon_rna_sequence_2;
    procedure stop_codon_rna_sequence_3;
    procedure sequence_of_two_protein_codons_translates_into_proteins;
    procedure sequence_of_two_different_protein_codons_translates_into_proteins;
    procedure translate_rna_strand_into_correct_protein_list;
    procedure translation_stops_if_stop_codon_at_beginning_of_sequence;
    procedure translation_stops_if_stop_codon_at_end_of_two_codon_sequence;
    procedure translation_stops_if_stop_codon_at_end_of_three_codon_sequence;
    procedure translation_stops_if_stop_codon_in_middle_of_three_codon_sequence;
    procedure translation_stops_if_stop_codon_in_middle_of_six_codon_sequence;
    procedure sequence_of_two_non_stop_codons_does_not_translate_to_a_stop_codon;
    procedure unknown_amino_acids_not_part_of_a_codon_cant_translate;
    procedure incomplete_rna_sequence_cant_translate;
    procedure incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon;
  end;

implementation

uses ProteinTranslation;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const Expected : string    ;
  const strand   : string
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    ProteinTranslation.proteins(strand);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 2c44f7bf-ba20-43f7-a3bf-f2219c0c3f98
procedure ProteinTranslationTest.empty_rna_sequence_results_in_no_proteins;
begin
  TapAssertTrue(Self, 'Empty RNA sequence results in no proteins', [], ProteinTranslation.proteins(''));
end;

// 96d3d44f-34a2-4db4-84cd-fff523e069be
procedure ProteinTranslationTest.methionine_rna_sequence;
begin
  TapAssertTrue(Self, 'Methionine RNA sequence', ['Methionine'], ProteinTranslation.proteins('AUG'));
end;

// 1b4c56d8-d69f-44eb-be0e-7b17546143d9
procedure ProteinTranslationTest.phenylalanine_rna_sequence_1;
begin
  TapAssertTrue(Self, 'Phenylalanine RNA sequence 1', ['Phenylalanine'], ProteinTranslation.proteins('UUU'));
end;

// 81b53646-bd57-4732-b2cb-6b1880e36d11
procedure ProteinTranslationTest.phenylalanine_rna_sequence_2;
begin
  TapAssertTrue(Self, 'Phenylalanine RNA sequence 2', ['Phenylalanine'], ProteinTranslation.proteins('UUC'));
end;

// 42f69d4f-19d2-4d2c-a8b0-f0ae9ee1b6b4
procedure ProteinTranslationTest.leucine_rna_sequence_1;
begin
  TapAssertTrue(Self, 'Leucine RNA sequence 1', ['Leucine'], ProteinTranslation.proteins('UUA'));
end;

// ac5edadd-08ed-40a3-b2b9-d82bb50424c4
procedure ProteinTranslationTest.leucine_rna_sequence_2;
begin
  TapAssertTrue(Self, 'Leucine RNA sequence 2', ['Leucine'], ProteinTranslation.proteins('UUG'));
end;

// 8bc36e22-f984-44c3-9f6b-ee5d4e73f120
procedure ProteinTranslationTest.serine_rna_sequence_1;
begin
  TapAssertTrue(Self, 'Serine RNA sequence 1', ['Serine'], ProteinTranslation.proteins('UCU'));
end;

// 5c3fa5da-4268-44e5-9f4b-f016ccf90131
procedure ProteinTranslationTest.serine_rna_sequence_2;
begin
  TapAssertTrue(Self, 'Serine RNA sequence 2', ['Serine'], ProteinTranslation.proteins('UCC'));
end;

// 00579891-b594-42b4-96dc-7ff8bf519606
procedure ProteinTranslationTest.serine_rna_sequence_3;
begin
  TapAssertTrue(Self, 'Serine RNA sequence 3', ['Serine'], ProteinTranslation.proteins('UCA'));
end;

// 08c61c3b-fa34-4950-8c4a-133945570ef6
procedure ProteinTranslationTest.serine_rna_sequence_4;
begin
  TapAssertTrue(Self, 'Serine RNA sequence 4', ['Serine'], ProteinTranslation.proteins('UCG'));
end;

// 54e1e7d8-63c0-456d-91d2-062c72f8eef5
procedure ProteinTranslationTest.tyrosine_rna_sequence_1;
begin
  TapAssertTrue(Self, 'Tyrosine RNA sequence 1', ['Tyrosine'], ProteinTranslation.proteins('UAU'));
end;

// 47bcfba2-9d72-46ad-bbce-22f7666b7eb1
procedure ProteinTranslationTest.tyrosine_rna_sequence_2;
begin
  TapAssertTrue(Self, 'Tyrosine RNA sequence 2', ['Tyrosine'], ProteinTranslation.proteins('UAC'));
end;

// 3a691829-fe72-43a7-8c8e-1bd083163f72
procedure ProteinTranslationTest.cysteine_rna_sequence_1;
begin
  TapAssertTrue(Self, 'Cysteine RNA sequence 1', ['Cysteine'], ProteinTranslation.proteins('UGU'));
end;

// 1b6f8a26-ca2f-43b8-8262-3ee446021767
procedure ProteinTranslationTest.cysteine_rna_sequence_2;
begin
  TapAssertTrue(Self, 'Cysteine RNA sequence 2', ['Cysteine'], ProteinTranslation.proteins('UGC'));
end;

// 1e91c1eb-02c0-48a0-9e35-168ad0cb5f39
procedure ProteinTranslationTest.tryptophan_rna_sequence;
begin
  TapAssertTrue(Self, 'Tryptophan RNA sequence', ['Tryptophan'], ProteinTranslation.proteins('UGG'));
end;

// e547af0b-aeab-49c7-9f13-801773a73557
procedure ProteinTranslationTest.stop_codon_rna_sequence_1;
begin
  TapAssertTrue(Self, 'STOP codon RNA sequence 1', [], ProteinTranslation.proteins('UAA'));
end;

// 67640947-ff02-4f23-a2ef-816f8a2ba72e
procedure ProteinTranslationTest.stop_codon_rna_sequence_2;
begin
  TapAssertTrue(Self, 'STOP codon RNA sequence 2', [], ProteinTranslation.proteins('UAG'));
end;

// 9c2ad527-ebc9-4ace-808b-2b6447cb54cb
procedure ProteinTranslationTest.stop_codon_rna_sequence_3;
begin
  TapAssertTrue(Self, 'STOP codon RNA sequence 3', [], ProteinTranslation.proteins('UGA'));
end;

// f4d9d8ee-00a8-47bf-a1e3-1641d4428e54
procedure ProteinTranslationTest.sequence_of_two_protein_codons_translates_into_proteins;
begin
  TapAssertTrue(Self, 'Sequence of two protein codons translates into proteins', ['Phenylalanine', 'Phenylalanine'], ProteinTranslation.proteins('UUUUUU'));
end;

// dd22eef3-b4f1-4ad6-bb0b-27093c090a9d
procedure ProteinTranslationTest.sequence_of_two_different_protein_codons_translates_into_proteins;
begin
  TapAssertTrue(Self, 'Sequence of two different protein codons translates into proteins', ['Leucine', 'Leucine'], ProteinTranslation.proteins('UUAUUG'));
end;

// d0f295df-fb70-425c-946c-ec2ec185388e
procedure ProteinTranslationTest.translate_rna_strand_into_correct_protein_list;
begin
  TapAssertTrue(Self, 'Translate RNA strand into correct protein list', ['Methionine', 'Phenylalanine', 'Tryptophan'], ProteinTranslation.proteins('AUGUUUUGG'));
end;

// e30e8505-97ec-4e5f-a73e-5726a1faa1f4
procedure ProteinTranslationTest.translation_stops_if_stop_codon_at_beginning_of_sequence;
begin
  TapAssertTrue(Self, 'Translation stops if STOP codon at beginning of sequence', [], ProteinTranslation.proteins('UAGUGG'));
end;

// 5358a20b-6f4c-4893-bce4-f929001710f3
procedure ProteinTranslationTest.translation_stops_if_stop_codon_at_end_of_two_codon_sequence;
begin
  TapAssertTrue(Self, 'Translation stops if STOP codon at end of two-codon sequence', ['Tryptophan'], ProteinTranslation.proteins('UGGUAG'));
end;

// ba16703a-1a55-482f-bb07-b21eef5093a3
procedure ProteinTranslationTest.translation_stops_if_stop_codon_at_end_of_three_codon_sequence;
begin
  TapAssertTrue(Self, 'Translation stops if STOP codon at end of three-codon sequence', ['Methionine', 'Phenylalanine'], ProteinTranslation.proteins('AUGUUUUAA'));
end;

// 4089bb5a-d5b4-4e71-b79e-b8d1f14a2911
procedure ProteinTranslationTest.translation_stops_if_stop_codon_in_middle_of_three_codon_sequence;
begin
  TapAssertTrue(Self, 'Translation stops if STOP codon in middle of three-codon sequence', ['Tryptophan'], ProteinTranslation.proteins('UGGUAGUGG'));
end;

// 2c2a2a60-401f-4a80-b977-e0715b23b93d
procedure ProteinTranslationTest.translation_stops_if_stop_codon_in_middle_of_six_codon_sequence;
begin
  TapAssertTrue(Self, 'Translation stops if STOP codon in middle of six-codon sequence', ['Tryptophan', 'Cysteine', 'Tyrosine'], ProteinTranslation.proteins('UGGUGUUAUUAAUGGUUU'));
end;

// f6f92714-769f-4187-9524-e353e8a41a80
procedure ProteinTranslationTest.sequence_of_two_non_stop_codons_does_not_translate_to_a_stop_codon;
begin
  TapAssertTrue(Self, 'Sequence of two non-STOP codons does not translate to a STOP codon', ['Methionine', 'Methionine'], ProteinTranslation.proteins('AUGAUG'));
end;

// 9eac93f3-627a-4c90-8653-6d0a0595bc6f
procedure ProteinTranslationTest.unknown_amino_acids_not_part_of_a_codon_cant_translate;
begin
  TapAssertExpectionMessage(Self, 'Unknown amino acids, not part of a codon, can''t translate', 'Invalid codon', 'XYZ');
end;

// 9d73899f-e68e-4291-b1e2-7bf87c00f024
procedure ProteinTranslationTest.incomplete_rna_sequence_cant_translate;
begin
  TapAssertExpectionMessage(Self, 'Incomplete RNA sequence can''t translate', 'Invalid codon', 'AUGU');
end;

// 43945cf7-9968-402d-ab9f-b8a28750b050
procedure ProteinTranslationTest.incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon;
begin
  TapAssertTrue(Self, 'Incomplete RNA sequence can translate if valid until a STOP codon', ['Phenylalanine', 'Phenylalanine'], ProteinTranslation.proteins('UUCUUCUAAUGGU'));
end;

initialization
RegisterTest(ProteinTranslationTest);

end.
