unit Meetup;

{$mode ObjFPC}{$H+}

interface

function meetup(
  const year, month: integer; const week, ADayOfWeek : string
) : string;

implementation

uses SysUtils, DateUtils;

function meetup(
  const year, month: integer; const week, ADayOfWeek : string
) : string;
var 
  ADate               : TDateTime;
  LYear, LMonth, LDay : word;
  LDoWStr, LDateStr   : string;
begin

  ADate := EncodeDate(year, month, 1);

  repeat
    DecodeDate(ADate, LYear, LMonth, LDay);
    if LMonth <> month then break;
    LDoWStr := FormatDateTime('dddd', ADate);
    if LDoWStr = ADayOfWeek then
      begin
        if (week = 'teenth') and (LDay in [13..19]) then
          begin
            LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
            break
          end
        else if week = 'first' then
          begin
            LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
            break
          end
        else if (week = 'second') and (NthDayOfWeek(ADate) = 2) then
          begin
            LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
            break
          end
        else if (week = 'third') and (NthDayOfWeek(ADate) = 3) then
          begin
            LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
            break
          end
        else if (week = 'fourth') and (NthDayOfWeek(ADate) = 4) then
          begin
            LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
            break
          end
        else if week = 'last' then
          LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
      end;
    ADate := IncDay(ADate);
  until false;

  result := LDateStr;

end;

end.
