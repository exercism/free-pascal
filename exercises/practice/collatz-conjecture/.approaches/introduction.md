# Introduction

There are several ways to solve Collatz Conjecture in Free Pascal.

## Approach: While loop

```pascal
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
```

For more information, check the [While loop approach][approach-while-loop].

## Approach: Repeat-until

```pascal
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
```

For more information, check the [Repeat-until approach][approach-repeat-until].

## Approach: Recursion

```pascal
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
```

For more information, check the [Recursion approach][approach-recursion].

[approach-while-loop]: https://exercism.org/tracks/free-pascal/exercises/collatz-conjecture/approaches/while-loop
[approach-repeat-until]: https://exercism.org/tracks/free-pascal/exercises/collatz-conjecture/approaches/repeat-until
[approach-recursion]: https://exercism.org/tracks/free-pascal/exercises/collatz-conjecture/approaches/recursion
