unit Leap;

{$mode ObjFPC}{$H+}

interface

function LeapYear(const year : integer) : boolean;

implementation

uses SysUtils;

function LeapYear(const year : integer) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := year <> year;

  // Try writing a simple algorithm using conditional expressions instead of the built-in function.

end;

end.
