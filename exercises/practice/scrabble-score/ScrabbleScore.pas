unit ScrabbleScore;

{$mode ObjFPC}{$H+}

interface

function score(const word: string) : integer;

implementation

uses SysUtils;

function score(const word: string) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(word) * -1;
  
end;

end.
