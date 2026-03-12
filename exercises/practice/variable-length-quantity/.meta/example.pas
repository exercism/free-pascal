unit VariableLengthQuantity;

{$mode ObjFPC}{$H+}

interface

type
  TBytes     = array of byte;
  TLongWords = array of longword;

function encode(const integers : TLongWords) : TBytes;
function decode(const bytes : TBytes) : TLongWords;

implementation

uses SysUtils;

function encode(const integers : TLongWords) : TBytes;

  procedure encodeValue(value : longword);
  var
    count, k : integer;
    buf      : array[0..4] of byte;
  begin
    count := 0;
    repeat
      buf[count] := byte(value and $7F);
      inc(count);
      value := value shr 7;
    until value = 0;
    for k := count - 1 downto 1 do
      insert(buf[k] or $80, result, length(result));
    insert(buf[0], result, length(result));
  end;

var
  n : longword;
begin
  result := nil;
  for n in integers do
    encodeValue(n);
end;

function decode(const bytes : TBytes) : TLongWords;
var
  acc : longword;
  b   : byte;
begin
  result := nil;
  acc := 0;
  for b in bytes do
  begin
    acc := (acc shl 7) or longword(b and $7F);
    if b < $80 then
    begin
      insert(acc, result, length(result));
      acc := 0;
    end;
  end;
  if (length(bytes) > 0) and (bytes[high(bytes)] >= $80) then
    raise Exception.Create('incomplete sequence');
end;

end.
