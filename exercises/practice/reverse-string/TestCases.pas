unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ReverseStringTest = class(TTestCase)
  published
    procedure an_empty_string;
    procedure a_word;
    procedure a_capitalized_word;
    procedure a_sentence_with_punctuation;
    procedure a_palindrome;
    procedure an_even_sized_word;
  end;

implementation

uses ReverseString;

// c3b7d806-dced-49ee-8543-933fd1719b1c
procedure ReverseStringTest.an_empty_string;
begin
  TapAssertTrue(Self, 'an empty string', '', ReverseString.reverse(''));
end;

// 01ebf55b-bebb-414e-9dec-06f7bb0bee3c
procedure ReverseStringTest.a_word;
begin
  TapAssertTrue(Self, 'a word', 'tobor', ReverseString.reverse('robot'));
end;

// 0f7c07e4-efd1-4aaa-a07a-90b49ce0b746
procedure ReverseStringTest.a_capitalized_word;
begin
  TapAssertTrue(Self, 'a capitalized word', 'nemaR', ReverseString.reverse('Ramen'));
end;

// 71854b9c-f200-4469-9f5c-1e8e5eff5614
procedure ReverseStringTest.a_sentence_with_punctuation;
begin
  TapAssertTrue(Self, 'a sentence with punctuation', '!yrgnuh m''I', ReverseString.reverse('I''m hungry!'));
end;

// 1f8ed2f3-56f3-459b-8f3e-6d8d654a1f6c
procedure ReverseStringTest.a_palindrome;
begin
  TapAssertTrue(Self, 'a palindrome', 'racecar', ReverseString.reverse('racecar'));
end;

// b9e7dec1-c6df-40bd-9fa3-cd7ded010c4c
procedure ReverseStringTest.an_even_sized_word;
begin
  TapAssertTrue(Self, 'an even-sized word', 'reward', ReverseString.reverse('drawer'));
end;

initialization
RegisterTest(ReverseStringTest);

end.
