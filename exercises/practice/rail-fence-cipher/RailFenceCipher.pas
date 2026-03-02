unit RailFenceCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const msg : String; const rails : Smallint) : String;
function decode(const msg : String; const rails : Smallint) : String;

implementation

uses SysUtils;

function encode(const msg : String; const rails : Smallint) : String;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := Copy(msg, 0, rails);

end;

function decode(const msg : String; const rails : Smallint) : String;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := Copy(msg, 0, rails);

end;

end.
