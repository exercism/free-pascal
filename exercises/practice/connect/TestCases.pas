unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ConnectTest = class(TTestCase)
  published
    procedure an_empty_board_has_no_winner;
    procedure x_can_win_on_a_1x1_board;
    procedure o_can_win_on_a_1x1_board;
    procedure only_edges_does_not_make_a_winner;
    procedure illegal_diagonal_does_not_make_a_winner;
    procedure nobody_wins_crossing_adjacent_angles;
    procedure x_wins_crossing_from_left_to_right;
    procedure x_wins_with_left_hand_dead_end_fork;
    procedure x_wins_with_right_hand_dead_end_fork;
    procedure o_wins_crossing_from_top_to_bottom;
    procedure x_wins_using_a_convoluted_path;
    procedure x_wins_using_a_spiral_path;
  end;

implementation

uses Connect;

// 6eff0df4-3e92-478d-9b54-d3e8b354db56
procedure ConnectTest.an_empty_board_has_no_winner;
var
  board          : TStrArray = ();
begin
  board := [
    '. . . . .',
    ' . . . . .',
    '  . . . . .',
    '   . . . . .',
    '    . . . . .'
  ];
  TapAssertTrue(Self, 'an empty board has no winner', '', Connect.winner(board));
end;

// 298b94c0-b46d-45d8-b34b-0fa2ea71f0a4
procedure ConnectTest.x_can_win_on_a_1x1_board;
var
  board          : TStrArray = ();
begin
  board := [
    'X'
  ];
  TapAssertTrue(Self, 'X can win on a 1x1 board', 'X', Connect.winner(board));
end;

// 763bbae0-cb8f-4f28-bc21-5be16a5722dc
procedure ConnectTest.o_can_win_on_a_1x1_board;
var
  board          : TStrArray = ();
begin
  board := [
    'O'
  ];
  TapAssertTrue(Self, 'O can win on a 1x1 board', 'O', Connect.winner(board));
end;

// 819fde60-9ae2-485e-a024-cbb8ea68751b
procedure ConnectTest.only_edges_does_not_make_a_winner;
var
  board          : TStrArray = ();
begin
  board := [
    'O O O X',
    ' X . . X',
    '  X . . X',
    '   X O O O'
  ];
  TapAssertTrue(Self, 'only edges does not make a winner', '', Connect.winner(board));
end;

// 2c56a0d5-9528-41e5-b92b-499dfe08506c
procedure ConnectTest.illegal_diagonal_does_not_make_a_winner;
var
  board          : TStrArray = ();
begin
  board := [
    'X O . .',
    ' O X X X',
    '  O X O .',
    '   . O X .',
    '    X X O O'
  ];
  TapAssertTrue(Self, 'illegal diagonal does not make a winner', '', Connect.winner(board));
end;

// 41cce3ef-43ca-4963-970a-c05d39aa1cc1
procedure ConnectTest.nobody_wins_crossing_adjacent_angles;
var
  board          : TStrArray = ();
begin
  board := [
    'X . . .',
    ' . X O .',
    '  O . X O',
    '   . O . X',
    '    . . O .'
  ];
  TapAssertTrue(Self, 'nobody wins crossing adjacent angles', '', Connect.winner(board));
end;

// cd61c143-92f6-4a8d-84d9-cb2b359e226b
procedure ConnectTest.x_wins_crossing_from_left_to_right;
var
  board          : TStrArray = ();
begin
  board := [
    '. O . .',
    ' O X X X',
    '  O X O .',
    '   X X O X',
    '    . O X .'
  ];
  TapAssertTrue(Self, 'X wins crossing from left to right', 'X', Connect.winner(board));
end;

// 495e33ed-30a9-4012-b46e-d7c4d5fe13c3
procedure ConnectTest.x_wins_with_left_hand_dead_end_fork;
var
  board          : TStrArray = ();
begin
  board := [
    '. . X .',
    ' X X . .',
    '  . X X X',
    '   O O O O'
  ];
  TapAssertTrue(Self, 'X wins with left-hand dead end fork', 'X', Connect.winner(board));
end;

// ab167ab0-4a98-4d0f-a1c0-e1cddddc3d58
procedure ConnectTest.x_wins_with_right_hand_dead_end_fork;
var
  board          : TStrArray = ();
begin
  board := [
    '. . X X',
    ' X X . .',
    '  . X X .',
    '   O O O O'
  ];
  TapAssertTrue(Self, 'X wins with right-hand dead end fork', 'X', Connect.winner(board));
end;

// 73d1eda6-16ab-4460-9904-b5f5dd401d0b
procedure ConnectTest.o_wins_crossing_from_top_to_bottom;
var
  board          : TStrArray = ();
begin
  board := [
    '. O . .',
    ' O X X X',
    '  O O O .',
    '   X X O X',
    '    . O X .'
  ];
  TapAssertTrue(Self, 'O wins crossing from top to bottom', 'O', Connect.winner(board));
end;

// c3a2a550-944a-4637-8b3f-1e1bf1340a3d
procedure ConnectTest.x_wins_using_a_convoluted_path;
var
  board          : TStrArray = ();
begin
  board := [
    '. X X . .',
    ' X . X . X',
    '  . X . X .',
    '   . X X . .',
    '    O O O O O'
  ];
  TapAssertTrue(Self, 'X wins using a convoluted path', 'X', Connect.winner(board));
end;

// 17e76fa8-f731-4db7-92ad-ed2a285d31f3
procedure ConnectTest.x_wins_using_a_spiral_path;
var
  board          : TStrArray = ();
begin
  board := [
    'O X X X X X X X X',
    ' O X O O O O O O O',
    '  O X O X X X X X O',
    '   O X O X O O O X O',
    '    O X O X X X O X O',
    '     O X O O O X O X O',
    '      O X X X X X O X O',
    '       O O O O O O O X O',
    '        X X X X X X X X O'
  ];
  TapAssertTrue(Self, 'X wins using a spiral path', 'X', Connect.winner(board));
end;

initialization
RegisterTest(ConnectTest);

end.
