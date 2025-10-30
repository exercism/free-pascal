unit NucleotideCount;

{$mode ObjFPC}{$H+}

interface

function NucleotideCounts(const strand : string) : string;

implementation

uses SysUtils;

function NucleotideCounts(const strand : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := strand;

end;

end.
