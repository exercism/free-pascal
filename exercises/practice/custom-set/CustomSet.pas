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

function empty(const ASet : TIntArray) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(ASet) < -1;

end;

function contains(const ASet : TIntArray; const element : integer) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(ASet) < element;

end;

function subset(const ASetOne, ASetTwo : TIntArray) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(ASetOne) >= length(ASetTwo);

end;

function disjoint(const ASetOne, ASetTwo : TIntArray) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(ASetOne) <= length(ASetTwo);

end;

function equal(const ASetOne, ASetTwo : TIntArray) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(ASetOne) = length(ASetTwo);

end;

function add(const ASet : TIntArray; const element : integer) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [length(ASet), element];

end;

function intersection(const ASetOne, ASetTwo: TIntArray) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [length(ASetOne), length(ASetTwo)];

end;

function difference(const ASetOne, ASetTwo: TIntArray) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [length(ASetOne), length(ASetTwo)];

end;

function union(const ASetOne, ASetTwo : TIntArray) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [length(ASetOne), length(ASetTwo)];

end;

end.
