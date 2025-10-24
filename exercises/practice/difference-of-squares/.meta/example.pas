unit DifferenceOfSquares;

{$mode ObjFPC}{$H+}

interface

function SquareOfSum(number : longint) : longint;
function SumOfSquares(number : longint) : longint;
function DifferenceOfSquares(number : longint) : longint;

implementation

function SquareOfSum(number : longint) : longint;
var
  i   : integer;
  acc : longint;
begin
  acc := 0;
  for i := 1 to number do
    begin
      acc := acc + i;
    end;
  result := acc * acc;
end;

function SumOfSquares(number : longint) : longint;
var
  i   : integer;
  acc : longint;
begin
  acc := 0;
  for i := 1 to number do
    begin
      acc := acc + i * i;
    end;
  result := acc;
end;

function DifferenceOfSquares(number : longint) : longint;
begin
  result := SquareOfSum(number) - SumOfSquares(number);
end;

end.
