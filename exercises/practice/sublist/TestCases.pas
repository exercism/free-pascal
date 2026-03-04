unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SublistTest = class(TTestCase)
  published
    procedure empty_lists;
    procedure empty_list_within_non_empty_list;
    procedure non_empty_list_contains_empty_list;
    procedure list_equals_itself;
    procedure different_lists;
    procedure false_start;
    procedure consecutive;
    procedure sublist_at_start;
    procedure sublist_in_middle;
    procedure sublist_at_end;
    procedure at_start_of_superlist;
    procedure in_middle_of_superlist;
    procedure at_end_of_superlist;
    procedure first_list_missing_element_from_second_list;
    procedure second_list_missing_element_from_first_list;
    procedure first_list_missing_additional_digits_from_second_list;
    procedure order_matters_to_a_list;
    procedure same_digits_but_different_numbers;
  end;

implementation

uses Sublist;

// 97319c93-ebc5-47ab-a022-02a1980e1d29
procedure SublistTest.empty_lists;
const
  listOne : TCurrencyArray = ();
  listTwo : TCurrencyArray = ();
begin
  TapAssertTrue(Self, 'empty lists', true, Sublist.compare(listOne, listTwo) = kEqual);
end;

// de27dbd4-df52-46fe-a336-30be58457382
procedure SublistTest.empty_list_within_non_empty_list;
const
  listOne : TCurrencyArray = ();
  listTwo : TCurrencyArray = (1, 2, 3);
begin
  TapAssertTrue(Self, 'empty list within non empty list', true, Sublist.compare(listOne, listTwo) = kSublist);
end;

// 5487cfd1-bc7d-429f-ac6f-1177b857d4fb
procedure SublistTest.non_empty_list_contains_empty_list;
const
  listOne : TCurrencyArray = (1, 2, 3);
  listTwo : TCurrencyArray = ();
begin
  TapAssertTrue(Self, 'non empty list contains empty list', true, Sublist.compare(listOne, listTwo) = kSuperlist);
end;

// 1f390b47-f6b2-4a93-bc23-858ba5dda9a6
procedure SublistTest.list_equals_itself;
const
  listOne : TCurrencyArray = (1, 2, 3);
  listTwo : TCurrencyArray = (1, 2, 3);
begin
  TapAssertTrue(Self, 'list equals itself', true, Sublist.compare(listOne, listTwo) = kEqual);
end;

// 7ed2bfb2-922b-4363-ae75-f3a05e8274f5
procedure SublistTest.different_lists;
const
  listOne : TCurrencyArray = (1, 2, 3);
  listTwo : TCurrencyArray = (2, 3, 4);
begin
  TapAssertTrue(Self, 'different lists', true, Sublist.compare(listOne, listTwo) = kUnequal);
end;

// 3b8a2568-6144-4f06-b0a1-9d266b365341
procedure SublistTest.false_start;
const
  listOne : TCurrencyArray = (1, 2, 5);
  listTwo : TCurrencyArray = (0, 1, 2, 3, 1, 2, 5, 6);
begin
  TapAssertTrue(Self, 'false start', true, Sublist.compare(listOne, listTwo) = kSublist);
end;

// dc39ed58-6311-4814-be30-05a64bc8d9b1
procedure SublistTest.consecutive;
const
  listOne : TCurrencyArray = (1, 1, 2);
  listTwo : TCurrencyArray = (0, 1, 1, 1, 2, 1, 2);
begin
  TapAssertTrue(Self, 'consecutive', true, Sublist.compare(listOne, listTwo) = kSublist);
end;

// d1270dab-a1ce-41aa-b29d-b3257241ac26
procedure SublistTest.sublist_at_start;
const
  listOne : TCurrencyArray = (0, 1, 2);
  listTwo : TCurrencyArray = (0, 1, 2, 3, 4, 5);
begin
  TapAssertTrue(Self, 'sublist at start', true, Sublist.compare(listOne, listTwo) = kSublist);
end;

// 81f3d3f7-4f25-4ada-bcdc-897c403de1b6
procedure SublistTest.sublist_in_middle;
const
  listOne : TCurrencyArray = (2, 3, 4);
  listTwo : TCurrencyArray = (0, 1, 2, 3, 4, 5);
begin
  TapAssertTrue(Self, 'sublist in middle', true, Sublist.compare(listOne, listTwo) = kSublist);
end;

// 43bcae1e-a9cf-470e-923e-0946e04d8fdd
procedure SublistTest.sublist_at_end;
const
  listOne : TCurrencyArray = (3, 4, 5);
  listTwo : TCurrencyArray = (0, 1, 2, 3, 4, 5);
begin
  TapAssertTrue(Self, 'sublist at end', true, Sublist.compare(listOne, listTwo) = kSublist);
end;

// 76cf99ed-0ff0-4b00-94af-4dfb43fe5caa
procedure SublistTest.at_start_of_superlist;
const
  listOne : TCurrencyArray = (0, 1, 2, 3, 4, 5);
  listTwo : TCurrencyArray = (0, 1, 2);
begin
  TapAssertTrue(Self, 'at start of superlist', true, Sublist.compare(listOne, listTwo) = kSuperlist);
end;

// b83989ec-8bdf-4655-95aa-9f38f3e357fd
procedure SublistTest.in_middle_of_superlist;
const
  listOne : TCurrencyArray = (0, 1, 2, 3, 4, 5);
  listTwo : TCurrencyArray = (2, 3);
begin
  TapAssertTrue(Self, 'in middle of superlist', true, Sublist.compare(listOne, listTwo) = kSuperlist);
end;

// 26f9f7c3-6cf6-4610-984a-662f71f8689b
procedure SublistTest.at_end_of_superlist;
const
  listOne : TCurrencyArray = (0, 1, 2, 3, 4, 5);
  listTwo : TCurrencyArray = (3, 4, 5);
begin
  TapAssertTrue(Self, 'at end of superlist', true, Sublist.compare(listOne, listTwo) = kSuperlist);
end;

// 0a6db763-3588-416a-8f47-76b1cedde31e
procedure SublistTest.first_list_missing_element_from_second_list;
const
  listOne : TCurrencyArray = (1, 3);
  listTwo : TCurrencyArray = (1, 2, 3);
begin
  TapAssertTrue(Self, 'first list missing element from second list', true, Sublist.compare(listOne, listTwo) = kUnequal);
end;

// 83ffe6d8-a445-4a3c-8795-1e51a95e65c3
procedure SublistTest.second_list_missing_element_from_first_list;
const
  listOne : TCurrencyArray = (1, 2, 3);
  listTwo : TCurrencyArray = (1, 3);
begin
  TapAssertTrue(Self, 'second list missing element from first list', true, Sublist.compare(listOne, listTwo) = kUnequal);
end;

// 7bc76cb8-5003-49ca-bc47-cdfbe6c2bb89
procedure SublistTest.first_list_missing_additional_digits_from_second_list;
const
  listOne : TCurrencyArray = (1, 2);
  listTwo : TCurrencyArray = (1, 22);
begin
  TapAssertTrue(Self, 'first list missing additional digits from second list', true, Sublist.compare(listOne, listTwo) = kUnequal);
end;

// 0d7ee7c1-0347-45c8-9ef5-b88db152b30b
procedure SublistTest.order_matters_to_a_list;
const
  listOne : TCurrencyArray = (1, 2, 3);
  listTwo : TCurrencyArray = (3, 2, 1);
begin
  TapAssertTrue(Self, 'order matters to a list', true, Sublist.compare(listOne, listTwo) = kUnequal);
end;

// 5f47ce86-944e-40f9-9f31-6368aad70aa6
procedure SublistTest.same_digits_but_different_numbers;
const
  listOne : TCurrencyArray = (1, 0, 1);
  listTwo : TCurrencyArray = (10, 1);
begin
  TapAssertTrue(Self, 'same digits but different numbers', true, Sublist.compare(listOne, listTwo) = kUnequal);
end;

initialization
RegisterTest(SublistTest);

end.
