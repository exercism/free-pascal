unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  DominoesTest = class(TTestCase)
  published
    procedure empty_input_implies_empty_output;
    procedure singleton_input_implies_singleton_output;
    procedure singleton_that_cant_be_chained;
    procedure three_elements;
    procedure can_reverse_dominoes;
    procedure cant_be_chained;
    procedure disconnected___simple;
    procedure disconnected___double_loop;
    procedure disconnected___single_isolated;
    procedure need_backtrack;
    procedure separate_loops;
    procedure nine_elements;
    procedure separate_three_domino_loops;
  end;

implementation

uses Dominoes;

// 31a673f2-5e54-49fe-bd79-1c1dae476c9c
procedure DominoesTest.empty_input_implies_empty_output;
const
  stones : TIntArray2D = ();
begin
  TapAssertTrue(Self, 'empty input implies empty output', True, Dominoes.canChain(stones));
end;

// 4f99b933-367b-404b-8c6d-36d5923ee476
procedure DominoesTest.singleton_input_implies_singleton_output;
const
  stones : TIntArray2D = ((1, 1));
begin
  TapAssertTrue(Self, 'singleton input implies singleton output', True, Dominoes.canChain(stones));
end;

// 91122d10-5ec7-47cb-b759-033756375869
procedure DominoesTest.singleton_that_cant_be_chained;
const
  stones : TIntArray2D = ((1, 2));
begin
  TapAssertTrue(Self, 'singleton that cant be chained', False, Dominoes.canChain(stones));
end;

// be8bc26b-fd3d-440b-8e9f-d698a0623be3
procedure DominoesTest.three_elements;
const
  stones : TIntArray2D = ((1, 2), (3, 1), (2, 3));
begin
  TapAssertTrue(Self, 'three elements', True, Dominoes.canChain(stones));
end;

// 99e615c6-c059-401c-9e87-ad7af11fea5c
procedure DominoesTest.can_reverse_dominoes;
const
  stones : TIntArray2D = ((1, 2), (1, 3), (2, 3));
begin
  TapAssertTrue(Self, 'can reverse dominoes', True, Dominoes.canChain(stones));
end;

// 51f0c291-5d43-40c5-b316-0429069528c9
procedure DominoesTest.cant_be_chained;
const
  stones : TIntArray2D = ((1, 2), (4, 1), (2, 3));
begin
  TapAssertTrue(Self, 'cant be chained', False, Dominoes.canChain(stones));
end;

// 9a75e078-a025-4c23-8c3a-238553657f39
procedure DominoesTest.disconnected___simple;
const
  stones : TIntArray2D = ((1, 1), (2, 2));
begin
  TapAssertTrue(Self, 'disconnected - simple', False, Dominoes.canChain(stones));
end;

// 0da0c7fe-d492-445d-b9ef-1f111f07a301
procedure DominoesTest.disconnected___double_loop;
const
  stones : TIntArray2D = ((1, 2), (2, 1), (3, 4), (4, 3));
begin
  TapAssertTrue(Self, 'disconnected - double loop', False, Dominoes.canChain(stones));
end;

// b6087ff0-f555-4ea0-a71c-f9d707c5994a
procedure DominoesTest.disconnected___single_isolated;
const
  stones : TIntArray2D = ((1, 2), (2, 3), (3, 1), (4, 4));
begin
  TapAssertTrue(Self, 'disconnected - single isolated', False, Dominoes.canChain(stones));
end;

// 2174fbdc-8b48-4bac-9914-8090d06ef978
procedure DominoesTest.need_backtrack;
const
  stones : TIntArray2D = ((1, 2), (2, 3), (3, 1), (2, 4), (2, 4));
begin
  TapAssertTrue(Self, 'need backtrack', True, Dominoes.canChain(stones));
end;

// 167bb480-dfd1-4318-a20d-4f90adb4a09f
procedure DominoesTest.separate_loops;
const
  stones : TIntArray2D = ((1, 2), (2, 3), (3, 1), (1, 1), (2, 2), (3, 3));
begin
  TapAssertTrue(Self, 'separate loops', True, Dominoes.canChain(stones));
end;

// cd061538-6046-45a7-ace9-6708fe8f6504
procedure DominoesTest.nine_elements;
const
  stones : TIntArray2D = ((1, 2), (5, 3), (3, 1), (1, 2), (2, 4), (1, 6), (2, 3), (3, 4), (5, 6));
begin
  TapAssertTrue(Self, 'nine elements', True, Dominoes.canChain(stones));
end;

// 44704c7c-3adb-4d98-bd30-f45527cf8b49
procedure DominoesTest.separate_three_domino_loops;
const
  stones : TIntArray2D = ((1, 2), (2, 3), (3, 1), (4, 5), (5, 6), (6, 4));
begin
  TapAssertTrue(Self, 'separate three-domino loops', False, Dominoes.canChain(stones));
end;

initialization
RegisterTest(DominoesTest);

end.
