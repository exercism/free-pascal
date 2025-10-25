unit MatchingBrackets;

{$mode ObjFPC}{$H+}

interface

function IsPaired(const value : string) : boolean;

implementation

uses StrUtils;

function IsPaired(const value : string) : boolean;
var
  i      : integer;
  TmpStr : string;
begin

  TmpStr := '';
  for i := 1 to length(value) do
    begin
      if value[i] in ['{','}','[',']','(',')'] then
        TmpStr := TmpStr + value[i]
    end;

  while (ContainsStr(TmpStr, '{}')) or
        (ContainsStr(TmpStr, '[]')) or
        (ContainsStr(TmpStr, '()')) do
    begin
      TmpStr := ReplaceStr(TmpStr, '{}', '');
      TmpStr := ReplaceStr(TmpStr, '[]', '');
      TmpStr := ReplaceStr(TmpStr, '()', '');
    end;

  result := TmpStr = '';

end;

end.
