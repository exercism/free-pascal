unit SecretHandshake;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function commands(const number : integer) : TStrArray;

implementation

uses SysUtils;

function commands(const number : integer) : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [ IntToStr(number) ];

end;

end.
