unit Grep;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function grep(
  const pattern : string;
  const flags   : TStrArray;
  const files   : TStrArray
) : TStrArray;

implementation

uses SysUtils;

function grep(
  const pattern : string;
  const flags   : TStrArray;
  const files   : TStrArray
) : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [pattern, IntToStr(length(flags)), IntToStr(length(files))];

end;

end.
