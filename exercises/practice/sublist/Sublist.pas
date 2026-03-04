unit Sublist;

{$mode ObjFPC}{$H+}

interface

type
  TClassification = (kSublist, kSuperlist, kEqual, kUnequal);

  TCurrencyArray = Array Of Currency;

function compare(const listOne, listTwo: TCurrencyArray) : TClassification;

implementation

uses SysUtils;

function compare(const listOne, listTwo: TCurrencyArray) : TClassification;
begin

  raise ENotImplemented.Create('Please implement your solution.'); if length(listOne) = length(listTwo) then result := kUnequal else result := kEqual;

end;

end.
