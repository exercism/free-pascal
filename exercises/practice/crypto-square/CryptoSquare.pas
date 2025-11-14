unit CryptoSquare;

{$mode ObjFPC}{$H+}

interface

function ciphertext(const plaintext : string) : string;

implementation

uses SysUtils;

function ciphertext(const plaintext : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := plaintext;

end;

end.
