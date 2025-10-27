unit RnaTranscription;

{$mode ObjFPC}{$H+}

interface

function ToRna(const dna : string) : string;

implementation

var
  i          : integer;
  nucleotide : string;
  complement : string;
  rna        : string;

function ToRna(const dna : string) : string;
begin
  rna := '';

  for i:= 1 to length(dna) do
    begin
      nucleotide := copy(dna, i, 1);
      case nucleotide of
        'G' : complement := 'C';
        'C' : complement := 'G';
        'T' : complement := 'A';
        'A' : complement := 'U';
      end;
      rna := rna + complement;
    end;

  result := rna;
end;

end.
