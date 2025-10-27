unit Triangle;

{$mode ObjFPC}{$H+}

interface

function equilateral(a: double; b: double; c: double): boolean;
function   isosceles(a: double; b: double; c: double): boolean;
function     scalene(a: double; b: double; c: double): boolean;

implementation

function IsTriangle(a: double; b: double; c: double): boolean;
begin
  result := (a > 0) and (b > 0) and (c > 0) and
            (a + b >= c) and (b + c >= a) and (a + c >= b);
end;

function equilateral(a: double; b: double; c: double): boolean;
begin
  result := IsTriangle(a, b, c) and (a = b) and (a = c);
end;

function isosceles(a: double; b: double; c: double): boolean;
begin
  result := IsTriangle(a, b, c) and ((a = b) or (a = c) or (b = c));
end;

function scalene(a: double; b: double; c: double): boolean;
begin
  result := IsTriangle(a, b, c) and (a <> b) and (a <> c) and (b <> c);
end;

end.
