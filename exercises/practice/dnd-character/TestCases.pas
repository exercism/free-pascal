unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  DndCharacterTest = class(TTestCase)
  published
    procedure ability_modifier_for_score_3_is_minus_4;
    procedure ability_modifier_for_score_4_is_minus_3;
    procedure ability_modifier_for_score_5_is_minus_3;
    procedure ability_modifier_for_score_6_is_minus_2;
    procedure ability_modifier_for_score_7_is_minus_2;
    procedure ability_modifier_for_score_8_is_minus_1;
    procedure ability_modifier_for_score_9_is_minus_1;
    procedure ability_modifier_for_score_10_is_0;
    procedure ability_modifier_for_score_11_is_0;
    procedure ability_modifier_for_score_12_is_plus_1;
    procedure ability_modifier_for_score_13_is_plus_1;
    procedure ability_modifier_for_score_14_is_plus_2;
    procedure ability_modifier_for_score_15_is_plus_2;
    procedure ability_modifier_for_score_16_is_plus_3;
    procedure ability_modifier_for_score_17_is_plus_3;
    procedure ability_modifier_for_score_18_is_plus_4;
    procedure random_ability_is_within_range;
    procedure random_character_is_valid;
    procedure each_ability_is_only_calculated_once;
  end;

implementation

uses DndCharacter;

var
  FCharacter : TCharacter;

// 1e9ae1dc-35bd-43ba-aa08-e4b94c20fa37
procedure DndCharacterTest.ability_modifier_for_score_3_is_minus_4;
begin
  TapAssertTrue(Self, 'ability modifier for score 3 is -4', -4, DndCharacter.modifier(3));
end;

// cc9bb24e-56b8-4e9e-989d-a0d1a29ebb9c
procedure DndCharacterTest.ability_modifier_for_score_4_is_minus_3;
begin
  TapAssertTrue(Self, 'ability modifier for score 4 is -3', -3, DndCharacter.modifier(4));
end;

// 5b519fcd-6946-41ee-91fe-34b4f9808326
procedure DndCharacterTest.ability_modifier_for_score_5_is_minus_3;
begin
  TapAssertTrue(Self, 'ability modifier for score 5 is -3', -3, DndCharacter.modifier(5));
end;

// dc2913bd-6d7a-402e-b1e2-6d568b1cbe21
procedure DndCharacterTest.ability_modifier_for_score_6_is_minus_2;
begin
  TapAssertTrue(Self, 'ability modifier for score 6 is -2', -2, DndCharacter.modifier(6));
end;

// 099440f5-0d66-4b1a-8a10-8f3a03cc499f
procedure DndCharacterTest.ability_modifier_for_score_7_is_minus_2;
begin
  TapAssertTrue(Self, 'ability modifier for score 7 is -2', -2, DndCharacter.modifier(7));
end;

// cfda6e5c-3489-42f0-b22b-4acb47084df0
procedure DndCharacterTest.ability_modifier_for_score_8_is_minus_1;
begin
  TapAssertTrue(Self, 'ability modifier for score 8 is -1', -1, DndCharacter.modifier(8));
end;

// c70f0507-fa7e-4228-8463-858bfbba1754
procedure DndCharacterTest.ability_modifier_for_score_9_is_minus_1;
begin
  TapAssertTrue(Self, 'ability modifier for score 9 is -1', -1, DndCharacter.modifier(9));
end;

// 6f4e6c88-1cd9-46a0-92b8-db4a99b372f7
procedure DndCharacterTest.ability_modifier_for_score_10_is_0;
begin
  TapAssertTrue(Self, 'ability modifier for score 10 is 0', 0, DndCharacter.modifier(10));
end;

// e00d9e5c-63c8-413f-879d-cd9be9697097
procedure DndCharacterTest.ability_modifier_for_score_11_is_0;
begin
  TapAssertTrue(Self, 'ability modifier for score 11 is 0', 0, DndCharacter.modifier(11));
end;

// eea06f3c-8de0-45e7-9d9d-b8cab4179715
procedure DndCharacterTest.ability_modifier_for_score_12_is_plus_1;
begin
  TapAssertTrue(Self, 'ability modifier for score 12 is +1', 1, DndCharacter.modifier(12));
end;

// 9c51f6be-db72-4af7-92ac-b293a02c0dcd
procedure DndCharacterTest.ability_modifier_for_score_13_is_plus_1;
begin
  TapAssertTrue(Self, 'ability modifier for score 13 is +1', 1, DndCharacter.modifier(13));
end;

// 94053a5d-53b6-4efc-b669-a8b5098f7762
procedure DndCharacterTest.ability_modifier_for_score_14_is_plus_2;
begin
  TapAssertTrue(Self, 'ability modifier for score 14 is +2', 2, DndCharacter.modifier(14));
end;

// 8c33e7ca-3f9f-4820-8ab3-65f2c9e2f0e2
procedure DndCharacterTest.ability_modifier_for_score_15_is_plus_2;
begin
  TapAssertTrue(Self, 'ability modifier for score 15 is +2', 2, DndCharacter.modifier(15));
end;

// c3ec871e-1791-44d0-b3cc-77e5fb4cd33d
procedure DndCharacterTest.ability_modifier_for_score_16_is_plus_3;
begin
  TapAssertTrue(Self, 'ability modifier for score 16 is +3', 3, DndCharacter.modifier(16));
end;

// 3d053cee-2888-4616-b9fd-602a3b1efff4
procedure DndCharacterTest.ability_modifier_for_score_17_is_plus_3;
begin
  TapAssertTrue(Self, 'ability modifier for score 17 is +3', 3, DndCharacter.modifier(17));
end;

// bafd997a-e852-4e56-9f65-14b60261faee
procedure DndCharacterTest.ability_modifier_for_score_18_is_plus_4;
begin
  TapAssertTrue(Self, 'ability modifier for score 18 is +4', 4, DndCharacter.modifier(18));
end;

// 4f28f19c-2e47-4453-a46a-c0d365259c14
procedure DndCharacterTest.random_ability_is_within_range;
var
  ability : integer;
begin
  ability := DndCharacter.ability;
  TapAssertTrue(Self, 'random ability is within range', true, (ability >= 3) and (ability <= 18) );
end;

// 385d7e72-864f-4e88-8279-81a7d75b04ad
procedure DndCharacterTest.random_character_is_valid;
begin
  FCharacter := DndCharacter.character;
  TapAssertTrue(Self, 'random character is valid', true, (FCharacter.strength >= 3) and (FCharacter.strength <= 18) and (FCharacter.dexterity >= 3) and (FCharacter.dexterity <= 18) and (FCharacter.constitution >= 3) and (FCharacter.constitution <= 18) and (FCharacter.intelligence >= 3) and (FCharacter.intelligence <= 18) and (FCharacter.wisdom >= 3) and (FCharacter.wisdom <= 18) and (FCharacter.charisma >= 3) and (FCharacter.charisma <= 18) and (FCharacter.hitpoints = 10 + DndCharacter.modifier(FCharacter.constitution)));
end;

// dca2b2ec-f729-4551-84b9-078876bb4808
procedure DndCharacterTest.each_ability_is_only_calculated_once;
var
  LCharacter : TCharacter;
begin
  LCharacter := DndCharacter.character;
  TapAssertTrue(Self, 'each ability is only calculated once', true, (LCharacter.strength = FCharacter.strength) and (LCharacter.dexterity = FCharacter.dexterity) and (LCharacter.constitution = FCharacter.constitution) and (LCharacter.intelligence = FCharacter.intelligence) and (LCharacter.wisdom = FCharacter.wisdom) and (LCharacter.charisma = FCharacter.charisma) );
end;

initialization
RegisterTest(DndCharacterTest);

end.
