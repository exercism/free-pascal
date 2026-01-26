unit Trinary;

{$mode ObjFPC}{$H+}

interface

function ToDecimal(const trinary : string) : longword;

implementation

uses SysUtils;

function ToDecimal(const trinary : string) : longword;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(trinary);

end;

end.
