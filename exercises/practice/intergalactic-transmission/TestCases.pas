unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  IntergalacticTransmissionTest = class(TTestCase)
  published
    procedure transmitSequence_empty_message;
    procedure x00_is_transmitted_as_x0000;
    procedure x02_is_transmitted_as_x0300;
    procedure x06_is_transmitted_as_x0600;
    procedure x05_is_transmitted_as_x0581;
    procedure x29_is_transmitted_as_x2881;
    procedure xc001c0de_is_transmitted_as_xc000711be1;
    procedure transmitSequence_six_byte_message;
    procedure transmitSequence_seven_byte_message;
    procedure transmitSequence_eight_byte_message;
    procedure transmitSequence_twenty_byte_message;
    procedure decodeMessage_empty_message;
    procedure decodeMessage_zero_message;
    procedure x0300_is_decoded_to_x02;
    procedure x0581_is_decoded_to_x05;
    procedure x2881_is_decoded_to_x29;
    procedure decodeMessage_first_byte_has_wrong_parity;
    procedure decodeMessage_second_byte_has_wrong_parity;
    procedure xcf4b00_is_decoded_to_xce94;
    procedure xe2566500_is_decoded_to_xe2ad90;
    procedure decodeMessage_six_byte_message;
    procedure decodeMessage_seven_byte_message;
    procedure decodeMessage_last_byte_has_wrong_parity;
    procedure decodeMessage_eight_byte_message;
    procedure decodeMessage_twenty_byte_message;
    procedure decodeMessage_wrong_parity_on_16th_byte;
  end;

implementation

uses IntergalacticTransmission;

procedure TapAssertExpectionMessage(
  ACase             : TTestCase ;
  const AMessage    : string    ;
  const expected    : string    ;
  const message     : TIntArray
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    IntergalacticTransmission.decodeMessage(message)
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// f99d4046-b429-4582-9324-f0bcac7ab51c
procedure IntergalacticTransmissionTest.transmitSequence_empty_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [];
  expect := [];
  TapAssertTrue(Self, 'empty message', expect, IntergalacticTransmission.transmitSequence(message));
end;

// ee27ea2d-8999-4f23-9275-8f6879545f86
procedure IntergalacticTransmissionTest.x00_is_transmitted_as_x0000;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$00];
  expect := [$00,$00];
  TapAssertTrue(Self, '0x00 is transmitted as 0x0000', expect, IntergalacticTransmission.transmitSequence(message));
end;

// 97f27f98-8020-402d-be85-f21ba54a6df0
procedure IntergalacticTransmissionTest.x02_is_transmitted_as_x0300;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$02];
  expect := [$03,$00];
  TapAssertTrue(Self, '0x02 is transmitted as 0x0300', expect, IntergalacticTransmission.transmitSequence(message));
end;

// 24712fb9-0336-4e2f-835e-d2350f29c420
procedure IntergalacticTransmissionTest.x06_is_transmitted_as_x0600;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$06];
  expect := [$06,$00];
  TapAssertTrue(Self, '0x06 is transmitted as 0x0600', expect, IntergalacticTransmission.transmitSequence(message));
end;

// 7630b5a9-dba1-4178-b2a0-4a376f7414e0
procedure IntergalacticTransmissionTest.x05_is_transmitted_as_x0581;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$05];
  expect := [$05,$81];
  TapAssertTrue(Self, '0x05 is transmitted as 0x0581', expect, IntergalacticTransmission.transmitSequence(message));
end;

// ab4fe80b-ef8e-4a99-b4fb-001937af415d
procedure IntergalacticTransmissionTest.x29_is_transmitted_as_x2881;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$29];
  expect := [$28,$81];
  TapAssertTrue(Self, '0x29 is transmitted as 0x2881', expect, IntergalacticTransmission.transmitSequence(message));
end;

// 4e200d84-593b-4449-b7c0-4de1b6a0955e
procedure IntergalacticTransmissionTest.xc001c0de_is_transmitted_as_xc000711be1;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$c0,$01,$c0,$de];
  expect := [$c0,$00,$71,$1b,$e1];
  TapAssertTrue(Self, '0xc001c0de is transmitted as 0xc000711be1', expect, IntergalacticTransmission.transmitSequence(message));
end;

// fbc537e9-6b21-4f4a-8c2b-9cf9b702a9b7
procedure IntergalacticTransmissionTest.transmitSequence_six_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$47,$72,$65,$61,$74,$21];
  expect := [$47,$b8,$99,$ac,$17,$a0,$84];
  TapAssertTrue(Self, 'six byte message', expect, IntergalacticTransmission.transmitSequence(message));
end;

// d5b75adf-b5fc-4f77-b4ab-77653e30f07c
procedure IntergalacticTransmissionTest.transmitSequence_seven_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$47,$72,$65,$61,$74,$31,$21];
  expect := [$47,$b8,$99,$ac,$17,$a0,$c5,$42];
  TapAssertTrue(Self, 'seven byte message', expect, IntergalacticTransmission.transmitSequence(message));
end;

// 6d8b297b-da1d-435e-bcd7-55fbb1400e73
procedure IntergalacticTransmissionTest.transmitSequence_eight_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$c0,$01,$13,$37,$c0,$de,$21,$21];
  expect := [$c0,$00,$44,$66,$7d,$06,$78,$42,$21,$81];
  TapAssertTrue(Self, 'eight byte message', expect, IntergalacticTransmission.transmitSequence(message));
end;

// 54a0642a-d5aa-490c-be89-8e171a0cab6f
procedure IntergalacticTransmissionTest.transmitSequence_twenty_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$45,$78,$65,$72,$63,$69,$73,$6d,$20,$69,$73,$20,$61,$77,$65,$73,$6f,$6d,$65,$21];
  expect := [$44,$bd,$18,$af,$27,$1b,$a5,$e7,$6c,$90,$1b,$2e,$33,$03,$84,$ee,$65,$b8,$db,$ed,$d7,$28,$84];
  TapAssertTrue(Self, 'twenty byte message', expect, IntergalacticTransmission.transmitSequence(message));
end;

// 9a8084dd-3336-474c-90cb-8a852524604d
procedure IntergalacticTransmissionTest.decodeMessage_empty_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [];
  expect := [];
  TapAssertTrue(Self, 'empty message', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 879af739-0094-4736-9127-bd441b1ddbbf
procedure IntergalacticTransmissionTest.decodeMessage_zero_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$00,$00];
  expect := [$00];
  TapAssertTrue(Self, 'zero message', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 7a89eeef-96c5-4329-a246-ec181a8e959a
procedure IntergalacticTransmissionTest.x0300_is_decoded_to_x02;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$03,$00];
  expect := [$02];
  TapAssertTrue(Self, '0x0300 is decoded to 0x02', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 3e515af7-8b62-417f-960c-3454bca7f806
procedure IntergalacticTransmissionTest.x0581_is_decoded_to_x05;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$05,$81];
  expect := [$05];
  TapAssertTrue(Self, '0x0581 is decoded to 0x05', expect, IntergalacticTransmission.decodeMessage(message));
end;

// a1b4a3f7-9f05-4b7a-b86e-d7c6fc3f16a9
procedure IntergalacticTransmissionTest.x2881_is_decoded_to_x29;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$28,$81];
  expect := [$29];
  TapAssertTrue(Self, '0x2881 is decoded to 0x29', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 2e99d617-4c91-4ad5-9217-e4b2447d6e4a
procedure IntergalacticTransmissionTest.decodeMessage_first_byte_has_wrong_parity;
var
  message          : TIntArray;
begin
  message := [$07,$00];
  TapAssertExpectionMessage(Self, 'first byte has wrong parity', 'wrong parity', message);
end;

// 507e212d-3dae-42e8-88b4-2223838ff8d2
procedure IntergalacticTransmissionTest.decodeMessage_second_byte_has_wrong_parity;
var
  message          : TIntArray;
begin
  message := [$03,$68];
  TapAssertExpectionMessage(Self, 'second byte has wrong parity', 'wrong parity', message);
end;

// b985692e-6338-46c7-8cea-bc38996d4dfd
procedure IntergalacticTransmissionTest.xcf4b00_is_decoded_to_xce94;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$cf,$4b,$00];
  expect := [$ce,$94];
  TapAssertTrue(Self, '0xcf4b00 is decoded to 0xce94', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 7a1f4d48-696d-4679-917c-21b7da3ff3fd
procedure IntergalacticTransmissionTest.xe2566500_is_decoded_to_xe2ad90;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$e2,$56,$65,$00];
  expect := [$e2,$ad,$90];
  TapAssertTrue(Self, '0xe2566500 is decoded to 0xe2ad90', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 467549dc-a558-443b-80c5-ff3d4eb305d4
procedure IntergalacticTransmissionTest.decodeMessage_six_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$47,$b8,$99,$ac,$17,$a0,$84];
  expect := [$47,$72,$65,$61,$74,$21];
  TapAssertTrue(Self, 'six byte message', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 1f3be5fb-093a-4661-9951-c1c4781c71ea
procedure IntergalacticTransmissionTest.decodeMessage_seven_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$47,$b8,$99,$ac,$17,$a0,$c5,$42];
  expect := [$47,$72,$65,$61,$74,$31,$21];
  TapAssertTrue(Self, 'seven byte message', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 6065b8b3-9dcd-45c9-918c-b427cfdb28c1
procedure IntergalacticTransmissionTest.decodeMessage_last_byte_has_wrong_parity;
var
  message          : TIntArray;
begin
  message := [$47,$b8,$99,$ac,$17,$a0,$c5,$43];
  TapAssertExpectionMessage(Self, 'last byte has wrong parity', 'wrong parity', message);
end;

// 98af97b7-9cca-4c4c-9de3-f70e227a4cb1
procedure IntergalacticTransmissionTest.decodeMessage_eight_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$c0,$00,$44,$66,$7d,$06,$78,$42,$21,$81];
  expect := [$c0,$01,$13,$37,$c0,$de,$21,$21];
  TapAssertTrue(Self, 'eight byte message', expect, IntergalacticTransmission.decodeMessage(message));
end;

// aa7d4785-2bb9-43a4-a38a-203325c464fb
procedure IntergalacticTransmissionTest.decodeMessage_twenty_byte_message;
var
  message          : TIntArray;
  expect           : TIntArray;
begin
  message := [$44,$bd,$18,$af,$27,$1b,$a5,$e7,$6c,$90,$1b,$2e,$33,$03,$84,$ee,$65,$b8,$db,$ed,$d7,$28,$84];
  expect := [$45,$78,$65,$72,$63,$69,$73,$6d,$20,$69,$73,$20,$61,$77,$65,$73,$6f,$6d,$65,$21];
  TapAssertTrue(Self, 'twenty byte message', expect, IntergalacticTransmission.decodeMessage(message));
end;

// 4c86e034-b066-42ac-8497-48f9bc1723c1
procedure IntergalacticTransmissionTest.decodeMessage_wrong_parity_on_16th_byte;
var
  message          : TIntArray;
begin
  message := [$44,$bd,$18,$af,$27,$1b,$a5,$e7,$6c,$90,$1b,$2e,$33,$03,$84,$ef,$65,$b8,$db,$ed,$d7,$28,$84];
  TapAssertExpectionMessage(Self, 'wrong parity on 16th byte', 'wrong parity', message);
end;

initialization
RegisterTest(IntergalacticTransmissionTest);

end.
