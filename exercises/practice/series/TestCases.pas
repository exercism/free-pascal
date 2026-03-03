unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SeriesTest = class(TTestCase)
  published
    procedure slices_of_one_from_one;
    procedure slices_of_one_from_two;
    procedure slices_of_two;
    procedure slices_of_two_overlap;
    procedure slices_can_include_duplicates;
    procedure slices_of_a_long_series;
    procedure slice_length_is_too_large;
    procedure slice_length_is_way_too_large;
    procedure slice_length_cannot_be_zero;
    procedure slice_length_cannot_be_negative;
    procedure empty_series_is_invalid;
  end;

implementation

uses Series;

procedure TapAssertExpectionMessage(
  ACase             : TTestCase ;
  const AMessage    : String    ;
  const Expected    : String    ;
  const series      : String    ;
  const sliceLength : Integer
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    slices(series, sliceLength);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 7ae7a46a-d992-4c2a-9c15-a112d125ebad
procedure SeriesTest.slices_of_one_from_one;
const
  expect : TStrArray = (
    '1'
  );
begin
  TapAssertTrue(Self, 'slices of one from one', expect, Series.slices('1', 1));
end;

// 3143b71d-f6a5-4221-aeae-619f906244d2
procedure SeriesTest.slices_of_one_from_two;
const
  expect : TStrArray = (
    '1',
    '2'
  );
begin
  TapAssertTrue(Self, 'slices of one from two', expect, Series.slices('12', 1));
end;

// dbb68ff5-76c5-4ccd-895a-93dbec6d5805
procedure SeriesTest.slices_of_two;
const
  expect : TStrArray = (
    '35'
  );
begin
  TapAssertTrue(Self, 'slices of two', expect, Series.slices('35', 2));
end;

// 19bbea47-c987-4e11-a7d1-e103442adf86
procedure SeriesTest.slices_of_two_overlap;
const
  expect : TStrArray = (
    '91',
    '14',
    '42'
  );
begin
  TapAssertTrue(Self, 'slices of two overlap', expect, Series.slices('9142', 2));
end;

// 8e17148d-ba0a-4007-a07f-d7f87015d84c
procedure SeriesTest.slices_can_include_duplicates;
const
  expect : TStrArray = (
    '777',
    '777',
    '777',
    '777'
  );
begin
  TapAssertTrue(Self, 'slices can include duplicates', expect, Series.slices('777777', 3));
end;

// bd5b085e-f612-4f81-97a8-6314258278b0
procedure SeriesTest.slices_of_a_long_series;
const
  expect : TStrArray = (
    '91849',
    '18493',
    '84939',
    '49390',
    '93904',
    '39042',
    '90424',
    '04243'
  );
begin
  TapAssertTrue(Self, 'slices of a long series', expect, Series.slices('918493904243', 5));
end;

// 6d235d85-46cf-4fae-9955-14b6efef27cd
procedure SeriesTest.slice_length_is_too_large;
begin
  TapAssertExpectionMessage(Self, 'slice length is too large', 'slice length cannot be greater than series length', '12345', 6);
end;

// d7957455-346d-4e47-8e4b-87ed1564c6d7
procedure SeriesTest.slice_length_is_way_too_large;
begin
  TapAssertExpectionMessage(Self, 'slice length is way too large', 'slice length cannot be greater than series length', '12345', 42);
end;

// d34004ad-8765-4c09-8ba1-ada8ce776806
procedure SeriesTest.slice_length_cannot_be_zero;
begin
  TapAssertExpectionMessage(Self, 'slice length cannot be zero', 'slice length cannot be zero', '12345', 0);
end;

// 10ab822d-8410-470a-a85d-23fbeb549e54
procedure SeriesTest.slice_length_cannot_be_negative;
begin
  TapAssertExpectionMessage(Self, 'slice length cannot be negative', 'slice length cannot be negative', '123', -1);
end;

// c7ed0812-0e4b-4bf3-99c4-28cbbfc246a2
procedure SeriesTest.empty_series_is_invalid;
begin
  TapAssertExpectionMessage(Self, 'empty series is invalid', 'series cannot be empty', '', 1);
end;

initialization
RegisterTest(SeriesTest);

end.
