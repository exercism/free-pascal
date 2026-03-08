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

type
  TDirection = record
    dr : integer;
    dc : integer;
  end;

const
  Directions : array[0..7] of TDirection = (
    (dr:  0; dc:  1),   { left to right       }
    (dr:  0; dc: -1),   { right to left       }
    (dr:  1; dc:  0),   { top to bottom       }
    (dr: -1; dc:  0),   { bottom to top       }
    (dr:  1; dc:  1),   { diagonal TL to BR   }
    (dr:  1; dc: -1),   { diagonal TR to BL   }
    (dr: -1; dc:  1),   { diagonal BL to TR   }
    (dr: -1; dc: -1)    { diagonal BR to TL   }
  );

function WordMatches(const grid : TStrArray; const word : String;
                     const start : TCoordinate; const dir : TDirection) : boolean;
var
  k : integer;
begin
  for k := 0 to Length(word) - 1 do
    { we subtract 1 as grid is 0-indexed }
    if grid[start.row - 1 + k * dir.dr][start.column + k * dir.dc] <> word[k + 1] then
      exit(false);

  result := true;
end;

function searchWord(const grid : TStrArray; const word : String) : TSearchResult;
var
  rows    : integer;
  columns : integer;
  dir     : TDirection;
begin
  result.found := false;
  rows := Length(grid);
  if rows = 0 then
    exit;

  columns := Length(grid[0]);

  result.start.row := 0;
  while result.start.row < rows do
    begin
      Inc(result.start.row);
      result.start.column := 0;
      while result.start.column < columns do
        begin
          Inc(result.start.column);
          for dir in Directions do
            begin
              result.finish.row    := result.start.row    + (Length(word) - 1) * dir.dr;
              result.finish.column := result.start.column + (Length(word) - 1) * dir.dc;
              if (result.finish.row < 1) or (result.finish.row > rows) or (result.finish.column < 1) or (result.finish.column > columns) then continue;
              if WordMatches(grid, word, result.start, dir) then
                begin
                  result.found := true;
                  exit;
                end;
            end;
        end;
    end;
end;

function search(const grid : TStrArray; const wordsToSearchFor : TStrArray) : TSearchResultArray;
var
  i : integer;
begin
  result := [];
  SetLength(result, Length(wordsToSearchFor));
  for i := Low(wordsToSearchFor) to High(wordsToSearchFor) do
    result[i] := searchWord(grid, wordsToSearchFor[i]);
end;

end.
