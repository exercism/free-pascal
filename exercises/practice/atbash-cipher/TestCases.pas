unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  AtbashCipherTest = class(TTestCase)
  published
    procedure encode_yes;
    procedure encode_no;
    procedure encode_omg;
    procedure encode_spaces;
    procedure encode_mindblowingly;
    procedure encode_numbers;
    procedure encode_deep_thought;
    procedure encode_all_the_letters;
    procedure decode_exercism;
    procedure decode_a_sentence;
    procedure decode_numbers;
    procedure decode_all_the_letters;
    procedure decode_with_too_many_spaces;
    procedure decode_with_no_spaces;
  end;

implementation

uses AtbashCipher;

// 2f47ebe1-eab9-4d6b-b3c6-627562a31c77
procedure AtbashCipherTest.encode_yes;
begin
  TapAssertTrue(Self, 'encode yes', 'bvh', AtbashCipher.encode('yes'));
end;

// b4ffe781-ea81-4b74-b268-cc58ba21c739
procedure AtbashCipherTest.encode_no;
begin
  TapAssertTrue(Self, 'encode no', 'ml', AtbashCipher.encode('no'));
end;

// 10e48927-24ab-4c4d-9d3f-3067724ace00
procedure AtbashCipherTest.encode_omg;
begin
  TapAssertTrue(Self, 'encode OMG', 'lnt', AtbashCipher.encode('OMG'));
end;

// d59b8bc3-509a-4a9a-834c-6f501b98750b
procedure AtbashCipherTest.encode_spaces;
begin
  TapAssertTrue(Self, 'encode spaces', 'lnt', AtbashCipher.encode('O M G'));
end;

// 31d44b11-81b7-4a94-8b43-4af6a2449429
procedure AtbashCipherTest.encode_mindblowingly;
begin
  TapAssertTrue(Self, 'encode mindblowingly', 'nrmwy oldrm tob', AtbashCipher.encode('mindblowingly'));
end;

// d503361a-1433-48c0-aae0-d41b5baa33ff
procedure AtbashCipherTest.encode_numbers;
begin
  TapAssertTrue(Self, 'encode numbers', 'gvhgr mt123 gvhgr mt', AtbashCipher.encode('Testing,1 2 3, testing.'));
end;

// 79c8a2d5-0772-42d4-b41b-531d0b5da926
procedure AtbashCipherTest.encode_deep_thought;
begin
  TapAssertTrue(Self, 'encode deep thought', 'gifgs rhurx grlm', AtbashCipher.encode('Truth is fiction.'));
end;

// 9ca13d23-d32a-4967-a1fd-6100b8742bab
procedure AtbashCipherTest.encode_all_the_letters;
begin
  TapAssertTrue(Self, 'encode all the letters', 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt', AtbashCipher.encode('The quick brown fox jumps over the lazy dog.'));
end;

// bb50e087-7fdf-48e7-9223-284fe7e69851
procedure AtbashCipherTest.decode_exercism;
begin
  TapAssertTrue(Self, 'decode exercism', 'exercism', AtbashCipher.decode('vcvix rhn'));
end;

// ac021097-cd5d-4717-8907-b0814b9e292c
procedure AtbashCipherTest.decode_a_sentence;
begin
  TapAssertTrue(Self, 'decode a sentence', 'anobstacleisoftenasteppingstone', AtbashCipher.decode('zmlyh gzxov rhlug vmzhg vkkrm thglm v'));
end;

// 18729de3-de74-49b8-b68c-025eaf77f851
procedure AtbashCipherTest.decode_numbers;
begin
  TapAssertTrue(Self, 'decode numbers', 'testing123testing', AtbashCipher.decode('gvhgr mt123 gvhgr mt'));
end;

// 0f30325f-f53b-415d-ad3e-a7a4f63de034
procedure AtbashCipherTest.decode_all_the_letters;
begin
  TapAssertTrue(Self, 'decode all the letters', 'thequickbrownfoxjumpsoverthelazydog', AtbashCipher.decode('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'));
end;

// 39640287-30c6-4c8c-9bac-9d613d1a5674
procedure AtbashCipherTest.decode_with_too_many_spaces;
begin
  TapAssertTrue(Self, 'decode with too many spaces', 'exercism', AtbashCipher.decode('vc vix    r hn'));
end;

// b34edf13-34c0-49b5-aa21-0768928000d5
procedure AtbashCipherTest.decode_with_no_spaces;
begin
  TapAssertTrue(Self, 'decode with no spaces', 'anobstacleisoftenasteppingstone', AtbashCipher.decode('zmlyhgzxovrhlugvmzhgvkkrmthglmv'));
end;

initialization
RegisterTest(AtbashCipherTest);

end.
