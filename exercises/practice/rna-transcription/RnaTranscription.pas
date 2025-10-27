unit RnaTranscription;

{$mode ObjFPC}{$H+}

interface

function ToRna(const dna : string) : string;

implementation

uses SysUtils;

function ToRna(const dna : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := dna;

end;

end.
