# Using an Array of Boolean

```pascal
function IsPangram(const sentence : string) : boolean;
var
  seen : Array [0..25] of Boolean;
  i : integer;
  j : integer;
  c : char;
begin
  for i := 0 to 25 do
    seen[i] := false;
  j := 1;
  while j <= Length(sentence) do
  begin
    c := LowerCase(sentence[j]);
    if c in ['a'..'z'] then
      seen[ord(c) - ord('a')] := true;
    Inc(j);
  end;
  result := true;
  for i := 0 to 25 do
    if not seen[i] then
    begin
      result := false;
      break;
    end;
end;
```

`Array [0..25] of Boolean` declares a fixed-size array with indices `0` through `25`, one slot per letter of the alphabet.
Pascal allows any ordinal type as an array index range, so the bounds are written directly as integer literals.

[`LowerCase`][lowercase] converts a single character to lowercase.
The single-character overload lives in the `System` unit, which is always available without a `uses` clause.

`ord(c) - ord('a')` maps a lowercase letter to its zero-based index: `'a'` → `0`, `'b'` → `1`, …, `'z'` → `25`.
The `in ['a'..'z']` guard ensures only letters reach the array, so the index is always in range.

[`Inc(j)`][inc] advances the loop variable.
Writing `j := 1` before the loop and `Inc(j)` at the bottom of the body is the idiomatic Pascal `while` loop pattern, equivalent to a `for` loop with an explicit start and end but allowing the index to be used after the loop exits.

Once the sentence has been scanned, a second loop checks every slot.
As soon as an unset entry is found the function assigns `false` to [`result`][result] and uses [`break`][break] to leave the loop early.

[lowercase]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/lowercase.html
[inc]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/inc.html
[result]: https://www.freepascal.org/docs-html/3.2.2/ref/refse94.html
[break]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/break.html
