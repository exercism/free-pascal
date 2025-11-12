unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  AllergiesTest = class(TTestCase)
  published
    procedure eggs_not_allergic_to_anything;
    procedure allergic_only_to_eggs;
    procedure allergic_to_eggs_and_something_else;
    procedure allergic_to_something_but_not_eggs;
    procedure eggs_allergic_to_everything;
    procedure peanuts_not_allergic_to_anything;
    procedure allergic_only_to_peanuts;
    procedure allergic_to_peanuts_and_something_else;
    procedure allergic_to_something_but_not_peanuts;
    procedure peanuts_allergic_to_everything;
    procedure shellfish_not_allergic_to_anything;
    procedure allergic_only_to_shellfish;
    procedure allergic_to_shellfish_and_something_else;
    procedure allergic_to_something_but_not_shellfish;
    procedure shellfish_allergic_to_everything;
    procedure strawberries_not_allergic_to_anything;
    procedure allergic_only_to_strawberries;
    procedure allergic_to_strawberries_and_something_else;
    procedure allergic_to_something_but_not_strawberries;
    procedure strawberries_allergic_to_everything;
    procedure tomatoes_not_allergic_to_anything;
    procedure allergic_only_to_tomatoes;
    procedure allergic_to_tomatoes_and_something_else;
    procedure allergic_to_something_but_not_tomatoes;
    procedure tomatoes_allergic_to_everything;
    procedure chocolate_not_allergic_to_anything;
    procedure allergic_only_to_chocolate;
    procedure allergic_to_chocolate_and_something_else;
    procedure allergic_to_something_but_not_chocolate;
    procedure chocolate_allergic_to_everything;
    procedure pollen_not_allergic_to_anything;
    procedure allergic_only_to_pollen;
    procedure allergic_to_pollen_and_something_else;
    procedure allergic_to_something_but_not_pollen;
    procedure pollen_allergic_to_everything;
    procedure cats_not_allergic_to_anything;
    procedure allergic_only_to_cats;
    procedure allergic_to_cats_and_something_else;
    procedure allergic_to_something_but_not_cats;
    procedure cats_allergic_to_everything;
    procedure no_allergies;
    procedure just_eggs;
    procedure just_peanuts;
    procedure just_strawberries;
    procedure eggs_and_peanuts;
    procedure more_than_eggs_but_not_peanuts;
    procedure lots_of_stuff;
    procedure everything;
    procedure no_allergen_score_parts;
    procedure no_allergen_score_parts_without_highest_valid_score;
  end;

implementation

uses Allergies;

// 17fc7296-2440-4ac4-ad7b-d07c321bc5a0
procedure AllergiesTest.eggs_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for eggs allergy - not allergic to anything', false, Allergies.AllergicTo('eggs', 0));
end;

// 07ced27b-1da5-4c2e-8ae2-cb2791437546
procedure AllergiesTest.allergic_only_to_eggs;
begin
  TapAssertTrue(Self, 'testing for eggs allergy - allergic only to eggs', true, Allergies.AllergicTo('eggs', 1));
end;

// 5035b954-b6fa-4b9b-a487-dae69d8c5f96
procedure AllergiesTest.allergic_to_eggs_and_something_else;
begin
  TapAssertTrue(Self, 'testing for eggs allergy - allergic to eggs and something else', true, Allergies.AllergicTo('eggs', 3));
end;

// 64a6a83a-5723-4b5b-a896-663307403310
procedure AllergiesTest.allergic_to_something_but_not_eggs;
begin
  TapAssertTrue(Self, 'testing for eggs allergy - allergic to something, but not eggs', false, Allergies.AllergicTo('eggs', 2));
end;

// 90c8f484-456b-41c4-82ba-2d08d93231c6
procedure AllergiesTest.eggs_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for eggs allergy - allergic to everything', true, Allergies.AllergicTo('eggs', 255));
end;

// d266a59a-fccc-413b-ac53-d57cb1f0db9d
procedure AllergiesTest.peanuts_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for peanuts allergy - not allergic to anything', false, Allergies.AllergicTo('peanuts', 0));
end;

// ea210a98-860d-46b2-a5bf-50d8995b3f2a
procedure AllergiesTest.allergic_only_to_peanuts;
begin
  TapAssertTrue(Self, 'testing for peanuts allergy - allergic only to peanuts', true, Allergies.AllergicTo('peanuts', 2));
end;

// eac69ae9-8d14-4291-ac4b-7fd2c73d3a5b
procedure AllergiesTest.allergic_to_peanuts_and_something_else;
begin
  TapAssertTrue(Self, 'testing for peanuts allergy - allergic to peanuts and something else', true, Allergies.AllergicTo('peanuts', 7));
end;

// 9152058c-ce39-4b16-9b1d-283ec6d25085
procedure AllergiesTest.allergic_to_something_but_not_peanuts;
begin
  TapAssertTrue(Self, 'testing for peanuts allergy - allergic to something, but not peanuts', false, Allergies.AllergicTo('peanuts', 5));
end;

// d2d71fd8-63d5-40f9-a627-fbdaf88caeab
procedure AllergiesTest.peanuts_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for peanuts allergy - allergic to everything', true, Allergies.AllergicTo('peanuts', 255));
end;

// b948b0a1-cbf7-4b28-a244-73ff56687c80
procedure AllergiesTest.shellfish_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for shellfish allergy - not allergic to anything', false, Allergies.AllergicTo('shellfish', 0));
end;

// 9ce9a6f3-53e9-4923-85e0-73019047c567
procedure AllergiesTest.allergic_only_to_shellfish;
begin
  TapAssertTrue(Self, 'testing for shellfish allergy - allergic only to shellfish', true, Allergies.AllergicTo('shellfish', 4));
end;

// b272fca5-57ba-4b00-bd0c-43a737ab2131
procedure AllergiesTest.allergic_to_shellfish_and_something_else;
begin
  TapAssertTrue(Self, 'testing for shellfish allergy - allergic to shellfish and something else', true, Allergies.AllergicTo('shellfish', 14));
end;

// 21ef8e17-c227-494e-8e78-470a1c59c3d8
procedure AllergiesTest.allergic_to_something_but_not_shellfish;
begin
  TapAssertTrue(Self, 'testing for shellfish allergy - allergic to something, but not shellfish', false, Allergies.AllergicTo('shellfish', 10));
end;

// cc789c19-2b5e-4c67-b146-625dc8cfa34e
procedure AllergiesTest.shellfish_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for shellfish allergy - allergic to everything', true, Allergies.AllergicTo('shellfish', 255));
end;

// 651bde0a-2a74-46c4-ab55-02a0906ca2f5
procedure AllergiesTest.strawberries_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for strawberries allergy - not allergic to anything', false, Allergies.AllergicTo('strawberries', 0));
end;

// b649a750-9703-4f5f-b7f7-91da2c160ece
procedure AllergiesTest.allergic_only_to_strawberries;
begin
  TapAssertTrue(Self, 'testing for strawberries allergy - allergic only to strawberries', true, Allergies.AllergicTo('strawberries', 8));
end;

// 50f5f8f3-3bac-47e6-8dba-2d94470a4bc6
procedure AllergiesTest.allergic_to_strawberries_and_something_else;
begin
  TapAssertTrue(Self, 'testing for strawberries allergy - allergic to strawberries and something else', true, Allergies.AllergicTo('strawberries', 28));
end;

// 23dd6952-88c9-48d7-a7d5-5d0343deb18d
procedure AllergiesTest.allergic_to_something_but_not_strawberries;
begin
  TapAssertTrue(Self, 'testing for strawberries allergy - allergic to something, but not strawberries', false, Allergies.AllergicTo('strawberries', 20));
end;

// 74afaae2-13b6-43a2-837a-286cd42e7d7e
procedure AllergiesTest.strawberries_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for strawberries allergy - allergic to everything', true, Allergies.AllergicTo('strawberries', 255));
end;

// c49a91ef-6252-415e-907e-a9d26ef61723
procedure AllergiesTest.tomatoes_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for tomatoes allergy - not allergic to anything', false, Allergies.AllergicTo('tomatoes', 0));
end;

// b69c5131-b7d0-41ad-a32c-e1b2cc632df8
procedure AllergiesTest.allergic_only_to_tomatoes;
begin
  TapAssertTrue(Self, 'testing for tomatoes allergy - allergic only to tomatoes', true, Allergies.AllergicTo('tomatoes', 16));
end;

// 1ca50eb1-f042-4ccf-9050-341521b929ec
procedure AllergiesTest.allergic_to_tomatoes_and_something_else;
begin
  TapAssertTrue(Self, 'testing for tomatoes allergy - allergic to tomatoes and something else', true, Allergies.AllergicTo('tomatoes', 56));
end;

// e9846baa-456b-4eff-8025-034b9f77bd8e
procedure AllergiesTest.allergic_to_something_but_not_tomatoes;
begin
  TapAssertTrue(Self, 'testing for tomatoes allergy - allergic to something, but not tomatoes', false, Allergies.AllergicTo('tomatoes', 40));
end;

// b2414f01-f3ad-4965-8391-e65f54dad35f
procedure AllergiesTest.tomatoes_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for tomatoes allergy - allergic to everything', true, Allergies.AllergicTo('tomatoes', 255));
end;

// 978467ab-bda4-49f7-b004-1d011ead947c
procedure AllergiesTest.chocolate_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for chocolate allergy - not allergic to anything', false, Allergies.AllergicTo('chocolate', 0));
end;

// 59cf4e49-06ea-4139-a2c1-d7aad28f8cbc
procedure AllergiesTest.allergic_only_to_chocolate;
begin
  TapAssertTrue(Self, 'testing for chocolate allergy - allergic only to chocolate', true, Allergies.AllergicTo('chocolate', 32));
end;

// b0a7c07b-2db7-4f73-a180-565e07040ef1
procedure AllergiesTest.allergic_to_chocolate_and_something_else;
begin
  TapAssertTrue(Self, 'testing for chocolate allergy - allergic to chocolate and something else', true, Allergies.AllergicTo('chocolate', 112));
end;

// f5506893-f1ae-482a-b516-7532ba5ca9d2
procedure AllergiesTest.allergic_to_something_but_not_chocolate;
begin
  TapAssertTrue(Self, 'testing for chocolate allergy - allergic to something, but not chocolate', false, Allergies.AllergicTo('chocolate', 80));
end;

// 02debb3d-d7e2-4376-a26b-3c974b6595c6
procedure AllergiesTest.chocolate_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for chocolate allergy - allergic to everything', true, Allergies.AllergicTo('chocolate', 255));
end;

// 17f4a42b-c91e-41b8-8a76-4797886c2d96
procedure AllergiesTest.pollen_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for pollen allergy - not allergic to anything', false, Allergies.AllergicTo('pollen', 0));
end;

// 7696eba7-1837-4488-882a-14b7b4e3e399
procedure AllergiesTest.allergic_only_to_pollen;
begin
  TapAssertTrue(Self, 'testing for pollen allergy - allergic only to pollen', true, Allergies.AllergicTo('pollen', 64));
end;

// 9a49aec5-fa1f-405d-889e-4dfc420db2b6
procedure AllergiesTest.allergic_to_pollen_and_something_else;
begin
  TapAssertTrue(Self, 'testing for pollen allergy - allergic to pollen and something else', true, Allergies.AllergicTo('pollen', 224));
end;

// 3cb8e79f-d108-4712-b620-aa146b1954a9
procedure AllergiesTest.allergic_to_something_but_not_pollen;
begin
  TapAssertTrue(Self, 'testing for pollen allergy - allergic to something, but not pollen', false, Allergies.AllergicTo('pollen', 160));
end;

// 1dc3fe57-7c68-4043-9d51-5457128744b2
procedure AllergiesTest.pollen_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for pollen allergy - allergic to everything', true, Allergies.AllergicTo('pollen', 255));
end;

// d3f523d6-3d50-419b-a222-d4dfd62ce314
procedure AllergiesTest.cats_not_allergic_to_anything;
begin
  TapAssertTrue(Self, 'testing for cats allergy - not allergic to anything', false, Allergies.AllergicTo('cats', 0));
end;

// eba541c3-c886-42d3-baef-c048cb7fcd8f
procedure AllergiesTest.allergic_only_to_cats;
begin
  TapAssertTrue(Self, 'testing for cats allergy - allergic only to cats', true, Allergies.AllergicTo('cats', 128));
end;

// ba718376-26e0-40b7-bbbe-060287637ea5
procedure AllergiesTest.allergic_to_cats_and_something_else;
begin
  TapAssertTrue(Self, 'testing for cats allergy - allergic to cats and something else', true, Allergies.AllergicTo('cats', 192));
end;

// 3c6dbf4a-5277-436f-8b88-15a206f2d6c4
procedure AllergiesTest.allergic_to_something_but_not_cats;
begin
  TapAssertTrue(Self, 'testing for cats allergy - allergic to something, but not cats', false, Allergies.AllergicTo('cats', 64));
end;

// 1faabb05-2b98-4995-9046-d83e4a48a7c1
procedure AllergiesTest.cats_allergic_to_everything;
begin
  TapAssertTrue(Self, 'testing for cats allergy - allergic to everything', true, Allergies.AllergicTo('cats', 255));
end;

// f9c1b8e7-7dc5-4887-aa93-cebdcc29dd8f
procedure AllergiesTest.no_allergies;
begin
  TapAssertTrue(Self, 'list when: no allergies', [], Allergies.list(0));
end;

// 9e1a4364-09a6-4d94-990f-541a94a4c1e8
procedure AllergiesTest.just_eggs;
begin
  TapAssertTrue(Self, 'list when: just eggs', ['eggs'], Allergies.list(1));
end;

// 8851c973-805e-4283-9e01-d0c0da0e4695
procedure AllergiesTest.just_peanuts;
begin
  TapAssertTrue(Self, 'list when: just peanuts', ['peanuts'], Allergies.list(2));
end;

// 2c8943cb-005e-435f-ae11-3e8fb558ea98
procedure AllergiesTest.just_strawberries;
begin
  TapAssertTrue(Self, 'list when: just strawberries', ['strawberries'], Allergies.list(8));
end;

// 6fa95d26-044c-48a9-8a7b-9ee46ec32c5c
procedure AllergiesTest.eggs_and_peanuts;
begin
  TapAssertTrue(Self, 'list when: eggs and peanuts', ['eggs', 'peanuts'], Allergies.list(3));
end;

// 19890e22-f63f-4c5c-a9fb-fb6eacddfe8e
procedure AllergiesTest.more_than_eggs_but_not_peanuts;
begin
  TapAssertTrue(Self, 'list when: more than eggs but not peanuts', ['eggs', 'shellfish'], Allergies.list(5));
end;

// 4b68f470-067c-44e4-889f-c9fe28917d2f
procedure AllergiesTest.lots_of_stuff;
begin
  TapAssertTrue(Self, 'list when: lots of stuff', ['strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'], Allergies.list(248));
end;

// 0881b7c5-9efa-4530-91bd-68370d054bc7
procedure AllergiesTest.everything;
begin
  TapAssertTrue(Self, 'list when: everything', ['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'], Allergies.list(255));
end;

// 12ce86de-b347-42a0-ab7c-2e0570f0c65b
procedure AllergiesTest.no_allergen_score_parts;
begin
  TapAssertTrue(Self, 'list when: no allergen score parts', ['eggs', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'], Allergies.list(509));
end;

// 93c2df3e-4f55-4fed-8116-7513092819cd
procedure AllergiesTest.no_allergen_score_parts_without_highest_valid_score;
begin
  TapAssertTrue(Self, 'list when: no allergen score parts without highest valid score', ['eggs'], Allergies.list(257));
end;

initialization
RegisterTest(AllergiesTest);

end.
