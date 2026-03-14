unit Alphametics;

{$mode ObjFPC}{$H+}

interface

function solve(const puzzle : string) : string;

implementation

uses SysUtils;

type
  ESolved = class(Exception);

function solve(const puzzle : string) : string;
type
  TLetter = record
    letter  : char;
    rank    : integer;           { lowest column where letter appears }
    weight  : array of integer;
    leading : boolean;           { cannot be assigned 0 }
    digit   : integer;
  end;
  TLetters = array of TLetter;
var
  letters : TLetters;
  nColumns  : integer;

  function ParsePuzzle : TLetters;
  var
    table : array[0..25] of TLetter;

    procedure Scan;
    var
      i, c, sign, place, prev : integer;
    begin
      for i := 0 to 25 do begin
        table[i].letter  := chr(ord('A') + i);
        table[i].rank    := High(integer);
        table[i].weight  := nil;
        table[i].leading := false;
      end;

      sign := -1;
      place := 0;
      prev := 0;
      for i := length(puzzle) downto 1 do begin
        c := ord(puzzle[i]) - ord('A');
        if (c >= 0) and (c < 26) then
          begin
            if place < table[c].rank then
              table[c].rank := place;

            if length(table[c].weight) <= place then
              SetLength(table[c].weight, place + 1);

            inc(table[c].weight[place], sign);
            prev := c;
            inc(place);
          end
        else
          begin
            if puzzle[i] = '=' then
              sign := 1;

            if place > 0 then
              table[prev].leading := true;

            place := 0;
          end;
      end;
      if place > 0 then
        table[prev].leading := true;
    end;

    function Compact : TLetters;
    var
      i, j : integer;
    begin
      nColumns := 0;
      result := nil;
      for i := 0 to 25 do begin
        if table[i].rank = High(integer) then
          continue;

        if length(table[i].weight) > nColumns then
          nColumns := length(table[i].weight);

        j := length(result);
        SetLength(result, j + 1);
        while (j > 0) and (result[j - 1].rank > table[i].rank) do
          begin
            result[j] := result[j - 1];
            dec(j);
          end;
        result[j] := table[i];
      end;
    end;

  begin
    Scan;
    result := Compact;
  end;

  procedure Search(index, claimed, col, carry : integer);
  var
    digit, k, colSum : integer;
  begin
    if (index = length(letters)) or (letters[index].rank > col) then
      begin
        colSum := carry;
        for k := 0 to index - 1 do
          if col < length(letters[k].weight) then
            inc(colSum, letters[k].weight[col] * letters[k].digit);

        if colSum mod 10 = 0 then
          begin
            if col + 1 < nColumns then
              Search(index, claimed, col + 1, colSum div 10)
            else if colSum div 10 = 0 then
              raise ESolved.Create('');
          end;
      end
    else
      for digit := ord(letters[index].leading) to 9 do
        begin
          if claimed and (1 shl digit) <> 0 then
            continue;

          letters[index].digit := digit;
          Search(index + 1, claimed or (1 shl digit), col, carry);
        end;
  end;

  function BuildResult : string;
  var
    i     : integer;
    table : array['A'..'Z'] of char;
    ch    : char;
  begin
    for i := 0 to length(letters) - 1 do
      table[letters[i].letter] := chr(ord('0') + letters[i].digit);

    result := '';
    for ch in puzzle do
      if (ch >= 'A') and (ch <= 'Z') then
        result += table[ch]
      else
        result += ch;
  end;

begin
  letters := ParsePuzzle;
  try
    Search(0, 0, 0, 0);
    raise Exception.Create('no solution');
  except
    on ESolved do result := BuildResult;
  end;
end;

end.
