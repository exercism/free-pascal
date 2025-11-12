unit Anagram;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;

implementation

uses SysUtils, Classes;

function SortCharacters(const text : string) : string;
var
  i          : integer;
  StringList : TStringList;
begin
  StringList := TStringList.Create;
  for i := 1 to length(text) do StringList.add(text[i]);
  StringList.Sort;
  StringList.LineBreak := '';
  result := StringList.Text;
  StringList.Free;
end;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;
var
  i        : integer;
  anagrams : TStrArray = ();
begin
  for i := low(candidates) to high(candidates) do
    begin
      if (LowerCase(subject) = LowerCase(candidates[i])) or
         (length(subject) <> length(candidates[i])) then
        continue;
      if SortCharacters(LowerCase(candidates[i])) =
         SortCharacters(LowerCase(subject)) then
        insert(candidates[i], anagrams, length(anagrams));
    end;
    result := anagrams;
end;

end.
