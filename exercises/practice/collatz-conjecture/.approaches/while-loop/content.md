# While loop

```pascal
unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number: integer): integer;

implementation

uses SysUtils;

function steps(const number: integer): integer;
var
  temp, count: integer;
begin
  if number < 1 then
    raise Exception.Create('Only positive integers are allowed');

  temp := number;
  count := 0;
  while temp > 1 do
  begin
    inc(count);
    if temp mod 2 = 0 then
      temp := temp div 2
    else
      temp := temp * 3 + 1;
  end;
  result := count;
end;

end.
```

This approach uses a `while...do` loop to repeatedly apply the Collatz algorithm until the value reaches `1`.

## Local variables

The `var` block declares local variables before the function body begins.
In Free Pascal, all local variables must be declared in a `var` section that appears between the function header and its `begin` keyword.

```pascal
var
  temp, count: integer;
```

Here, `temp` tracks the current value in the sequence and `count` tracks the number of steps taken.

## Input validation with exceptions

The function checks for non-positive input and raises an `Exception` using `Exception.Create`:

```pascal
if number < 1 then
  raise Exception.Create('Only positive integers are allowed');
```

The `raise` keyword in Free Pascal throws an exception object.
`Exception.Create` is a constructor that accepts a string message.
The `SysUtils` unit must be included in the `uses` clause for `Exception` to be available.

## The while...do loop

The [`while...do`][while-do] loop is a pre-condition loop: it tests the condition before each iteration.
If the condition is `false` from the start, the loop body never executes.

```pascal
while temp > 1 do
begin
  ...
end;
```

Because the loop body contains multiple statements, it must be enclosed in a `begin...end` compound statement.

## Arithmetic operators: mod and div

Free Pascal uses the keyword `mod` for the integer remainder operator and `div` for integer division:

```pascal
if temp mod 2 = 0 then
  temp := temp div 2
```

These are built-in operators for the `integer` type.
Note that `=` is the equality comparison operator in Pascal (not `==` as in C-family languages), and `:=` is the assignment operator.

## The inc procedure

`inc` is a built-in procedure that increments an integer variable by 1:

```pascal
inc(count);
```

This is equivalent to `count := count + 1`, but `inc` is idiomatic in Pascal code.

## The result variable

Each function has an implicit local variable called `result` whose type matches the function's return type.
Assigning to `result` sets the function's return value:

```pascal
result := count;
```

This is an alternative to the traditional Pascal syntax `steps := count` (assigning to the function name).

[while-do]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu61.html
