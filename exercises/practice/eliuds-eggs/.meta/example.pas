unit EliudsEggs;

{$mode ObjFPC}{$H+}

interface

function EggCount(const number : uint32) : uint8;

implementation

var
  i, eggs : uint8;

function EggCount(const number : uint32) : uint8;
begin

  eggs := 0;

  for i := 0 to 31 do
    begin
      if ((number and (1 shl i)) <> 0) then inc(eggs);
    end;

  result := eggs;

end;

end.
