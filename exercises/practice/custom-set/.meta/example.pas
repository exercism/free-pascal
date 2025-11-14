unit CustomSet;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function empty(const ASet : TIntArray) : boolean;
function contains(const ASet : TIntArray; const element : integer) : boolean;
function subset(const ASetOne, ASetTwo : TIntArray) : boolean;
function disjoint(const ASetOne, ASetTwo : TIntArray) : boolean;
function equal(const ASetOne, ASetTwo : TIntArray) : boolean;
function add(const ASet : TIntArray; const element : integer) : TIntArray;
function intersection(const ASetOne, ASetTwo: TIntArray) : TIntArray;
function difference(const ASetOne, ASetTwo: TIntArray) : TIntArray;
function union(const ASetOne, ASetTwo : TIntArray) : TIntArray;

implementation

uses SysUtils;

type
  TSetRange = 0..255;
  TIntSet   = Set Of TSetRange;

function ArrayToSet(const ASet : TIntArray) : TIntSet;
var
  i    : integer;
  LSet : TIntSet = [];
begin
  for i := low(ASet) to high(ASet) do include(LSet, ASet[i]);
  result := LSet;
end;

function SetToArray(const ASet : TIntSet) : TIntArray;
var
  LElement : TSetRange;
  LArray   : TIntArray = ();
begin
  for LElement in ASet do insert(LElement, LArray, length(LArray));
  result := LArray;
end;

function empty(const ASet : TIntArray) : boolean;
begin
  result := ArrayToSet(ASet) = [];
end;

function contains(const ASet : TIntArray; const element : integer) : boolean;
begin
  result := [element] <= ArrayToSet(ASet);
end;

function subset(const ASetOne, ASetTwo : TIntArray) : boolean;
begin
  result := ArrayToSet(ASetOne) <= ArrayToSet(ASetTwo);
end;

function disjoint(const ASetOne, ASetTwo : TIntArray) : boolean;
begin
  result := ArrayToSet(ASetOne) * ArrayToSet(ASetTwo) = [];
end;

function equal(const ASetOne, ASetTwo : TIntArray) : boolean;
begin
  result := ArrayToSet(ASetOne) = ArrayToSet(ASetTwo);
end;

function add(const ASet : TIntArray; const element : integer) : TIntArray;
begin
  result := SetToArray([element] + ArrayToSet(ASet));
end;

function intersection(const ASetOne, ASetTwo: TIntArray) : TIntArray;
begin
  result := SetToArray(ArrayToSet(ASetOne) * ArrayToSet(ASetTwo));
end;

function difference(const ASetOne, ASetTwo: TIntArray) : TIntArray;
begin
  result := SetToArray(ArrayToSet(ASetOne) - ArrayToSet(ASetTwo));
end;

function union(const ASetOne, ASetTwo : TIntArray) : TIntArray;
begin
  result := SetToArray(ArrayToSet(ASetOne) + ArrayToSet(ASetTwo));
end;

end.
