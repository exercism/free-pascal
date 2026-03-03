unit BookStore;

{$mode ObjFPC}{$H+}

interface

function total(const basket : Array Of Smallint) : integer;

implementation

uses SysUtils;

function total(const basket : Array Of Smallint) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(basket);

end;

end.
