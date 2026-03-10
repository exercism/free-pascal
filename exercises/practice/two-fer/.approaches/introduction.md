# Introduction

There are three main approaches for solving Two Fer in Free Pascal:

- Using the `+` operator
- Using `Format`
- Using `Concat`


## Approach: Using the `+` Operator

Build the result with the `+` [string concatenation operator][operator].

```pascal
function TwoFer(const name : string) : string;
begin
  if name = '' then
    exit('One for you, one for me.');

  result := 'One for ' + name + ', one for me.';
end;
```

For more information, check the [operator approach][approach-operator].


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
  result := Format('One for %s, one for me.', [who]);
end;
```

For more information, check the [format approach][approach-format].


## Approach: Using `Concat`

Use [`IfThen`][ifthen] from `StrUtils` to select the name inline, and [`Concat`][concat] to build the result.

```pascal
uses StrUtils;

function TwoFer(const name : string) : string;
begin
  result := Concat('One for ', IfThen(name = '', 'you', name), ', one for me.');
end;
```

For more information, check the [Concat approach][approach-concat].

[operator]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu47.html
[format]: https://www.freepascal.org/docs-html/3.2.2/rtl/sysutils/format.html
[ifthen]: https://www.freepascal.org/docs-html/3.2.2/rtl/strutils/ifthen.html
[concat]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/concat.html
[approach-operator]: https://exercism.org/tracks/free-pascal/exercises/two-fer/approaches/operator
[approach-format]: https://exercism.org/tracks/free-pascal/exercises/two-fer/approaches/format
[approach-concat]: https://exercism.org/tracks/free-pascal/exercises/two-fer/approaches/concat
