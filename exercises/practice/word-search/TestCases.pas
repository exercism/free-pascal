unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  WordSearchTest = class(TTestCase)
  published
    procedure should_accept_an_initial_game_grid_and_a_target_search_word;
    procedure should_locate_one_word_written_left_to_right;
    procedure should_locate_the_same_word_written_left_to_right_in_a_different_position;
    procedure should_locate_a_different_left_to_right_word;
    procedure should_locate_that_different_left_to_right_word_in_a_different_position;
    procedure should_locate_a_left_to_right_word_in_two_line_grid;
    procedure should_locate_a_left_to_right_word_in_three_line_grid;
    procedure should_locate_a_left_to_right_word_in_ten_line_grid;
    procedure should_locate_that_left_to_right_word_in_a_different_position_in_a_ten_line_grid;
    procedure should_locate_a_different_left_to_right_word_in_a_ten_line_grid;
    procedure should_locate_multiple_words;
    procedure should_locate_a_single_word_written_right_to_left;
    procedure should_locate_multiple_words_written_in_different_horizontal_directions;
    procedure should_locate_words_written_top_to_bottom;
    procedure should_locate_words_written_bottom_to_top;
    procedure should_locate_words_written_top_left_to_bottom_right;
    procedure should_locate_words_written_bottom_right_to_top_left;
    procedure should_locate_words_written_bottom_left_to_top_right;
    procedure should_locate_words_written_top_right_to_bottom_left;
    procedure should_fail_to_locate_a_word_that_is_not_in_the_puzzle;
    procedure should_fail_to_locate_words_that_are_not_on_horizontal_vertical_or_diagonal_lines;
    procedure should_not_concatenate_different_lines_to_find_a_horizontal_word;
    procedure should_not_wrap_around_horizontally_to_find_a_word;
    procedure should_not_wrap_around_vertically_to_find_a_word;
  end;

implementation

uses WordSearch;

// b4057815-0d01-41f0-9119-6a91f54b2a0a
procedure WordSearchTest.should_accept_an_initial_game_grid_and_a_target_search_word;
const
  grid : TStrArray = (
    'jefblpepre'
  );
  wordsToSearchFor : TStrArray = (
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should accept an initial game grid and a target search word', false, results[0].found);
end;

// 6b22bcc5-6cbf-4674-931b-d2edbff73132
procedure WordSearchTest.should_locate_one_word_written_left_to_right;
const
  grid : TStrArray = (
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate one word written left to right', true, results[0].found);
  TapAssertTrue(Self, 'Should locate one word written left to right', 1, results[0].start.row);
  TapAssertTrue(Self, 'Should locate one word written left to right', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate one word written left to right', 1, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate one word written left to right', 7, results[0].finish.column);
end;

// ff462410-434b-442d-9bc3-3360c75f34a8
procedure WordSearchTest.should_locate_the_same_word_written_left_to_right_in_a_different_position;
const
  grid : TStrArray = (
    'mtclojurer'
  );
  wordsToSearchFor : TStrArray = (
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate the same word written left to right in a different position', true, results[0].found);
  TapAssertTrue(Self, 'Should locate the same word written left to right in a different position', 1, results[0].start.row);
  TapAssertTrue(Self, 'Should locate the same word written left to right in a different position', 3, results[0].start.column);
  TapAssertTrue(Self, 'Should locate the same word written left to right in a different position', 1, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate the same word written left to right in a different position', 9, results[0].finish.column);
end;

// a02febae-6347-443e-b99c-ab0afb0b8fca
procedure WordSearchTest.should_locate_a_different_left_to_right_word;
const
  grid : TStrArray = (
    'coffeelplx'
  );
  wordsToSearchFor : TStrArray = (
    'coffee'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // coffee
  TapAssertTrue(Self, 'Should locate a different left to right word', true, results[0].found);
  TapAssertTrue(Self, 'Should locate a different left to right word', 1, results[0].start.row);
  TapAssertTrue(Self, 'Should locate a different left to right word', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate a different left to right word', 1, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate a different left to right word', 6, results[0].finish.column);
end;

// e42e9987-6304-4e13-8232-fa07d5280130
procedure WordSearchTest.should_locate_that_different_left_to_right_word_in_a_different_position;
const
  grid : TStrArray = (
    'xcoffeezlp'
  );
  wordsToSearchFor : TStrArray = (
    'coffee'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // coffee
  TapAssertTrue(Self, 'Should locate that different left to right word in a different position', true, results[0].found);
  TapAssertTrue(Self, 'Should locate that different left to right word in a different position', 1, results[0].start.row);
  TapAssertTrue(Self, 'Should locate that different left to right word in a different position', 2, results[0].start.column);
  TapAssertTrue(Self, 'Should locate that different left to right word in a different position', 1, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate that different left to right word in a different position', 7, results[0].finish.column);
end;

// 9bff3cee-49b9-4775-bdfb-d55b43a70b2f
procedure WordSearchTest.should_locate_a_left_to_right_word_in_two_line_grid;
const
  grid : TStrArray = (
    'jefblpepre',
    'tclojurerm'
  );
  wordsToSearchFor : TStrArray = (
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate a left to right word in two line grid', true, results[0].found);
  TapAssertTrue(Self, 'Should locate a left to right word in two line grid', 2, results[0].start.row);
  TapAssertTrue(Self, 'Should locate a left to right word in two line grid', 2, results[0].start.column);
  TapAssertTrue(Self, 'Should locate a left to right word in two line grid', 2, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate a left to right word in two line grid', 8, results[0].finish.column);
end;

// 851a35fb-f499-4ec1-9581-395a87903a22
procedure WordSearchTest.should_locate_a_left_to_right_word_in_three_line_grid;
const
  grid : TStrArray = (
    'camdcimgtc',
    'jefblpepre',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate a left to right word in three line grid', true, results[0].found);
  TapAssertTrue(Self, 'Should locate a left to right word in three line grid', 3, results[0].start.row);
  TapAssertTrue(Self, 'Should locate a left to right word in three line grid', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate a left to right word in three line grid', 3, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate a left to right word in three line grid', 7, results[0].finish.column);
end;

// 2f3dcf84-ba7d-4b75-8b8d-a3672b32c035
procedure WordSearchTest.should_locate_a_left_to_right_word_in_ten_line_grid;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate a left to right word in ten line grid', true, results[0].found);
  TapAssertTrue(Self, 'Should locate a left to right word in ten line grid', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should locate a left to right word in ten line grid', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate a left to right word in ten line grid', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate a left to right word in ten line grid', 7, results[0].finish.column);
end;

// 006d4856-f365-4e84-a18c-7d129ce9eefb
procedure WordSearchTest.should_locate_that_left_to_right_word_in_a_different_position_in_a_ten_line_grid;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'clojurermt',
    'jalaycalmp'
  );
  wordsToSearchFor : TStrArray = (
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate that left to right word in a different position in a ten line grid', true, results[0].found);
  TapAssertTrue(Self, 'Should locate that left to right word in a different position in a ten line grid', 9, results[0].start.row);
  TapAssertTrue(Self, 'Should locate that left to right word in a different position in a ten line grid', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate that left to right word in a different position in a ten line grid', 9, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate that left to right word in a different position in a ten line grid', 7, results[0].finish.column);
end;

// eff7ac9f-ff11-443e-9747-40850c12ab60
procedure WordSearchTest.should_locate_a_different_left_to_right_word_in_a_ten_line_grid;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'fortranftw',
    'alxhpburyi',
    'clojurermt',
    'jalaycalmp'
  );
  wordsToSearchFor : TStrArray = (
    'fortran'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // fortran
  TapAssertTrue(Self, 'Should locate a different left to right word in a ten line grid', true, results[0].found);
  TapAssertTrue(Self, 'Should locate a different left to right word in a ten line grid', 7, results[0].start.row);
  TapAssertTrue(Self, 'Should locate a different left to right word in a ten line grid', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate a different left to right word in a ten line grid', 7, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate a different left to right word in a ten line grid', 7, results[0].finish.column);
end;

// dea39f86-8c67-4164-8884-13bfc48bd13b
procedure WordSearchTest.should_locate_multiple_words;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'fortranftw',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'fortran',
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // fortran
  TapAssertTrue(Self, 'Should locate multiple words', true, results[0].found);
  TapAssertTrue(Self, 'Should locate multiple words', 7, results[0].start.row);
  TapAssertTrue(Self, 'Should locate multiple words', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate multiple words', 7, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate multiple words', 7, results[0].finish.column);
  // clojure
  TapAssertTrue(Self, 'Should locate multiple words', true, results[1].found);
  TapAssertTrue(Self, 'Should locate multiple words', 10, results[1].start.row);
  TapAssertTrue(Self, 'Should locate multiple words', 1, results[1].start.column);
  TapAssertTrue(Self, 'Should locate multiple words', 10, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate multiple words', 7, results[1].finish.column);
end;

// 29e6a6a5-f80c-48a6-8e68-05bbbe187a09
procedure WordSearchTest.should_locate_a_single_word_written_right_to_left;
const
  grid : TStrArray = (
    'rixilelhrs'
  );
  wordsToSearchFor : TStrArray = (
    'elixir'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // elixir
  TapAssertTrue(Self, 'Should locate a single word written right to left', true, results[0].found);
  TapAssertTrue(Self, 'Should locate a single word written right to left', 1, results[0].start.row);
  TapAssertTrue(Self, 'Should locate a single word written right to left', 6, results[0].start.column);
  TapAssertTrue(Self, 'Should locate a single word written right to left', 1, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate a single word written right to left', 1, results[0].finish.column);
end;

// 3cf34428-b43f-48b6-b332-ea0b8836011d
procedure WordSearchTest.should_locate_multiple_words_written_in_different_horizontal_directions;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'elixir',
    'clojure'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // elixir
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', true, results[0].found);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 5, results[0].start.row);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 6, results[0].start.column);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 5, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 1, results[0].finish.column);
  // clojure
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', true, results[1].found);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 10, results[1].start.row);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 1, results[1].start.column);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 10, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate multiple words written in different horizontal directions', 7, results[1].finish.column);
end;

// 2c8cd344-a02f-464b-93b6-8bf1bd890003
procedure WordSearchTest.should_locate_words_written_top_to_bottom;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure',
    'elixir',
    'ecmascript'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate words written top to bottom', true, results[0].found);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 7, results[0].finish.column);
  // elixir
  TapAssertTrue(Self, 'Should locate words written top to bottom', true, results[1].found);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 5, results[1].start.row);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 6, results[1].start.column);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 5, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 1, results[1].finish.column);
  // ecmascript
  TapAssertTrue(Self, 'Should locate words written top to bottom', true, results[2].found);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 1, results[2].start.row);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 10, results[2].start.column);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 10, results[2].finish.row);
  TapAssertTrue(Self, 'Should locate words written top to bottom', 10, results[2].finish.column);
end;

// 9ee1e43d-e59d-4c32-9a5f-6a22d4a1550f
procedure WordSearchTest.should_locate_words_written_bottom_to_top;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure',
    'elixir',
    'ecmascript',
    'rust'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate words written bottom to top', true, results[0].found);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 7, results[0].finish.column);
  // elixir
  TapAssertTrue(Self, 'Should locate words written bottom to top', true, results[1].found);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 5, results[1].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 6, results[1].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 5, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 1, results[1].finish.column);
  // ecmascript
  TapAssertTrue(Self, 'Should locate words written bottom to top', true, results[2].found);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 1, results[2].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 10, results[2].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 10, results[2].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 10, results[2].finish.column);
  // rust
  TapAssertTrue(Self, 'Should locate words written bottom to top', true, results[3].found);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 5, results[3].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 9, results[3].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 2, results[3].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom to top', 9, results[3].finish.column);
end;

// 6a21a676-f59e-4238-8e88-9f81015afae9
procedure WordSearchTest.should_locate_words_written_top_left_to_bottom_right;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure',
    'elixir',
    'ecmascript',
    'rust',
    'java'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', true, results[0].found);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 7, results[0].finish.column);
  // elixir
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', true, results[1].found);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 5, results[1].start.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 6, results[1].start.column);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 5, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 1, results[1].finish.column);
  // ecmascript
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', true, results[2].found);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 1, results[2].start.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 10, results[2].start.column);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 10, results[2].finish.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 10, results[2].finish.column);
  // rust
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', true, results[3].found);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 5, results[3].start.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 9, results[3].start.column);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 2, results[3].finish.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 9, results[3].finish.column);
  // java
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', true, results[4].found);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 1, results[4].start.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 1, results[4].start.column);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 4, results[4].finish.row);
  TapAssertTrue(Self, 'Should locate words written top left to bottom right', 4, results[4].finish.column);
end;

// c9125189-1861-4b0d-a14e-ba5dab29ca7c
procedure WordSearchTest.should_locate_words_written_bottom_right_to_top_left;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure',
    'elixir',
    'ecmascript',
    'rust',
    'java',
    'lua'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', true, results[0].found);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 7, results[0].finish.column);
  // elixir
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', true, results[1].found);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 5, results[1].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 6, results[1].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 5, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 1, results[1].finish.column);
  // ecmascript
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', true, results[2].found);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 1, results[2].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 10, results[2].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 10, results[2].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 10, results[2].finish.column);
  // rust
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', true, results[3].found);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 5, results[3].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 9, results[3].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 2, results[3].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 9, results[3].finish.column);
  // java
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', true, results[4].found);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 1, results[4].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 1, results[4].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 4, results[4].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 4, results[4].finish.column);
  // lua
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', true, results[5].found);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 9, results[5].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 8, results[5].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 7, results[5].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom right to top left', 6, results[5].finish.column);
end;

// b19e2149-7fc5-41ec-a8a9-9bc6c6c38c40
procedure WordSearchTest.should_locate_words_written_bottom_left_to_top_right;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure',
    'elixir',
    'ecmascript',
    'rust',
    'java',
    'lua',
    'lisp'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', true, results[0].found);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 7, results[0].finish.column);
  // elixir
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', true, results[1].found);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 5, results[1].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 6, results[1].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 5, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 1, results[1].finish.column);
  // ecmascript
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', true, results[2].found);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 1, results[2].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 10, results[2].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 10, results[2].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 10, results[2].finish.column);
  // rust
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', true, results[3].found);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 5, results[3].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 9, results[3].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 2, results[3].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 9, results[3].finish.column);
  // java
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', true, results[4].found);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 1, results[4].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 1, results[4].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 4, results[4].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 4, results[4].finish.column);
  // lua
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', true, results[5].found);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 9, results[5].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 8, results[5].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 7, results[5].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 6, results[5].finish.column);
  // lisp
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', true, results[6].found);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 6, results[6].start.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 3, results[6].start.column);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 3, results[6].finish.row);
  TapAssertTrue(Self, 'Should locate words written bottom left to top right', 6, results[6].finish.column);
end;

// 69e1d994-a6d7-4e24-9b5a-db76751c2ef8
procedure WordSearchTest.should_locate_words_written_top_right_to_bottom_left;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure',
    'elixir',
    'ecmascript',
    'rust',
    'java',
    'lua',
    'lisp',
    'ruby'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[0].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 7, results[0].finish.column);
  // elixir
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[1].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 5, results[1].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 6, results[1].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 5, results[1].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 1, results[1].finish.column);
  // ecmascript
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[2].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 1, results[2].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 10, results[2].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 10, results[2].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 10, results[2].finish.column);
  // rust
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[3].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 5, results[3].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 9, results[3].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 2, results[3].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 9, results[3].finish.column);
  // java
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[4].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 1, results[4].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 1, results[4].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 4, results[4].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 4, results[4].finish.column);
  // lua
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[5].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 9, results[5].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 8, results[5].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 7, results[5].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 6, results[5].finish.column);
  // lisp
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[6].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 6, results[6].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 3, results[6].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 3, results[6].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 6, results[6].finish.column);
  // ruby
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', true, results[7].found);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 6, results[7].start.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 8, results[7].start.column);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 9, results[7].finish.row);
  TapAssertTrue(Self, 'Should locate words written top right to bottom left', 5, results[7].finish.column);
end;

// 695531db-69eb-463f-8bad-8de3bf5ef198
procedure WordSearchTest.should_fail_to_locate_a_word_that_is_not_in_the_puzzle;
const
  grid : TStrArray = (
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt'
  );
  wordsToSearchFor : TStrArray = (
    'clojure',
    'elixir',
    'ecmascript',
    'rust',
    'java',
    'lua',
    'lisp',
    'ruby',
    'haskell'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // clojure
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[0].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 10, results[0].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 1, results[0].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 10, results[0].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 7, results[0].finish.column);
  // elixir
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[1].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 5, results[1].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 6, results[1].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 5, results[1].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 1, results[1].finish.column);
  // ecmascript
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[2].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 1, results[2].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 10, results[2].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 10, results[2].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 10, results[2].finish.column);
  // rust
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[3].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 5, results[3].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 9, results[3].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 2, results[3].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 9, results[3].finish.column);
  // java
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[4].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 1, results[4].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 1, results[4].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 4, results[4].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 4, results[4].finish.column);
  // lua
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[5].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 9, results[5].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 8, results[5].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 7, results[5].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 6, results[5].finish.column);
  // lisp
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[6].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 6, results[6].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 3, results[6].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 3, results[6].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 6, results[6].finish.column);
  // ruby
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', true, results[7].found);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 6, results[7].start.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 8, results[7].start.column);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 9, results[7].finish.row);
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', 5, results[7].finish.column);
  // haskell
  TapAssertTrue(Self, 'Should fail to locate a word that is not in the puzzle', false, results[8].found);
end;

// fda5b937-6774-4a52-8f89-f64ed833b175
procedure WordSearchTest.should_fail_to_locate_words_that_are_not_on_horizontal_vertical_or_diagonal_lines;
const
  grid : TStrArray = (
    'abc',
    'def'
  );
  wordsToSearchFor : TStrArray = (
    'aef',
    'ced',
    'abf',
    'cbd'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // aef
  TapAssertTrue(Self, 'Should fail to locate words that are not on horizontal, vertical, or diagonal lines', false, results[0].found);
  // ced
  TapAssertTrue(Self, 'Should fail to locate words that are not on horizontal, vertical, or diagonal lines', false, results[1].found);
  // abf
  TapAssertTrue(Self, 'Should fail to locate words that are not on horizontal, vertical, or diagonal lines', false, results[2].found);
  // cbd
  TapAssertTrue(Self, 'Should fail to locate words that are not on horizontal, vertical, or diagonal lines', false, results[3].found);
end;

// 5b6198eb-2847-4e2f-8efe-65045df16bd3
procedure WordSearchTest.should_not_concatenate_different_lines_to_find_a_horizontal_word;
const
  grid : TStrArray = (
    'abceli',
    'xirdfg'
  );
  wordsToSearchFor : TStrArray = (
    'elixir'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // elixir
  TapAssertTrue(Self, 'Should not concatenate different lines to find a horizontal word', false, results[0].found);
end;

// eba44139-a34f-4a92-98e1-bd5f259e5769
procedure WordSearchTest.should_not_wrap_around_horizontally_to_find_a_word;
const
  grid : TStrArray = (
    'silabcdefp'
  );
  wordsToSearchFor : TStrArray = (
    'lisp'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // lisp
  TapAssertTrue(Self, 'Should not wrap around horizontally to find a word', false, results[0].found);
end;

// cd1f0fa8-76af-4167-b105-935f78364dac
procedure WordSearchTest.should_not_wrap_around_vertically_to_find_a_word;
const
  grid : TStrArray = (
    's',
    'u',
    'r',
    'a',
    'b',
    'c',
    't'
  );
  wordsToSearchFor : TStrArray = (
    'rust'
  );
var
  results : TSearchResultArray;
begin
  results := WordSearch.search(grid, wordsToSearchFor);
  // rust
  TapAssertTrue(Self, 'Should not wrap around vertically to find a word', false, results[0].found);
end;

initialization
RegisterTest(WordSearchTest);

end.
