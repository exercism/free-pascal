unit Allergies;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function list(const score : integer) : TStrArray;
function AllergicTo(const item : string; const score : integer) : boolean;

implementation

uses SysUtils;

function list(const score : integer) : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [IntToStr(score)];

end;

function AllergicTo(const item : string; const score : integer) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(item) > score;

end;


end.
