unit Matrix;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray  = Array Of Integer;
  TIntMatrix = Array Of TIntArray;

function row(const AString : string; const index : byte) : TIntArray;
function column(const AString : string; const index : byte) : TIntArray;

implementation

uses SysUtils, StrUtils;

function StringToMatrix(const AString : string) : TIntMatrix;
var
  LRow : string;
  LCol : string;
  i    : byte = 0;
  j    : byte = 0;
begin
  result := [[]];
  for LRow in SplitString(AString, '\n') do
    begin
      inc(i);
      SetLength(result, i);
      for LCol in SplitString(LRow, ' ') do
        begin
          insert(StrToInt(LCol), result[i - 1], j);
          inc(j);
        end;
    end;
end;

function row(const AString : string; const index : byte) : TIntArray;
var
  LMatrix : TIntMatrix;
  i       : byte;
begin
  LMatrix := StringToMatrix(AString);
  result  := [];
  for i := low(LMatrix[index - 1]) to high(LMatrix[index - 1]) do
    insert(LMatrix[index - 1][i], result, i);
end;

function column(const AString : string; const index : byte) : TIntArray;
var
  LMatrix : TIntMatrix;
  i       : byte;
begin
  LMatrix := StringToMatrix(AString);
  result  := [];
  for i := low(LMatrix) to high(LMatrix) do
    insert(LMatrix[i][index - 1], result, i);
end;

end.
