# Introduction

There are multiple ways to solve the Pangram exercise.
Among them are:

- Using a `Set of Char`
- Using a Bit Field
- Using an Array of Boolean


## Approach: Using a `Set of Char`

Build a `set of char` from the sentence, then test whether `['a'..'z']` is a subset of it.

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

For more information, check the [set approach][approach-set].


## Approach: Using a Bit Field

Use a `longword` to track which of the 26 letters have been seen, then compare against `$3FFFFFF`.

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

For more information, check the [bitfield approach][approach-bitfield].


## Approach: Using an Array of Boolean

Track seen letters in a fixed `Array [0..25] of Boolean`, using `ord(c) - ord('a')` to index each slot.

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

For more information, check the [array approach][approach-array].


[approach-set]: https://exercism.org/tracks/free-pascal/exercises/pangram/approaches/set
[approach-bitfield]: https://exercism.org/tracks/free-pascal/exercises/pangram/approaches/bitfield
[approach-array]: https://exercism.org/tracks/free-pascal/exercises/pangram/approaches/array
