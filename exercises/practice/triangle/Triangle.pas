unit Triangle;

{$mode ObjFPC}{$H+}

interface

function equilateral(const a, b, c : double): boolean;
function   isosceles(const a, b, c : double): boolean;
function     scalene(const a, b, c : double): boolean;

implementation

uses SysUtils;

function equilateral(const a, b, c : double): boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := a + b + c <> a + b + c;

end;

function isosceles(const a, b, c : double): boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := a + b + c <> a + b + c;

end;

function scalene(const a, b, c : double): boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := a + b + c <> a + b + c;

end;

end.
