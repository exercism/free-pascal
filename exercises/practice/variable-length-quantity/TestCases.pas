unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  VariableLengthQuantityTest = class(TTestCase)
  published
    procedure zero;
    procedure arbitrary_single_byte;
    procedure asymmetric_single_byte;
    procedure largest_single_byte;
    procedure smallest_double_byte;
    procedure arbitrary_double_byte;
    procedure asymmetric_double_byte;
    procedure largest_double_byte;
    procedure smallest_triple_byte;
    procedure arbitrary_triple_byte;
    procedure asymmetric_triple_byte;
    procedure largest_triple_byte;
    procedure smallest_quadruple_byte;
    procedure arbitrary_quadruple_byte;
    procedure asymmetric_quadruple_byte;
    procedure largest_quadruple_byte;
    procedure smallest_quintuple_byte;
    procedure arbitrary_quintuple_byte;
    procedure asymmetric_quintuple_byte;
    procedure maximum_32_bit_integer_input;
    procedure two_single_byte_values;
    procedure two_multi_byte_values;
    procedure many_multi_byte_values;
    procedure one_byte;
    procedure two_bytes;
    procedure three_bytes;
    procedure four_bytes;
    procedure maximum_32_bit_integer;
    procedure incomplete_sequence_causes_error;
    procedure incomplete_sequence_causes_error_even_if_value_is_zero;
    procedure multiple_values;
  end;

implementation

uses VariableLengthQuantity;

function BytesToStr(const bytes : TBytes) : string;
var
  i : integer;
begin
  result := '';
  for i := 0 to high(bytes) do
  begin
    if i > 0 then result := result + ',';
    result := result + '$' + IntToHex(bytes[i], 2);
  end;
end;

function LongWordsToStr(const values : TLongWords) : string;
var
  i : integer;
begin
  result := '';
  for i := 0 to high(values) do
  begin
    if i > 0 then result := result + ',';
    result := result + IntToStr(values[i]);
  end;
end;

procedure TapAssertExceptionMessage(
  ACase          : TTestCase ;
  const AMessage : string    ;
  const expected : string    ;
  const bytes    : TBytes
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    decode(bytes);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 35c9db2e-f781-4c52-b73b-8e76427defd0
procedure VariableLengthQuantityTest.zero;
const
  integers : TLongWords = (0);
  expected : TBytes     = ($00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'zero', BytesToStr(expected), BytesToStr(bytes));
end;

// be44d299-a151-4604-a10e-d4b867f41540
procedure VariableLengthQuantityTest.arbitrary_single_byte;
const
  integers : TLongWords = (64);
  expected : TBytes     = ($40);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'arbitrary single byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 890bc344-cb80-45af-b316-6806a6971e81
procedure VariableLengthQuantityTest.asymmetric_single_byte;
const
  integers : TLongWords = (83);
  expected : TBytes     = ($53);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'asymmetric single byte', BytesToStr(expected), BytesToStr(bytes));
end;

// ea399615-d274-4af6-bbef-a1c23c9e1346
procedure VariableLengthQuantityTest.largest_single_byte;
const
  integers : TLongWords = (127);
  expected : TBytes     = ($7F);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'largest single byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 77b07086-bd3f-4882-8476-8dcafee79b1c
procedure VariableLengthQuantityTest.smallest_double_byte;
const
  integers : TLongWords = (128);
  expected : TBytes     = ($81, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'smallest double byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 63955a49-2690-4e22-a556-0040648d6b2d
procedure VariableLengthQuantityTest.arbitrary_double_byte;
const
  integers : TLongWords = (8192);
  expected : TBytes     = ($C0, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'arbitrary double byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 4977d113-251b-4d10-a3ad-2f5a7756bb58
procedure VariableLengthQuantityTest.asymmetric_double_byte;
const
  integers : TLongWords = (173);
  expected : TBytes     = ($81, $2D);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'asymmetric double byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 29da7031-0067-43d3-83a7-4f14b29ed97a
procedure VariableLengthQuantityTest.largest_double_byte;
const
  integers : TLongWords = (16383);
  expected : TBytes     = ($FF, $7F);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'largest double byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 3345d2e3-79a9-4999-869e-d4856e3a8e01
procedure VariableLengthQuantityTest.smallest_triple_byte;
const
  integers : TLongWords = (16384);
  expected : TBytes     = ($81, $80, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'smallest triple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 5df0bc2d-2a57-4300-a653-a75ee4bd0bee
procedure VariableLengthQuantityTest.arbitrary_triple_byte;
const
  integers : TLongWords = (1048576);
  expected : TBytes     = ($C0, $80, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'arbitrary triple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 6731045f-1e00-4192-b5ae-98b22e17e9f7
procedure VariableLengthQuantityTest.asymmetric_triple_byte;
const
  integers : TLongWords = (120220);
  expected : TBytes     = ($87, $AB, $1C);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'asymmetric triple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// f51d8539-312d-4db1-945c-250222c6aa22
procedure VariableLengthQuantityTest.largest_triple_byte;
const
  integers : TLongWords = (2097151);
  expected : TBytes     = ($FF, $FF, $7F);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'largest triple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// da78228b-544f-47b7-8bfe-d16b35bbe570
procedure VariableLengthQuantityTest.smallest_quadruple_byte;
const
  integers : TLongWords = (2097152);
  expected : TBytes     = ($81, $80, $80, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'smallest quadruple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 11ed3469-a933-46f1-996f-2231e05d7bb6
procedure VariableLengthQuantityTest.arbitrary_quadruple_byte;
const
  integers : TLongWords = (134217728);
  expected : TBytes     = ($C0, $80, $80, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'arbitrary quadruple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// b45ef770-cbba-48c2-bd3c-c6362679516e
procedure VariableLengthQuantityTest.asymmetric_quadruple_byte;
const
  integers : TLongWords = (3503876);
  expected : TBytes     = ($81, $D5, $EE, $04);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'asymmetric quadruple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// d5f3f3c3-e0f1-4e7f-aad0-18a44f223d1c
procedure VariableLengthQuantityTest.largest_quadruple_byte;
const
  integers : TLongWords = (268435455);
  expected : TBytes     = ($FF, $FF, $FF, $7F);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'largest quadruple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 91a18b33-24e7-4bfb-bbca-eca78ff4fc47
procedure VariableLengthQuantityTest.smallest_quintuple_byte;
const
  integers : TLongWords = (268435456);
  expected : TBytes     = ($81, $80, $80, $80, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'smallest quintuple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 5f34ff12-2952-4669-95fe-2d11b693d331
procedure VariableLengthQuantityTest.arbitrary_quintuple_byte;
const
  integers : TLongWords = (4278190080);
  expected : TBytes     = ($8F, $F8, $80, $80, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'arbitrary quintuple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 9be46731-7cd5-415c-b960-48061cbc1154
procedure VariableLengthQuantityTest.asymmetric_quintuple_byte;
const
  integers : TLongWords = (2254790917);
  expected : TBytes     = ($88, $B3, $95, $C2, $05);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'asymmetric quintuple byte', BytesToStr(expected), BytesToStr(bytes));
end;

// 7489694b-88c3-4078-9864-6fe802411009
procedure VariableLengthQuantityTest.maximum_32_bit_integer_input;
const
  integers : TLongWords = (4294967295);
  expected : TBytes     = ($8F, $FF, $FF, $FF, $7F);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'maximum 32-bit integer input', BytesToStr(expected), BytesToStr(bytes));
end;

// f9b91821-cada-4a73-9421-3c81d6ff3661
procedure VariableLengthQuantityTest.two_single_byte_values;
const
  integers : TLongWords = (64, 127);
  expected : TBytes     = ($40, $7F);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'two single-byte values', BytesToStr(expected), BytesToStr(bytes));
end;

// 68694449-25d2-4974-ba75-fa7bb36db212
procedure VariableLengthQuantityTest.two_multi_byte_values;
const
  integers : TLongWords = (16384, 1193046);
  expected : TBytes     = ($81, $80, $00, $C8, $E8, $56);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'two multi-byte values', BytesToStr(expected), BytesToStr(bytes));
end;

// 51a06b5c-de1b-4487-9a50-9db1b8930d85
procedure VariableLengthQuantityTest.many_multi_byte_values;
const
  integers : TLongWords = (8192, 1193046, 268435455, 0, 16383, 16384);
  expected : TBytes     = ($C0, $00, $C8, $E8, $56, $FF, $FF, $FF, $7F, $00, $FF, $7F, $81, $80, $00);
var
  bytes    : TBytes;
begin
  bytes := encode(integers);
  TapAssertTrue(Self, 'many multi-byte values', BytesToStr(expected), BytesToStr(bytes));
end;

// baa73993-4514-4915-bac0-f7f585e0e59a
procedure VariableLengthQuantityTest.one_byte;
const
  bytes    : TBytes     = ($7F);
  expected : TLongWords = (127);
var
  integers : TLongWords;
begin
  integers := decode(bytes);
  TapAssertTrue(Self, 'one byte', LongWordsToStr(expected), LongWordsToStr(integers));
end;

// 72e94369-29f9-46f2-8c95-6c5b7a595aee
procedure VariableLengthQuantityTest.two_bytes;
const
  bytes    : TBytes     = ($C0, $00);
  expected : TLongWords = (8192);
var
  integers : TLongWords;
begin
  integers := decode(bytes);
  TapAssertTrue(Self, 'two bytes', LongWordsToStr(expected), LongWordsToStr(integers));
end;

// df5a44c4-56f7-464e-a997-1db5f63ce691
procedure VariableLengthQuantityTest.three_bytes;
const
  bytes    : TBytes     = ($FF, $FF, $7F);
  expected : TLongWords = (2097151);
var
  integers : TLongWords;
begin
  integers := decode(bytes);
  TapAssertTrue(Self, 'three bytes', LongWordsToStr(expected), LongWordsToStr(integers));
end;

// 1bb58684-f2dc-450a-8406-1f3452aa1947
procedure VariableLengthQuantityTest.four_bytes;
const
  bytes    : TBytes     = ($81, $80, $80, $00);
  expected : TLongWords = (2097152);
var
  integers : TLongWords;
begin
  integers := decode(bytes);
  TapAssertTrue(Self, 'four bytes', LongWordsToStr(expected), LongWordsToStr(integers));
end;

// cecd5233-49f1-4dd1-a41a-9840a40f09cd
procedure VariableLengthQuantityTest.maximum_32_bit_integer;
const
  bytes    : TBytes     = ($8F, $FF, $FF, $FF, $7F);
  expected : TLongWords = (4294967295);
var
  integers : TLongWords;
begin
  integers := decode(bytes);
  TapAssertTrue(Self, 'maximum 32-bit integer', LongWordsToStr(expected), LongWordsToStr(integers));
end;

// e7d74ba3-8b8e-4bcb-858d-d08302e15695
procedure VariableLengthQuantityTest.incomplete_sequence_causes_error;
const
  bytes : TBytes = ($FF);
begin
  TapAssertExceptionMessage(Self, 'incomplete sequence causes error', 'incomplete sequence', bytes);
end;

// aa378291-9043-4724-bc53-aca1b4a3fcb6
procedure VariableLengthQuantityTest.incomplete_sequence_causes_error_even_if_value_is_zero;
const
  bytes : TBytes = ($80);
begin
  TapAssertExceptionMessage(Self, 'incomplete sequence causes error, even if value is zero', 'incomplete sequence', bytes);
end;

// a91e6f5a-c64a-48e3-8a75-ce1a81e0ebee
procedure VariableLengthQuantityTest.multiple_values;
const
  bytes    : TBytes     = ($C0, $00, $C8, $E8, $56, $FF, $FF, $FF, $7F, $00, $FF, $7F, $81, $80, $00);
  expected : TLongWords = (8192, 1193046, 268435455, 0, 16383, 16384);
var
  integers : TLongWords;
begin
  integers := decode(bytes);
  TapAssertTrue(Self, 'multiple values', LongWordsToStr(expected), LongWordsToStr(integers));
end;

initialization
RegisterTest(VariableLengthQuantityTest);

end.
