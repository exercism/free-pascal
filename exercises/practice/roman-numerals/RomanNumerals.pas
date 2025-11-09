unit RomanNumerals;

{$mode ObjFPC}{$H+}

interface

function roman(const number : integer) : string;

implementation

uses SysUtils;

function roman(const number : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := IntToStr(number);
  // Try to creating an algorithm instead of using the built-in function.

end;

end.
