unit PhoneNumber;

{$mode ObjFPC}{$H+}

interface

function clean(const phrase : string) : string;

implementation

uses SysUtils;

function clean(const phrase : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := phrase;

end;

end.
