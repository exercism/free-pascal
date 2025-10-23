unit Bob;

{$mode ObjFPC}{$H+}

interface

function response(const HeyBob: string) : string;

implementation

uses SysUtils;

function response(const HeyBob: string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := copy(HeyBob, 1, 0);

end;

end.
