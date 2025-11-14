unit CryptoSquare;

{$mode ObjFPC}{$H+}

interface

function ciphertext(const plaintext : string) : string;

implementation

uses SysUtils, Character, Math, StrUtils;

function ciphertext(const plaintext : string) : string;
var
  i, j, rows, cols : integer;
  normalized    : string;
  chunk         : string;
  square        : Array Of String = ();
  cipher        : string;
begin
  normalized := '';
  for i := 1 to length(plaintext) do
    begin
      if IsWhiteSpace(plaintext[i]) or IsPunctuation(plaintext[i]) then
        continue;
      normalized := normalized + LowerCase(plaintext[i]);
    end;

  if normalized = '' then
    begin
      result := '';
      exit;
    end;

  rows := trunc(sqrt(length(normalized)));
  cols := ceil(length(normalized) / rows);
  if cols - rows > 1 then
    begin
      dec(cols);
      inc(rows);
    end;

  SetLength(square, rows);
  j := 0;
  chunk := '';
  for i := 1 to length(normalized) do
    begin
      chunk := chunk + normalized[i];
      if (i mod cols = 0) or (i = length(normalized)) then
        begin
          square[j] := PadRight(chunk, cols);
          inc(j);
          chunk := ''
        end;
    end;

  cipher := '';
  for i := 1 to cols do
    begin
      for j := low(square) to high(square) do
        begin
          cipher := cipher + square[j][i];
        end;
      if i < cols then cipher := cipher + ' ';
    end;

  result := cipher;
end;

end.
