unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  AlphameticsTest = class(TTestCase)
  published
    procedure puzzle_with_three_letters;
    procedure solution_must_have_unique_value_for_each_letter;
    procedure leading_zero_solution_is_invalid;
    procedure puzzle_with_two_digits_final_carry;
    procedure puzzle_with_four_letters;
    procedure puzzle_with_six_letters;
    procedure puzzle_with_seven_letters;
    procedure puzzle_with_eight_letters;
    procedure puzzle_with_ten_letters;
    procedure puzzle_with_ten_letters_and_199_addends;
    procedure retirement_puzzle;
  end;

implementation

uses Alphametics;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : string;
  const puzzle   : string
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    Alphametics.solve(puzzle);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// e0c08b07-9028-4d5f-91e1-d178fead8e1a
procedure AlphameticsTest.puzzle_with_three_letters;
const
  puzzle : string = 'I + BB == ILL';
  expect : string = '1 + 99 == 100';
begin
  TapAssertTrue(Self, 'puzzle with three letters', expect, Alphametics.solve(puzzle));
end;

// a504ee41-cb92-4ec2-9f11-c37e95ab3f25
procedure AlphameticsTest.solution_must_have_unique_value_for_each_letter;
const
  puzzle : string = 'A == B';
begin
  TapAssertExpectionMessage(Self, 'solution must have unique value for each letter', 'no solution', puzzle);
end;

// 4e3b81d2-be7b-4c5c-9a80-cd72bc6d465a
procedure AlphameticsTest.leading_zero_solution_is_invalid;
const
  puzzle : string = 'ACA + DD == BD';
begin
  TapAssertExpectionMessage(Self, 'leading zero solution is invalid', 'no solution', puzzle);
end;

// 8a3e3168-d1ee-4df7-94c7-b9c54845ac3a
procedure AlphameticsTest.puzzle_with_two_digits_final_carry;
const
  puzzle : string = 'A + A + A + A + A + A + A + A + A + A + A + B == BCC';
  expect : string = '9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 1 == 100';
begin
  TapAssertTrue(Self, 'puzzle with two digits final carry', expect, Alphametics.solve(puzzle));
end;

// a9630645-15bd-48b6-a61e-d85c4021cc09
procedure AlphameticsTest.puzzle_with_four_letters;
const
  puzzle : string = 'AS + A == MOM';
  expect : string = '92 + 9 == 101';
begin
  TapAssertTrue(Self, 'puzzle with four letters', expect, Alphametics.solve(puzzle));
end;

// 3d905a86-5a52-4e4e-bf80-8951535791bd
procedure AlphameticsTest.puzzle_with_six_letters;
const
  puzzle : string = 'NO + NO + TOO == LATE';
  expect : string = '74 + 74 + 944 == 1092';
begin
  TapAssertTrue(Self, 'puzzle with six letters', expect, Alphametics.solve(puzzle));
end;

// 4febca56-e7b7-4789-97b9-530d09ba95f0
procedure AlphameticsTest.puzzle_with_seven_letters;
const
  puzzle : string = 'HE + SEES + THE == LIGHT';
  expect : string = '54 + 9449 + 754 == 10257';
begin
  TapAssertTrue(Self, 'puzzle with seven letters', expect, Alphametics.solve(puzzle));
end;

// 12125a75-7284-4f9a-a5fa-191471e0d44f
procedure AlphameticsTest.puzzle_with_eight_letters;
const
  puzzle : string = 'SEND + MORE == MONEY';
  expect : string = '9567 + 1085 == 10652';
begin
  TapAssertTrue(Self, 'puzzle with eight letters', expect, Alphametics.solve(puzzle));
end;

// fb05955f-38dc-477a-a0b6-5ef78969fffa
procedure AlphameticsTest.puzzle_with_ten_letters;
const
  puzzle : string = 'AND + A + STRONG + OFFENSE + AS + A + GOOD == DEFENSE';
  expect : string = '503 + 5 + 691208 + 2774064 + 56 + 5 + 8223 == 3474064';
begin
  TapAssertTrue(Self, 'puzzle with ten letters', expect, Alphametics.solve(puzzle));
end;

// 9a101e81-9216-472b-b458-b513a7adacf7
procedure AlphameticsTest.puzzle_with_ten_letters_and_199_addends;
const
  puzzle : string = 'THIS + A + FIRE + THEREFORE + FOR + ALL + HISTORIES + I + TELL + A + TALE + THAT + FALSIFIES + ITS + TITLE + TIS + A + LIE + THE + TALE + OF + THE + LAST + FIRE + HORSES + LATE + AFTER + THE + FIRST + FATHERS + FORESEE + THE + HORRORS + THE + LAST + FREE + TROLL + TERRIFIES + THE + HORSES + OF + FIRE + THE + TROLL + RESTS + AT + THE + HOLE + OF + LOSSES + IT + IS + THERE + THAT + SHE + STORES + ROLES + OF + LEATHERS + AFTER + SHE + SATISFIES + HER + HATE + OFF + THOSE + FEARS + A + TASTE + RISES + AS + SHE + HEARS + THE + LEAST + FAR + HORSE + THOSE + FAST + HORSES + THAT + FIRST + HEAR + THE + TROLL + FLEE + OFF + TO + THE + FOREST + THE + HORSES + THAT + ALERTS + RAISE + THE + STARES + OF + THE + OTHERS + AS + THE + TROLL + ASSAILS + AT + THE + TOTAL + SHIFT + HER + TEETH + TEAR + HOOF + OFF + TORSO + AS + THE + LAST + HORSE + FORFEITS + ITS + LIFE + THE + FIRST + FATHERS + HEAR + OF + THE + HORRORS + THEIR + FEARS + THAT + THE + FIRES + FOR + THEIR + FEASTS + ARREST + AS + THE + FIRST + FATHERS + RESETTLE + THE + LAST + OF + THE + FIRE + HORSES + THE + LAST + TROLL + HARASSES + THE + FOREST + HEART + FREE + AT + LAST + OF + THE + LAST + TROLL + ALL + OFFER + THEIR + FIRE + HEAT + TO + THE + ASSISTERS + FAR + OFF + THE + TROLL + FASTS + ITS + LIFE + SHORTER + AS + STARS + RISE + THE + HORSES + REST + SAFE + AFTER + ALL + SHARE + HOT + FISH + AS + THEIR + AFFILIATES + TAILOR + A + ROOFS + FOR + THEIR + SAFE == FORTRESSES';
  expect : string = '9874 + 1 + 5730 + 980305630 + 563 + 122 + 874963704 + 7 + 9022 + 1 + 9120 + 9819 + 512475704 + 794 + 97920 + 974 + 1 + 270 + 980 + 9120 + 65 + 980 + 2149 + 5730 + 863404 + 2190 + 15903 + 980 + 57349 + 5198034 + 5630400 + 980 + 8633634 + 980 + 2149 + 5300 + 93622 + 903375704 + 980 + 863404 + 65 + 5730 + 980 + 93622 + 30494 + 19 + 980 + 8620 + 65 + 264404 + 79 + 74 + 98030 + 9819 + 480 + 496304 + 36204 + 65 + 20198034 + 15903 + 480 + 419745704 + 803 + 8190 + 655 + 98640 + 50134 + 1 + 91490 + 37404 + 14 + 480 + 80134 + 980 + 20149 + 513 + 86340 + 98640 + 5149 + 863404 + 9819 + 57349 + 8013 + 980 + 93622 + 5200 + 655 + 96 + 980 + 563049 + 980 + 863404 + 9819 + 120394 + 31740 + 980 + 491304 + 65 + 980 + 698034 + 14 + 980 + 93622 + 1441724 + 19 + 980 + 96912 + 48759 + 803 + 90098 + 9013 + 8665 + 655 + 96346 + 14 + 980 + 2149 + 86340 + 56350794 + 794 + 2750 + 980 + 57349 + 5198034 + 8013 + 65 + 980 + 8633634 + 98073 + 50134 + 9819 + 980 + 57304 + 563 + 98073 + 501494 + 133049 + 14 + 980 + 57349 + 5198034 + 30409920 + 980 + 2149 + 65 + 980 + 5730 + 863404 + 980 + 2149 + 93622 + 81314404 + 980 + 563049 + 80139 + 5300 + 19 + 2149 + 65 + 980 + 2149 + 93622 + 122 + 65503 + 98073 + 5730 + 8019 + 96 + 980 + 144749034 + 513 + 655 + 980 + 93622 + 51494 + 794 + 2750 + 4863903 + 14 + 49134 + 3740 + 980 + 863404 + 3049 + 4150 + 15903 + 122 + 48130 + 869 + 5748 + 14 + 98073 + 1557271904 + 917263 + 1 + 36654 + 563 + 98073 + 4150 == 5639304404';
begin
  TapAssertTrue(Self, 'puzzle with ten letters and 199 addends', expect, Alphametics.solve(puzzle));
end;

procedure AlphameticsTest.retirement_puzzle;
const
  puzzle : string = 'MARTIN + GARDNER = RETIRES';
  expect : string = '862903 + 1627342 = 2490245';
begin
  TapAssertTrue(Self, 'retirement puzzle', expect, Alphametics.solve(puzzle));
end;

initialization
RegisterTest(AlphameticsTest);

end.
