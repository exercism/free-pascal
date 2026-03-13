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

function flatten(const arr : TIElements) : TIntArray;

  procedure collect(const elements : TIElements);
  var
    e : IElement;
  begin
    for e in elements do
      begin
        if e = nil then
          continue;

        if e.isArray then
          collect(e.asArr)
        else
          insert(e.asInt, result, length(result));
      end;
  end;

begin
  result := nil;
  collect(arr);
end;

end.
