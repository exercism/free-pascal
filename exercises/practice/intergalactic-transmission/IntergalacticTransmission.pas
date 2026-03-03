unit IntergalacticTransmission;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function TransmitSequence(message : TIntArray) : TIntArray;
function DecodeMessage(message : TIntArray) : TIntArray;

implementation

uses SysUtils;

function TransmitSequence(message : TIntArray) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := message;

end;

function DecodeMessage(message : TIntArray) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := message;

end;

end.
