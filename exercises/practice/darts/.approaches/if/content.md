# Using `If` Statements

```pascal
uses Math;

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

[`hypot(x, y)`][hypot] from the `Math` unit computes `sqrt(x*x + y*y)`, the straight-line distance from the origin.
Assigning it to a local variable `r` avoids computing it more than once.

The [`if`][if]/`else if`/`else` structure guarantees exactly one branch is taken.

In Free Pascal the [`result`][result] variable holds the return value of a function.

[hypot]: https://www.freepascal.org/docs-html/3.2.2/rtl/math/hypot.html
[if]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu57.html
[result]: https://www.freepascal.org/docs-html/3.2.2/ref/refse94.html
