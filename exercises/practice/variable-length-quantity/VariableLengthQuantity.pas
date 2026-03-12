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
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := nil; SetLength(result, length(integers));

end;

function decode(const bytes : TBytes) : TLongWords;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := nil; SetLength(result, length(bytes));

end;

end.
