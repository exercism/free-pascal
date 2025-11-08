unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ProverbTest = class(TTestCase)
  published
    procedure zero_pieces;
    procedure one_piece;
    procedure two_pieces;
    procedure three_pieces;
    procedure full_proverb;
    procedure four_pieces_modernized;
  end;

implementation

uses Proverb;

// e974b73e-7851-484f-8d6d-92e07fe742fc
procedure ProverbTest.zero_pieces;
begin
  TapAssertTrue(Self, 'zero pieces', '', Proverb.recite([]));
end;

// 2fcd5f5e-8b82-4e74-b51d-df28a5e0faa4
procedure ProverbTest.one_piece;
begin
  TapAssertTrue(Self, 'one piece', 'And all for the want of a nail.', Proverb.recite(['nail']));
end;

// d9d0a8a1-d933-46e2-aa94-eecf679f4b0e
procedure ProverbTest.two_pieces;
begin
  TapAssertTrue(Self, 'two pieces', 'For want of a nail the shoe was lost.' + #10 + 'And all for the want of a nail.', Proverb.recite(['nail', 'shoe']));
end;

// c95ef757-5e94-4f0d-a6cb-d2083f5e5a83
procedure ProverbTest.three_pieces;
begin
  TapAssertTrue(Self, 'three pieces', 'For want of a nail the shoe was lost.' + #10 + 'For want of a shoe the horse was lost.' + #10 + 'And all for the want of a nail.', Proverb.recite(['nail', 'shoe', 'horse']));
end;

// 433fb91c-35a2-4d41-aeab-4de1e82b2126
procedure ProverbTest.full_proverb;
begin
  TapAssertTrue(Self, 'full proverb', 'For want of a nail the shoe was lost.' + #10 + 'For want of a shoe the horse was lost.' + #10 + 'For want of a horse the rider was lost.' + #10 + 'For want of a rider the message was lost.' + #10 + 'For want of a message the battle was lost.' + #10 + 'For want of a battle the kingdom was lost.' + #10 + 'And all for the want of a nail.', Proverb.recite(['nail', 'shoe', 'horse', 'rider', 'message', 'battle', 'kingdom']));
end;

// c1eefa5a-e8d9-41c7-91d4-99fab6d6b9f7
procedure ProverbTest.four_pieces_modernized;
begin
  TapAssertTrue(Self, 'four pieces modernized', 'For want of a pin the gun was lost.' + #10 + 'For want of a gun the soldier was lost.' + #10 + 'For want of a soldier the battle was lost.' + #10 + 'And all for the want of a pin.', Proverb.recite(['pin', 'gun', 'soldier', 'battle']));
end;

initialization
RegisterTest(ProverbTest);

end.
