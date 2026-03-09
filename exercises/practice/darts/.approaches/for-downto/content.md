# Using a `For-downto` Statement

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

When working with arrays and strings, it is easy to make [off-by-one] errors.
Indices for an array like `points` range from `0` to `length(points) - 1` inclusive.
Indices for a string `str` range from `1` to `length(str)` inclusive.

A convenient way to iterate backwards over all the indices of an array or string is to use [high()][high] [downto][downto] [low()][low].

As soon as we find a circle that does not contain the point, we leave the loop using [break].

The last value assigned to [result] is returned from the function.

[off-by-one]: https://en.wikipedia.org/wiki/Off-by-one_error
[high]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/high.html
[downto]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu58.html
[low]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/low.html
[break]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/break.html
[result]: https://www.freepascal.org/docs-html/3.2.2/ref/refse94.html

