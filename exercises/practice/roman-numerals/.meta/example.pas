unit RomanNumerals;

{$mode ObjFPC}{$H+}

interface

function roman(const number : integer) : string;

implementation

uses SysUtils, Math;

function roman(const number : integer) : string;
const
  DecimalPlaces : Array[1..4] Of Array[1..9] Of String = (
    ('I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'),
    ('X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'),
    ('C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'),
    ('M', 'MM', 'MMM',   '',  '',   '',    '',     '',   '')
  );
var
  conversion : string = '';
  arabic     : integer;
  digit      : integer;
  NumDigits  : integer;
begin
  arabic := number;
  while arabic > 0 do
    begin
      NumDigits  := trunc(log10(arabic) + 1);
      digit      := arabic div 10 ** (NumDigits - 1);
      conversion := conversion + DecimalPlaces[NumDigits, digit];
      arabic     := arabic mod 10 ** (NumDigits - 1);
    end;
  result := conversion;
end;

end.
