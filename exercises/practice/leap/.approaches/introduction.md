# Introduction

There are multiple approaches to solving Leap Year in Free Pascal:

- [Using a Boolean Chain][approach-boolean-chain]
- [Using `If-Then-Else`][approach-if-then-else]


## Approach: Using a Boolean Chain

Combine [`mod`][mod] and boolean operators into a single expression.

```pascal
function LeapYear(const year : integer) : boolean;
begin
  result := (year mod 400 = 0) or ((year mod 4 = 0) and (year mod 100 <> 0));
end;
```

For more information, check the [boolean-chain approach][approach-boolean-chain].


## Approach: Using `If-Then-Else`

Branch first on divisibility by 100, then test 400 or 4 separately.

```pascal
function LeapYear(const year : integer) : boolean;
begin
  if year mod 100 = 0 then
    result := year mod 400 = 0
  else
    result := year mod 4 = 0;
end;
```

For more information, check the [if-then-else approach][approach-if-then-else].


[mod]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu44.html
[approach-boolean-chain]: https://exercism.org/tracks/free-pascal/exercises/leap/approaches/boolean-chain
[approach-if-then-else]: https://exercism.org/tracks/free-pascal/exercises/leap/approaches/if-then-else
