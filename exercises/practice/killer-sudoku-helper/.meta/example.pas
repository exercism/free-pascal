unit KillerSudokuHelper;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;
  PIntArray = ^TIntArray;
  PIntArray2D = ^TIntArray2D;

function combinations(
  const sum, size : Word;
  const exclude : TIntArray
) : TIntArray2D;

implementation

uses SysUtils;

function contains(
  const haystack : TIntArray;
  const needle : Integer
) : Boolean;
var
  index : Integer;
begin
  result := true;
  for index := low(haystack) to high(haystack) do
    if haystack[index] = needle then
      exit;
  result := false;
end;

procedure search(
  const sum, size : Integer;
  const exclude : TIntArray;
  solutions : PIntArray2D;
  solution : PIntArray;
  const previous : Integer
);
var
  current : Integer;
begin
  if sum = 0 then
    begin
      if size = 0 then
        insert(solution^, solutions^, length(solutions^));
    end
  else
    for current := previous + 1 to 9 do
      if not contains(exclude, current) then
        begin
          insert(current, solution^, length(solution^));
          search(sum - current, size - 1, exclude, solutions, solution, current);
          Delete(solution^, high(solution^), 1);
        end;
end;

function combinations(
  const sum, size : Word;
  const exclude : TIntArray
) : TIntArray2D;
var
  solution : TIntArray;
begin
  result := [];
  solution := [];
  search(sum, size, exclude, @result, @solution, 0);
end;

end.
