unit Triangle;

{$mode ObjFPC}{$H+}

interface

function equilateral(a: double; b: double; c: double): boolean;
function   isosceles(a: double; b: double; c: double): boolean;
function     scalene(a: double; b: double; c: double): boolean;

implementation

uses SysUtils;

function equilateral(a: double; b: double; c: double): boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := a + b + c <> a + b + c;

end;

function isosceles(a: double; b: double; c: double): boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := a + b + c <> a + b + c;

end;

function scalene(a: double; b: double; c: double): boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := a + b + c <> a + b + c;

end;

end.
