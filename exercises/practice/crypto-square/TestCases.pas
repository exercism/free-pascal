unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  CryptoSquareTest = class(TTestCase)
  published
    procedure empty_plaintext_results_in_an_empty_ciphertext;
    procedure normalization_results_in_empty_plaintext;
    procedure lowercase;
    procedure remove_spaces;
    procedure remove_punctuation;
    procedure t_9_character_plaintext_results_in_3_chunks_of_3_characters;
    procedure t_8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space;
    procedure t_54_character_plaintext_results_in_8_chunks_the_last_two_with_trailing_spaces;
  end;

implementation

uses CryptoSquare;

// 407c3837-9aa7-4111-ab63-ec54b58e8e9f
procedure CryptoSquareTest.empty_plaintext_results_in_an_empty_ciphertext;
begin
  TapAssertTrue(Self, 'empty plaintext results in an empty ciphertext', '', CryptoSquare.ciphertext(''));
end;

// aad04a25-b8bb-4304-888b-581bea8e0040
procedure CryptoSquareTest.normalization_results_in_empty_plaintext;
begin
  TapAssertTrue(Self, 'normalization results in empty plaintext', '', CryptoSquare.ciphertext('... --- ...'));
end;

// 64131d65-6fd9-4f58-bdd8-4a2370fb481d
procedure CryptoSquareTest.lowercase;
begin
  TapAssertTrue(Self, 'Lowercase', 'a', CryptoSquare.ciphertext('A'));
end;

// 63a4b0ed-1e3c-41ea-a999-f6f26ba447d6
procedure CryptoSquareTest.remove_spaces;
begin
  TapAssertTrue(Self, 'Remove spaces', 'b', CryptoSquare.ciphertext('  b '));
end;

// 1b5348a1-7893-44c1-8197-42d48d18756c
procedure CryptoSquareTest.remove_punctuation;
begin
  TapAssertTrue(Self, 'Remove punctuation', '1', CryptoSquare.ciphertext('@1,%!'));
end;

// 8574a1d3-4a08-4cec-a7c7-de93a164f41a
procedure CryptoSquareTest.t_9_character_plaintext_results_in_3_chunks_of_3_characters;
begin
  TapAssertTrue(Self, '9 character plaintext results in 3 chunks of 3 characters', 'tsf hiu isn', CryptoSquare.ciphertext('This is fun!'));
end;

// a65d3fa1-9e09-43f9-bcec-7a672aec3eae
procedure CryptoSquareTest.t_8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space;
begin
  TapAssertTrue(Self, '8 character plaintext results in 3 chunks, the last one with a trailing space', 'clu hlt io ', CryptoSquare.ciphertext('Chill out.'));
end;

// 33fd914e-fa44-445b-8f38-ff8fbc9fe6e6
procedure CryptoSquareTest.t_54_character_plaintext_results_in_8_chunks_the_last_two_with_trailing_spaces;
begin
  TapAssertTrue(Self, '54 character plaintext results in 8 chunks, the last two with trailing spaces', 'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ', CryptoSquare.ciphertext('If man was meant to stay on the ground, god would have given us roots.'));
end;

initialization
RegisterTest(CryptoSquareTest);

end.
