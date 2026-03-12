# Using a Boolean Chain

```pascal
function LeapYear(const year : integer) : boolean;
begin
  result := (year mod 400 = 0) or ((year mod 4 = 0) and (year mod 100 <> 0));
end;
```

The [`mod`][mod] operator returns the remainder of integer division — equivalent to `%` in C.
`year mod 4 = 0` is true when `year` is evenly divisible by 4.

[`and`][boolean] and [`or`][boolean] are Pascal's boolean operators, written as keywords rather than symbols.
`&&` in C maps to `and`; `||` in C maps to `or`.

`<>` is Pascal's not-equal operator, equivalent to `!=` in C.

`and` binds more tightly than `or`, so the inner parentheses around the `and` subexpression are not strictly required — but they are included here for clarity.
Both operators also [short-circuit][boolean]: when the left operand of `or` is `true`, the right operand is not evaluated; when the left operand of `and` is `false`, the right operand is not evaluated.

The [`result`][result] variable is implicitly declared in every Pascal function and holds the return value.
Assigning to `result` without calling [`exit`][exit] allows the function to reach its final `end` and return normally.

| year | `year mod 400 = 0`  | `year mod 4 = 0`  | `year mod 100 <> 0`  | is leap year |
| ---- | :-----------------: | :---------------: | :------------------: | :----------: |
| 2020 | false               | true              | true                 | true         |
| 2019 | false               | false             | not evaluated        | false        |
| 2000 | true                | not evaluated     | not evaluated        | true         |
| 1900 | false               | true              | false                | false        |

[mod]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu44.html
[boolean]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu46.html
[result]: https://www.freepascal.org/docs-html/3.2.2/ref/refse94.html
[exit]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/exit.html
