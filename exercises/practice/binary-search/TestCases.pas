unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  BinarySearchTest = class(TTestCase)
  published
    procedure finds_a_value_in_an_array_with_one_element;
    procedure finds_a_value_in_the_middle_of_an_array;
    procedure finds_a_value_at_the_beginning_of_an_array;
    procedure finds_a_value_at_the_end_of_an_array;
    procedure finds_a_value_in_an_array_of_odd_length;
    procedure finds_a_value_in_an_array_of_even_length;
    procedure identifies_that_a_value_is_not_included_in_the_array;
    procedure a_value_smaller_than_the_array_s_smallest_value_is_not_found;
    procedure a_value_larger_than_the_array_s_largest_value_is_not_found;
    procedure nothing_is_found_in_an_empty_array;
    procedure nothing_is_found_when_the_left_and_right_bounds_cross;
  end;

implementation

uses BinarySearch;

type TIntArray = Array Of Integer;
procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const Expected : string    ;
  const AArray   : TIntArray ;
  const AValue   : integer
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    BinarySearch.find(AArray, AValue);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// b55c24a9-a98d-4379-a08c-2adcf8ebeee8
procedure BinarySearchTest.finds_a_value_in_an_array_with_one_element;
begin
  TapAssertTrue(Self, 'finds a value in an array with one element', 0, BinarySearch.find([6], 6));
end;

// 73469346-b0a0-4011-89bf-989e443d503d
procedure BinarySearchTest.finds_a_value_in_the_middle_of_an_array;
begin
  TapAssertTrue(Self, 'finds a value in the middle of an array', 3, BinarySearch.find([1,3,4,6,8,9,11], 6));
end;

// 327bc482-ab85-424e-a724-fb4658e66ddb
procedure BinarySearchTest.finds_a_value_at_the_beginning_of_an_array;
begin
  TapAssertTrue(Self, 'finds a value at the beginning of an array', 0, BinarySearch.find([1,3,4,6,8,9,11], 1));
end;

// f9f94b16-fe5e-472c-85ea-c513804c7d59
procedure BinarySearchTest.finds_a_value_at_the_end_of_an_array;
begin
  TapAssertTrue(Self, 'finds a value at the end of an array', 6, BinarySearch.find([1,3,4,6,8,9,11], 11));
end;

// f0068905-26e3-4342-856d-ad153cadb338
procedure BinarySearchTest.finds_a_value_in_an_array_of_odd_length;
begin
  TapAssertTrue(Self, 'finds a value in an array of odd length', 9, BinarySearch.find([1,3,5,8,13,21,34,55,89,144,233,377,634], 144));
end;

// fc316b12-c8b3-4f5e-9e89-532b3389de8c
procedure BinarySearchTest.finds_a_value_in_an_array_of_even_length;
begin
  TapAssertTrue(Self, 'finds a value in an array of even length', 5, BinarySearch.find([1,3,5,8,13,21,34,55,89,144,233,377], 21));
end;

// da7db20a-354f-49f7-a6a1-650a54998aa6
procedure BinarySearchTest.identifies_that_a_value_is_not_included_in_the_array;
begin
  TapAssertExpectionMessage(Self, 'identifies that a value is not included in the array', 'value not in array', [1,3,4,6,8,9,11], 7);
end;

// 95d869ff-3daf-4c79-b622-6e805c675f97
procedure BinarySearchTest.a_value_smaller_than_the_array_s_smallest_value_is_not_found;
begin
  TapAssertExpectionMessage(Self, 'a value smaller than the array''s smallest value is not found', 'value not in array', [1,3,4,6,8,9,11], 0);
end;

// 8b24ef45-6e51-4a94-9eac-c2bf38fdb0ba
procedure BinarySearchTest.a_value_larger_than_the_array_s_largest_value_is_not_found;
begin
  TapAssertExpectionMessage(Self, 'a value larger than the array''s largest value is not found', 'value not in array', [1,3,4,6,8,9,11], 13);
end;

// f439a0fa-cf42-4262-8ad1-64bf41ce566a
procedure BinarySearchTest.nothing_is_found_in_an_empty_array;
begin
  TapAssertExpectionMessage(Self, 'nothing is found in an empty array', 'value not in array', [], 1);
end;

// 2c353967-b56d-40b8-acff-ce43115eed64
procedure BinarySearchTest.nothing_is_found_when_the_left_and_right_bounds_cross;
begin
  TapAssertExpectionMessage(Self, 'nothing is found when the left and right bounds cross', 'value not in array', [1,2], 0);
end;

initialization
RegisterTest(BinarySearchTest);

end.
