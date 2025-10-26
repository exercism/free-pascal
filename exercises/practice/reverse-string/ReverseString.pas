unit ReverseString;

{$mode ObjFPC}{$H+}

interface

function reverse(const value: string) : string;

implementation

uses SysUtils;

function reverse(const value: string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := value;
  // Try writing a simple algorithm instead of using the built-in function.

end;

end.
