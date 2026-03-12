unit SaddlePoints;

{$mode ObjFPC}{$H+}

interface

type
  TMatrix = array of array of integer;
  TPoint  = record
    row    : integer;
    column : integer;
  end;
  TPoints = array of TPoint;

function saddlePoints(const matrix : TMatrix) : TPoints;

implementation

uses SysUtils;

function saddlePoints(const matrix : TMatrix) : TPoints;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := nil; SetLength(result, length(matrix));

end;

end.
