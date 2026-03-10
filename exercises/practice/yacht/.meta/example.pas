unit Yacht;

{$mode ObjFPC}{$H+}

interface

type
  TDie = 1..6;
  TCategory = (kYacht, kOnes, kTwos, kThrees, kFours, kFives, kSixes,
               kFullHouse, kFourOfAKind, kLittleStraight, kBigStraight, kChoice);

function score(const category : TCategory; const dice : array of TDie) : integer;

implementation

function score(const category : TCategory; const dice : array of TDie) : integer;
var
  counts : array [1..6] of integer;

  procedure setCounts;
  var i : integer;
  begin
    for i := 1 to 6 do
      counts[i] := 0;

    for i := low(dice) to high(dice) do
      inc(counts[dice[i]]);
  end;

  function total : integer;
  var i : integer;
  begin
    result := 0;
    for i := low(dice) to high(dice) do
      inc(result, dice[i]);
  end;

  function yacht : integer;
  begin
    if counts[dice[0]] = 5 then
      result := 50
    else
      result := 0;
  end;

  function fullHouse : integer;
  var
    i        : integer;
    hasTwo   : boolean;
    hasThree : boolean;
  begin
    hasTwo   := false;
    hasThree := false;
    for i := 1 to 6 do
      begin
        if counts[i] = 2 then
          hasTwo := true;
        if counts[i] = 3 then
          hasThree := true;
      end;

    if hasTwo and hasThree then
      result := total
    else
      result := 0;
  end;

  function fourOfAKind : integer;
  var
    i       : integer;
    fourVal : integer;
  begin
    fourVal := 0;
    for i := 1 to 6 do
      if counts[i] >= 4 then
        fourVal := i;

    result := fourVal * 4;
  end;

  function littleStraight : integer;
  begin
    if (counts[1] = 1) and (counts[2] = 1) and (counts[3] = 1) and
       (counts[4] = 1) and (counts[5] = 1) and (counts[6] = 0) then
      result := 30
    else
      result := 0;
  end;

  function bigStraight : integer;
  begin
    if (counts[1] = 0) and (counts[2] = 1) and (counts[3] = 1) and
       (counts[4] = 1) and (counts[5] = 1) and (counts[6] = 1) then
      result := 30
    else
      result := 0;
  end;

begin
  setCounts;
  case category of
    kYacht:          result := yacht;
    kOnes:           result := counts[1] * 1;
    kTwos:           result := counts[2] * 2;
    kThrees:         result := counts[3] * 3;
    kFours:          result := counts[4] * 4;
    kFives:          result := counts[5] * 5;
    kSixes:          result := counts[6] * 6;
    kFullHouse:      result := fullHouse;
    kFourOfAKind:    result := fourOfAKind;
    kLittleStraight: result := littleStraight;
    kBigStraight:    result := bigStraight;
    kChoice:         result := total;
  end;
end;

end.
