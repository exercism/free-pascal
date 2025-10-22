unit Acronym;

{$mode ObjFPC}{$H+}

interface

function abbreviate(const phrase: string) : string;

implementation

uses SysUtils;

function abbreviate(const phrase: string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := phrase;

end;

end.
