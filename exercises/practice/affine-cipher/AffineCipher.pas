unit AffineCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string; const a, b : longword) : string;
function decode(const phrase : string; const a, b : longword) : string;

implementation

uses SysUtils;

function encode(const phrase : string; const a, b : longword) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := Copy(phrase, a, b);

end;

function decode(const phrase : string; const a, b : longword) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := Copy(phrase, a, b);

end;

end.
