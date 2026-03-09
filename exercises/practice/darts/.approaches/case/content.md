# Using a `Case` Statement

```pascal
uses Math;

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

[`ceil`][ceil] from the `Math` unit returns the smallest integer greater than or equal to
its argument.
Applying it to the floating-point squared distance produces an integer, which Free Pascal's
[`case`][case] statement can match against integer ranges.

The range arms map directly to the circle boundaries:
- `0..1` covers squared distances up to 1: the inner circle.
- `2..25` covers squared distances from just above 1 up to 25: the middle circle.
- `26..100` covers squared distances from just above 25 up to 100: the outer circle.
- The `else` arm catches anything above 100: a miss.

[`exit(value)`][exit] sets `result` and returns from the function immediately.

[ceil]: https://www.freepascal.org/docs-html/3.2.2/rtl/math/ceil.html
[case]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu56.html
[exit]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/exit.html
