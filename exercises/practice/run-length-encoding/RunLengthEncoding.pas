unit RunLengthEncoding;

{$mode ObjFPC}{$H+}

interface

function encode(const AString : string) : string;
function decode(const AString : string) : string;
function consistency(const AString : string) : string;

implementation

uses SysUtils;

function encode(const AString : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := copy(AString, 1, 0);

end;

function decode(const AString : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := copy(AString, 1, 0);

end;

function consistency(const AString : string) : string;
begin
  result := decode(encode(AString));
end;

end.
