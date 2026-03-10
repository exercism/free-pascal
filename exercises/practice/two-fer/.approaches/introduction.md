# Introduction

There are two main approaches for solving Two Fer in Free Pascal:

- Using string concatenation
- Using `Format`


## Approach: Using String Concatenation

Build the result with the `+` [string concatenation operator][operator].

```pascal
function TwoFer(const name : string) : string;
begin
  if name = '' then
    exit('One for you, one for me.');

  result := 'One for ' + name + ', one for me.';
end;
```

For more information, check the [concatenation approach][approach-concat].


## Approach: Using `Format`

Build the result with the [`Format`][format] function from `SysUtils`.

```pascal
function TwoFer(const name : string) : string;
var
  who : string;
begin
  case name of
    '': who := 'you';
  else
    who := name;
  end;
  result := format('One for %s, one for me.', [who]);
end;
```

For more information, check the [format approach][approach-format].

[operator]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu47.html
[format]: https://www.freepascal.org/docs-html/3.2.2/rtl/sysutils/format.html
[approach-concat]: https://exercism.org/tracks/free-pascal/exercises/two-fer/approaches/concat
[approach-format]: https://exercism.org/tracks/free-pascal/exercises/two-fer/approaches/format
