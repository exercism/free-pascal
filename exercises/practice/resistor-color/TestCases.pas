unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ResistorColorTest = class(TTestCase)
  published
    procedure black;
    procedure white;
    procedure orange;
    procedure colors;
  end;

implementation

uses ResistorColor;

// 49eb31c5-10a8-4180-9f7f-fea632ab87ef
procedure ResistorColorTest.black;
begin
  TapAssertTrue(Self, 'Black', 0, ResistorColor.ColorCode('black'));
end;

// 0a4df94b-92da-4579-a907-65040ce0b3fc
procedure ResistorColorTest.white;
begin
  TapAssertTrue(Self, 'White', 9, ResistorColor.ColorCode('white'));
end;

// 5f81608d-f36f-4190-8084-f45116b6f380
procedure ResistorColorTest.orange;
begin
  TapAssertTrue(Self, 'Orange', 3, ResistorColor.ColorCode('orange'));
end;

// 581d68fa-f968-4be2-9f9d-880f2fb73cf7
procedure ResistorColorTest.colors;
begin
  TapAssertTrue(Self, 'Colors', ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'], ResistorColor.colors);
end;

initialization
RegisterTest(ResistorColorTest);

end.
