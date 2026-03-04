unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  KnapsackTest = class(TTestCase)
  published
    procedure no_items;
    procedure one_item_too_heavy;
    procedure five_items_cannot_be_greedy_by_weight;
    procedure five_items_cannot_be_greedy_by_value;
    procedure example_knapsack;
    procedure _8_items;
    procedure _15_items;
  end;

implementation

uses Knapsack;

// 3993a824-c20e-493d-b3c9-ee8a7753ee59
procedure KnapsackTest.no_items;
const
  items : TItemArray = (
  );
begin
  TapAssertTrue(Self, 'no items', 0, Knapsack.maximumValue(100, items));
end;

// 1d39e98c-6249-4a8b-912f-87cb12e506b0
procedure KnapsackTest.one_item_too_heavy;
const
  items : TItemArray = (
    (weight: 100; value: 1)
  );
begin
  TapAssertTrue(Self, 'one item, too heavy', 0, Knapsack.maximumValue(10, items));
end;

// 833ea310-6323-44f2-9d27-a278740ffbd8
procedure KnapsackTest.five_items_cannot_be_greedy_by_weight;
const
  items : TItemArray = (
    (weight: 2; value: 5),
    (weight: 2; value: 5),
    (weight: 2; value: 5),
    (weight: 2; value: 5),
    (weight: 10; value: 21)
  );
begin
  TapAssertTrue(Self, 'five items (cannot be greedy by weight)', 21, Knapsack.maximumValue(10, items));
end;

// 277cdc52-f835-4c7d-872b-bff17bab2456
procedure KnapsackTest.five_items_cannot_be_greedy_by_value;
const
  items : TItemArray = (
    (weight: 2; value: 20),
    (weight: 2; value: 20),
    (weight: 2; value: 20),
    (weight: 2; value: 20),
    (weight: 10; value: 50)
  );
begin
  TapAssertTrue(Self, 'five items (cannot be greedy by value)', 80, Knapsack.maximumValue(10, items));
end;

// 81d8e679-442b-4f7a-8a59-7278083916c9
procedure KnapsackTest.example_knapsack;
const
  items : TItemArray = (
    (weight: 5; value: 10),
    (weight: 4; value: 40),
    (weight: 6; value: 30),
    (weight: 4; value: 50)
  );
begin
  TapAssertTrue(Self, 'example knapsack', 90, Knapsack.maximumValue(10, items));
end;

// f23a2449-d67c-4c26-bf3e-cde020f27ecc
procedure KnapsackTest._8_items;
const
  items : TItemArray = (
    (weight: 25; value: 350),
    (weight: 35; value: 400),
    (weight: 45; value: 450),
    (weight: 5; value: 20),
    (weight: 25; value: 70),
    (weight: 3; value: 8),
    (weight: 2; value: 5),
    (weight: 2; value: 5)
  );
begin
  TapAssertTrue(Self, '8 items', 900, Knapsack.maximumValue(104, items));
end;

// 7c682ae9-c385-4241-a197-d2fa02c81a11
procedure KnapsackTest._15_items;
const
  items : TItemArray = (
    (weight: 70; value: 135),
    (weight: 73; value: 139),
    (weight: 77; value: 149),
    (weight: 80; value: 150),
    (weight: 82; value: 156),
    (weight: 87; value: 163),
    (weight: 90; value: 173),
    (weight: 94; value: 184),
    (weight: 98; value: 192),
    (weight: 106; value: 201),
    (weight: 110; value: 210),
    (weight: 113; value: 214),
    (weight: 115; value: 221),
    (weight: 118; value: 229),
    (weight: 120; value: 240)
  );
begin
  TapAssertTrue(Self, '15 items', 1458, Knapsack.maximumValue(750, items));
end;

initialization
RegisterTest(KnapsackTest);

end.
