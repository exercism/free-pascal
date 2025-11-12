unit Allergies;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function list(const score : integer) : TStrArray;
function AllergicTo(const item : string; const score : integer) : boolean;

implementation

uses SysUtils;

const
  FULL_LIST : Array[0..7] Of String = (
    'eggs',         // (1)
    'peanuts',      // (2)
    'shellfish',    // (4)
    'strawberries', // (8)
    'tomatoes',     // (16)
    'chocolate',    // (32)
    'pollen',       // (64)
    'cats'          // (128)
  );

function list(const score : integer) : TStrArray;
var
  i     : integer;
  LList : TStrArray = ();
begin
  for i := low(FULL_LIST) to high(FULL_LIST) do
    if ((score and (1 shl i)) <> 0 ) then
      insert(FULL_LIST[i], LList, Length(LList));
  result := LList;
end;

function AllergicTo(const item : string; const score : integer) : boolean;
var
  LBool : boolean = false;
  i     : integer;
  LList : TStrArray = ();
begin
  LList := list(score);
  for i := low(LList) to high(LList) do
    if item = LList[i] then
      begin
        LBool := true;
        break;
      end;
  result := LBool;
end;

end.
