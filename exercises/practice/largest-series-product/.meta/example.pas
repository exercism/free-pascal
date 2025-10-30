unit LargestSeriesProduct;

{$mode ObjFPC}{$H+}

interface

function LargestProduct(const digits : string; const span : integer) : integer;

implementation

uses SysUtils, Character;

function LargestProduct(const digits : string; const span : integer) : integer;
var
  chr                       : string;
  i, j, product, MaxProduct : integer;
begin
  if span < 0 then
    raise Exception.Create('span must not be negative');

  if span > length(digits) then
    raise Exception.Create('span must not exceed string length');

  MaxProduct := -1;
  for i := 1 to length(digits) - span + 1 do
    begin
      product := 1;
      for j := i to i + span - 1 do
        begin
          chr := copy(digits, j, 1);
          if not(IsNumber(chr[1])) then
            raise Exception.Create('digits input must only contain digits');
          product *= StrToInt(chr);
        end;
      if product > MaxProduct then MaxProduct := product;
    end;

  result := MaxProduct;
end;

end.
