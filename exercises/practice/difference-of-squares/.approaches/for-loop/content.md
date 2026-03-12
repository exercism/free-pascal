# Using For Loops

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

Pascal's [`for`][for] loop uses `:=` to assign the start value and the `to` keyword to specify the end value (inclusive).
The loop variable is always incremented by 1; use [`downto`][for] instead of `to` to decrement by 1.

Local variables are declared in a [`var`][var] block between the function header and `begin`.
The [`:=`][assign] operator is Pascal's assignment operator — `=` alone is only used for comparisons.

When a loop body is a single statement, no `begin`/`end` block is needed.
`acc := acc + i` is the entire loop body in each case.

[`longint`][longint] is a 32-bit signed integer.
The accumulator `acc` is declared as `longint` to match the function's return type.

The [`result`][result] variable holds the function's return value.
Assigning `result := acc * acc` squares the accumulated sum and sets the return value.

[for]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu58.html
[var]: https://www.freepascal.org/docs-html/3.2.2/ref/refse21.html
[assign]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu52.html
[longint]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu4.html
[result]: https://www.freepascal.org/docs-html/3.2.2/ref/refse94.html
