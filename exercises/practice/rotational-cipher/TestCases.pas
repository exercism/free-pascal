unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RotationalCipherTest = class(TTestCase)
  published
    procedure rotate_a_by_0_same_output_as_input;
    procedure rotate_a_by_1;
    procedure rotate_a_by_26_same_output_as_input;
    procedure rotate_m_by_13;
    procedure rotate_n_by_13_with_wrap_around_alphabet;
    procedure rotate_capital_letters;
    procedure rotate_spaces;
    procedure rotate_numbers;
    procedure rotate_punctuation;
    procedure rotate_all_letters;
  end;

implementation

uses RotationalCipher;

// 74e58a38-e484-43f1-9466-877a7515e10f
procedure RotationalCipherTest.rotate_a_by_0_same_output_as_input;
begin
  TapAssertTrue(Self, 'rotate a by 0, same output as input', 'a', RotationalCipher.rotate('a', 0));
end;

// 7ee352c6-e6b0-4930-b903-d09943ecb8f5
procedure RotationalCipherTest.rotate_a_by_1;
begin
  TapAssertTrue(Self, 'rotate a by 1', 'b', RotationalCipher.rotate('a', 1));
end;

// edf0a733-4231-4594-a5ee-46a4009ad764
procedure RotationalCipherTest.rotate_a_by_26_same_output_as_input;
begin
  TapAssertTrue(Self, 'rotate a by 26, same output as input', 'a', RotationalCipher.rotate('a', 26));
end;

// e3e82cb9-2a5b-403f-9931-e43213879300
procedure RotationalCipherTest.rotate_m_by_13;
begin
  TapAssertTrue(Self, 'rotate m by 13', 'z', RotationalCipher.rotate('m', 13));
end;

// 19f9eb78-e2ad-4da4-8fe3-9291d47c1709
procedure RotationalCipherTest.rotate_n_by_13_with_wrap_around_alphabet;
begin
  TapAssertTrue(Self, 'rotate n by 13 with wrap around alphabet', 'a', RotationalCipher.rotate('n', 13));
end;

// a116aef4-225b-4da9-884f-e8023ca6408a
procedure RotationalCipherTest.rotate_capital_letters;
begin
  TapAssertTrue(Self, 'rotate capital letters', 'TRL', RotationalCipher.rotate('OMG', 5));
end;

// 71b541bb-819c-4dc6-a9c3-132ef9bb737b
procedure RotationalCipherTest.rotate_spaces;
begin
  TapAssertTrue(Self, 'rotate spaces', 'T R L', RotationalCipher.rotate('O M G', 5));
end;

// ef32601d-e9ef-4b29-b2b5-8971392282e6
procedure RotationalCipherTest.rotate_numbers;
begin
  TapAssertTrue(Self, 'rotate numbers', 'Xiwxmrk 1 2 3 xiwxmrk', RotationalCipher.rotate('Testing 1 2 3 testing', 4));
end;

// 32dd74f6-db2b-41a6-b02c-82eb4f93e549
procedure RotationalCipherTest.rotate_punctuation;
begin
  TapAssertTrue(Self, 'rotate punctuation', 'Gzo''n zvo, Bmviyhv!', RotationalCipher.rotate('Let''s eat, Grandma!', 21));
end;

// 9fb93fe6-42b0-46e6-9ec1-0bf0a062d8c9
procedure RotationalCipherTest.rotate_all_letters;
begin
  TapAssertTrue(Self, 'rotate all letters', 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt.', RotationalCipher.rotate('The quick brown fox jumps over the lazy dog.', 13));
end;

initialization
RegisterTest(RotationalCipherTest);

end.
