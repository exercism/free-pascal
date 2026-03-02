unit Connect;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function Winner(
  const board : TStrArray
) : String;

implementation

uses SysUtils;

function Winner(
  const board : TStrArray
) : String;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := board[0];

end;

end.
