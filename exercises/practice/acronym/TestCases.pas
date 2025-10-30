unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  AcronymTest = class(TTestCase)
  published
    procedure basic;
    procedure lowercase_words;
    procedure punctuation;
    procedure all_caps_word;
    procedure punctuation_without_whitespace;
    procedure very_long_abbreviation;
    procedure consecutive_delimiters;
    procedure apostrophes;
    procedure underscore_emphasis;
  end;

implementation

uses Acronym;

// 1e22cceb-c5e4-4562-9afe-aef07ad1eaf4
procedure AcronymTest.basic;
begin
  TapAssertTrue(Self, 'basic', 'PNG', Acronym.abbreviate('Portable Network Graphics'));
end;

// 79ae3889-a5c0-4b01-baf0-232d31180c08
procedure AcronymTest.lowercase_words;
begin
  TapAssertTrue(Self, 'lowercase words', 'ROR', Acronym.abbreviate('Ruby on Rails'));
end;

// ec7000a7-3931-4a17-890e-33ca2073a548
procedure AcronymTest.punctuation;
begin
  TapAssertTrue(Self, 'punctuation', 'FIFO', Acronym.abbreviate('First In, First Out'));
end;

// 32dd261c-0c92-469a-9c5c-b192e94a63b0
procedure AcronymTest.all_caps_word;
begin
  TapAssertTrue(Self, 'all caps word', 'GIMP', Acronym.abbreviate('GNU Image Manipulation Program'));
end;

// ae2ac9fa-a606-4d05-8244-3bcc4659c1d4
procedure AcronymTest.punctuation_without_whitespace;
begin
  TapAssertTrue(Self, 'punctuation without whitespace', 'CMOS', Acronym.abbreviate('Complementary metal-oxide semiconductor'));
end;

// 0e4b1e7c-1a6d-48fb-81a7-bf65eb9e69f9
procedure AcronymTest.very_long_abbreviation;
begin
  TapAssertTrue(Self, 'very long abbreviation', 'ROTFLSHTMDCOALM', Acronym.abbreviate('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'));
end;

// 6a078f49-c68d-4b7b-89af-33a1a98c28cc
procedure AcronymTest.consecutive_delimiters;
begin
  TapAssertTrue(Self, 'consecutive delimiters', 'SIMUFTA', Acronym.abbreviate('Something - I made up from thin air'));
end;

// 5118b4b1-4572-434c-8d57-5b762e57973e
procedure AcronymTest.apostrophes;
begin
  TapAssertTrue(Self, 'apostrophes', 'HC', Acronym.abbreviate('Halley''s Comet'));
end;

// adc12eab-ec2d-414f-b48c-66a4fc06cdef
procedure AcronymTest.underscore_emphasis;
begin
  TapAssertTrue(Self, 'underscore emphasis', 'TRNT', Acronym.abbreviate('The Road _Not_ Taken'));
end;

initialization
RegisterTest(AcronymTest);

end.
