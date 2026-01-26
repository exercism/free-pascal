unit Binary;

{$mode ObjFPC}{$H+}

interface

function Decimal(const binary : string) : longword;

implementation

uses SysUtils;

function Decimal(const binary : string) : longword;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(binary);

end;

end.
