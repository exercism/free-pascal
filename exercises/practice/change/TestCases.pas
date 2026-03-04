unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ChangeTest = class(TTestCase)
  published
    procedure change_for_1_cent;
    procedure single_coin_change;
    procedure multiple_coin_change;
    procedure change_with_lilliputian_coins;
    procedure change_with_lower_elbonia_coins;
    procedure large_target_values;
    procedure possible_change_without_unit_coins_available;
    procedure another_possible_change_without_unit_coins_available;
    procedure a_greedy_approach_is_not_optimal;
    procedure no_coins_make_0_change;
    procedure error_testing_for_change_smaller_than_the_smallest_of_coins;
    procedure error_if_no_combination_can_add_up_to_target;
    procedure cannot_find_negative_change_values;
  end;

implementation

uses Change;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const Expected : string    ;
  const coins    : TIntArray ;
  const target   : Integer
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    findFewestCoins(coins, target);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// d0ebd0e1-9d27-4609-a654-df5c0ba1d83a
procedure ChangeTest.change_for_1_cent;
begin
  TapAssertTrue(Self, 'change for 1 cent', [1], Change.findFewestCoins([1,5,10,25], 1));
end;

// 36887bea-7f92-4a9c-b0cc-c0e886b3ecc8
procedure ChangeTest.single_coin_change;
begin
  TapAssertTrue(Self, 'single coin change', [25], Change.findFewestCoins([1,5,10,25,100], 25));
end;

// cef21ccc-0811-4e6e-af44-f011e7eab6c6
procedure ChangeTest.multiple_coin_change;
begin
  TapAssertTrue(Self, 'multiple coin change', [5,10], Change.findFewestCoins([1,5,10,25,100], 15));
end;

// d60952bc-0c1a-4571-bf0c-41be72690cb3
procedure ChangeTest.change_with_lilliputian_coins;
begin
  TapAssertTrue(Self, 'change with Lilliputian Coins', [4,4,15], Change.findFewestCoins([1,4,15,20,50], 23));
end;

// 408390b9-fafa-4bb9-b608-ffe6036edb6c
procedure ChangeTest.change_with_lower_elbonia_coins;
begin
  TapAssertTrue(Self, 'change with Lower Elbonia Coins', [21,21,21], Change.findFewestCoins([1,5,10,21,25], 63));
end;

// 7421a4cb-1c48-4bf9-99c7-7f049689132f
procedure ChangeTest.large_target_values;
begin
  TapAssertTrue(Self, 'large target values', [2,2,5,20,20,50,100,100,100,100,100,100,100,100,100], Change.findFewestCoins([1,2,5,10,20,50,100], 999));
end;

// f79d2e9b-0ae3-4d6a-bb58-dc978b0dba28
procedure ChangeTest.possible_change_without_unit_coins_available;
begin
  TapAssertTrue(Self, 'possible change without unit coins available', [2,2,2,5,10], Change.findFewestCoins([2,5,10,20,50], 21));
end;

// 9a166411-d35d-4f7f-a007-6724ac266178
procedure ChangeTest.another_possible_change_without_unit_coins_available;
begin
  TapAssertTrue(Self, 'another possible change without unit coins available', [4,4,4,5,5,5], Change.findFewestCoins([4,5], 27));
end;

// ce0f80d5-51c3-469d-818c-3e69dbd25f75
procedure ChangeTest.a_greedy_approach_is_not_optimal;
begin
  TapAssertTrue(Self, 'a greedy approach is not optimal', [10,10], Change.findFewestCoins([1,10,11], 20));
end;

// bbbcc154-e9e9-4209-a4db-dd6d81ec26bb
procedure ChangeTest.no_coins_make_0_change;
begin
  TapAssertTrue(Self, 'no coins make 0 change', [], Change.findFewestCoins([1,5,10,21,25], 0));
end;

// c8b81d5a-49bd-4b61-af73-8ee5383a2ce1
procedure ChangeTest.error_testing_for_change_smaller_than_the_smallest_of_coins;
begin
  TapAssertExpectionMessage(Self, 'error testing for change smaller than the smallest of coins', 'cannot make target with given coins', [5,10], 3);
end;

// 3c43e3e4-63f9-46ac-9476-a67516e98f68
procedure ChangeTest.error_if_no_combination_can_add_up_to_target;
begin
  TapAssertExpectionMessage(Self, 'error if no combination can add up to target', 'cannot make target with given coins', [5,10], 94);
end;

// 8fe1f076-9b2d-4f44-89fe-8a6ccd63c8f3
procedure ChangeTest.cannot_find_negative_change_values;
begin
  TapAssertExpectionMessage(Self, 'cannot find negative change values', 'target cannot be negative', [1,2,5], -5);
end;

initialization
RegisterTest(ChangeTest);

end.
