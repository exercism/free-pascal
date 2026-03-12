# Using `If-Then-Else`

```pascal
function LeapYear(const year : integer) : boolean;
begin
  if year mod 100 = 0 then
    result := year mod 400 = 0
  else
    result := year mod 4 = 0;
end;
```

Note that Pascal's [`if`][if] condition does not require surrounding parentheses — `if year mod 100 = 0 then` is valid,
unlike C which requires `if (year % 100 == 0)`.

The logic branches on divisibility by 100:
- If `year mod 100 = 0`, the year is a century year, and is a leap year only if also divisible by 400.
- Otherwise, divisibility by 4 is sufficient.

This order of checks uses at most two [`mod`][mod] operations instead of up to three.

When both branches of an `if`/`else` are single statements, no `begin`/`end` block is needed.

[if]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu57.html
[mod]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu44.html
