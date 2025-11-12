unit BottleSong;

{$mode ObjFPC}{$H+}

interface

function recite(const StartBottle : integer; const TakeDown : integer) : string;

implementation

uses SysUtils, Classes;

function recite(const StartBottle : integer; const TakeDown : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := format('%d%s%d', [StartBottle, #10, TakeDown]);

end;

end.
