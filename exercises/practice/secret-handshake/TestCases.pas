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

type
  TStrArray = Array Of String;

var message : string;

// b8496fbd-6778-468c-8054-648d03c4bb23
procedure SecretHandshakeTest.wink_for_1;
const expected : TStrArray = ('wink');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(1);
  message := EncodeJsonMessage('wink for 1', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 83ec6c58-81a9-4fd1-bfaf-0160514fc0e3
procedure SecretHandshakeTest.double_blink_for_10;
const expected : TStrArray = ('double blink');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(2);
  message := EncodeJsonMessage('double blink for 10', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 0e20e466-3519-4134-8082-5639d85fef71
procedure SecretHandshakeTest.close_your_eyes_for_100;
const expected : TStrArray = ('close your eyes');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(4);
  message := EncodeJsonMessage('close your eyes for 100', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// b339ddbb-88b7-4b7d-9b19-4134030d9ac0
procedure SecretHandshakeTest.jump_for_1000;
const expected : TStrArray = ('jump');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(8);
  message := EncodeJsonMessage('jump for 1000', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 40499fb4-e60c-43d7-8b98-0de3ca44e0eb
procedure SecretHandshakeTest.combine_two_actions;
const expected : TStrArray = ('wink', 'double blink');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(3);
  message := EncodeJsonMessage('combine two actions', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 9730cdd5-ef27-494b-afd3-5c91ad6c3d9d
procedure SecretHandshakeTest.reverse_two_actions;
const expected : TStrArray = ('double blink', 'wink');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(19);
  message := EncodeJsonMessage('reverse two actions', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 0b828205-51ca-45cd-90d5-f2506013f25f
procedure SecretHandshakeTest.reversing_one_action_gives_the_same_action;
const expected : TStrArray = ('jump');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(24);
  message := EncodeJsonMessage('reversing one action gives the same action', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 9949e2ac-6c9c-4330-b685-2089ab28b05f
procedure SecretHandshakeTest.reversing_no_actions_still_gives_no_actions;
const expected : TStrArray = ();
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(16);
  message := EncodeJsonMessage('reversing no actions still gives no actions', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 23fdca98-676b-4848-970d-cfed7be39f81
procedure SecretHandshakeTest.all_possible_actions;
const expected : TStrArray = ('wink', 'double blink', 'close your eyes', 'jump');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(15);
  message := EncodeJsonMessage('all possible actions', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// ae8fe006-d910-4d6f-be00-54b7c3799e79
procedure SecretHandshakeTest.reverse_all_possible_actions;
const expected : TStrArray = ('jump', 'close your eyes', 'double blink', 'wink');
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(31);
  message := EncodeJsonMessage('reverse all possible actions', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

// 3d36da37-b31f-4cdb-a396-d93a2ee1c4a5
procedure SecretHandshakeTest.do_nothing_for_zero;
const expected : TStrArray = ();
var actual : TStrArray;
begin
  actual  := SecretHandshake.commands(0);
  message := EncodeJsonMessage('do nothing for zero', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

initialization
RegisterTest(SecretHandshakeTest);

end.
