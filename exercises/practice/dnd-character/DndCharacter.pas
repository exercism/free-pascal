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

uses SysUtils;

function modifier(const score : integer) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := score * -1;

end;

function ability : integer;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := -999;
end;

function character : TCharacter;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.hitpoints := -1;
end;

end.
