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

uses SpaceAge;

const epsilon = 0.005;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const Expected : string    ;
  const planet   : string    ;
  const seconds  : LongInt
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    SpaceAge.age(planet, seconds);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 84f609af-5a91-4d68-90a3-9e32d8a5cd34
procedure SpaceAgeTest.age_on_earth;
begin
  TapAssertTrue(Self, 'age on Earth', 31.69, SpaceAge.age('Earth', 1000000000), epsilon);
end;

// ca20c4e9-6054-458c-9312-79679ffab40b
procedure SpaceAgeTest.age_on_mercury;
begin
  TapAssertTrue(Self, 'age on Mercury', 280.88, SpaceAge.age('Mercury', 2134835688), epsilon);
end;

// 502c6529-fd1b-41d3-8fab-65e03082b024
procedure SpaceAgeTest.age_on_venus;
begin
  TapAssertTrue(Self, 'age on Venus', 9.78, SpaceAge.age('Venus', 189839836), epsilon);
end;

// 9ceadf5e-a0d5-4388-9d40-2c459227ceb8
procedure SpaceAgeTest.age_on_mars;
begin
  TapAssertTrue(Self, 'age on Mars', 35.88, SpaceAge.age('Mars', 2129871239), epsilon);
end;

// 42927dc3-fe5e-4f76-a5b5-f737fc19bcde
procedure SpaceAgeTest.age_on_jupiter;
begin
  TapAssertTrue(Self, 'age on Jupiter', 2.41, SpaceAge.age('Jupiter', 901876382), epsilon);
end;

// 8469b332-7837-4ada-b27c-00ee043ebcad
procedure SpaceAgeTest.age_on_saturn;
begin
  TapAssertTrue(Self, 'age on Saturn', 2.15, SpaceAge.age('Saturn', 2000000000), epsilon);
end;

// 999354c1-76f8-4bb5-a672-f317b6436743
procedure SpaceAgeTest.age_on_uranus;
begin
  TapAssertTrue(Self, 'age on Uranus', 0.46, SpaceAge.age('Uranus', 1210123456), epsilon);
end;

// 80096d30-a0d4-4449-903e-a381178355d8
procedure SpaceAgeTest.age_on_neptune;
begin
  TapAssertTrue(Self, 'age on Neptune', 0.35, SpaceAge.age('Neptune', 1821023456), epsilon);
end;

// 57b96e2a-1178-40b7-b34d-f3c9c34e4bf4
procedure SpaceAgeTest.invalid_planet_causes_error;
begin
  TapAssertExpectionMessage(Self, 'invalid planet causes error', 'not a planet', 'Sun', 680804807);
end;

initialization
RegisterTest(SpaceAgeTest);

end.
