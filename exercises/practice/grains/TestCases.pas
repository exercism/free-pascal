unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  GrainsTest = class(TTestCase)
  published
    procedure grains_on_square_1;
    procedure grains_on_square_2;
    procedure grains_on_square_3;
    procedure grains_on_square_4;
    procedure grains_on_square_16;
    procedure grains_on_square_32;
    procedure grains_on_square_64;
    procedure square_0_is_invalid;
    procedure negative_square_is_invalid;
    procedure square_greater_than_64_is_invalid;
    procedure returns_the_total_number_of_grains_on_the_board;
  end;

implementation

uses Grains;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase;
  const AMessage : string   ;
  const Expected : string   ;
  const ASquare  : integer
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    Grains.square(ASquare);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 9fbde8de-36b2-49de-baf2-cd42d6f28405
procedure GrainsTest.grains_on_square_1;
begin
  TapAssertTrue(Self, 'grains on square 1', 1, Grains.square(1));
end;

// ee1f30c2-01d8-4298-b25d-c677331b5e6d
procedure GrainsTest.grains_on_square_2;
begin
  TapAssertTrue(Self, 'grains on square 2', 2, Grains.square(2));
end;

// 10f45584-2fc3-4875-8ec6-666065d1163b
procedure GrainsTest.grains_on_square_3;
begin
  TapAssertTrue(Self, 'grains on square 3', 4, Grains.square(3));
end;

// a7cbe01b-36f4-4601-b053-c5f6ae055170
procedure GrainsTest.grains_on_square_4;
begin
  TapAssertTrue(Self, 'grains on square 4', 8, Grains.square(4));
end;

// c50acc89-8535-44e4-918f-b848ad2817d4
procedure GrainsTest.grains_on_square_16;
begin
  TapAssertTrue(Self, 'grains on square 16', 32768, Grains.square(16));
end;

// acd81b46-c2ad-4951-b848-80d15ed5a04f
procedure GrainsTest.grains_on_square_32;
begin
  TapAssertTrue(Self, 'grains on square 32', 2147483648, Grains.square(32));
end;

// c73b470a-5efb-4d53-9ac6-c5f6487f227b
procedure GrainsTest.grains_on_square_64;
begin
  TapAssertTrue(Self, 'grains on square 64', 9223372036854775808, Grains.square(64));
end;

// 1d47d832-3e85-4974-9466-5bd35af484e3
procedure GrainsTest.square_0_is_invalid;
begin
  TapAssertExpectionMessage(Self, 'square 0 is invalid', 'square must be between 1 and 64', 0);
end;

// 61974483-eeb2-465e-be54-ca5dde366453
procedure GrainsTest.negative_square_is_invalid;
begin
  TapAssertExpectionMessage(Self, 'negative square is invalid', 'square must be between 1 and 64', -1);
end;

// a95e4374-f32c-45a7-a10d-ffec475c012f
procedure GrainsTest.square_greater_than_64_is_invalid;
begin
  TapAssertExpectionMessage(Self, 'square greater than 64 is invalid', 'square must be between 1 and 64', 65);
end;

// 6eb07385-3659-4b45-a6be-9dc474222750
procedure GrainsTest.returns_the_total_number_of_grains_on_the_board;
begin
  TapAssertTrue(Self, 'returns the total number of grains on the board', 18446744073709551615, Grains.total);
end;

initialization
RegisterTest(GrainsTest);

end.
