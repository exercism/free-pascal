unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  CollatzConjectureTest = class(TTestCase)
  published
    procedure zero_steps_for_one;
    procedure divide_if_even;
    procedure even_and_odd_steps;
    procedure large_number_of_even_and_odd_steps;
    procedure zero_is_an_error;
    procedure negative_value_is_an_error;
  end;

implementation

uses CollatzConjecture;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const Expected : string    ;
  const number   : integer
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    CollatzConjecture.steps(number);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;


// 540a3d51-e7a6-47a5-92a3-4ad1838f0bfd
procedure CollatzConjectureTest.zero_steps_for_one;
begin
  TapAssertTrue(Self, 'zero steps for one', 0, CollatzConjecture.steps(1));
end;

// 3d76a0a6-ea84-444a-821a-f7857c2c1859
procedure CollatzConjectureTest.divide_if_even;
begin
  TapAssertTrue(Self, 'divide if even', 4, CollatzConjecture.steps(16));
end;

// 754dea81-123c-429e-b8bc-db20b05a87b9
procedure CollatzConjectureTest.even_and_odd_steps;
begin
  TapAssertTrue(Self, 'even and odd steps', 9, CollatzConjecture.steps(12));
end;

// ecfd0210-6f85-44f6-8280-f65534892ff6
procedure CollatzConjectureTest.large_number_of_even_and_odd_steps;
begin
  TapAssertTrue(Self, 'large number of even and odd steps', 152, CollatzConjecture.steps(1000000));
end;

// 2187673d-77d6-4543-975e-66df6c50e2da
procedure CollatzConjectureTest.zero_is_an_error;
begin
  TapAssertExpectionMessage(Self, 'zero is an error', 'Only positive integers are allowed', 0);
end;

// ec11f479-56bc-47fd-a434-bcd7a31a7a2e
procedure CollatzConjectureTest.negative_value_is_an_error;
begin
  TapAssertExpectionMessage(Self, 'negative value is an error', 'Only positive integers are allowed', -15);
end;

initialization
RegisterTest(CollatzConjectureTest);

end.
