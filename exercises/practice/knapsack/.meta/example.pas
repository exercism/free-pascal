unit Knapsack;

{$mode ObjFPC}{$H+}

interface

type
  TItem = record
    weight: Integer;
    value: Integer;
  end;

  TItemArray = Array Of TItem;
  TIntArray = Array Of Integer;

function maximumValue(const maximumWeight : Integer; const items : TItemArray) : Integer;

implementation

uses SysUtils;

function maximumValue(const maximumWeight : Integer; const items : TItemArray) : Integer;
var
  table : TIntArray = ();
  itemIndex : Integer;
  index : Integer;
  value : Integer;
begin
  SetLength(table, maximumWeight + 1);
  for index := Low(table) to High(table) do
    table[index] := 0;

  for itemIndex := Low(items) to High(items) do
    begin
      index := maximumWeight + 1;
      while index > items[itemIndex].weight do
        begin
          index := index - 1;
          value := items[itemIndex].value + table[index - items[itemIndex].weight];
          if table[index] < value then
            table[index] := value;
        end;
    end;

  result := table[maximumWeight];
end;

end.
