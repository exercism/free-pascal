unit RotationalCipher;

{$mode ObjFPC}{$H+}

interface

function rotate(const text : string; const shiftKey : shortint) : string;

implementation

uses SysUtils;

function rotate(const text : string; const shiftKey : shortint) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := Copy(text, 0, shiftKey);

end;

end.
