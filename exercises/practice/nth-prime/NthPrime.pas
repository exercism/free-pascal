unit NthPrime;

{$mode ObjFPC}{$H+}

interface

function prime(const number : dword) : cardinal;

implementation

uses SysUtils;

function prime(const number : dword) : cardinal;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := number;

end;

end.
