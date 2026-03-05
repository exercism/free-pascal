unit ResistorColorTrio;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function resistance(const colors : TStrArray) : String;

implementation

uses SysUtils;

function resistance(const colors : TStrArray) : String;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := IntToStr(length(colors));

end;

end.
