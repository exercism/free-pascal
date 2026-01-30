unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TCipherFunction = function(const phrase : string; const a, b : longword) : string;

  AffineCipherTest = class(TTestCase)
  published
    procedure encode_yes;
    procedure encode_no;
    procedure encode_omg;
    procedure encode_o_m_g;
    procedure encode_mindblowingly;
    procedure encode_numbers;
    procedure encode_deep_thought;
    procedure encode_all_the_letters;
    procedure encode_with_a_not_coprime_to_m;
    procedure decode_exercism;
    procedure decode_a_sentence;
    procedure decode_numbers;
    procedure decode_all_the_letters;
    procedure decode_with_no_spaces_in_input;
    procedure decode_with_too_many_spaces;
    procedure decode_with_a_not_coprime_to_m;
  end;

implementation

uses AffineCipher;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const Expected : string    ;
  const cipherFunction : TCipherFunction ;
  const phrase   : string    ;
  const a        : longword  ;
  const b        : longword
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    cipherFunction(phrase, a, b);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 2ee1d9af-1c43-416c-b41b-cefd7d4d2b2a
procedure AffineCipherTest.encode_yes;
begin
  TapAssertTrue(Self, 'encode yes', 'xbt', AffineCipher.encode('yes', 5, 7));
end;

// 785bade9-e98b-4d4f-a5b0-087ba3d7de4b
procedure AffineCipherTest.encode_no;
begin
  TapAssertTrue(Self, 'encode no', 'fu', AffineCipher.encode('no', 15, 18));
end;

// 2854851c-48fb-40d8-9bf6-8f192ed25054
procedure AffineCipherTest.encode_omg;
begin
  TapAssertTrue(Self, 'encode OMG', 'lvz', AffineCipher.encode('OMG', 21, 3));
end;

// bc0c1244-b544-49dd-9777-13a770be1bad
procedure AffineCipherTest.encode_o_m_g;
begin
  TapAssertTrue(Self, 'encode O M G', 'hjp', AffineCipher.encode('O M G', 25, 47));
end;

// 381a1a20-b74a-46ce-9277-3778625c9e27
procedure AffineCipherTest.encode_mindblowingly;
begin
  TapAssertTrue(Self, 'encode mindblowingly', 'rzcwa gnxzc dgt', AffineCipher.encode('mindblowingly', 11, 15));
end;

// 6686f4e2-753b-47d4-9715-876fdc59029d
procedure AffineCipherTest.encode_numbers;
begin
  TapAssertTrue(Self, 'encode numbers', 'jqgjc rw123 jqgjc rw', AffineCipher.encode('Testing,1 2 3, testing.', 3, 4));
end;

// ae23d5bd-30a8-44b6-afbe-23c8c0c7faa3
procedure AffineCipherTest.encode_deep_thought;
begin
  TapAssertTrue(Self, 'encode deep thought', 'iynia fdqfb ifje', AffineCipher.encode('Truth is fiction.', 5, 17));
end;

// c93a8a4d-426c-42ef-9610-76ded6f7ef57
procedure AffineCipherTest.encode_all_the_letters;
begin
  TapAssertTrue(Self, 'encode all the letters', 'swxtj npvyk lruol iejdc blaxk swxmh qzglf', AffineCipher.encode('The quick brown fox jumps over the lazy dog.', 17, 33));
end;

// 0673638a-4375-40bd-871c-fb6a2c28effb
procedure AffineCipherTest.encode_with_a_not_coprime_to_m;
begin
  TapAssertExpectionMessage(Self, 'encode with a not coprime to m', 'a and m must be coprime.', @AffineCipher.encode, 'This is a test.', 6, 17);
end;

// 3f0ac7e2-ec0e-4a79-949e-95e414953438
procedure AffineCipherTest.decode_exercism;
begin
  TapAssertTrue(Self, 'decode exercism', 'exercism', AffineCipher.decode('tytgn fjr', 3, 7));
end;

// 241ee64d-5a47-4092-a5d7-7939d259e077
procedure AffineCipherTest.decode_a_sentence;
begin
  TapAssertTrue(Self, 'decode a sentence', 'anobstacleisoftenasteppingstone', AffineCipher.decode('qdwju nqcro muwhn odqun oppmd aunwd o', 19, 16));
end;

// 33fb16a1-765a-496f-907f-12e644837f5e
procedure AffineCipherTest.decode_numbers;
begin
  TapAssertTrue(Self, 'decode numbers', 'testing123testing', AffineCipher.decode('odpoz ub123 odpoz ub', 25, 7));
end;

// 20bc9dce-c5ec-4db6-a3f1-845c776bcbf7
procedure AffineCipherTest.decode_all_the_letters;
begin
  TapAssertTrue(Self, 'decode all the letters', 'thequickbrownfoxjumpsoverthelazydog', AffineCipher.decode('swxtj npvyk lruol iejdc blaxk swxmh qzglf', 17, 33));
end;

// 623e78c0-922d-49c5-8702-227a3e8eaf81
procedure AffineCipherTest.decode_with_no_spaces_in_input;
begin
  TapAssertTrue(Self, 'decode with no spaces in input', 'thequickbrownfoxjumpsoverthelazydog', AffineCipher.decode('swxtjnpvyklruoliejdcblaxkswxmhqzglf', 17, 33));
end;

// 58fd5c2a-1fd9-4563-a80a-71cff200f26f
procedure AffineCipherTest.decode_with_too_many_spaces;
begin
  TapAssertTrue(Self, 'decode with too many spaces', 'jollygreengiant', AffineCipher.decode('vszzm    cly   yd cg    qdp', 15, 16));
end;

// b004626f-c186-4af9-a3f4-58f74cdb86d5
procedure AffineCipherTest.decode_with_a_not_coprime_to_m;
begin
  TapAssertExpectionMessage(Self, 'decode with a not coprime to m', 'a and m must be coprime.', @AffineCipher.decode, 'Test', 13, 5);
end;

initialization
RegisterTest(AffineCipherTest);

end.
