# Using `Concat`

```pascal
uses StrUtils;

function TwoFer(const name : string) : string;
begin
  result := Concat('One for ', IfThen(name = '', 'you', name), ', one for me.');
end;
```

[`IfThen`][ifthen] from `StrUtils` takes a boolean condition and two string values,
returning the first when the condition is true and the second when it is false.
Here it returns `'you'` when `name` is empty, and `name` otherwise.

[`Concat`][concat] from `System` joins any number of strings into one,
avoiding the need for a `Format` call or an intermediate variable.

[ifthen]: https://www.freepascal.org/docs-html/3.2.2/rtl/strutils/ifthen.html
[concat]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/concat.html
