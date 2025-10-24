unit Isogram;

{$mode ObjFPC}{$H+}

interface

function IsIsogram(const phrase: string) : boolean;

implementation

uses SysUtils;

function IsIsogram(const phrase: string) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := phrase <> phrase;

end;

end.
