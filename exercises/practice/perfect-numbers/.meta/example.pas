unit PerfectNumbers;

{$mode ObjFPC}{$H+}

interface

function classify(const number : integer) : string;

implementation

uses SysUtils;

function classify(const number : integer) : string;
var
  factor, AliquotSum : integer;
  classification     : string;
begin
  if number < 1 then
    raise Exception.Create(
      'Classification is only possible for positive integers.'
    );

  AliquotSum := 0;
  for factor := 1 to number - 1 do
    begin
      if number mod factor <> 0 then continue;
      AliquotSum := AliquotSum + factor;
    end;

  if      number = AliquotSum then classification := 'perfect'
  else if number < AliquotSum then classification := 'abundant'
  else                             classification := 'deficient';

  result := classification;
end;

end.
