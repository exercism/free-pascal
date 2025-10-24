unit Gigasecond;

{$mode ObjFPC}{$H+}

interface

function add(const moment : string) : string;

implementation

uses SysUtils;

function add(const moment : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := copy(moment, 1, 0);

end;

end.
