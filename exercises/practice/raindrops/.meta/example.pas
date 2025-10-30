unit Raindrops;

{$mode ObjFPC}{$H+}

interface

function convert(const number : integer) : string;

implementation

uses SysUtils;

function convert(const number : integer) : string;
var
  sounds : string;
begin
  sounds := '';

  if number mod 3 = 0 then sounds := sounds + 'Pling';
  if number mod 5 = 0 then sounds := sounds + 'Plang';
  if number mod 7 = 0 then sounds := sounds + 'Plong';

  if sounds = '' then sounds := IntToStr(number);

  result := sounds;
end;

end.
