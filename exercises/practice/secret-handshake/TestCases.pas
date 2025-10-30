unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SecretHandshakeTest = class(TTestCase)
  published
    procedure wink_for_1;
    procedure double_blink_for_10;
    procedure close_your_eyes_for_100;
    procedure jump_for_1000;
    procedure combine_two_actions;
    procedure reverse_two_actions;
    procedure reversing_one_action_gives_the_same_action;
    procedure reversing_no_actions_still_gives_no_actions;
    procedure all_possible_actions;
    procedure reverse_all_possible_actions;
    procedure do_nothing_for_zero;
  end;

implementation

uses SecretHandshake;

// b8496fbd-6778-468c-8054-648d03c4bb23
procedure SecretHandshakeTest.wink_for_1;
begin
  TapAssertTrue(Self, 'wink for 1', ['wink'], SecretHandshake.commands(1));
end;

// 83ec6c58-81a9-4fd1-bfaf-0160514fc0e3
procedure SecretHandshakeTest.double_blink_for_10;
begin
  TapAssertTrue(Self, 'double blink for 10', ['double blink'], SecretHandshake.commands(2));
end;

// 0e20e466-3519-4134-8082-5639d85fef71
procedure SecretHandshakeTest.close_your_eyes_for_100;
begin
  TapAssertTrue(Self, 'close your eyes for 100', ['close your eyes'], SecretHandshake.commands(4));
end;

// b339ddbb-88b7-4b7d-9b19-4134030d9ac0
procedure SecretHandshakeTest.jump_for_1000;
begin
  TapAssertTrue(Self, 'jump for 1000', ['jump'], SecretHandshake.commands(8));
end;

// 40499fb4-e60c-43d7-8b98-0de3ca44e0eb
procedure SecretHandshakeTest.combine_two_actions;
begin
  TapAssertTrue(Self, 'combine two actions', ['wink', 'double blink'], SecretHandshake.commands(3));
end;

// 9730cdd5-ef27-494b-afd3-5c91ad6c3d9d
procedure SecretHandshakeTest.reverse_two_actions;
begin
  TapAssertTrue(Self, 'reverse two actions', ['double blink', 'wink'], SecretHandshake.commands(19));
end;

// 0b828205-51ca-45cd-90d5-f2506013f25f
procedure SecretHandshakeTest.reversing_one_action_gives_the_same_action;
begin
  TapAssertTrue(Self, 'reversing one action gives the same action', ['jump'], SecretHandshake.commands(24));
end;

// 9949e2ac-6c9c-4330-b685-2089ab28b05f
procedure SecretHandshakeTest.reversing_no_actions_still_gives_no_actions;
begin
  TapAssertTrue(Self, 'reversing no actions still gives no actions', [], SecretHandshake.commands(16));
end;

// 23fdca98-676b-4848-970d-cfed7be39f81
procedure SecretHandshakeTest.all_possible_actions;
begin
  TapAssertTrue(Self, 'all possible actions', ['wink', 'double blink', 'close your eyes', 'jump'], SecretHandshake.commands(15));
end;

// ae8fe006-d910-4d6f-be00-54b7c3799e79
procedure SecretHandshakeTest.reverse_all_possible_actions;
begin
  TapAssertTrue(Self, 'reverse all possible actions', ['jump', 'close your eyes', 'double blink', 'wink'], SecretHandshake.commands(31));
end;

// 3d36da37-b31f-4cdb-a396-d93a2ee1c4a5
procedure SecretHandshakeTest.do_nothing_for_zero;
begin
  TapAssertTrue(Self, 'do nothing for zero', [], SecretHandshake.commands(0));
end;

initialization
RegisterTest(SecretHandshakeTest);

end.
