unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils;

function TwoFer(const name : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := name;

end;

end.
