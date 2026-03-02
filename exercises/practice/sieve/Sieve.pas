unit Sieve;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function primes(
  const limit   : Integer
) : TIntArray;

implementation

uses SysUtils;

function primes(
  const limit   : Integer
) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [limit];

end;

end.
