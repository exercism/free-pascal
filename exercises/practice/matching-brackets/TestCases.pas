unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  MatchingBracketsTest = class(TTestCase)
  published
    procedure paired_square_brackets;
    procedure empty_string;
    procedure unpaired_brackets;
    procedure wrong_ordered_brackets;
    procedure wrong_closing_bracket;
    procedure paired_with_whitespace;
    procedure partially_paired_brackets;
    procedure simple_nested_brackets;
    procedure several_paired_brackets;
    procedure paired_and_nested_brackets;
    procedure unopened_closing_brackets;
    procedure unpaired_and_nested_brackets;
    procedure paired_and_wrong_nested_brackets;
    procedure paired_and_wrong_nested_brackets_but_innermost_are_correct;
    procedure paired_and_incomplete_brackets;
    procedure too_many_closing_brackets;
    procedure early_unexpected_brackets;
    procedure early_mismatched_brackets;
    procedure math_expression;
    procedure complex_latex_expression;
  end;

implementation

uses MatchingBrackets;

// 81ec11da-38dd-442a-bcf9-3de7754609a5
procedure MatchingBracketsTest.paired_square_brackets;
begin
  TapAssertTrue(Self, 'paired square brackets', true, MatchingBrackets.IsPaired('[]'));
end;

// 287f0167-ac60-4b64-8452-a0aa8f4e5238
procedure MatchingBracketsTest.empty_string;
begin
  TapAssertTrue(Self, 'empty string', true, MatchingBrackets.IsPaired(''));
end;

// 6c3615a3-df01-4130-a731-8ef5f5d78dac
procedure MatchingBracketsTest.unpaired_brackets;
begin
  TapAssertTrue(Self, 'unpaired brackets', false, MatchingBrackets.IsPaired('[['));
end;

// 9d414171-9b98-4cac-a4e5-941039a97a77
procedure MatchingBracketsTest.wrong_ordered_brackets;
begin
  TapAssertTrue(Self, 'wrong ordered brackets', false, MatchingBrackets.IsPaired('}{'));
end;

// f0f97c94-a149-4736-bc61-f2c5148ffb85
procedure MatchingBracketsTest.wrong_closing_bracket;
begin
  TapAssertTrue(Self, 'wrong closing bracket', false, MatchingBrackets.IsPaired('{]'));
end;

// 754468e0-4696-4582-a30e-534d47d69756
procedure MatchingBracketsTest.paired_with_whitespace;
begin
  TapAssertTrue(Self, 'paired with whitespace', true, MatchingBrackets.IsPaired('{ }'));
end;

// ba84f6ee-8164-434a-9c3e-b02c7f8e8545
procedure MatchingBracketsTest.partially_paired_brackets;
begin
  TapAssertTrue(Self, 'partially paired brackets', false, MatchingBrackets.IsPaired('{[])'));
end;

// 3c86c897-5ff3-4a2b-ad9b-47ac3a30651d
procedure MatchingBracketsTest.simple_nested_brackets;
begin
  TapAssertTrue(Self, 'simple nested brackets', true, MatchingBrackets.IsPaired('{[]}'));
end;

// 2d137f2c-a19e-4993-9830-83967a2d4726
procedure MatchingBracketsTest.several_paired_brackets;
begin
  TapAssertTrue(Self, 'several paired brackets', true, MatchingBrackets.IsPaired('{}[]'));
end;

// 2e1f7b56-c137-4c92-9781-958638885a44
procedure MatchingBracketsTest.paired_and_nested_brackets;
begin
  TapAssertTrue(Self, 'paired and nested brackets', true, MatchingBrackets.IsPaired('([{}({}[])])'));
end;

// 84f6233b-e0f7-4077-8966-8085d295c19b
procedure MatchingBracketsTest.unopened_closing_brackets;
begin
  TapAssertTrue(Self, 'unopened closing brackets', false, MatchingBrackets.IsPaired('{[)][]}'));
end;

// 9b18c67d-7595-4982-b2c5-4cb949745d49
procedure MatchingBracketsTest.unpaired_and_nested_brackets;
begin
  TapAssertTrue(Self, 'unpaired and nested brackets', false, MatchingBrackets.IsPaired('([{])'));
end;

// a0205e34-c2ac-49e6-a88a-899508d7d68e
procedure MatchingBracketsTest.paired_and_wrong_nested_brackets;
begin
  TapAssertTrue(Self, 'paired and wrong nested brackets', false, MatchingBrackets.IsPaired('[({]})'));
end;

// 1d5c093f-fc84-41fb-8c2a-e052f9581602
procedure MatchingBracketsTest.paired_and_wrong_nested_brackets_but_innermost_are_correct;
begin
  TapAssertTrue(Self, 'paired and wrong nested brackets but innermost are correct', false, MatchingBrackets.IsPaired('[({}])'));
end;

// ef47c21b-bcfd-4998-844c-7ad5daad90a8
procedure MatchingBracketsTest.paired_and_incomplete_brackets;
begin
  TapAssertTrue(Self, 'paired and incomplete brackets', false, MatchingBrackets.IsPaired('{}['));
end;

// a4675a40-a8be-4fc2-bc47-2a282ce6edbe
procedure MatchingBracketsTest.too_many_closing_brackets;
begin
  TapAssertTrue(Self, 'too many closing brackets', false, MatchingBrackets.IsPaired('[]]'));
end;

// a345a753-d889-4b7e-99ae-34ac85910d1a
procedure MatchingBracketsTest.early_unexpected_brackets;
begin
  TapAssertTrue(Self, 'early unexpected brackets', false, MatchingBrackets.IsPaired(')()'));
end;

// 21f81d61-1608-465a-b850-baa44c5def83
procedure MatchingBracketsTest.early_mismatched_brackets;
begin
  TapAssertTrue(Self, 'early mismatched brackets', false, MatchingBrackets.IsPaired('{)()'));
end;

// 99255f93-261b-4435-a352-02bdecc9bdf2
procedure MatchingBracketsTest.math_expression;
begin
  TapAssertTrue(Self, 'math expression', true, MatchingBrackets.IsPaired('(((185 + 223.85) * 15) - 543)/2'));
end;

// 8e357d79-f302-469a-8515-2561877256a1
procedure MatchingBracketsTest.complex_latex_expression;
begin
  TapAssertTrue(Self, 'complex latex expression', true, MatchingBrackets.IsPaired('\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)'));
end;

initialization
RegisterTest(MatchingBracketsTest);

end.
