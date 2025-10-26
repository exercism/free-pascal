unit ReverseString;

{$mode ObjFPC}{$H+}

interface

function reverse(const value: string) : string;

implementation

function reverse(const value: string) : string;
var
  TmpStr : string;
  i      : integer;
begin
  TmpStr := '' ;
  for i := length(value) downto 1 do
    TmpStr := TmpStr + value[i];
  result := TmpStr;
end;

end.
