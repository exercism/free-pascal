# Using a Bit Field

```pascal
function IsPangram(const sentence : string) : boolean;
var
  letters : longword;
  c : char;
begin
  letters := 0;
  for c in sentence do
    if c in ['a'..'z'] then
      letters := letters or (1 shl (ord(c) - ord('a')))
    else if c in ['A'..'Z'] then
      letters := letters or (1 shl (ord(c) - ord('A')));
  result := letters = $3FFFFFF;
end;
```

A [`longword`][longword] is a 32-bit unsigned integer.
We use one bit per letter: bit 0 for `a`, bit 1 for `b`, …, bit 25 for `z`.

[`shl`][logical] is Pascal's left-shift operator.
`1 shl (ord(c) - ord('a'))` produces a mask with exactly one bit set — the bit corresponding to the letter `c`.
The [`or`][logical] operator sets that bit in `letters`.

The `in` operator tests membership in a set literal: `c in ['a'..'z']` returns `true` when `c` is a lowercase letter.
Handling upper and lower case separately avoids a call to any case-conversion function.

`$3FFFFFF` is a hexadecimal literal equal to 67,108,863, which has its lowest 26 bits set — one for each letter of the alphabet.
When `letters = $3FFFFFF`, every letter has been seen.

The [`for c in sentence`][for-in] loop iterates directly over the characters of the string without index arithmetic.

[longword]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu4.html
[logical]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu45.html
[for-in]: https://www.freepascal.org/docs-html/3.2.2/ref/refsu59.html
