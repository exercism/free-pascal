unit Yacht;

{$mode ObjFPC}{$H+}

interface

type
  TDie = 1..6;
  TCategory = (kYacht, kOnes, kTwos, kThrees, kFours, kFives, kSixes,
               kFullHouse, kFourOfAKind, kLittleStraight, kBigStraight, kChoice);

function score(const category : TCategory; const dice : array of TDie) : integer;

implementation

uses SysUtils;

function score(const category : TCategory; const dice : array of TDie) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := ord(category) + length(dice);

end;

end.
