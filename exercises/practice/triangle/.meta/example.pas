unit Triangle;

{$mode ObjFPC}{$H+}

interface

function equilateral(const a, b, c : double): boolean;
function   isosceles(const a, b, c : double): boolean;
function     scalene(const a, b, c : double): boolean;

implementation

function IsTriangle(const a, b, c : double): boolean;
begin
  result := (a > 0) and (b > 0) and (c > 0) and
            (a + b >= c) and (b + c >= a) and (a + c >= b);
end;

function equilateral(const a, b, c : double): boolean;
begin
  result := IsTriangle(a, b, c) and (a = b) and (a = c);
end;

function isosceles(const a, b, c : double): boolean;
begin
  result := IsTriangle(a, b, c) and ((a = b) or (a = c) or (b = c));
end;

function scalene(const a, b, c : double): boolean;
begin
  result := IsTriangle(a, b, c) and (a <> b) and (a <> c) and (b <> c);
end;

end.
