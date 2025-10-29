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
const expected = '';
var
  actual  : string;
  message : string;
begin
  actual  := ReverseString.reverse('');
  message := EncodeJsonMessage('an empty string', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 01ebf55b-bebb-414e-9dec-06f7bb0bee3c
procedure ReverseStringTest.a_word;
const expected = 'tobor';
var
  actual  : string;
  message : string;
begin
  actual  := ReverseString.reverse('robot');
  message := EncodeJsonMessage('a word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 0f7c07e4-efd1-4aaa-a07a-90b49ce0b746
procedure ReverseStringTest.a_capitalized_word;
const expected = 'nemaR';
var
  actual  : string;
  message : string;
begin
  actual  := ReverseString.reverse('Ramen');
  message := EncodeJsonMessage('a capitalized word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 71854b9c-f200-4469-9f5c-1e8e5eff5614
procedure ReverseStringTest.a_sentence_with_punctuation;
const expected = '!yrgnuh m''I';
var
  actual  : string;
  message : string;
begin
  actual  := ReverseString.reverse('I''m hungry!');
  message := EncodeJsonMessage('a sentence with punctuation', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 1f8ed2f3-56f3-459b-8f3e-6d8d654a1f6c
procedure ReverseStringTest.a_palindrome;
const expected = 'racecar';
var
  actual  : string;
  message : string;
begin
  actual  := ReverseString.reverse('racecar');
  message := EncodeJsonMessage('a palindrome', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b9e7dec1-c6df-40bd-9fa3-cd7ded010c4c
procedure ReverseStringTest.an_even_sized_word;
const expected = 'reward';
var
  actual  : string;
  message : string;
begin
  actual  := ReverseString.reverse('drawer');
  message := EncodeJsonMessage('an even-sized word', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(ReverseStringTest);

end.
