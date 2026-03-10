unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  YachtTest = class(TTestCase)
  published
    procedure yacht;
    procedure not_yacht;
    procedure ones;
    procedure ones_out_of_order;
    procedure no_ones;
    procedure twos;
    procedure fours;
    procedure yacht_counted_as_threes;
    procedure yacht_of_3s_counted_as_fives;
    procedure fives;
    procedure sixes;
    procedure full_house_two_small_three_big;
    procedure full_house_three_small_two_big;
    procedure two_pair_is_not_a_full_house;
    procedure four_of_a_kind_is_not_a_full_house;
    procedure yacht_is_not_a_full_house;
    procedure four_of_a_kind;
    procedure yacht_can_be_scored_as_four_of_a_kind;
    procedure full_house_is_not_four_of_a_kind;
    procedure little_straight;
    procedure little_straight_as_big_straight;
    procedure four_in_order_but_not_a_little_straight;
    procedure no_pairs_but_not_a_little_straight;
    procedure minimum_is_1_maximum_is_5_but_not_a_little_straight;
    procedure big_straight;
    procedure big_straight_as_little_straight;
    procedure no_pairs_but_not_a_big_straight;
    procedure choice;
    procedure yacht_as_choice;
  end;

implementation

uses Yacht;

// 3060e4a5-4063-4deb-a380-a630b43a84b6
procedure YachtTest.yacht;
var
  actual : integer;
begin
  actual := score(kYacht, [5, 5, 5, 5, 5]);
  TapAssertTrue(Self, 'Yacht', 50, actual);
end;

// 15026df2-f567-482f-b4d5-5297d57769d9
procedure YachtTest.not_yacht;
var
  actual : integer;
begin
  actual := score(kYacht, [1, 3, 3, 2, 5]);
  TapAssertTrue(Self, 'Not Yacht', 0, actual);
end;

// 36b6af0c-ca06-4666-97de-5d31213957a4
procedure YachtTest.ones;
var
  actual : integer;
begin
  actual := score(kOnes, [1, 1, 1, 3, 5]);
  TapAssertTrue(Self, 'Ones', 3, actual);
end;

// 023a07c8-6c6e-44d0-bc17-efc5e1b8205a
procedure YachtTest.ones_out_of_order;
var
  actual : integer;
begin
  actual := score(kOnes, [3, 1, 1, 5, 1]);
  TapAssertTrue(Self, 'Ones, out of order', 3, actual);
end;

// 7189afac-cccd-4a74-8182-1cb1f374e496
procedure YachtTest.no_ones;
var
  actual : integer;
begin
  actual := score(kOnes, [4, 3, 6, 5, 5]);
  TapAssertTrue(Self, 'No ones', 0, actual);
end;

// 793c4292-dd14-49c4-9707-6d9c56cee725
procedure YachtTest.twos;
var
  actual : integer;
begin
  actual := score(kTwos, [2, 3, 4, 5, 6]);
  TapAssertTrue(Self, 'Twos', 2, actual);
end;

// dc41bceb-d0c5-4634-a734-c01b4233a0c6
procedure YachtTest.fours;
var
  actual : integer;
begin
  actual := score(kFours, [1, 4, 1, 4, 1]);
  TapAssertTrue(Self, 'Fours', 8, actual);
end;

// f6125417-5c8a-4bca-bc5b-b4b76d0d28c8
procedure YachtTest.yacht_counted_as_threes;
var
  actual : integer;
begin
  actual := score(kThrees, [3, 3, 3, 3, 3]);
  TapAssertTrue(Self, 'Yacht counted as threes', 15, actual);
end;

// 464fc809-96ed-46e4-acb8-d44e302e9726
procedure YachtTest.yacht_of_3s_counted_as_fives;
var
  actual : integer;
begin
  actual := score(kFives, [3, 3, 3, 3, 3]);
  TapAssertTrue(Self, 'Yacht of 3s counted as fives', 0, actual);
end;

// d054227f-3a71-4565-a684-5c7e621ec1e9
procedure YachtTest.fives;
var
  actual : integer;
begin
  actual := score(kFives, [1, 5, 3, 5, 3]);
  TapAssertTrue(Self, 'Fives', 10, actual);
end;

// e8a036e0-9d21-443a-8b5f-e15a9e19a761
procedure YachtTest.sixes;
var
  actual : integer;
begin
  actual := score(kSixes, [2, 3, 4, 5, 6]);
  TapAssertTrue(Self, 'Sixes', 6, actual);
end;

// 51cb26db-6b24-49af-a9ff-12f53b252eea
procedure YachtTest.full_house_two_small_three_big;
var
  actual : integer;
begin
  actual := score(kFullHouse, [2, 2, 4, 4, 4]);
  TapAssertTrue(Self, 'Full house two small, three big', 16, actual);
end;

// 1822ca9d-f235-4447-b430-2e8cfc448f0c
procedure YachtTest.full_house_three_small_two_big;
var
  actual : integer;
begin
  actual := score(kFullHouse, [5, 3, 3, 5, 3]);
  TapAssertTrue(Self, 'Full house three small, two big', 19, actual);
end;

// b208a3fc-db2e-4363-a936-9e9a71e69c07
procedure YachtTest.two_pair_is_not_a_full_house;
var
  actual : integer;
begin
  actual := score(kFullHouse, [2, 2, 4, 4, 5]);
  TapAssertTrue(Self, 'Two pair is not a full house', 0, actual);
end;

// b90209c3-5956-445b-8a0b-0ac8b906b1c2
procedure YachtTest.four_of_a_kind_is_not_a_full_house;
var
  actual : integer;
begin
  actual := score(kFullHouse, [1, 4, 4, 4, 4]);
  TapAssertTrue(Self, 'Four of a kind is not a full house', 0, actual);
end;

// 32a3f4ee-9142-4edf-ba70-6c0f96eb4b0c
procedure YachtTest.yacht_is_not_a_full_house;
var
  actual : integer;
begin
  actual := score(kFullHouse, [2, 2, 2, 2, 2]);
  TapAssertTrue(Self, 'Yacht is not a full house', 0, actual);
end;

// b286084d-0568-4460-844a-ba79d71d79c6
procedure YachtTest.four_of_a_kind;
var
  actual : integer;
begin
  actual := score(kFourOfAKind, [6, 6, 4, 6, 6]);
  TapAssertTrue(Self, 'Four of a Kind', 24, actual);
end;

// f25c0c90-5397-4732-9779-b1e9b5f612ca
procedure YachtTest.yacht_can_be_scored_as_four_of_a_kind;
var
  actual : integer;
begin
  actual := score(kFourOfAKind, [3, 3, 3, 3, 3]);
  TapAssertTrue(Self, 'Yacht can be scored as Four of a Kind', 12, actual);
end;

// 9f8ef4f0-72bb-401a-a871-cbad39c9cb08
procedure YachtTest.full_house_is_not_four_of_a_kind;
var
  actual : integer;
begin
  actual := score(kFourOfAKind, [3, 3, 3, 5, 5]);
  TapAssertTrue(Self, 'Full house is not Four of a Kind', 0, actual);
end;

// b4743c82-1eb8-4a65-98f7-33ad126905cd
procedure YachtTest.little_straight;
var
  actual : integer;
begin
  actual := score(kLittleStraight, [3, 5, 4, 1, 2]);
  TapAssertTrue(Self, 'Little Straight', 30, actual);
end;

// 7ac08422-41bf-459c-8187-a38a12d080bc
procedure YachtTest.little_straight_as_big_straight;
var
  actual : integer;
begin
  actual := score(kBigStraight, [1, 2, 3, 4, 5]);
  TapAssertTrue(Self, 'Little Straight as Big Straight', 0, actual);
end;

// 97bde8f7-9058-43ea-9de7-0bc3ed6d3002
procedure YachtTest.four_in_order_but_not_a_little_straight;
var
  actual : integer;
begin
  actual := score(kLittleStraight, [1, 1, 2, 3, 4]);
  TapAssertTrue(Self, 'Four in order but not a little straight', 0, actual);
end;

// cef35ff9-9c5e-4fd2-ae95-6e4af5e95a99
procedure YachtTest.no_pairs_but_not_a_little_straight;
var
  actual : integer;
begin
  actual := score(kLittleStraight, [1, 2, 3, 4, 6]);
  TapAssertTrue(Self, 'No pairs but not a little straight', 0, actual);
end;

// fd785ad2-c060-4e45-81c6-ea2bbb781b9d
procedure YachtTest.minimum_is_1_maximum_is_5_but_not_a_little_straight;
var
  actual : integer;
begin
  actual := score(kLittleStraight, [1, 1, 3, 4, 5]);
  TapAssertTrue(Self, 'Minimum is 1, maximum is 5, but not a little straight', 0, actual);
end;

// 35bd74a6-5cf6-431a-97a3-4f713663f467
procedure YachtTest.big_straight;
var
  actual : integer;
begin
  actual := score(kBigStraight, [4, 6, 2, 5, 3]);
  TapAssertTrue(Self, 'Big Straight', 30, actual);
end;

// 87c67e1e-3e87-4f3a-a9b1-62927822b250
procedure YachtTest.big_straight_as_little_straight;
var
  actual : integer;
begin
  actual := score(kLittleStraight, [6, 5, 4, 3, 2]);
  TapAssertTrue(Self, 'Big Straight as little straight', 0, actual);
end;

// c1fa0a3a-40ba-4153-a42d-32bc34d2521e
procedure YachtTest.no_pairs_but_not_a_big_straight;
var
  actual : integer;
begin
  actual := score(kBigStraight, [6, 5, 4, 3, 1]);
  TapAssertTrue(Self, 'No pairs but not a big straight', 0, actual);
end;

// 207e7300-5d10-43e5-afdd-213e3ac8827d
procedure YachtTest.choice;
var
  actual : integer;
begin
  actual := score(kChoice, [3, 3, 5, 6, 6]);
  TapAssertTrue(Self, 'Choice', 23, actual);
end;

// b524c0cf-32d2-4b40-8fb3-be3500f3f135
procedure YachtTest.yacht_as_choice;
var
  actual : integer;
begin
  actual := score(kChoice, [2, 2, 2, 2, 2]);
  TapAssertTrue(Self, 'Yacht as choice', 10, actual);
end;

initialization
RegisterTest(YachtTest);

end.
