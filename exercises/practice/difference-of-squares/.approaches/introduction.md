# Introduction

There are two main approaches to solving Difference of Squares in Free Pascal:

- [Using For Loops][approach-for-loop]
- [Using Closed-Form Formulas][approach-formula]


## Approach: Using For Loops

Accumulate running totals with [`for`][for] loops.

```pascal
function SquareOfSum(number : longint) : longint;
var
  i   : integer;
  acc : longint;
begin
  acc := 0;
  for i := 1 to number do
    acc := acc + i;
  result := acc * acc;
end;

function SumOfSquares(number : longint) : longint;
var
  i   : integer;
  acc : longint;
begin
  acc := 0;
  for i := 1 to number do
    acc := acc + i * i;
  result := acc;
end;

function DifferenceOfSquares(number : longint) : longint;
begin
  result := SquareOfSum(number) - SumOfSquares(number);
end;
```

For more information, check the [for-loop approach][approach-for-loop].


## Approach: Using Closed-Form Formulas

Compute results directly using the formulas `n*(n+1)/2` and `n*(n+1)*(2*n+1)/6`.

```pascal
function SquareOfSum(number : longint) : longint;
var
  s : longint;
begin
  s := number * (number + 1) div 2;
  result := s * s;
end;

function SumOfSquares(number : longint) : longint;
begin
  result := number * (number + 1) * (2 * number + 1) div 6;
end;

function DifferenceOfSquares(number : longint) : longint;
begin
  result := SquareOfSum(number) - SumOfSquares(number);
end;
```

For more information, check the [formula approach][approach-formula].


[for]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu58.html
[approach-for-loop]: https://exercism.org/tracks/free-pascal/exercises/difference-of-squares/approaches/for-loop
[approach-formula]: https://exercism.org/tracks/free-pascal/exercises/difference-of-squares/approaches/formula
