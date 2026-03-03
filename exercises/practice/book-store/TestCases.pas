unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  BookStoreTest = class(TTestCase)
  published
    procedure only_a_single_book;
    procedure two_of_the_same_book;
    procedure empty_basket;
    procedure two_different_books;
    procedure three_different_books;
    procedure four_different_books;
    procedure five_different_books;
    procedure two_groups_of_four_is_cheaper_than_group_of_five_plus_group_of_three;
    procedure two_groups_of_four_is_cheaper_than_groups_of_five_and_three;
    procedure group_of_four_plus_group_of_two_is_cheaper_than_two_groups_of_three;
    procedure two_each_of_first_four_books_and_one_copy_each_of_rest;
    procedure two_copies_of_each_book;
    procedure three_copies_of_first_book_and_two_each_of_remaining;
    procedure three_each_of_first_two_books_and_two_each_of_remaining_books;
    procedure four_groups_of_four_are_cheaper_than_two_groups_each_of_five_and_three;
    procedure check_that_groups_of_four_are_created_properly_even_when_there_are_more_groups_of_three_than_groups_of_five;
    procedure one_group_of_one_and_four_is_cheaper_than_one_group_of_two_and_three;
    procedure one_group_of_one_and_two_plus_three_groups_of_four_is_cheaper_than_one_group_of_each_size;
  end;

implementation

uses BookStore;

// 17146bd5-2e80-4557-ab4c-05632b6b0d01
procedure BookStoreTest.only_a_single_book;
var
  basket : Array Of Smallint;
begin
  basket := [1];
  TapAssertTrue(Self, 'Only a single book', 800, BookStore.total(basket));
end;

// cc2de9ac-ff2a-4efd-b7c7-bfe0f43271ce
procedure BookStoreTest.two_of_the_same_book;
var
  basket : Array Of Smallint;
begin
  basket := [2, 2];
  TapAssertTrue(Self, 'Two of the same book', 1600, BookStore.total(basket));
end;

// 5a86eac0-45d2-46aa-bbf0-266b94393a1a
procedure BookStoreTest.empty_basket;
var
  basket : Array Of Smallint;
begin
  basket := [];
  TapAssertTrue(Self, 'Empty basket', 0, BookStore.total(basket));
end;

// 158bd19a-3db4-4468-ae85-e0638a688990
procedure BookStoreTest.two_different_books;
var
  basket : Array Of Smallint;
begin
  basket := [1, 2];
  TapAssertTrue(Self, 'Two different books', 1520, BookStore.total(basket));
end;

// f3833f6b-9332-4a1f-ad98-6c3f8e30e163
procedure BookStoreTest.three_different_books;
var
  basket : Array Of Smallint;
begin
  basket := [1, 2, 3];
  TapAssertTrue(Self, 'Three different books', 2160, BookStore.total(basket));
end;

// 1951a1db-2fb6-4cd1-a69a-f691b6dd30a2
procedure BookStoreTest.four_different_books;
var
  basket : Array Of Smallint;
begin
  basket := [1, 2, 3, 4];
  TapAssertTrue(Self, 'Four different books', 2560, BookStore.total(basket));
end;

// d70f6682-3019-4c3f-aede-83c6a8c647a3
procedure BookStoreTest.five_different_books;
var
  basket : Array Of Smallint;
begin
  basket := [1, 2, 3, 4, 5];
  TapAssertTrue(Self, 'Five different books', 3000, BookStore.total(basket));
end;

// 78cacb57-911a-45f1-be52-2a5bd428c634
procedure BookStoreTest.two_groups_of_four_is_cheaper_than_group_of_five_plus_group_of_three;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 2, 3, 3, 4, 5];
  TapAssertTrue(Self, 'Two groups of four is cheaper than group of five plus group of three', 5120, BookStore.total(basket));
end;

// f808b5a4-e01f-4c0d-881f-f7b90d9739da
procedure BookStoreTest.two_groups_of_four_is_cheaper_than_groups_of_five_and_three;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 3, 4, 4, 5, 5];
  TapAssertTrue(Self, 'Two groups of four is cheaper than groups of five and three', 5120, BookStore.total(basket));
end;

// fe96401c-5268-4be2-9d9e-19b76478007c
procedure BookStoreTest.group_of_four_plus_group_of_two_is_cheaper_than_two_groups_of_three;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 2, 3, 4];
  TapAssertTrue(Self, 'Group of four plus group of two is cheaper than two groups of three', 4080, BookStore.total(basket));
end;

// 68ea9b78-10ad-420e-a766-836a501d3633
procedure BookStoreTest.two_each_of_first_four_books_and_one_copy_each_of_rest;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 2, 3, 3, 4, 4, 5];
  TapAssertTrue(Self, 'Two each of first four books and one copy each of rest', 5560, BookStore.total(basket));
end;

// c0a779d5-a40c-47ae-9828-a340e936b866
procedure BookStoreTest.two_copies_of_each_book;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 2, 3, 3, 4, 4, 5, 5];
  TapAssertTrue(Self, 'Two copies of each book', 6000, BookStore.total(basket));
end;

// 18fd86fe-08f1-4b68-969b-392b8af20513
procedure BookStoreTest.three_copies_of_first_book_and_two_each_of_remaining;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1];
  TapAssertTrue(Self, 'Three copies of first book and two each of remaining', 6800, BookStore.total(basket));
end;

// 0b19a24d-e4cf-4ec8-9db2-8899a41af0da
procedure BookStoreTest.three_each_of_first_two_books_and_two_each_of_remaining_books;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2];
  TapAssertTrue(Self, 'Three each of first two books and two each of remaining books', 7520, BookStore.total(basket));
end;

// bb376344-4fb2-49ab-ab85-e38d8354a58d
procedure BookStoreTest.four_groups_of_four_are_cheaper_than_two_groups_each_of_five_and_three;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5];
  TapAssertTrue(Self, 'Four groups of four are cheaper than two groups each of five and three', 10240, BookStore.total(basket));
end;

// 5260ddde-2703-4915-b45a-e54dbbac4303
procedure BookStoreTest.check_that_groups_of_four_are_created_properly_even_when_there_are_more_groups_of_three_than_groups_of_five;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5];
  TapAssertTrue(Self, 'Check that groups of four are created properly even when there are more groups of three than groups of five', 14560, BookStore.total(basket));
end;

// b0478278-c551-4747-b0fc-7e0be3158b1f
procedure BookStoreTest.one_group_of_one_and_four_is_cheaper_than_one_group_of_two_and_three;
var
  basket : Array Of Smallint;
begin
  basket := [1, 1, 2, 3, 4];
  TapAssertTrue(Self, 'One group of one and four is cheaper than one group of two and three', 3360, BookStore.total(basket));
end;

// cf868453-6484-4ae1-9dfc-f8ee85bbde01
procedure BookStoreTest.one_group_of_one_and_two_plus_three_groups_of_four_is_cheaper_than_one_group_of_each_size;
var
  basket : Array Of Smallint;
begin
  basket := [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5];
  TapAssertTrue(Self, 'One group of one and two plus three groups of four is cheaper than one group of each size', 10000, BookStore.total(basket));
end;

initialization
RegisterTest(BookStoreTest);

end.
