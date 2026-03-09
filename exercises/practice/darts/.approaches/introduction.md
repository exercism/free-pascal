# Introduction

There are multiple ways to solve the Darts exercise.
Among them are:

- Using `If` Statements
- Using a `Case` Statement
- Using a `For-in` Statement
- Using a `For-downto` Statement

The scoring areas are _concentric circles_, so to properly score a throw the distance `sqrt(x * x + y * y)` from the center needs to be compared with circle radii.

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


## Approach: Using a `For-in` Statement

We loop over a table of circles, and exit when we find a circle that contains the point.

```pascal
const
  circles : Array of TCircle = (
    (radius: 1; points: 10),
    (radius: 5; points: 5),
    (radius: 10; points: 1)
  );

function score(const x : single; const y : single) : uint8;
var
  r : single;
  circle : TCircle;
begin
  r := sqrt(x * x + y * y);
  for circle in circles do
    if r <= circle.radius then
      exit(circle.points);

  exit(0);
end;
```

For more information, check the [for-in approach][approach-for-in].


## Approach: Using a `For-downto` Statement

We iterate an index backwards, stopping when we find a circle that does not contain the point.

```pascal
const
  squares : Array of single = (1, 25, 100);
  points : Array of uint8 = (10, 5, 1);

function score(const x : single; const y : single) : uint8;
var
  s : single;
  index : integer;
begin
  s := x * x + y * y;

  result := 0;
  for index := high(points) downto low(points) do
    begin
      if s > squares[index] then
        break;

      result := points[index];
    end;
end;
```

For more information, check the [for-downto approach][approach-for-downto].


[approach-if]: https://exercism.org/tracks/free-pascal/exercises/darts/approaches/if
[approach-case]:  https://exercism.org/tracks/free-pascal/exercises/darts/approaches/case
[approach-for-in]: https://exercism.org/tracks/free-pascal/exercises/darts/approaches/for-in
[approach-for-downto]:  https://exercism.org/tracks/free-pascal/exercises/darts/approaches/for-downto
