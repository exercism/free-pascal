# Using `Format`

```pascal
uses SysUtils;

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

A [`case`][case] statement assigns `who` to either `'you'` (when `name` is empty) or the supplied name.

[`Format`][format] from `SysUtils` then substitutes `who` into the `%s` placeholder.

[case]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu56.html
[format]: https://www.freepascal.org/docs-html/3.2.2/rtl/sysutils/format.html
