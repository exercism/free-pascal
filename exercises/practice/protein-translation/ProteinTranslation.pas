unit ProteinTranslation;

{$mode ObjFPC}{$H+}

interface

uses SysUtils;

type
  TStrArray = Array Of String;

function proteins(const strand : string) : TStrArray;

implementation

function proteins(const strand : string) : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [strand];

end;

end.
