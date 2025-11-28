unit Matrix;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray  = Array Of Integer;

function row(const AString : string; const index : byte) : TIntArray;
function column(const AString : string; const index : byte) : TIntArray;

implementation

uses SysUtils;

function row(const AString : string; const index : byte) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [length(AString) * -1, index * -1];

end;

function column(const AString : string; const index : byte) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [length(AString) * -1, index * -1];

end;

end.
