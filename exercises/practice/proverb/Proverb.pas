unit Proverb;

{$mode ObjFPC}{$H+}

interface

function recite(const strings : Array Of String) : string;

implementation

uses SysUtils, Classes;

function recite(const strings : Array Of String) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := IntToStr(length(strings));

end;

end.
