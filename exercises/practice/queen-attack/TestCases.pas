unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  QueenAttackTest = class(TTestCase)
  published
    procedure queen_with_a_valid_position;
    procedure queen_must_have_positive_row;
    procedure queen_must_have_row_on_board;
    procedure queen_must_have_positive_column;
    procedure queen_must_have_column_on_board;
    procedure cannot_attack;
    procedure can_attack_on_same_row;
    procedure can_attack_on_same_column;
    procedure can_attack_on_first_diagonal;
    procedure can_attack_on_second_diagonal;
    procedure can_attack_on_third_diagonal;
    procedure can_attack_on_fourth_diagonal;
    procedure cannot_attack_if_falling_diagonals_are_only_the_same_when_reflected_across_the_longest_falling_diagonal;
  end;

implementation

uses QueenAttack;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const expected : string    ;
  const ARow     : integer   ;
  const AColumn  : integer
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    QueenAttack.create(ARow, AColumn);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 3ac4f735-d36c-44c4-a3e2-316f79704203
procedure QueenAttackTest.queen_with_a_valid_position;
var
  q : TPosition;
begin
  q := QueenAttack.create(2, 2);
  TapAssertTrue(Self, 'queen with a valid position', 2, q.row);
end;

// 4e812d5d-b974-4e38-9a6b-8e0492bfa7be
procedure QueenAttackTest.queen_must_have_positive_row;
begin
  TapAssertExpectionMessage(Self, 'queen must have positive row', 'row not positive', -2, 2);
end;

// f07b7536-b66b-4f08-beb9-4d70d891d5c8
procedure QueenAttackTest.queen_must_have_row_on_board;
begin
  TapAssertExpectionMessage(Self, 'queen must have row on board', 'row not on board', 8, 4);
end;

// 15a10794-36d9-4907-ae6b-e5a0d4c54ebe
procedure QueenAttackTest.queen_must_have_positive_column;
begin
  TapAssertExpectionMessage(Self, 'queen must have positive column', 'column not positive', 2, -2);
end;

// 6907762d-0e8a-4c38-87fb-12f2f65f0ce4
procedure QueenAttackTest.queen_must_have_column_on_board;
begin
  TapAssertExpectionMessage(Self, 'queen must have column on board', 'column not on board', 4, 8);
end;

// 33ae4113-d237-42ee-bac1-e1e699c0c007
procedure QueenAttackTest.cannot_attack;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(2, 4);
  black := QueenAttack.create(6, 6);
  TapAssertTrue(Self, 'cannot attack', false, QueenAttack.canAttack(white, black));
end;

// eaa65540-ea7c-4152-8c21-003c7a68c914
procedure QueenAttackTest.can_attack_on_same_row;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(2, 4);
  black := QueenAttack.create(2, 6);
  TapAssertTrue(Self, 'can attack on same row', true, QueenAttack.canAttack(white, black));
end;

// bae6f609-2c0e-4154-af71-af82b7c31cea
procedure QueenAttackTest.can_attack_on_same_column;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(4, 5);
  black := QueenAttack.create(2, 5);
  TapAssertTrue(Self, 'can attack on same column', true, QueenAttack.canAttack(white, black));
end;

// 0e1b4139-b90d-4562-bd58-dfa04f1746c7
procedure QueenAttackTest.can_attack_on_first_diagonal;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(2, 2);
  black := QueenAttack.create(0, 4);
  TapAssertTrue(Self, 'can attack on first diagonal', true, QueenAttack.canAttack(white, black));
end;

// ff9b7ed4-e4b6-401b-8d16-bc894d6d3dcd
procedure QueenAttackTest.can_attack_on_second_diagonal;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(2, 2);
  black := QueenAttack.create(3, 1);
  TapAssertTrue(Self, 'can attack on second diagonal', true, QueenAttack.canAttack(white, black));
end;

// 0a71e605-6e28-4cc2-aa47-d20a2e71037a
procedure QueenAttackTest.can_attack_on_third_diagonal;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(2, 2);
  black := QueenAttack.create(1, 1);
  TapAssertTrue(Self, 'can attack on third diagonal', true, QueenAttack.canAttack(white, black));
end;

// 0790b588-ae73-4f1f-a968-dd0b34f45f86
procedure QueenAttackTest.can_attack_on_fourth_diagonal;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(1, 7);
  black := QueenAttack.create(0, 6);
  TapAssertTrue(Self, 'can attack on fourth diagonal', true, QueenAttack.canAttack(white, black));
end;

// 543f8fd4-2597-4aad-8d77-cbdab63619f8
procedure QueenAttackTest.cannot_attack_if_falling_diagonals_are_only_the_same_when_reflected_across_the_longest_falling_diagonal;
var
  white, black : TPosition;
begin
  white := QueenAttack.create(4, 1);
  black := QueenAttack.create(2, 5);
  TapAssertTrue(Self, 'cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal', false, QueenAttack.canAttack(white, black));
end;

initialization
RegisterTest(QueenAttackTest);

end.
