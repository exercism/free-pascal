unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RobotSimulatorTest = class(TTestCase)
  published
    procedure at_origin_facing_north;
    procedure at_negative_position_facing_south;
    procedure changes_north_to_east;
    procedure changes_east_to_south;
    procedure changes_south_to_west;
    procedure changes_west_to_north;
    procedure changes_north_to_west;
    procedure changes_west_to_south;
    procedure changes_south_to_east;
    procedure changes_east_to_north;
    procedure facing_north_increments_y;
    procedure facing_south_decrements_y;
    procedure facing_east_increments_x;
    procedure facing_west_decrements_x;
    procedure moving_east_and_north_from_readme;
    procedure moving_west_and_north;
    procedure moving_west_and_south;
    procedure moving_east_and_north;
  end;

implementation

uses RobotSimulator;

// c557c16d-26c1-4e06-827c-f6602cd0785c
procedure RobotSimulatorTest.at_origin_facing_north;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, north);
  TapAssertTrue(Self, 'at origin facing north', '0,0 N', robot.ToString);
  robot.Free;
end;

// bf0dffce-f11c-4cdb-8a5e-2c89d8a5a67d
procedure RobotSimulatorTest.at_negative_position_facing_south;
const
  start : TPosition = (x: -1; y: -1);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, south);
  TapAssertTrue(Self, 'at negative position facing south', '-1,-1 S', robot.ToString);
  robot.Free;
end;

// 8cbd0086-6392-4680-b9b9-73cf491e67e5
procedure RobotSimulatorTest.changes_north_to_east;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, north);
  robot.Move('R');
  TapAssertTrue(Self, 'changes north to east', '0,0 E', robot.ToString);
  robot.Free;
end;

// 8abc87fc-eab2-4276-93b7-9c009e866ba1
procedure RobotSimulatorTest.changes_east_to_south;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, east);
  robot.Move('R');
  TapAssertTrue(Self, 'changes east to south', '0,0 S', robot.ToString);
  robot.Free;
end;

// 3cfe1b85-bbf2-4bae-b54d-d73e7e93617a
procedure RobotSimulatorTest.changes_south_to_west;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, south);
  robot.Move('R');
  TapAssertTrue(Self, 'changes south to west', '0,0 W', robot.ToString);
  robot.Free;
end;

// 5ea9fb99-3f2c-47bd-86f7-46b7d8c3c716
procedure RobotSimulatorTest.changes_west_to_north;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, west);
  robot.Move('R');
  TapAssertTrue(Self, 'changes west to north', '0,0 N', robot.ToString);
  robot.Free;
end;

// fa0c40f5-6ba3-443d-a4b3-58cbd6cb8d63
procedure RobotSimulatorTest.changes_north_to_west;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, north);
  robot.Move('L');
  TapAssertTrue(Self, 'changes north to west', '0,0 W', robot.ToString);
  robot.Free;
end;

// da33d734-831f-445c-9907-d66d7d2a92e2
procedure RobotSimulatorTest.changes_west_to_south;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, west);
  robot.Move('L');
  TapAssertTrue(Self, 'changes west to south', '0,0 S', robot.ToString);
  robot.Free;
end;

// bd1ca4b9-4548-45f4-b32e-900fc7c19389
procedure RobotSimulatorTest.changes_south_to_east;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, south);
  robot.Move('L');
  TapAssertTrue(Self, 'changes south to east', '0,0 E', robot.ToString);
  robot.Free;
end;

// 2de27b67-a25c-4b59-9883-bc03b1b55bba
procedure RobotSimulatorTest.changes_east_to_north;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, east);
  robot.Move('L');
  TapAssertTrue(Self, 'changes east to north', '0,0 N', robot.ToString);
  robot.Free;
end;

// f0dc2388-cddc-4f83-9bed-bcf46b8fc7b8
procedure RobotSimulatorTest.facing_north_increments_y;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, north);
  robot.Move('A');
  TapAssertTrue(Self, 'facing north increments Y', '0,1 N', robot.ToString);
  robot.Free;
end;

// 2786cf80-5bbf-44b0-9503-a89a9c5789da
procedure RobotSimulatorTest.facing_south_decrements_y;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, south);
  robot.Move('A');
  TapAssertTrue(Self, 'facing south decrements Y', '0,-1 S', robot.ToString);
  robot.Free;
end;

// 84bf3c8c-241f-434d-883d-69817dbd6a48
procedure RobotSimulatorTest.facing_east_increments_x;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, east);
  robot.Move('A');
  TapAssertTrue(Self, 'facing east increments X', '1,0 E', robot.ToString);
  robot.Free;
end;

// bb69c4a7-3bbf-4f64-b415-666fa72d7b04
procedure RobotSimulatorTest.facing_west_decrements_x;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, west);
  robot.Move('A');
  TapAssertTrue(Self, 'facing west decrements X', '-1,0 W', robot.ToString);
  robot.Free;
end;

// e34ac672-4ed4-4be3-a0b8-d9af259cbaa1
procedure RobotSimulatorTest.moving_east_and_north_from_readme;
const
  start : TPosition = (x: 7; y: 3);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, north);
  robot.Move('RAALAL');
  TapAssertTrue(Self, 'moving east and north from README', '9,4 W', robot.ToString);
  robot.Free;
end;

// f30e4955-4b47-4aa3-8b39-ae98cfbd515b
procedure RobotSimulatorTest.moving_west_and_north;
const
  start : TPosition = (x: 0; y: 0);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, north);
  robot.Move('LAAARALA');
  TapAssertTrue(Self, 'moving west and north', '-4,1 W', robot.ToString);
  robot.Free;
end;

// 3e466bf6-20ab-4d79-8b51-264165182fca
procedure RobotSimulatorTest.moving_west_and_south;
const
  start : TPosition = (x: 2; y: -7);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, east);
  robot.Move('RRAAAAALA');
  TapAssertTrue(Self, 'moving west and south', '-3,-8 S', robot.ToString);
  robot.Free;
end;

// 41f0bb96-c617-4e6b-acff-a4b279d44514
procedure RobotSimulatorTest.moving_east_and_north;
const
  start : TPosition = (x: 8; y: 4);
var
  robot : TRobot;
begin
  robot := RobotSimulator.TRobot.Create(start, south);
  robot.Move('LAAARRRALLLL');
  TapAssertTrue(Self, 'moving east and north', '11,5 N', robot.ToString);
  robot.Free;
end;

initialization
RegisterTest(RobotSimulatorTest);

end.
