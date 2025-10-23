unit AllYourBase;

{$mode ObjFPC}{$H+}

interface

type
  IntArray = array of integer;

function rebase(
  const InputBase   : integer;
  const InputDigits : IntArray;
  const OutputBase  : integer
) : IntArray;

implementation

uses SysUtils;

function rebase(
  const InputBase   : integer;
  const InputDigits : IntArray;
  const OutputBase  : integer
) : IntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [InputBase, length(InputDigits), OutputBase];

end;

end.
