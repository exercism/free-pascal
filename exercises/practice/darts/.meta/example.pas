unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x: single; const y: single) : uint8;

implementation

uses Math;

var
  spot   : single;
  points : uint8;

function score(const x: single; const y: single) : uint8;
begin
  spot   := x ** 2 + y ** 2;
  points := 0;
  if      spot <=  1 ** 2 then points := 10
  else if spot <=  5 ** 2 then points :=  5
  else if spot <= 10 ** 2 then points :=  1;
  result := points;
end;

end.
