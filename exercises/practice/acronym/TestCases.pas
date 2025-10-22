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

var message : string;

procedure AcronymTest.basic;
const expected = 'PNG';
var actual  : string;
begin
  // 1e22cceb-c5e4-4562-9afe-aef07ad1eaf4
  actual  := Acronym.abbreviate('Portable Network Graphics');
  message := EncodeJsonMessage('basic', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.lowercase_words;
const expected = 'ROR';
var actual  : string;
begin
  // 79ae3889-a5c0-4b01-baf0-232d31180c08
  actual  := Acronym.abbreviate('Ruby on Rails');
  message := EncodeJsonMessage('lowercase words', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.punctuation;
const expected = 'FIFO';
var actual  : string;
begin
  // ec7000a7-3931-4a17-890e-33ca2073a548
  actual  := Acronym.abbreviate('First In, First Out');
  message := EncodeJsonMessage('punctuation', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.all_caps_word;
const expected = 'GIMP';
var actual  : string;
begin
  // 32dd261c-0c92-469a-9c5c-b192e94a63b0
  actual  := Acronym.abbreviate('GNU Image Manipulation Program');
  message := EncodeJsonMessage('all caps word', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.punctuation_without_whitespace;
const expected = 'CMOS';
var actual  : string;
begin
  // ae2ac9fa-a606-4d05-8244-3bcc4659c1d4
  actual  := Acronym.abbreviate('Complementary metal-oxide semiconductor');
  message := EncodeJsonMessage('punctuation without whitespace', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.very_long_abbreviation;
const expected = 'ROTFLSHTMDCOALM';
var actual  : string;
begin
  // 0e4b1e7c-1a6d-48fb-81a7-bf65eb9e69f9
  actual  := Acronym.abbreviate('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me');
  message := EncodeJsonMessage('very long abbreviation', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.consecutive_delimiters;
const expected = 'SIMUFTA';
var actual  : string;
begin
  // 6a078f49-c68d-4b7b-89af-33a1a98c28cc
  actual  := Acronym.abbreviate('Something - I made up from thin air');
  message := EncodeJsonMessage('consecutive delimiters', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.apostrophes;
const expected = 'HC';
var actual : string;
begin
  // 5118b4b1-4572-434c-8d57-5b762e57973e
  actual  := Acronym.abbreviate('Halley''s Comet');
  message := EncodeJsonMessage('apostrophes', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure AcronymTest.underscore_emphasis;
const expected = 'TRNT';
var actual : string;
begin
  // adc12eab-ec2d-414f-b48c-66a4fc06cdef
  actual  := Acronym.abbreviate('The Road _Not_ Taken');
  message := EncodeJsonMessage('underscore emphasis', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(AcronymTest);

end.
