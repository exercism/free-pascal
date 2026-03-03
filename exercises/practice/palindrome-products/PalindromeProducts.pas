unit PalindromeProducts;

{$mode ObjFPC}{$H+}

interface

function smallest(const min, max : UInt64) : UInt64;
function largest(const min, max : UInt64) : UInt64;

implementation

uses SysUtils;

function smallest(const min, max : UInt64) : UInt64;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := min * max;

end;

function largest(const min, max : UInt64) : UInt64;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := min * max;

end;

end.
