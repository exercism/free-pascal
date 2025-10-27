unit ProteinTranslation;

{$mode ObjFPC}{$H+}

interface

uses SysUtils;

type
  TStrArray = Array Of String;

function proteins(const strand : string) : TStrArray;

implementation

function proteins(const strand : string) : TStrArray;
const
  CondonLength : uint8 = 3;
var
  i                : integer;
  codon, AminoAcid : string;
  DynAminoAcids    : TStrArray;
begin
  DynAminoAcids := [];
  i := 1;
  while i <= length(strand) do
    begin
      codon := copy(strand, i, CondonLength);
      inc(i, CondonLength);
      AminoAcid := '';
      case codon of
        'AUG'                   : AminoAcid := 'Methionine';
        'UUU','UUC'             : AminoAcid := 'Phenylalanine';
        'UUA','UUG'             : AminoAcid := 'Leucine';
        'UCU','UCC','UCA','UCG' : AminoAcid := 'Serine';
        'UAU','UAC'             : AminoAcid := 'Tyrosine';
        'UGU','UGC'             : AminoAcid := 'Cysteine';
        'UGG'                   : AminoAcid := 'Tryptophan';
        'UAA','UAG','UGA'       : break;
        otherwise raise Exception.Create('Invalid codon');
      end;
      insert(AminoAcid, DynAminoAcids, length(DynAminoAcids));
    end;

  result := DynAminoAcids;
end;

end.
