# Using a `For-in` Statement

```pascal
type
  TCircle = record
    radius : single;
    points : uint8;
  end;

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

We have a read-only table of circles, with their radii and points scores.

We loop over the circles using [for-in], and [exit] when we find a circle that contains the point.

The local variable `r` stores the straight-line distance from the origin, computed using [sqrt].

[for-in]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu59.html
[exit]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/exit.html
[sqrt]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/sqrt.html
