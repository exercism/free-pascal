unit Diamond;

{$mode ObjFPC}{$H+}

interface

function rows(const letter : char) : string;

implementation

uses SysUtils, StrUtils, Classes;

function rows(const letter : char) : string;
var
  i           : integer;
  InterSpaces : integer;
  PadSpaces   : integer;
  Diamond     : TStringList;
begin
  Diamond := TStringList.Create;
  Diamond.TextLineBreakStyle := tlbsLF;
  Diamond.SkipLastLineBreak  := true;
  PadSpaces   := (ord(letter) - ord('A')) * 2 + 1;
  Diamond.Add(PadCenter('A', PadSpaces));
  for i := ord('B') to ord(letter) do
    begin
      InterSpaces := (i - ord('A')) * 2 - 1;
      Diamond.Add(
        PadCenter(
          char(i) + StringOfChar(char(32), InterSpaces) + char(i),
          PadSpaces
        )
      );
    end;
  for i := Diamond.Count - 2 downto 0 do Diamond.Add(Diamond[i]);
  result := Diamond.Text;
  Diamond.Free;
end;

end.
