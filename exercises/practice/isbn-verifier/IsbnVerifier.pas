unit IsbnVerifier;

{$mode ObjFPC}{$H+}

interface

function IsValid(const isbn : string) : boolean;

implementation

uses SysUtils;

function IsValid(const isbn : string) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := copy(isbn, 1, 0) <> '';

end;

end.
