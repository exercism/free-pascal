unit uLeap;

{$mode ObjFPC}{$H+}

interface

  function IsLeapYear(Year: Integer): Boolean;

implementation

function IsLeapYear(Year: Integer): Boolean;
begin
  Result := ((Year mod 400) = 0) or (((Year mod 4) = 0) and ((Year mod 100) <> 0));
end;

end.