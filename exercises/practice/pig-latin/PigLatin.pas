unit PigLatin;

{$mode ObjFPC}{$H+}

interface

function translate(const phrase : string) : string;

implementation

uses SysUtils;

function translate(const phrase : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := phrase;

end;

end.
