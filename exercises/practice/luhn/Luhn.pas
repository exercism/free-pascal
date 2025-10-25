unit Luhn;

{$mode ObjFPC}{$H+}

interface

function valid(const value : string) : boolean;

implementation

uses SysUtils;

function valid(const value : string) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := value <> value;

end;

end.
