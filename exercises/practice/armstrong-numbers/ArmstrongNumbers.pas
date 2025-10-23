unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

interface

function IsArmstrongNumber(const number: qword) : boolean;

implementation

uses SysUtils;

function IsArmstrongNumber(const number: qword) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := number <> number;

end;

end.
