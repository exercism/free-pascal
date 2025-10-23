unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

interface

function IsArmstrongNumber(const number: qword) : boolean;

implementation

uses Math;

var 
  tmp              : qword;
  nlen, digit, sum : integer;

function IsArmstrongNumber(const number: qword) : boolean;
begin

  tmp := number;
  nlen := 1;
  if number > 0 then nlen := floor(log10(number) + 1);
  sum    := 0;

  while tmp > 0 do
    begin
      digit := tmp mod 10;
      tmp   := tmp div 10;
      sum   := sum + digit ** nlen;
    end;

  result := number = sum;

end;

end.
