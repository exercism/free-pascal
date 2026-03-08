unit WordSearch;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

  TCoordinate = record
    row    : integer;
    column : integer;
  end;

  TSearchResult = record
    found  : boolean;
    start  : TCoordinate;
    finish : TCoordinate;
  end;

  TSearchResultArray = Array Of TSearchResult;

function search(const grid : TStrArray; const wordsToSearchFor : TStrArray) : TSearchResultArray;

implementation

uses SysUtils;

function search(const grid : TStrArray; const wordsToSearchFor : TStrArray) : TSearchResultArray;
begin
  if length(grid) + length(wordsToSearchFor) >= 0 then
    raise ENotImplemented.Create('Please implement your solution.');
  result := nil;
end;

end.
