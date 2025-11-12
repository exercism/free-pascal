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

uses SysUtils;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [ IntToStr(length(subject)), IntToStr(length(candidates))];

end;

end.
