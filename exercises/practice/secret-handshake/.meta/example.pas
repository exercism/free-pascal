unit SecretHandshake;

{$mode ObjFPC}{$H+}

interface

type 
  TStrArray = Array Of String;

function commands(const number : integer) : TStrArray;

implementation

type 
  TOperation = record
    bit    : integer;
    action : string
  end;               

const 
  OperationList : Array of TOperation = (
    (bit: %00001; action: 'wink'           ),
    (bit: %00010; action: 'double blink'   ),
    (bit: %00100; action: 'close your eyes'),
    (bit: %01000; action: 'jump'           )
 );

function commands(const number : integer) : TStrArray;
var 
  i, idx     : integer;
  operations : TStrArray;
begin
  operations := [];
  for i := low(OperationList) to high(OperationList) do
    begin
      if number and OperationList[i].bit <> 0 then
        begin
          if number and %10000 <> 0 then idx := 0
          else idx := length(operations);
          insert(OperationList[i].action, operations, idx);
        end;
    end;
  result := operations;
end;

end.
