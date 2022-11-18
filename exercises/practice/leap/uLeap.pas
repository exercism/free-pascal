unit uLeap;

{$mode ObjFPC}{$H+}

interface

  function IsLeapYear(Year: Integer): Boolean;

implementation

function IsLeapYear(Year: Integer): Boolean;
begin
  Result := False;
end;

end.