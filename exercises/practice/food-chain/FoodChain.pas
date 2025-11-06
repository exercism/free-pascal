unit FoodChain;

{$mode ObjFPC}{$H+}

interface

function recite(const StartVerse, EndVerse : int8) : string;

implementation

uses SysUtils;

function recite(const StartVerse, EndVerse : int8) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := IntToStr(StartVerse) + IntToStr(EndVerse);

end;

end.
