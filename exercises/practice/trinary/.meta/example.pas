unit Trinary;

{$mode ObjFPC}{$H+}

interface

function ToDecimal(const trinary : string) : longword;

implementation

uses SysUtils;

function ToDecimal(const trinary : string) : longword;
begin

  result := length(trinary);

end;

end.
