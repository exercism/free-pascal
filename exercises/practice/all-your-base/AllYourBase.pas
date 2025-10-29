unit AllYourBase;

{$mode ObjFPC}{$H+}

interface

type TIntArray = array of integer;

function rebase(
  const InputBase   : integer;
  const InputDigits : IntArray;
  const OutputBase  : integer
) : TIntArray;

implementation

uses SysUtils;

function rebase(
  const InputBase   : integer;
  const InputDigits : IntArray;
  const OutputBase  : integer
) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [InputBase, length(InputDigits), OutputBase];

end;

end.
