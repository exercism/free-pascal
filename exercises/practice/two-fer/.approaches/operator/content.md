# Using the `+` Operator

```pascal
function TwoFer(const name : string) : string;
begin
  if name = '' then
    exit('One for you, one for me.');

  result := 'One for ' + name + ', one for me.';
end;
```

An [`if`][if] statement checks whether `name` is empty.
If so, [`exit`][exit] returns the result immediately with `"you"` in place of a name.

Otherwise, the [`+` operator][operator] concatenates string fragments around the supplied name.

[if]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu57.html
[exit]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/exit.html
[operator]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu47.html
