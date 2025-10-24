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

var message : string;

procedure CollatzConjectureTest.zero_steps_for_one;
const expected = 0;
var actual : integer;
begin
  // 540a3d51-e7a6-47a5-92a3-4ad1838f0bfd
  actual  := CollatzConjecture.steps(1);
  message := EncodeJsonMessage('zero steps for one', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure CollatzConjectureTest.divide_if_even;
const expected = 4;
var actual : integer;
begin
  // 3d76a0a6-ea84-444a-821a-f7857c2c1859
  actual  := CollatzConjecture.steps(16);
  message := EncodeJsonMessage('divide if even', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure CollatzConjectureTest.even_and_odd_steps;
const expected = 9;
var actual : integer;
begin
  // 754dea81-123c-429e-b8bc-db20b05a87b9
  actual  := CollatzConjecture.steps(12);
  message := EncodeJsonMessage('even and odd steps', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure CollatzConjectureTest.large_number_of_even_and_odd_steps;
const expected = 152;
var actual : integer;
begin
  // ecfd0210-6f85-44f6-8280-f65534892ff6
  actual  := CollatzConjecture.steps(1000000);
  message := EncodeJsonMessage('large number of even and odd steps', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure CollatzConjectureTest.zero_is_an_error;
const expected = 'Only positive integers are allowed';
var actual : string;
begin
  // 2187673d-77d6-4543-975e-66df6c50e2da
  actual := '';
  try
    CollatzConjecture.steps(0);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('zero is an error', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure CollatzConjectureTest.negative_value_is_an_error;
const expected = 'Only positive integers are allowed';
var actual : string;
begin
  // ec11f479-56bc-47fd-a434-bcd7a31a7a2e
  actual := '';
  try
    CollatzConjecture.steps(-15);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('negative value is an error', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(CollatzConjectureTest);

end.
