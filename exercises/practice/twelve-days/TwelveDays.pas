unit TwelveDays;

{$mode ObjFPC}{$H+}

interface

function recite(const startVerse, endVerse : integer) : string;

implementation

uses SysUtils;

function recite(const startVerse, endVerse : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := IntToStr(startVerse + endVerse);

end;

end.
