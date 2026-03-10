# Using `Ord`

```pascal
function score(const x : single; const y : single) : uint8;
  function withinCircle(const radius : single) : boolean;
  begin
    result := x * x + y * y <= radius * radius;
  end;
begin
  result := 5 * Ord(withinCircle(1)) + 4 * Ord(withinCircle(5)) + Ord(withinCircle(10));
end;
```

`withinCircle` is a [nested function][nested] defined inside `score`.
It closes over parameters `x` and `y`, so only the circle radius needs to be passed in.

[`Ord`][ord] converts a boolean to an integer: `Ord(True) = 1`, `Ord(False) = 0`.
Because every dart within the inner circle is also within the middle and outer circles,
the three calls to `withinCircle` each contribute 0 or 1 to the weighted sum:

| zone         | `withinCircle(1)` | `withinCircle(5)` | `withinCircle(10)` | score          |
| ------------ | :---------------: | :---------------: | :----------------: | -------------- |
| inner        | 1                 | 1                 | 1                  | 5 + 4 + 1 = 10 |
| middle       | 0                 | 1                 | 1                  | 0 + 4 + 1 = 5  |
| outer        | 0                 | 0                 | 1                  | 0 + 0 + 1 = 1  |
| miss         | 0                 | 0                 | 0                  | 0 + 0 + 0 = 0  |

[nested]: https://www.freepascal.org/docs-html/3.2.2/prog/progse23.html
[ord]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/ord.html
