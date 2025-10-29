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

// b55c24a9-a98d-4379-a08c-2adcf8ebeee8
procedure BinarySearchTest.finds_a_value_in_an_array_with_one_element;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := BinarySearch.find([6], 6);
  message := EncodeJsonMessage('finds a value in an array with one element', expected, actual);
  AssertTrue(message, expected = actual);
    AssertTrue(message, expected = actual);
end;

// 73469346-b0a0-4011-89bf-989e443d503d
procedure BinarySearchTest.finds_a_value_in_the_middle_of_an_array;
const expected = 3;
var
  actual  : integer;
  message : string;
begin
  actual  := BinarySearch.find([1,3,4,6,8,9,11], 6);
  message := EncodeJsonMessage('finds a value in the middle of an array', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 327bc482-ab85-424e-a724-fb4658e66ddb
procedure BinarySearchTest.finds_a_value_at_the_beginning_of_an_array;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := BinarySearch.find([1,3,4,6,8,9,11], 1);
  message := EncodeJsonMessage('finds a value at the beginning of an array', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f9f94b16-fe5e-472c-85ea-c513804c7d59
procedure BinarySearchTest.finds_a_value_at_the_end_of_an_array;
const expected = 6;
var
  actual  : integer;
  message : string;
begin
  actual  := BinarySearch.find([1,3,4,6,8,9,11], 11);
  message := EncodeJsonMessage('finds a value at the end of an array', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f0068905-26e3-4342-856d-ad153cadb338
procedure BinarySearchTest.finds_a_value_in_an_array_of_odd_length;
const expected = 9;
var
  actual  : integer;
  message : string;
begin
  actual  := BinarySearch.find([1,3,5,8,13,21,34,55,89,144,233,377,634], 144);
  message := EncodeJsonMessage('finds a value in an array of odd length', expected, actual);
  AssertTrue(message, expected = actual);
end;

// fc316b12-c8b3-4f5e-9e89-532b3389de8c
procedure BinarySearchTest.finds_a_value_in_an_array_of_even_length;
const expected = 5;
var
  actual  : integer;
  message : string;
begin
  actual  := BinarySearch.find([1,3,5,8,13,21,34,55,89,144,233,377], 21);
  message := EncodeJsonMessage('finds a value in an array of even length', expected, actual);
  AssertTrue(message, expected = actual);
end;

// da7db20a-354f-49f7-a6a1-650a54998aa6
procedure BinarySearchTest.identifies_that_a_value_is_not_included_in_the_array;
const expected = 'value not in array';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    BinarySearch.find([1,3,4,6,8,9,11], 7)
    except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('identifies that a value is not included in the array', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 95d869ff-3daf-4c79-b622-6e805c675f97
procedure BinarySearchTest.a_value_smaller_than_the_array_s_smallest_value_is_not_found;
const expected = 'value not in array';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    BinarySearch.find([1,3,4,6,8,9,11], 0);
    except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('a value smaller than the array''s smallest value is not found', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8b24ef45-6e51-4a94-9eac-c2bf38fdb0ba
procedure BinarySearchTest.a_value_larger_than_the_array_s_largest_value_is_not_found;
const expected = 'value not in array';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    BinarySearch.find([1,3,4,6,8,9,11], 13)
    except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('a value larger than the array''s largest value is not found', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f439a0fa-cf42-4262-8ad1-64bf41ce566a
procedure BinarySearchTest.nothing_is_found_in_an_empty_array;
const expected = 'value not in array';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    BinarySearch.find([], 1)
    except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('nothing is found in an empty array', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2c353967-b56d-40b8-acff-ce43115eed64
procedure BinarySearchTest.nothing_is_found_when_the_left_and_right_bounds_cross;
const expected = 'value not in array';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    BinarySearch.find([1,2], 0)
    except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('nothing is found when the left and right bounds cross', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(BinarySearchTest);

end.
