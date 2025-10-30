unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ResistorColorDuoTest = class(TTestCase)
  published
    procedure brown_and_black;
    procedure blue_and_grey;
    procedure yellow_and_violet;
    procedure white_and_red;
    procedure orange_and_orange;
    procedure ignore_additional_colors;
    procedure black_and_brown_one_digit;
  end;

implementation

uses ResistorColorDuo;

// ce11995a-5b93-4950-a5e9-93423693b2fc
procedure ResistorColorDuoTest.brown_and_black;
begin
  TapAssertTrue(Self, 'Brown and black', 10, ResistorColorDuo.value(['brown', 'black']));
end;

// 7bf82f7a-af23-48ba-a97d-38d59406a920
procedure ResistorColorDuoTest.blue_and_grey;
begin
  TapAssertTrue(Self, 'Blue and grey', 68, ResistorColorDuo.value(['blue', 'grey']));
end;

// f1886361-fdfd-4693-acf8-46726fe24e0c
procedure ResistorColorDuoTest.yellow_and_violet;
begin
  TapAssertTrue(Self, 'Yellow and violet', 47, ResistorColorDuo.value(['yellow', 'violet']));
end;

// b7a6cbd2-ae3c-470a-93eb-56670b305640
procedure ResistorColorDuoTest.white_and_red;
begin
  TapAssertTrue(Self, 'White and red', 92, ResistorColorDuo.value(['white', 'red']));
end;

// 77a8293d-2a83-4016-b1af-991acc12b9fe
procedure ResistorColorDuoTest.orange_and_orange;
begin
  TapAssertTrue(Self, 'Orange and orange', 33, ResistorColorDuo.value(['orange', 'orange']));
end;

// 0c4fb44f-db7c-4d03-afa8-054350f156a8
procedure ResistorColorDuoTest.ignore_additional_colors;
begin
  TapAssertTrue(Self, 'Ignore additional colors', 51, ResistorColorDuo.value(['green', 'brown', 'orange']));
end;

// 4a8ceec5-0ab4-4904-88a4-daf953a5e818
procedure ResistorColorDuoTest.black_and_brown_one_digit;
begin
  TapAssertTrue(Self, 'Black and brown, one-digit', 1, ResistorColorDuo.value(['black', 'brown']));
end;

initialization
RegisterTest(ResistorColorDuoTest);

end.
