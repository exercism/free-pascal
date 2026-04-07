# Repeat-until

```pascal
unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number: integer): integer;

implementation

uses SysUtils;

function steps(const number: integer): integer;
var
  temp: integer;
begin
  if number < 1 then
    raise Exception.Create('Only positive integers are allowed');

  temp := number;
  result := 0;
  if temp = 1 then
    exit;
  repeat
    if temp mod 2 <> 0 then begin
      temp := (temp * 3 + 1);
      inc(result);
    end;
    temp := temp div 2;
    inc(result);
  until temp = 1;
end;

end.
```

This approach uses Pascal's `repeat...until` loop and exploits the fact that for odd `n`, `3n + 1` is always even.

## The repeat...until loop

Unlike `while...do`, which checks the condition before each iteration, [`repeat...until`][repeat-until] checks the condition after each iteration:

```pascal
repeat
  ...
until temp = 1;
```

The `repeat` and `until` keywords act as implicit delimiters for the loop body, so there is no need for a `begin...end` compound statement around the entire loop body.
This is different from `while...do`, which requires `begin...end` when the body contains more than one statement.

Note that the condition logic is inverted compared to `while`: instead of continuing while the condition is true, but `repeat...until` continues *until* the condition becomes true (that is, it loops while the condition is false).

## Guarding against number = 1

Because `repeat...until` always executes its body at least once, the case where `number` is already `1` must be handled before entering the loop.
The `exit` statement returns from the function immediately:

```pascal
if temp = 1 then
  exit;
```

At this point `result` is already `0`, so `exit` returns the correct value.
The `exit` procedure leaves the current function, and the value of `result` at the time of the `exit` call becomes the return value.

## The odd-number shortcut

For any odd number `n`, the value `3n + 1` is always even.
This means the next step after computing `3n + 1` will always be a division by 2.

## Using result directly as the counter

Instead of declaring a separate `count` variable, this approach writes directly to the implicit `result` variable:

```pascal
result := 0;
...
inc(result);
```

This works because `result` is a fully usable local variable — it can be read, written, and passed to procedures like `inc`.

[repeat-until]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu60.html
