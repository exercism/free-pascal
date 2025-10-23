unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number: integer) : integer;

implementation

uses SysUtils;

var
  temp, count : integer;

function steps(const number: integer) : integer;
begin

  if number < 1 then
    raise Exception.Create('Only positive integers are allowed');

  temp  := number;
  count := 0;

  while temp > 1 do
    begin
      inc(count);
      if temp mod 2 = 0 then
        temp := temp div 2
      else temp := temp * 3 + 1;
    end;

  result := count;

end;

end.
