unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  GrepTest = class(TTestCase)
  published
    procedure one_file_one_match_no_flags;
    procedure one_file_one_match_print_line_numbers_flag;
    procedure one_file_one_match_case_insensitive_flag;
    procedure one_file_one_match_print_file_names_flag;
    procedure one_file_one_match_match_entire_lines_flag;
    procedure one_file_one_match_multiple_flags;
    procedure one_file_several_matches_no_flags;
    procedure one_file_several_matches_print_line_numbers_flag;
    procedure one_file_several_matches_match_entire_lines_flag;
    procedure one_file_several_matches_case_insensitive_flag;
    procedure one_file_several_matches_inverted_flag;
    procedure one_file_no_matches_various_flags;
    procedure one_file_one_match_file_flag_takes_precedence_over_line_flag;
    procedure one_file_several_matches_inverted_and_match_entire_lines_flags;
    procedure multiple_files_one_match_no_flags;
    procedure multiple_files_several_matches_no_flags;
    procedure multiple_files_several_matches_print_line_numbers_flag;
    procedure multiple_files_one_match_print_file_names_flag;
    procedure multiple_files_several_matches_case_insensitive_flag;
    procedure multiple_files_several_matches_inverted_flag;
    procedure multiple_files_one_match_match_entire_lines_flag;
    procedure multiple_files_one_match_multiple_flags;
    procedure multiple_files_no_matches_various_flags;
    procedure multiple_files_several_matches_file_flag_takes_precedence_over_line_number_flag;
    procedure multiple_files_several_matches_inverted_and_match_entire_lines_flags;
  end;

implementation

uses Grep;

// 9049fdfd-53a7-4480-a390-375203837d09
procedure GrepTest.one_file_one_match_no_flags;
begin
  TapAssertTrue(Self, 'One file, one match, no flags', ['Of Atreus, Agamemnon, King of men.'], Grep.grep('Agamemnon', [], ['iliad.txt']));
end;

// 76519cce-98e3-46cd-b287-aac31b1d77d6
procedure GrepTest.one_file_one_match_print_line_numbers_flag;
begin
  TapAssertTrue(Self, 'One file, one match, print line numbers flag', ['2:Of that Forbidden Tree, whose mortal tast'], Grep.grep('Forbidden', ['-n'], ['paradise-lost.txt']));
end;

// af0b6d3c-e0e8-475e-a112-c0fc10a1eb30
procedure GrepTest.one_file_one_match_case_insensitive_flag;
begin
  TapAssertTrue(Self, 'One file, one match, case-insensitive flag', ['Of that Forbidden Tree, whose mortal tast'], Grep.grep('FORBIDDEN', ['-i'], ['paradise-lost.txt']));
end;

// ff7af839-d1b8-4856-a53e-99283579b672
procedure GrepTest.one_file_one_match_print_file_names_flag;
begin
  TapAssertTrue(Self, 'One file, one match, print file names flag', ['paradise-lost.txt'], Grep.grep('Forbidden', ['-l'], ['paradise-lost.txt']));
end;

// 8625238a-720c-4a16-81f2-924ec8e222cb
procedure GrepTest.one_file_one_match_match_entire_lines_flag;
begin
  TapAssertTrue(Self, 'One file, one match, match entire lines flag', ['With loss of Eden, till one greater Man'], Grep.grep('With loss of Eden, till one greater Man', ['-x'], ['paradise-lost.txt']));
end;

// 2a6266b3-a60f-475c-a5f5-f5008a717d3e
procedure GrepTest.one_file_one_match_multiple_flags;
begin
  TapAssertTrue(Self, 'One file, one match, multiple flags', ['9:Of Atreus, Agamemnon, King of men.'], Grep.grep('OF ATREUS, Agamemnon, KIng of MEN.', ['-n', '-i', '-x'], ['iliad.txt']));
end;

// 842222da-32e8-4646-89df-0d38220f77a1
procedure GrepTest.one_file_several_matches_no_flags;
begin
  TapAssertTrue(Self, 'One file, several matches, no flags', ['Nor how it may concern my modesty,', 'But I beseech your grace that I may know', 'The worst that may befall me in this case,'], Grep.grep('may', [], ['midsummer-night.txt']));
end;

// 4d84f45f-a1d8-4c2e-a00e-0b292233828c
procedure GrepTest.one_file_several_matches_print_line_numbers_flag;
begin
  TapAssertTrue(Self, 'One file, several matches, print line numbers flag', ['3:Nor how it may concern my modesty,', '5:But I beseech your grace that I may know', '6:The worst that may befall me in this case,'], Grep.grep('may', ['-n'], ['midsummer-night.txt']));
end;

// 0a483b66-315b-45f5-bc85-3ce353a22539
procedure GrepTest.one_file_several_matches_match_entire_lines_flag;
begin
  TapAssertTrue(Self, 'One file, several matches, match entire lines flag', [], Grep.grep('may', ['-x'], ['midsummer-night.txt']));
end;

// 3d2ca86a-edd7-494c-8938-8eeed1c61cfa
procedure GrepTest.one_file_several_matches_case_insensitive_flag;
begin
  TapAssertTrue(Self, 'One file, several matches, case-insensitive flag', ['Achilles sing, O Goddess! Peleus'' son;', 'The noble Chief Achilles from the son'], Grep.grep('ACHILLES', ['-i'], ['iliad.txt']));
end;

// 1f52001f-f224-4521-9456-11120cad4432
procedure GrepTest.one_file_several_matches_inverted_flag;
begin
  TapAssertTrue(Self, 'One file, several matches, inverted flag', ['Brought Death into the World, and all our woe,', 'With loss of Eden, till one greater Man', 'Restore us, and regain the blissful Seat,', 'Sing Heav''nly Muse, that on the secret top', 'That Shepherd, who first taught the chosen Seed'], Grep.grep('Of', ['-v'], ['paradise-lost.txt']));
end;

// 7a6ede7f-7dd5-4364-8bf8-0697c53a09fe
procedure GrepTest.one_file_no_matches_various_flags;
begin
  TapAssertTrue(Self, 'One file, no matches, various flags', [], Grep.grep('Gandalf', ['-n', '-l', '-x', '-i'], ['iliad.txt']));
end;

// 3d3dfc23-8f2a-4e34-abd6-7b7d140291dc
procedure GrepTest.one_file_one_match_file_flag_takes_precedence_over_line_flag;
begin
  TapAssertTrue(Self, 'One file, one match, file flag takes precedence over line flag', ['iliad.txt'], Grep.grep('ten', ['-n', '-l'], ['iliad.txt']));
end;

// 87b21b24-b788-4d6e-a68b-7afe9ca141fe
procedure GrepTest.one_file_several_matches_inverted_and_match_entire_lines_flags;
begin
  TapAssertTrue(Self, 'One file, several matches, inverted and match entire lines flags', ['Achilles sing, O Goddess! Peleus'' son;', 'His wrath pernicious, who ten thousand woes', 'Caused to Achaia''s host, sent many a soul', 'And Heroes gave (so stood the will of Jove)', 'To dogs and to all ravening fowls a prey,', 'When fierce dispute had separated once', 'The noble Chief Achilles from the son', 'Of Atreus, Agamemnon, King of men.'], Grep.grep('Illustrious into Ades premature,', ['-x', '-v'], ['iliad.txt']));
end;

// ba496a23-6149-41c6-a027-28064ed533e5
procedure GrepTest.multiple_files_one_match_no_flags;
begin
  TapAssertTrue(Self, 'Multiple files, one match, no flags', ['iliad.txt:Of Atreus, Agamemnon, King of men.'], Grep.grep('Agamemnon', [], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// 4539bd36-6daa-4bc3-8e45-051f69f5aa95
procedure GrepTest.multiple_files_several_matches_no_flags;
begin
  TapAssertTrue(Self, 'Multiple files, several matches, no flags', ['midsummer-night.txt:Nor how it may concern my modesty,', 'midsummer-night.txt:But I beseech your grace that I may know', 'midsummer-night.txt:The worst that may befall me in this case,'], Grep.grep('may', [], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// 9fb4cc67-78e2-4761-8e6b-a4b57aba1938
procedure GrepTest.multiple_files_several_matches_print_line_numbers_flag;
begin
  TapAssertTrue(Self, 'Multiple files, several matches, print line numbers flag', ['midsummer-night.txt:5:But I beseech your grace that I may know', 'midsummer-night.txt:6:The worst that may befall me in this case,', 'paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast', 'paradise-lost.txt:6:Sing Heav''nly Muse, that on the secret top'], Grep.grep('that', ['-n'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// aeee1ef3-93c7-4cd5-af10-876f8c9ccc73
procedure GrepTest.multiple_files_one_match_print_file_names_flag;
begin
  TapAssertTrue(Self, 'Multiple files, one match, print file names flag', ['iliad.txt', 'paradise-lost.txt'], Grep.grep('who', ['-l'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// d69f3606-7d15-4ddf-89ae-01df198e6b6c
procedure GrepTest.multiple_files_several_matches_case_insensitive_flag;
begin
  TapAssertTrue(Self, 'Multiple files, several matches, case-insensitive flag', ['iliad.txt:Caused to Achaia''s host, sent many a soul', 'iliad.txt:Illustrious into Ades premature,', 'iliad.txt:And Heroes gave (so stood the will of Jove)', 'iliad.txt:To dogs and to all ravening fowls a prey,', 'midsummer-night.txt:I do entreat your grace to pardon me.', 'midsummer-night.txt:In such a presence here to plead my thoughts;', 'midsummer-night.txt:If I refuse to wed Demetrius.', 'paradise-lost.txt:Brought Death into the World, and all our woe,', 'paradise-lost.txt:Restore us, and regain the blissful Seat,', 'paradise-lost.txt:Sing Heav''nly Muse, that on the secret top'], Grep.grep('TO', ['-i'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// 82ef739d-6701-4086-b911-007d1a3deb21
procedure GrepTest.multiple_files_several_matches_inverted_flag;
begin
  TapAssertTrue(Self, 'Multiple files, several matches, inverted flag', ['iliad.txt:Achilles sing, O Goddess! Peleus'' son;', 'iliad.txt:The noble Chief Achilles from the son', 'midsummer-night.txt:If I refuse to wed Demetrius.'], Grep.grep('a', ['-v'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// 77b2eb07-2921-4ea0-8971-7636b44f5d29
procedure GrepTest.multiple_files_one_match_match_entire_lines_flag;
begin
  TapAssertTrue(Self, 'Multiple files, one match, match entire lines flag', ['midsummer-night.txt:But I beseech your grace that I may know'], Grep.grep('But I beseech your grace that I may know', ['-x'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// e53a2842-55bb-4078-9bb5-04ac38929989
procedure GrepTest.multiple_files_one_match_multiple_flags;
begin
  TapAssertTrue(Self, 'Multiple files, one match, multiple flags', ['paradise-lost.txt:4:With loss of Eden, till one greater Man'], Grep.grep('WITH LOSS OF EDEN, TILL ONE GREATER MAN', ['-n', '-i', '-x'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// 9c4f7f9a-a555-4e32-bb06-4b8f8869b2cb
procedure GrepTest.multiple_files_no_matches_various_flags;
begin
  TapAssertTrue(Self, 'Multiple files, no matches, various flags', [], Grep.grep('Frodo', ['-n', '-l', '-x', '-i'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// ba5a540d-bffd-481b-bd0c-d9a30f225e01
procedure GrepTest.multiple_files_several_matches_file_flag_takes_precedence_over_line_number_flag;
begin
  TapAssertTrue(Self, 'Multiple files, several matches, file flag takes precedence over line number flag', ['iliad.txt', 'paradise-lost.txt'], Grep.grep('who', ['-n', '-l'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

// ff406330-2f0b-4b17-9ee4-4b71c31dd6d2
procedure GrepTest.multiple_files_several_matches_inverted_and_match_entire_lines_flags;
begin
  TapAssertTrue(Self, 'Multiple files, several matches, inverted and match entire lines flags', ['iliad.txt:Achilles sing, O Goddess! Peleus'' son;', 'iliad.txt:His wrath pernicious, who ten thousand woes', 'iliad.txt:Caused to Achaia''s host, sent many a soul', 'iliad.txt:And Heroes gave (so stood the will of Jove)', 'iliad.txt:To dogs and to all ravening fowls a prey,', 'iliad.txt:When fierce dispute had separated once', 'iliad.txt:The noble Chief Achilles from the son', 'iliad.txt:Of Atreus, Agamemnon, King of men.', 'midsummer-night.txt:I do entreat your grace to pardon me.', 'midsummer-night.txt:I know not by what power I am made bold,', 'midsummer-night.txt:Nor how it may concern my modesty,', 'midsummer-night.txt:In such a presence here to plead my thoughts;', 'midsummer-night.txt:But I beseech your grace that I may know', 'midsummer-night.txt:The worst that may befall me in this case,', 'midsummer-night.txt:If I refuse to wed Demetrius.', 'paradise-lost.txt:Of Mans First Disobedience, and the Fruit', 'paradise-lost.txt:Of that Forbidden Tree, whose mortal tast', 'paradise-lost.txt:Brought Death into the World, and all our woe,', 'paradise-lost.txt:With loss of Eden, till one greater Man', 'paradise-lost.txt:Restore us, and regain the blissful Seat,', 'paradise-lost.txt:Sing Heav''nly Muse, that on the secret top', 'paradise-lost.txt:Of Oreb, or of Sinai, didst inspire', 'paradise-lost.txt:That Shepherd, who first taught the chosen Seed'], Grep.grep('Illustrious into Ades premature,', ['-x', '-v'], ['iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt']));
end;

initialization
RegisterTest(GrepTest);

end.
