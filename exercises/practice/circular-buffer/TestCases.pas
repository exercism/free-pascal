unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  CircularBufferTest = class(TTestCase)
  published
    procedure reading_empty_buffer_should_fail;
    procedure can_read_an_item_just_written;
    procedure each_item_may_only_be_read_once;
    procedure items_are_read_in_the_order_they_are_written;
    procedure full_buffer_cant_be_written_to;
    procedure a_read_frees_up_capacity_for_another_write;
    procedure read_position_is_maintained_even_across_multiple_writes;
    procedure items_cleared_out_of_buffer_cant_be_read;
    procedure clear_frees_up_capacity_for_another_write;
    procedure clear_does_nothing_on_empty_buffer;
    procedure overwrite_acts_like_write_on_non_full_buffer;
    procedure overwrite_replaces_the_oldest_item_on_full_buffer;
    procedure overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read;
    procedure initial_clear_does_not_affect_wrapping_around;
    procedure can_write_and_read_a_string;
    procedure string_full_buffer_cant_be_written_to;
    procedure overwrite_replaces_oldest_string_on_full_buffer;
    procedure string_buffer_can_be_cleared;
  end;

implementation

uses CircularBuffer;

type
  TIntCircularBuffer = specialize TCircularBuffer<integer>;
  TStrCircularBuffer = specialize TCircularBuffer<string>;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase         ;
  const AMessage : string            ;
  const expected : string            ;
  const buf      : TIntCircularBuffer
); overload;
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    buf.Read;
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase         ;
  const AMessage : string            ;
  const expected : string            ;
  const buf      : TIntCircularBuffer;
  const item     : integer
); overload;
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    buf.Write(item);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase         ;
  const AMessage : string            ;
  const expected : string            ;
  const buf      : TStrCircularBuffer
); overload;
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    buf.Read;
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

procedure TapAssertExpectionMessage(
  ACase          : TTestCase         ;
  const AMessage : string            ;
  const expected : string            ;
  const buf      : TStrCircularBuffer;
  const item     : string
); overload;
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    buf.Write(item);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 28268ed4-4ff3-45f3-820e-895b44d53dfa
procedure CircularBufferTest.reading_empty_buffer_should_fail;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    TapAssertExpectionMessage(Self, 'reading empty buffer should fail', 'buffer is empty', buf);
  finally
    buf.Free;
  end;
end;

// 2e6db04a-58a1-425d-ade8-ac30b5f318f3
procedure CircularBufferTest.can_read_an_item_just_written;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    buf.Write(1);
    TapAssertTrue(Self, 'can read an item just written', 1, buf.Read);
  finally
    buf.Free;
  end;
end;

// 90741fe8-a448-45ce-be2b-de009a24c144
procedure CircularBufferTest.each_item_may_only_be_read_once;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    buf.Write(1);
    TapAssertTrue(Self, 'each item may only be read once', 1, buf.Read);
    TapAssertExpectionMessage(Self, 'each item may only be read once', 'buffer is empty', buf);
  finally
    buf.Free;
  end;
end;

// be0e62d5-da9c-47a8-b037-5db21827baa7
procedure CircularBufferTest.items_are_read_in_the_order_they_are_written;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(2);
  try
    buf.Write(1);
    buf.Write(2);
    TapAssertTrue(Self, 'items are read in the order they are written', 1, buf.Read);
    TapAssertTrue(Self, 'items are read in the order they are written', 2, buf.Read);
  finally
    buf.Free;
  end;
end;

// 2af22046-3e44-4235-bfe6-05ba60439d38
procedure CircularBufferTest.full_buffer_cant_be_written_to;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    buf.Write(1);
    TapAssertExpectionMessage(Self, 'full buffer cant be written to', 'buffer is full', buf, 2);
  finally
    buf.Free;
  end;
end;

// 547d192c-bbf0-4369-b8fa-fc37e71f2393
procedure CircularBufferTest.a_read_frees_up_capacity_for_another_write;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    buf.Write(1);
    TapAssertTrue(Self, 'a read frees up capacity for another write', 1, buf.Read);
    buf.Write(2);
    TapAssertTrue(Self, 'a read frees up capacity for another write', 2, buf.Read);
  finally
    buf.Free;
  end;
end;

// 04a56659-3a81-4113-816b-6ecb659b4471
procedure CircularBufferTest.read_position_is_maintained_even_across_multiple_writes;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(3);
  try
    buf.Write(1);
    buf.Write(2);
    TapAssertTrue(Self, 'read position is maintained even across multiple writes', 1, buf.Read);
    buf.Write(3);
    TapAssertTrue(Self, 'read position is maintained even across multiple writes', 2, buf.Read);
    TapAssertTrue(Self, 'read position is maintained even across multiple writes', 3, buf.Read);
  finally
    buf.Free;
  end;
end;

// 60c3a19a-81a7-43d7-bb0a-f07242b1111f
procedure CircularBufferTest.items_cleared_out_of_buffer_cant_be_read;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    buf.Write(1);
    buf.Clear;
    TapAssertExpectionMessage(Self, 'items cleared out of buffer cant be read', 'buffer is empty', buf);
  finally
    buf.Free;
  end;
end;

// 45f3ae89-3470-49f3-b50e-362e4b330a59
procedure CircularBufferTest.clear_frees_up_capacity_for_another_write;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    buf.Write(1);
    buf.Clear;
    buf.Write(2);
    TapAssertTrue(Self, 'clear frees up capacity for another write', 2, buf.Read);
  finally
    buf.Free;
  end;
end;

// e1ac5170-a026-4725-bfbe-0cf332eddecd
procedure CircularBufferTest.clear_does_nothing_on_empty_buffer;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(1);
  try
    buf.Clear;
    buf.Write(1);
    TapAssertTrue(Self, 'clear does nothing on empty buffer', 1, buf.Read);
  finally
    buf.Free;
  end;
end;

// 9c2d4f26-3ec7-453f-a895-7e7ff8ae7b5b
procedure CircularBufferTest.overwrite_acts_like_write_on_non_full_buffer;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(2);
  try
    buf.Write(1);
    buf.Overwrite(2);
    TapAssertTrue(Self, 'overwrite acts like write on non-full buffer', 1, buf.Read);
    TapAssertTrue(Self, 'overwrite acts like write on non-full buffer', 2, buf.Read);
  finally
    buf.Free;
  end;
end;

// 880f916b-5039-475c-bd5c-83463c36a147
procedure CircularBufferTest.overwrite_replaces_the_oldest_item_on_full_buffer;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(2);
  try
    buf.Write(1);
    buf.Write(2);
    buf.Overwrite(3);
    TapAssertTrue(Self, 'overwrite replaces the oldest item on full buffer', 2, buf.Read);
    TapAssertTrue(Self, 'overwrite replaces the oldest item on full buffer', 3, buf.Read);
  finally
    buf.Free;
  end;
end;

// bfecab5b-aca1-4fab-a2b0-cd4af2b053c3
procedure CircularBufferTest.overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(3);
  try
    buf.Write(1);
    buf.Write(2);
    buf.Write(3);
    TapAssertTrue(Self, 'overwrite replaces the oldest item remaining in buffer following a read', 1, buf.Read);
    buf.Write(4);
    buf.Overwrite(5);
    TapAssertTrue(Self, 'overwrite replaces the oldest item remaining in buffer following a read', 3, buf.Read);
    TapAssertTrue(Self, 'overwrite replaces the oldest item remaining in buffer following a read', 4, buf.Read);
    TapAssertTrue(Self, 'overwrite replaces the oldest item remaining in buffer following a read', 5, buf.Read);
  finally
    buf.Free;
  end;
end;

// 9cebe63a-c405-437b-8b62-e3fdc1ecec5a
procedure CircularBufferTest.initial_clear_does_not_affect_wrapping_around;
var
  buf : TIntCircularBuffer;
begin
  buf := TIntCircularBuffer.Create(2);
  try
    buf.Clear;
    buf.Write(1);
    buf.Write(2);
    buf.Overwrite(3);
    buf.Overwrite(4);
    TapAssertTrue(Self, 'initial clear does not affect wrapping around', 3, buf.Read);
    TapAssertTrue(Self, 'initial clear does not affect wrapping around', 4, buf.Read);
    TapAssertExpectionMessage(Self, 'initial clear does not affect wrapping around', 'buffer is empty', buf);
  finally
    buf.Free;
  end;
end;

// extra-cb-str-01
procedure CircularBufferTest.can_write_and_read_a_string;
var
  buf : TStrCircularBuffer;
begin
  buf := TStrCircularBuffer.Create(1);
  try
    buf.Write('hello');
    TapAssertTrue(Self, 'can write and read a string', 'hello', buf.Read);
  finally
    buf.Free;
  end;
end;

// extra-cb-str-02
procedure CircularBufferTest.string_full_buffer_cant_be_written_to;
var
  buf : TStrCircularBuffer;
begin
  buf := TStrCircularBuffer.Create(1);
  try
    buf.Write('hello');
    TapAssertExpectionMessage(Self, 'string full buffer cant be written to', 'buffer is full', buf, 'world');
  finally
    buf.Free;
  end;
end;

// extra-cb-str-03
procedure CircularBufferTest.overwrite_replaces_oldest_string_on_full_buffer;
var
  buf : TStrCircularBuffer;
begin
  buf := TStrCircularBuffer.Create(2);
  try
    buf.Write('one');
    buf.Write('two');
    buf.Overwrite('three');
    TapAssertTrue(Self, 'overwrite replaces oldest string on full buffer', 'two', buf.Read);
    TapAssertTrue(Self, 'overwrite replaces oldest string on full buffer', 'three', buf.Read);
  finally
    buf.Free;
  end;
end;

// extra-cb-str-04
procedure CircularBufferTest.string_buffer_can_be_cleared;
var
  buf : TStrCircularBuffer;
begin
  buf := TStrCircularBuffer.Create(1);
  try
    buf.Write('hello');
    buf.Clear;
    TapAssertExpectionMessage(Self, 'string buffer can be cleared', 'buffer is empty', buf);
  finally
    buf.Free;
  end;
end;

initialization
RegisterTest(CircularBufferTest);

end.
