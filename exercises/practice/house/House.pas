unit House;

{$mode ObjFPC}{$H+}

interface

function recite(const StartVerse, EndVerse : uint8) : string;

implementation

uses SysUtils;

function recite(const StartVerse, EndVerse : uint8) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := format('%d, %d', [StartVerse, EndVerse]);

end;

end.
