# Recursion

```pascal
unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number: integer): integer;

implementation

uses SysUtils;

function countSteps(const n: integer; const count: integer): integer;
begin
  if n = 1 then
    result := count
  else if (n and 1) = 0 then
    result := countSteps(n shr 1, count + 1)
  else
    result := countSteps(n * 3 + 1, count + 1);
end;

function steps(const number: integer): integer;
begin
  if number < 1 then
    raise Exception.Create('Only positive integers are allowed');

  result := countSteps(number, 0);
end;

end.
```

This approach uses a recursive helper function instead of any loop construct to count the Collatz steps.

## Helper function in the implementation section

The `countSteps` function is declared in the `implementation` section but not in the `interface` section.
In Free Pascal units, only functions and types listed in `interface` are visible to other units.
Functions in `implementation` that are not declared in `interface` are private to the unit:

```pascal
interface

function steps(const number: integer): integer;

implementation

function countSteps(const n: integer; const count: integer): integer;
```

This means external code can call `steps` but not `countSteps`.

## Const parameters

Both parameters are declared with the `const` modifier:

```pascal
function countSteps(const n: integer; const count: integer): integer;
```

The `const` keyword tells the compiler that the parameter will not be modified inside the function.
For simple types like `integer`, this serves as documentation of intent.

## The `and` operator for even/odd check

The `and` keyword in Free Pascal performs a bitwise AND when applied to integer operands:

```pascal
if (n and 1) = 0 then
```

This tests whether the least significant bit of `n` is `0`.
If it is, the number is even.
For example, the integer `6` is `110` in binary; `110 and 001` yields `000`, which equals `0`, confirming that `6` is even.
The integer `7` is `111` in binary; `111 and 001` yields `001`, which equals `1`, confirming that `7` is odd.

Note that in Free Pascal, `and` is both a logical operator (for `boolean` operands) and a bitwise operator (for integer operands).
The compiler determines which meaning to use based on the operand types.

## Operator precedence

In Free Pascal, `and` has higher precedence than `=`.
So `n and 1 = 0` would be parsed as `(n and 1) = 0`.
The example uses explicit parentheses for clarity.

## The shr operator for division by two

The `shr` keyword performs a bitwise shift right:

```pascal
result := countSteps(n shr 1, count + 1)
```

Shifting all bits one position to the right is equivalent to integer division by 2.
For example, `6` in binary is `110`; shifting right by 1 gives `011`, which is `3`.

Free Pascal provides `shr` (shift right) and `shl` (shift left) as built-in operators for integer types.

## Recursive calls

The function calls itself with updated arguments, building up the step count:

```pascal
if n = 1 then
  result := count
else if (n and 1) = 0 then
  result := countSteps(n shr 1, count + 1)
else
  result := countSteps(n * 3 + 1, count + 1);
```

Each recursive call applies one step of the algorithm and increments the counter.
The base case (`n = 1`) stops the recursion and returns the accumulated count.

## Separation of concerns

The public `steps` function handles only validation and delegates the computation to `countSteps`:

```pascal
function steps(const number: integer): integer;
begin
  if number < 1 then
    raise Exception.Create('Only positive integers are allowed');
  result := countSteps(number, 0);
end;
```

This keeps the recursive function free of error-handling logic.

[bitwise-and]: https://www.freepascal.org/docs-html/ref/refsu46.html
[shr]: https://www.freepascal.org/docs-html/ref/refsu47.html
