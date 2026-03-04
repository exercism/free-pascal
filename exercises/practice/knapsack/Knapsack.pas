unit Knapsack;

{$mode ObjFPC}{$H+}

interface

type
  TItem = record
    weight: Integer;
    value: Integer;
  end;

  TItemArray = Array Of TItem;

function maximumValue(const maximumWeight : Integer; const items : TItemArray) : Integer;

implementation

uses SysUtils;

function maximumValue(const maximumWeight : Integer; const items : TItemArray) : Integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := maximumWeight + length(items);

end;

end.
