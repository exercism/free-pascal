unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  PigLatinTest = class(TTestCase)
  published
    procedure word_beginning_with_a;
    procedure word_beginning_with_e;
    procedure word_beginning_with_i;
    procedure word_beginning_with_o;
    procedure word_beginning_with_u;
    procedure word_beginning_with_a_vowel_and_followed_by_a_qu;
    procedure word_beginning_with_p;
    procedure word_beginning_with_k;
    procedure word_beginning_with_x;
    procedure word_beginning_with_q_without_a_following_u;
    procedure word_beginning_with_consonant_and_vowel_containing_qu;
    procedure word_beginning_with_ch;
    procedure word_beginning_with_qu;
    procedure word_beginning_with_qu_and_a_preceding_consonant;
    procedure word_beginning_with_th;
    procedure word_beginning_with_thr;
    procedure word_beginning_with_sch;
    procedure word_beginning_with_yt;
    procedure word_beginning_with_xr;
    procedure y_is_treated_like_a_consonant_at_the_beginning_of_a_word;
    procedure y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster;
    procedure y_as_second_letter_in_two_letter_word;
    procedure a_whole_phrase;
  end;

implementation

uses PigLatin;

var message : string;

// 11567f84-e8c6-4918-aedb-435f0b73db57
procedure PigLatinTest.word_beginning_with_a;
const expected = 'appleay';
var actual : string;
begin
  actual  := PigLatin.translate('apple');
  message := EncodeJsonMessage('word beginning with a', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f623f581-bc59-4f45-9032-90c3ca9d2d90
procedure PigLatinTest.word_beginning_with_e;
const expected = 'earay';
var actual : string;
begin
  actual  := PigLatin.translate('ear');
  message := EncodeJsonMessage('word beginning with e', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7dcb08b3-23a6-4e8a-b9aa-d4e859450d58
procedure PigLatinTest.word_beginning_with_i;
const expected = 'iglooay';
var actual : string;
begin
  actual  := PigLatin.translate('igloo');
  message := EncodeJsonMessage('word beginning with i', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 0e5c3bff-266d-41c8-909f-364e4d16e09c
procedure PigLatinTest.word_beginning_with_o;
const expected = 'objectay';
var actual : string;
begin
  actual  := PigLatin.translate('object');
  message := EncodeJsonMessage('word beginning with o', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 614ba363-ca3c-4e96-ab09-c7320799723c
procedure PigLatinTest.word_beginning_with_u;
const expected = 'underay';
var actual : string;
begin
  actual  := PigLatin.translate('under');
  message := EncodeJsonMessage('word beginning with u', expected, actual);
  AssertTrue(message, expected = actual);
end;

// bf2538c6-69eb-4fa7-a494-5a3fec911326
procedure PigLatinTest.word_beginning_with_a_vowel_and_followed_by_a_qu;
const expected = 'equalay';
var actual : string;
begin
  actual  := PigLatin.translate('equal');
  message := EncodeJsonMessage('word beginning with a vowel and followed by a qu', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e5be8a01-2d8a-45eb-abb4-3fcc9582a303
procedure PigLatinTest.word_beginning_with_p;
const expected = 'igpay';
var actual : string;
begin
  actual  := PigLatin.translate('pig');
  message := EncodeJsonMessage('word beginning with p', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d36d1e13-a7ed-464d-a282-8820cb2261ce
procedure PigLatinTest.word_beginning_with_k;
const expected = 'oalakay';
var actual : string;
begin
  actual  := PigLatin.translate('koala');
  message := EncodeJsonMessage('word beginning with k', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d838b56f-0a89-4c90-b326-f16ff4e1dddc
procedure PigLatinTest.word_beginning_with_x;
const expected = 'enonxay';
var actual : string;
begin
  actual  := PigLatin.translate('xenon');
  message := EncodeJsonMessage('word beginning with x', expected, actual);
  AssertTrue(message, expected = actual);
end;

// bce94a7a-a94e-4e2b-80f4-b2bb02e40f71
procedure PigLatinTest.word_beginning_with_q_without_a_following_u;
const expected = 'atqay';
var actual : string;
begin
  actual  := PigLatin.translate('qat');
  message := EncodeJsonMessage('word beginning with q without a following u', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e59dbbe8-ccee-4619-a8e9-ce017489bfc0
procedure PigLatinTest.word_beginning_with_consonant_and_vowel_containing_qu;
const expected = 'iquidlay';
var actual : string;
begin
  actual  := PigLatin.translate('liquid');
  message := EncodeJsonMessage('word beginning with consonant and vowel containing qu', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c01e049a-e3e2-451c-bf8e-e2abb7e438b8
procedure PigLatinTest.word_beginning_with_ch;
const expected = 'airchay';
var actual : string;
begin
  actual  := PigLatin.translate('chair');
  message := EncodeJsonMessage('word beginning with ch', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9ba1669e-c43f-4b93-837a-cfc731fd1425
procedure PigLatinTest.word_beginning_with_qu;
const expected = 'eenquay';
var actual : string;
begin
  actual  := PigLatin.translate('queen');
  message := EncodeJsonMessage('word beginning with qu', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 92e82277-d5e4-43d7-8dd3-3a3b316c41f7
procedure PigLatinTest.word_beginning_with_qu_and_a_preceding_consonant;
const expected = 'aresquay';
var actual : string;
begin
  actual  := PigLatin.translate('square');
  message := EncodeJsonMessage('word beginning with qu and a preceding consonant', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 79ae4248-3499-4d5b-af46-5cb05fa073ac
procedure PigLatinTest.word_beginning_with_th;
const expected = 'erapythay';
var actual : string;
begin
  actual  := PigLatin.translate('therapy');
  message := EncodeJsonMessage('word beginning with th', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e0b3ae65-f508-4de3-8999-19c2f8e243e1
procedure PigLatinTest.word_beginning_with_thr;
const expected = 'ushthray';
var actual : string;
begin
  actual  := PigLatin.translate('thrush');
  message := EncodeJsonMessage('word beginning with thr', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 20bc19f9-5a35-4341-9d69-1627d6ee6b43
procedure PigLatinTest.word_beginning_with_sch;
const expected = 'oolschay';
var actual : string;
begin
  actual  := PigLatin.translate('school');
  message := EncodeJsonMessage('word beginning with sch', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 54b796cb-613d-4509-8c82-8fbf8fc0af9e
procedure PigLatinTest.word_beginning_with_yt;
const expected = 'yttriaay';
var actual : string;
begin
  actual  := PigLatin.translate('yttria');
  message := EncodeJsonMessage('word beginning with yt', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8c37c5e1-872e-4630-ba6e-d20a959b67f6
procedure PigLatinTest.word_beginning_with_xr;
const expected = 'xrayay';
var actual : string;
begin
  actual  := PigLatin.translate('xray');
  message := EncodeJsonMessage('word beginning with xr', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a4a36d33-96f3-422c-a233-d4021460ff00
procedure PigLatinTest.y_is_treated_like_a_consonant_at_the_beginning_of_a_word;
const expected = 'ellowyay';
var actual : string;
begin
  actual  := PigLatin.translate('yellow');
  message := EncodeJsonMessage('y is treated like a consonant at the beginning of a word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// adc90017-1a12-4100-b595-e346105042c7
procedure PigLatinTest.y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster;
const expected = 'ythmrhay';
var actual : string;
begin
  actual  := PigLatin.translate('rhythm');
  message := EncodeJsonMessage('y is treated like a vowel at the end of a consonant cluster', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 29b4ca3d-efe5-4a95-9a54-8467f2e5e59a
procedure PigLatinTest.y_as_second_letter_in_two_letter_word;
const expected = 'ymay';
var actual : string;
begin
  actual  := PigLatin.translate('my');
  message := EncodeJsonMessage('y as second letter in two letter word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 44616581-5ce3-4a81-82d0-40c7ab13d2cf
procedure PigLatinTest.a_whole_phrase;
const expected = 'ickquay astfay unray';
var actual : string;
begin
  actual  := PigLatin.translate('quick fast run');
  message := EncodeJsonMessage('a whole phrase', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(PigLatinTest);

end.
