# Using a `Set of Char`

```pascal
function IsPangram(const sentence : string) : boolean;
var
  found : set of char;
  i : integer;
begin
  found := [];
  for i := low(sentence) to high(sentence) do
    Include(found, LowerCase(sentence[i]));
  result := ['a'..'z'] <= found;
end;
```

Pascal's [`set of`][set-of] type is a built-in ordered collection of values from an ordinal type.
`set of char` can hold any subset of the 256 possible `char` values, stored internally as a bit array.

[`Include`][include] adds an element to a set in-place — equivalent to `found := found + [c]` but potentially faster.

[`LowerCase`][lowercase] converts a character to lowercase.

When working with arrays and strings, it is easy to make [off-by-one] errors.
Indices for an array range from `0` to `length(arr) - 1` inclusive.
Indices for a string range from `1` to `length(str)` inclusive.

A convenient way to iterate over all valid indices of an array or string is to use [`low()`][low] to [`high()`][high], which automatically gives the correct bounds.

The expression `['a'..'z'] <= found` uses the subset operator `<=`.
A set `A` is a subset of set `B` if every element of `A` is also in `B`.
When `found` contains all 26 letters, this returns `true`.

[off-by-one]: https://en.wikipedia.org/wiki/Off-by-one_error
[set-of]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu16.html
[include]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/include.html
[lowercase]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/lowercase.html
[low]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/low.html
[high]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/high.html
