unit FlowerField;

{$mode ObjFPC}{$H+}

interface

function annotate(const garden : string) : string;

implementation

uses SysUtils;

function annotate(const garden : string) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := garden;

end;

end.
