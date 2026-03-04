unit Sublist;

{$mode ObjFPC}{$H+}

interface

type
  TClassification = (kSublist, kSuperlist, kEqual, kUnequal);

  TCurrencyArray = Array Of Currency;

function compare(const listOne, listTwo: TCurrencyArray) : TClassification;

implementation

uses SysUtils;

function isSublist(const listOne, listTwo: TCurrencyArray) : Boolean;
var
  i : Integer;
  j : Integer;
begin
  for i := low(listTwo) to high(listTwo) + 1 - length(listOne) do
    begin
      j := low(ListOne);
      while (j <= high(listOne)) and (listOne[j] = listTwo[i + j]) do
        j := j + 1;

      if j > high(listOne) then
        begin
          result := true;
          exit;
        end;
    end;

  result := false;
end;

function compare(const listOne, listTwo: TCurrencyArray) : TClassification;
begin
  if isSublist(listOne, listTwo) then
    begin
      if isSublist(listTwo, listOne) then
        result := kEqual
      else
        result := kSublist;
    end
  else
    begin
      if isSublist(listTwo, listOne) then
        result := kSuperlist
      else
        result := kUnequal;
    end;
end;

end.
