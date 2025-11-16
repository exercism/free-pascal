unit Diamond;

{$mode ObjFPC}{$H+}

interface

function rows(const letter : char) : string;

implementation

uses SysUtils;

function rows(const letter : char) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := format('"··%s··"', [letter]);

end;

end.
