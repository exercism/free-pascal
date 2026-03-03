unit Rectangles;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function rectangles(
  const strings : TStrArray
) : Integer;

implementation

uses SysUtils;

function rectangles(
  const strings : TStrArray
) : Integer;
var
  rows : Integer;
  columns : Integer;
  top : Integer;
  left : Integer;
  right : Integer;
  bottom : Integer;
  index : Integer;
begin
  result := 0;
  rows := length(strings);
  if rows = 0 then
    exit;
  columns := length(strings[0]);
  if columns = 0 then
    exit;

  for top := low(strings) to high(strings) - 1 do
    for left := 1 to columns - 1 do
      begin
        if strings[top][left] = '+' then
          begin
            right := left + 1;
            while (right <= columns) and ((strings[top][right] = '-') or (strings[top][right] = '+')) do
              begin
                if strings[top][right] = '+' then
                  begin
                    bottom := top + 1;
                    while (bottom < rows) and ((strings[bottom][left] = '|') or (strings[bottom][left] = '+')) and ((strings[bottom][right] = '|') or (strings[bottom][right] = '+')) do
                      begin
                        if (strings[bottom][left] = '+') and (strings[bottom][right] = '+') then
                          begin
                            index := left + 1;
                            while (index < right) and ((strings[bottom][index] = '-') or (strings[bottom][index] = '+')) do
                              index := index + 1;
                            if index = right then
                              result := result + 1;
                          end;
                        bottom := bottom + 1;
                      end;
                  end;
                right := right + 1;
              end;
          end;
      end;
end;

end.
