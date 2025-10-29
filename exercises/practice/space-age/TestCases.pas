unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SpaceAgeTest = class(TTestCase)
  published
    procedure age_on_earth;
    procedure age_on_mercury;
    procedure age_on_venus;
    procedure age_on_mars;
    procedure age_on_jupiter;
    procedure age_on_saturn;
    procedure age_on_uranus;
    procedure age_on_neptune;
    procedure invalid_planet_causes_error;
  end;

implementation

uses Math, SpaceAge;

const epsilon = 0.005;

// 84f609af-5a91-4d68-90a3-9e32d8a5cd34
procedure SpaceAgeTest.age_on_earth;
const expected = 31.69;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Earth', 1000000000);
  message := EncodeJsonMessage('age on Earth', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// ca20c4e9-6054-458c-9312-79679ffab40b
procedure SpaceAgeTest.age_on_mercury;
const expected = 280.88;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Mercury', 2134835688);
  message := EncodeJsonMessage('age on Mercury', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// 502c6529-fd1b-41d3-8fab-65e03082b024
procedure SpaceAgeTest.age_on_venus;
const expected = 9.78;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Venus', 189839836);
  message := EncodeJsonMessage('age on Venus', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// 9ceadf5e-a0d5-4388-9d40-2c459227ceb8
procedure SpaceAgeTest.age_on_mars;
const expected = 35.88;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Mars', 2129871239);
  message := EncodeJsonMessage('age on Mars', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// 42927dc3-fe5e-4f76-a5b5-f737fc19bcde
procedure SpaceAgeTest.age_on_jupiter;
const expected = 2.41;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Jupiter', 901876382);
  message := EncodeJsonMessage('age on Jupiter', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// 8469b332-7837-4ada-b27c-00ee043ebcad
procedure SpaceAgeTest.age_on_saturn;
const expected = 2.15;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Saturn', 2000000000);
  message := EncodeJsonMessage('age on Saturn', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// 999354c1-76f8-4bb5-a672-f317b6436743
procedure SpaceAgeTest.age_on_uranus;
const expected = 0.46;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Uranus', 1210123456);
  message := EncodeJsonMessage('age on Uranus', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// 80096d30-a0d4-4449-903e-a381178355d8
procedure SpaceAgeTest.age_on_neptune;
const expected = 0.35;
var
  actual  : double;
  message : string;
begin
  actual  := SpaceAge.age('Neptune', 1821023456);
  message := EncodeJsonMessage('age on Neptune', expected, actual);
  AssertTrue(message, SameValue(expected, actual, epsilon));
end;

// 57b96e2a-1178-40b7-b34d-f3c9c34e4bf4
procedure SpaceAgeTest.invalid_planet_causes_error;
const expected = 'not a planet';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    SpaceAge.age('Sun', 680804807);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid planet causes error', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(SpaceAgeTest);

end.
