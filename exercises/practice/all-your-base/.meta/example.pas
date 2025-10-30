unit AllYourBase;

{$mode ObjFPC}{$H+}

interface

type IntArray = Array Of Integer;

function rebase(
  const InputBase   : integer;
  const InputDigits : IntArray;
  const OutputBase  : integer
) : IntArray;

implementation

uses Math, SysUtils;

function ToBase10(
  const InputDigits : IntArray;
  const InputBase   : integer
) : UInt64;
var
  number      : uint64;
  i, position : integer;
begin
  number   := 0;
  position := 0;
  for i := high(InputDigits) downto low(InputDigits) do
    begin
      number := number + InputDigits[i]  * InputBase ** position;
      inc(position);
    end;
  result := number;
end;

function ToAnyBase(
  const NumberBase10 : uint64;
  const OutputBase   : integer
) :   IntArray;
var
  TempArr, digits : IntArray;
  i, j   : integer;
  number : uint64;
begin
  TempArr := [];
  digits  := [];
  number  := NumberBase10;
  i      := 0;
  while number > 0 do
    begin
      Insert(number mod OutputBase, TempArr, i);
      number := number div OutputBase;
      inc(i);
    end;
  j := 0;
  for i:=high(TempArr) downto low(TempArr) do
    begin
      insert(TempArr[i], digits, j);
      inc(j);
    end;
  result := digits;
end;

var
  number  : uint64;
  i, nlen : integer;
  digits  : IntArray = ();

function rebase(
  const InputBase   : integer;
  const InputDigits : IntArray;
  const OutputBase  : integer
) : IntArray;
begin
  if InputBase < 2 then
    raise Exception.Create('input base must be >= 2');

  if OutputBase < 2 then
    raise Exception.Create('output base must be >= 2');

  for i := low(InputDigits) to high(InputDigits) do
    begin
      if (InputDigits[i] < 0) or (InputDigits[i] >= InputBase) then
        raise Exception.Create('all digits must satisfy 0 <= d < input base');
    end;

  digits := [];
  number := ToBase10(InputDigits, InputBase);

  if number = 0 then exit([0]);

  if OutputBase <> 10 then
    digits := ToAnyBase(number, OutputBase)
  else
    begin
      digits := [];
      if number = 0 then nlen := 1
      else nlen := floor(log10(number) + 1);
      i := 0;
      while nlen > 0 do
        begin
          insert(number div (10 ** (nlen - 1)), digits, i);
          number := number mod (10 ** (nlen - 1));
          inc(i);
          dec(nlen);
        end;
    end;

  result := digits;
end;

end.
