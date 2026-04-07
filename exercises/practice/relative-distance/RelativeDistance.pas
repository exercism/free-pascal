unit RelativeDistance;

{$mode ObjFPC}{$H+}

{$WARN 4046 OFF}
{$WARN 5024 OFF}
{$WARN 5062 OFF}
{$WARN 5071 OFF}
{$WARN 6058 OFF}

interface

uses SysUtils, Generics.Collections;

type
  TStrArray   = Array of String;
  TFamilyTree = specialize TDictionary<String, TStrArray>;

function degreeOfSeparation(const familyTree : TFamilyTree;
  const personA, personB : String) : integer;

implementation

function degreeOfSeparation(const familyTree : TFamilyTree;
  const personA, personB : String) : integer;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := -1;
end;

end.
