unit IntergalacticTransmission;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function TransmitSequence(message : TIntArray) : TIntArray;
function DecodeMessage(message : TIntArray) : TIntArray;

implementation

uses SysUtils;

function Parity(value : Integer) : Integer;
var
  remaining : Integer;
begin
  remaining := value;
  result := 0;
  while remaining <> 0 do
    begin
      remaining := remaining - (remaining and (-remaining));
      result := 1 - result;
    end;
end;

function Encode(value : Integer) : Integer;
begin
  result := (value and $7f);
  result := (result shl 1) or Parity(result);
end;

function TransmitSequence(message : TIntArray) : TIntArray;
var
  i        : Integer;
  data     : Integer = 0;
  count    : Integer = 0;
  sequence : TIntArray = ();
begin
  for i := low(message) to high(message) do
    begin
      data := ((data and $ff) shl 8) or message[i];
      count := count + 1;
      insert(Encode(data shr count), sequence, Length(sequence));
      if count = 7 then
        begin
          count := 0;
          insert(Encode(data), sequence, Length(sequence));
        end;
    end;

  if count <> 0 then
    begin
      insert(Encode(data shl (7 - count)), sequence, Length(sequence));
    end;

  result := sequence;
end;

function DecodeMessage(message : TIntArray) : TIntArray;
var
  i        : Integer;
  value    : Integer = 0;
  data     : Integer = 0;
  count    : Integer = 0;
  sequence : TIntArray = ();
begin
  for i := low(message) to high(message) do
    begin
      value := message[i];
      if Parity(value) <> 0 then
        raise Exception.Create('wrong parity');
      data := ((data and $ff) shl 7) or (value shr 1);
      count := count + 7;
      if count >= 8 then
        begin
          count := count - 8;
          insert((data shr count) and $ff, sequence, Length(sequence));
        end;
    end;

  result := sequence;
end;

end.
