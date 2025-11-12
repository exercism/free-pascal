unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  BottleSongTest = class(TTestCase)
  published
    procedure first_generic_verse;
    procedure last_generic_verse;
    procedure verse_with_2_bottles;
    procedure verse_with_1_bottle;
    procedure first_two_verses;
    procedure last_three_verses;
    procedure all_verses;
  end;

implementation

uses BottleSong;

// d4ccf8fc-01dc-48c0-a201-4fbeb30f2d03
procedure BottleSongTest.first_generic_verse;
begin
  TapAssertTrue(Self, 'first generic verse', 'Ten green bottles hanging on the wall,' + #10 + 'Ten green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be nine green bottles hanging on the wall.', BottleSong.recite(10, 1));
end;

// 0f0aded3-472a-4c64-b842-18d4f1f5f030
procedure BottleSongTest.last_generic_verse;
begin
  TapAssertTrue(Self, 'last generic verse', 'Three green bottles hanging on the wall,' + #10 + 'Three green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be two green bottles hanging on the wall.', BottleSong.recite(3, 1));
end;

// f61f3c97-131f-459e-b40a-7428f3ed99d9
procedure BottleSongTest.verse_with_2_bottles;
begin
  TapAssertTrue(Self, 'verse with 2 bottles', 'Two green bottles hanging on the wall,' + #10 + 'Two green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be one green bottle hanging on the wall.', BottleSong.recite(2, 1));
end;

// 05eadba9-5dbd-401e-a7e8-d17cc9baa8e0
procedure BottleSongTest.verse_with_1_bottle;
begin
  TapAssertTrue(Self, 'verse with 1 bottle', 'One green bottle hanging on the wall,' + #10 + 'One green bottle hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be no green bottles hanging on the wall.', BottleSong.recite(1, 1));
end;

// a4a28170-83d6-4dc1-bd8b-319b6abb6a80
procedure BottleSongTest.first_two_verses;
begin
  TapAssertTrue(Self, 'first two verses', 'Ten green bottles hanging on the wall,' + #10 + 'Ten green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be nine green bottles hanging on the wall.' + #10 + '' + #10 + 'Nine green bottles hanging on the wall,' + #10 + 'Nine green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be eight green bottles hanging on the wall.', BottleSong.recite(10, 2));
end;

// 3185d438-c5ac-4ce6-bcd3-02c9ff1ed8db
procedure BottleSongTest.last_three_verses;
begin
  TapAssertTrue(Self, 'last three verses', 'Three green bottles hanging on the wall,' + #10 + 'Three green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be two green bottles hanging on the wall.' + #10 + '' + #10 + 'Two green bottles hanging on the wall,' + #10 + 'Two green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be one green bottle hanging on the wall.' + #10 + '' + #10 + 'One green bottle hanging on the wall,' + #10 + 'One green bottle hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be no green bottles hanging on the wall.', BottleSong.recite(3, 3));
end;

// 28c1584a-0e51-4b65-9ae2-fbc0bf4bbb28
procedure BottleSongTest.all_verses;
begin
  TapAssertTrue(Self, 'all verses', 'Ten green bottles hanging on the wall,' + #10 + 'Ten green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be nine green bottles hanging on the wall.' + #10 + '' + #10 + 'Nine green bottles hanging on the wall,' + #10 + 'Nine green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be eight green bottles hanging on the wall.' + #10 + '' + #10 + 'Eight green bottles hanging on the wall,' + #10 + 'Eight green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be seven green bottles hanging on the wall.' + #10 + '' + #10 + 'Seven green bottles hanging on the wall,' + #10 + 'Seven green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be six green bottles hanging on the wall.' + #10 + '' + #10 + 'Six green bottles hanging on the wall,' + #10 + 'Six green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be five green bottles hanging on the wall.' + #10 + '' + #10 + 'Five green bottles hanging on the wall,' + #10 + 'Five green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be four green bottles hanging on the wall.' + #10 + '' + #10 + 'Four green bottles hanging on the wall,' + #10 + 'Four green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be three green bottles hanging on the wall.' + #10 + '' + #10 + 'Three green bottles hanging on the wall,' + #10 + 'Three green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be two green bottles hanging on the wall.' + #10 + '' + #10 + 'Two green bottles hanging on the wall,' + #10 + 'Two green bottles hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be one green bottle hanging on the wall.' + #10 + '' + #10 + 'One green bottle hanging on the wall,' + #10 + 'One green bottle hanging on the wall,' + #10 + 'And if one green bottle should accidentally fall,' + #10 + 'There''ll be no green bottles hanging on the wall.', BottleSong.recite(10, 10));
end;

initialization
RegisterTest(BottleSongTest);

end.
