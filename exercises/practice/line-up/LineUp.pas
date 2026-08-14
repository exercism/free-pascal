unit LineUp;

{$mode ObjFPC}{$H+}

interface

function FormatMessage(
  const name : ShortString; const number : Word
) : ShortString;

implementation

uses SysUtils;

function FormatMessage(
  const name : ShortString; const number : Word
) : ShortString;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := name + IntToStr(number);

end;

end.
