unit FlattenArray;

{$mode ObjFPC}{$H+}

interface

type
  IElement   = interface;
  TIElements = array of IElement;
  TIntArray  = array of integer;

  IElement = interface
    function isArray : boolean;
    function asInt   : integer;
    function asArr   : TIElements;
  end;

function flatten(const arr : TIElements) : TIntArray;

implementation

uses SysUtils;

function flatten(const arr : TIElements) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := nil; SetLength(result, length(arr));

end;

end.
