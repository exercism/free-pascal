unit DndCharacter;

{$mode ObjFPC}{$H+}

{$WARN 6058 OFF}
{$WARN 5071 OFF}

interface

type
  TCharacter = record
    strength     : integer;
    dexterity    : integer;
    constitution : integer;
    intelligence : integer;
    wisdom       : integer;
    charisma     : integer;
    hitpoints    : integer;
  end;

function modifier(const score : integer) : integer;
function ability : integer;
function character : TCharacter;

implementation

uses SysUtils, Math, Classes, Generics.Collections;

type
  TIntegerList = specialize TList<integer>;

var
  FCharacter : TCharacter;

function modifier(const score : integer) : integer;
begin
  result := floor((score - 10) / 2);
end;

function ability : integer;
const
  min = 1;
  max = 6;
var
  DiceRolls : TIntegerList;
  i          : integer;
  sum        : integer;
begin
  DiceRolls := TIntegerList.Create;
  for i := 0 to 3 do
    begin
      DiceRolls.Add(random(max) + min);
    end;
  DiceRolls.Sort;
  DiceRolls.Delete(0);
  sum := 0;
  for i := 0 to DiceRolls.Count - 1 do
    begin
      inc(sum, DiceRolls[i]);
    end;
  DiceRolls.Free;
  result := sum;
end;

function character : TCharacter;
begin
  if FCharacter.hitpoints = 0 then
    with FCharacter do
      begin
        strength     := ability;
        dexterity    := ability;
        constitution := ability;
        intelligence := ability;
        wisdom       := ability;
        charisma     := ability;
        hitpoints    := 10 + modifier(constitution);
      end;
  result := FCharacter;
end;

end.
