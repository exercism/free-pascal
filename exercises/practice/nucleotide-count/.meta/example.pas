unit NucleotideCount;

{$mode ObjFPC}{$H+}

interface

function NucleotideCounts(const strand: string) : string;

implementation

uses SysUtils;

const
  nucleotides : Array [0..3] Of Char = ('A', 'C', 'G', 'T');

function GetNucleotideIdx (const nucleotide : char) : integer;
var i : integer;
begin
  for i := low(nucleotides) to high(nucleotides) do
    if nucleotide = nucleotides[i] then exit(i);
  result := -1;
end;

function NucleotideCounts(const strand: string) : string;
var
  i, idx : integer;
  counts : Array [0..3] Of Integer = (0, 0, 0, 0);
  output : string;
begin
  for i := low(strand) to high(strand) do
    begin
      idx := GetNucleotideIdx(strand[i]);
      if idx = -1 then
        raise Exception.Create('Invalid nucleotide in strand');
      inc(counts[idx]);
    end;
  output := '';
  for i:= low(nucleotides) to high(nucleotides) do
    begin
      if output = '' then
        output := format('%s: %d', [nucleotides[i], counts[i]])
      else
        output := output + #10 + format('%s: %d', [nucleotides[i], counts[i]]);
    end;
  result := output;
end;

end.
