unit Proverb;

{$mode ObjFPC}{$H+}

interface

function recite(const strings : array of string) : string;

implementation

uses SysUtils, Classes;

function recite(const strings : array of string) : string;

var
  i     : integer;
  rhyme : TStringList;
begin
  if length(strings) = 0 then
    begin
      result := '';
      exit;
    end;

  rhyme := TStringList.Create;
  rhyme.TrailingLineBreak := False;
  for i := low(strings) to high(strings) - 1 do
    begin
      rhyme.Add(
        format(
          'For want of a %s the %s was lost.',
          [strings[i], strings[i + 1]]
        )
      );
    end;
  rhyme.Add(format('And all for the want of a %s.', [strings[0]]));
  result := rhyme.Text;
  rhyme.Free;
end;

end.
