# Using a Generic Dictionary

```pascal
unit Pangram;

{$mode ObjFPC}{$H+}

{$WARN 4046 OFF}
{$WARN 5024 OFF}
{$WARN 5062 OFF}
{$WARN 5071 OFF}
{$WARN 6058 OFF}

interface

function IsPangram(const sentence : string) : boolean;

implementation

uses SysUtils, Generics.Collections;

type
  TCharIntDict = Specialize TDictionary<Char, Integer>;

function IsPangram(const sentence : string) : boolean;
var
  tally : TCharIntDict;
  c : char;
begin
  tally := TCharIntDict.Create;
  try
    for c in LowerCase(sentence) do
      if c in ['a'..'z'] then
        if tally.ContainsKey(c) then
          tally[c] := tally[c] + 1
        else
          tally.Add(c, 1);
    result := tally.Count = 26;
  finally
    tally.Free;
  end;
end;

end.
```

Free Pascal's `Generics.Collections` unit provides generic container classes similar to those found in other languages.
[`TDictionary`][tdictionary] is a hash-map that associates keys with values.

The line `Specialize TDictionary<Char, Integer>` creates a concrete dictionary type mapping each `Char` key to an `Integer` value.
In ObjFPC mode, the `Specialize` keyword is required when instantiating a generic type.

Using generics triggers several compiler warnings that are harmless in this context.
The `{$WARN ... OFF}` directives at the top of the unit suppress these:

| Warning | Meaning |
|---------|---------|
| 4046 | Symbol not portable |
| 5024 | Parameter not used |
| 5062 | Variable not initialized |
| 5071 | Type not portable |
| 6058 | Call to subroutine marked as inline is not inlined |

[`ContainsKey`][containskey] checks whether a key already exists in the dictionary.
If the letter has been seen before, its count is incremented; otherwise [`Add`][add] inserts it with an initial count of `1`.

After scanning the sentence, `tally.Count` gives the number of distinct keys.
If 26 distinct lowercase letters were found, the sentence is a pangram.

The dictionary is a heap-allocated object and must be freed when no longer needed.
The [`try...finally`][try-finally] block ensures `tally.Free` is called even if an exception occurs.

[tdictionary]: https://wiki.freepascal.org/TDictionary
[containskey]: https://wiki.freepascal.org/TDictionary#Check_If_Key/Value_Exists
[add]: https://wiki.freepascal.org/TDictionary#Add
[try-finally]: https://www.freepascal.org/docs-html/3.2.2/ref/refse120.html
