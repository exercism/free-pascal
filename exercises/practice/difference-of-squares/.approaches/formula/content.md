# Using Closed-Form Formulas

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

Both functions use closed-form [mathematical formulas][formula]:

- The sum of integers 1 through `n` is `n * (n + 1) / 2`.
  Squaring that sum gives `SquareOfSum`.
- The sum of squares of integers 1 through `n` is `n * (n + 1) * (2n + 1) / 6`.

These are O(1) operations regardless of the value of `number`, compared to O(n) for the loop-based approach.

Pascal's [`div`][div] operator performs integer division, truncating any remainder — equivalent to `//` in Python or integer `/` in Java.
Using `div` here is correct because both formulas are guaranteed to produce whole-number results:
`n * (n + 1)` is always divisible by 2, and `n * (n + 1) * (2n + 1)` is always divisible by 6.

Do not use `/` for integer division in Pascal: when applied to integer operands it produces a [`real`][real] (floating-point) result,
which cannot be assigned back to a `longint` without an explicit cast.

A local variable `s` is used in `SquareOfSum` to compute the intermediate sum before squaring, avoiding the need to evaluate the formula twice.
`SumOfSquares` needs no intermediate variable because its result is a single expression.

[formula]: https://en.wikipedia.org/wiki/Triangular_number
[div]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu45.html
[real]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu5.html
[longint]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu4.html
