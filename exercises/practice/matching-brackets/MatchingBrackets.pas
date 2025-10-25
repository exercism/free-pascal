unit MatchingBrackets;

{$mode ObjFPC}{$H+}

interface

function IsPaired(const value : string) : boolean;

implementation

uses SysUtils;

function IsPaired(const value : string) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := value <> value;

end;

end.
