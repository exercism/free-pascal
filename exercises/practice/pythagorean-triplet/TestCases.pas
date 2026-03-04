unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  PythagoreanTripletTest = class(TTestCase)
  published
    procedure triplets_whose_sum_is_12;
    procedure triplets_whose_sum_is_108;
    procedure triplets_whose_sum_is_1000;
    procedure no_matching_triplets_for_1001;
    procedure returns_all_matching_triplets;
    procedure several_matching_triplets;
    procedure triplets_for_large_number;
  end;

implementation

uses PythagoreanTriplet;

// a19de65d-35b8-4480-b1af-371d9541e706
procedure PythagoreanTripletTest.triplets_whose_sum_is_12;
var
  triplets : TIntArray2D;
begin
  triplets := PythagoreanTriplet.tripletsWithSum(12);
  TapAssertTrue(Self, 'triplets whose sum is 12', 1, length(triplets));
  TapAssertTrue(Self, 'triplets whose sum is 12', [3, 4, 5], triplets[0]);
end;

// 48b21332-0a3d-43b2-9a52-90b2a6e5c9f5
procedure PythagoreanTripletTest.triplets_whose_sum_is_108;
var
  triplets : TIntArray2D;
begin
  triplets := PythagoreanTriplet.tripletsWithSum(108);
  TapAssertTrue(Self, 'triplets whose sum is 108', 1, length(triplets));
  TapAssertTrue(Self, 'triplets whose sum is 108', [27, 36, 45], triplets[0]);
end;

// dffc1266-418e-4daa-81af-54c3e95c3bb5
procedure PythagoreanTripletTest.triplets_whose_sum_is_1000;
var
  triplets : TIntArray2D;
begin
  triplets := PythagoreanTriplet.tripletsWithSum(1000);
  TapAssertTrue(Self, 'triplets whose sum is 1000', 1, length(triplets));
  TapAssertTrue(Self, 'triplets whose sum is 1000', [200, 375, 425], triplets[0]);
end;

// 5f86a2d4-6383-4cce-93a5-e4489e79b186
procedure PythagoreanTripletTest.no_matching_triplets_for_1001;
var
  triplets : TIntArray2D;
begin
  triplets := PythagoreanTriplet.tripletsWithSum(1001);
  TapAssertTrue(Self, 'no matching triplets for 1001', 0, length(triplets));
end;

// bf17ba80-1596-409a-bb13-343bdb3b2904
procedure PythagoreanTripletTest.returns_all_matching_triplets;
var
  triplets : TIntArray2D;
begin
  triplets := PythagoreanTriplet.tripletsWithSum(90);
  TapAssertTrue(Self, 'returns all matching triplets', 2, length(triplets));
  TapAssertTrue(Self, 'returns all matching triplets', [9, 40, 41], triplets[0]);
  TapAssertTrue(Self, 'returns all matching triplets', [15, 36, 39], triplets[1]);
end;

// 9d8fb5d5-6c6f-42df-9f95-d3165963ac57
procedure PythagoreanTripletTest.several_matching_triplets;
var
  triplets : TIntArray2D;
begin
  triplets := PythagoreanTriplet.tripletsWithSum(840);
  TapAssertTrue(Self, 'several matching triplets', 8, length(triplets));
  TapAssertTrue(Self, 'several matching triplets', [40, 399, 401], triplets[0]);
  TapAssertTrue(Self, 'several matching triplets', [56, 390, 394], triplets[1]);
  TapAssertTrue(Self, 'several matching triplets', [105, 360, 375], triplets[2]);
  TapAssertTrue(Self, 'several matching triplets', [120, 350, 370], triplets[3]);
  TapAssertTrue(Self, 'several matching triplets', [140, 336, 364], triplets[4]);
  TapAssertTrue(Self, 'several matching triplets', [168, 315, 357], triplets[5]);
  TapAssertTrue(Self, 'several matching triplets', [210, 280, 350], triplets[6]);
  TapAssertTrue(Self, 'several matching triplets', [240, 252, 348], triplets[7]);
end;

// f5be5734-8aa0-4bd1-99a2-02adcc4402b4
procedure PythagoreanTripletTest.triplets_for_large_number;
var
  triplets : TIntArray2D;
begin
  triplets := PythagoreanTriplet.tripletsWithSum(30000);
  TapAssertTrue(Self, 'triplets for large number', 5, length(triplets));
  TapAssertTrue(Self, 'triplets for large number', [1200, 14375, 14425], triplets[0]);
  TapAssertTrue(Self, 'triplets for large number', [1875, 14000, 14125], triplets[1]);
  TapAssertTrue(Self, 'triplets for large number', [5000, 12000, 13000], triplets[2]);
  TapAssertTrue(Self, 'triplets for large number', [6000, 11250, 12750], triplets[3]);
  TapAssertTrue(Self, 'triplets for large number', [7500, 10000, 12500], triplets[4]);
end;

initialization
RegisterTest(PythagoreanTripletTest);

end.
