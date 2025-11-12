unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  AnagramTest = class(TTestCase)
  published
    procedure no_matches;
    procedure detects_two_anagrams;
    procedure does_not_detect_anagram_subsets;
    procedure detects_anagram;
    procedure detects_three_anagrams;
    procedure detects_multiple_anagrams_with_different_case;
    procedure does_not_detect_non_anagrams_with_identical_checksum;
    procedure detects_anagrams_case_insensitively;
    procedure detects_anagrams_using_case_insensitive_subject;
    procedure detects_anagrams_using_case_insensitive_possible_matches;
    procedure does_not_detect_an_anagram_if_the_original_word_is_repeated;
    procedure anagrams_must_use_all_letters_exactly_once;
    procedure words_are_not_anagrams_of_themselves;
    procedure words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different;
    procedure words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different;
    procedure words_other_than_themselves_can_be_anagrams;
  end;

implementation

uses Anagram;

// dd40c4d2-3c8b-44e5-992a-f42b393ec373
procedure AnagramTest.no_matches;
begin
  TapAssertTrue(Self, 'no matches', [], Anagram.FindAnagrams('diaper', ['hello', 'world', 'zombies', 'pants']));
end;

// 03eb9bbe-8906-4ea0-84fa-ffe711b52c8b
procedure AnagramTest.detects_two_anagrams;
begin
  TapAssertTrue(Self, 'detects two anagrams', ['lemons', 'melons'], Anagram.FindAnagrams('solemn', ['lemons', 'cherry', 'melons']));
end;

// a27558ee-9ba0-4552-96b1-ecf665b06556
procedure AnagramTest.does_not_detect_anagram_subsets;
begin
  TapAssertTrue(Self, 'does not detect anagram subsets', [], Anagram.FindAnagrams('good', ['dog', 'goody']));
end;

// 64cd4584-fc15-4781-b633-3d814c4941a4
procedure AnagramTest.detects_anagram;
begin
  TapAssertTrue(Self, 'detects anagram', ['inlets'], Anagram.FindAnagrams('listen', ['enlists', 'google', 'inlets', 'banana']));
end;

// 99c91beb-838f-4ccd-b123-935139917283
procedure AnagramTest.detects_three_anagrams;
begin
  TapAssertTrue(Self, 'detects three anagrams', ['gallery', 'regally', 'largely'], Anagram.FindAnagrams('allergy', ['gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading']));
end;

// 78487770-e258-4e1f-a646-8ece10950d90
procedure AnagramTest.detects_multiple_anagrams_with_different_case;
begin
  TapAssertTrue(Self, 'detects multiple anagrams with different case', ['Eons', 'ONES'], Anagram.FindAnagrams('nose', ['Eons', 'ONES']));
end;

// 1d0ab8aa-362f-49b7-9902-3d0c668d557b
procedure AnagramTest.does_not_detect_non_anagrams_with_identical_checksum;
begin
  TapAssertTrue(Self, 'does not detect non-anagrams with identical checksum', [], Anagram.FindAnagrams('mass', ['last']));
end;

// 9e632c0b-c0b1-4804-8cc1-e295dea6d8a8
procedure AnagramTest.detects_anagrams_case_insensitively;
begin
  TapAssertTrue(Self, 'detects anagrams case-insensitively', ['Carthorse'], Anagram.FindAnagrams('Orchestra', ['cashregister', 'Carthorse', 'radishes']));
end;

// b248e49f-0905-48d2-9c8d-bd02d8c3e392
procedure AnagramTest.detects_anagrams_using_case_insensitive_subject;
begin
  TapAssertTrue(Self, 'detects anagrams using case-insensitive subject', ['carthorse'], Anagram.FindAnagrams('Orchestra', ['cashregister', 'carthorse', 'radishes']));
end;

// f367325c-78ec-411c-be76-e79047f4bd54
procedure AnagramTest.detects_anagrams_using_case_insensitive_possible_matches;
begin
  TapAssertTrue(Self, 'detects anagrams using case-insensitive possible matches', ['Carthorse'], Anagram.FindAnagrams('orchestra', ['cashregister', 'Carthorse', 'radishes']));
end;

// 630abb71-a94e-4715-8395-179ec1df9f91
procedure AnagramTest.does_not_detect_an_anagram_if_the_original_word_is_repeated;
begin
  TapAssertTrue(Self, 'does not detect an anagram if the original word is repeated', [], Anagram.FindAnagrams('go', ['goGoGO']));
end;

// 9878a1c9-d6ea-4235-ae51-3ea2befd6842
procedure AnagramTest.anagrams_must_use_all_letters_exactly_once;
begin
  TapAssertTrue(Self, 'anagrams must use all letters exactly once', [], Anagram.FindAnagrams('tapper', ['patter']));
end;

// 68934ed0-010b-4ef9-857a-20c9012d1ebf
procedure AnagramTest.words_are_not_anagrams_of_themselves;
begin
  TapAssertTrue(Self, 'words are not anagrams of themselves', [], Anagram.FindAnagrams('BANANA', ['BANANA']));
end;

// 589384f3-4c8a-4e7d-9edc-51c3e5f0c90e
procedure AnagramTest.words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different;
begin
  TapAssertTrue(Self, 'words are not anagrams of themselves even if letter case is partially different', [], Anagram.FindAnagrams('BANANA', ['Banana']));
end;

// ba53e423-7e02-41ee-9ae2-71f91e6d18e6
procedure AnagramTest.words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different;
begin
  TapAssertTrue(Self, 'words are not anagrams of themselves even if letter case is completely different', [], Anagram.FindAnagrams('BANANA', ['banana']));
end;

// 33d3f67e-fbb9-49d3-a90e-0beb00861da7
procedure AnagramTest.words_other_than_themselves_can_be_anagrams;
begin
  TapAssertTrue(Self, 'words other than themselves can be anagrams', ['Silent'], Anagram.FindAnagrams('LISTEN', ['LISTEN', 'Silent']));
end;

initialization
RegisterTest(AnagramTest);

end.
