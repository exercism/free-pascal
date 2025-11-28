unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  NthPrimeTest = class(TTestCase)
  published
    procedure first_prime;
    procedure second_prime;
    procedure sixth_prime;
    procedure big_prime;
    procedure there_is_no_zeroth_prime;
  end;

implementation

uses NthPrime;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : string;
  const number   : dword
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    NthPrime.prime(number);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 75c65189-8aef-471a-81de-0a90c728160c
procedure NthPrimeTest.first_prime;
begin
  TapAssertTrue(Self, 'first prime', 2, NthPrime.prime(1));
end;

// 2c38804c-295f-4701-b728-56dea34fd1a0
procedure NthPrimeTest.second_prime;
begin
  TapAssertTrue(Self, 'second prime', 3, NthPrime.prime(2));
end;

// 56692534-781e-4e8c-b1f9-3e82c1640259
procedure NthPrimeTest.sixth_prime;
begin
  TapAssertTrue(Self, 'sixth prime', 13, NthPrime.prime(6));
end;

// fce1e979-0edb-412d-93aa-2c744e8f50ff
procedure NthPrimeTest.big_prime;
begin
  TapAssertTrue(Self, 'big prime', 104743, NthPrime.prime(10001));
end;

// bd0a9eae-6df7-485b-a144-80e13c7d55b2
procedure NthPrimeTest.there_is_no_zeroth_prime;
begin
  TapAssertExpectionMessage(Self, 'there is no zeroth prime', 'there is no zeroth prime', 0);
end;

initialization
RegisterTest(NthPrimeTest);

end.
