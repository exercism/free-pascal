unit Transpose;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = array of string;

function transpose(const lines : TStrArray) : TStrArray;

implementation

uses SysUtils;

function transpose(const lines : TStrArray) : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := nil; SetLength(result, length(lines));

end;

end.
