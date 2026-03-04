unit PythagoreanTriplet;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;

function tripletsWithSum(const n : Integer) : TIntArray2D;

implementation

uses SysUtils;

function tripletsWithSum(const n : Integer) : TIntArray2D;
var
  a : Integer;
  b : Integer;
  c : Integer;
  numerator : Integer;
  denominator : Integer;
  triplet : TIntArray;
begin
  result := [];
  for a := 1 to n div 3 do
    begin
      numerator := n * (n - 2 * a);
      denominator := 2 * (n - a);
      b := numerator div denominator;
      if b <= a then
        exit;

      if numerator mod denominator = 0 then
        begin
          c := n - a - b;
          triplet := [a, b, c];
          insert(triplet, result, length(result));
        end;
    end;
end;

end.
