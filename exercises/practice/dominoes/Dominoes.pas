unit Dominoes;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;

function canChain(const stones : TIntArray2D) : Boolean;

implementation

uses SysUtils;

function canChain(const stones : TIntArray2D) : Boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := (length(stones) > 0);

end;

end.
