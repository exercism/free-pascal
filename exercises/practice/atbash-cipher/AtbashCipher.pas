unit AtbashCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string) : string;
function decode(const phrase : string) : string;

implementation

uses SysUtils;

function encode(const phrase : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := phrase;

end;

function decode(const phrase : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := phrase;

end;

end.
