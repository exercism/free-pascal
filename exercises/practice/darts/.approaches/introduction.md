# Introduction

There are multiple ways to solve the Darts exercise.
Among them are:

- Using `If` Statements
- Using a `Case` Statement

<br>

The scoring areas are _concentric circles_, so distances `sqrt(x * x + y * y)` from the center need to be checked in order to properly score a throw.

Darts that fall on a _boundary_ are scored based on the area _closer to center_.

## Approach: Using `If` Statements

Compute the distance from the center using `hypot`, then compare it against the circle radii using an `if`/`else if` chain.

```pascal
function score(const x : single; const y : single) : uint8;
var
  r : single;
begin
  r := hypot(x, y);
  if      r <= 1  then result := 10
  else if r <= 5  then result :=  5
  else if r <= 10 then result :=  1
  else                 result :=  0;
end;
```

For more information, check the [if approach][approach-if].

## Approach: Using a `Case` Statement

`ceil` converts a floating-point value to an integer, which fits neatly into a `case` statement with integer range arms.

```pascal
function score(const x : single; const y : single) : uint8;
begin
  case ceil(x * x + y * y) of
    0..1:
      exit(10);
    2..25:
      exit(5);
    26..100:
      exit(1);
  else
    exit(0);
  end;
end;
```

For more information, check the [case approach][approach-case].

[approach-if]: https://exercism.org/tracks/pascal/exercises/darts/approaches/if
[approach-case]:  https://exercism.org/tracks/pascal/exercises/darts/approaches/case
