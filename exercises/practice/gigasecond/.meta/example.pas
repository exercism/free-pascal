unit Gigasecond;

{$mode ObjFPC}{$H+}

interface

function add(const moment : string) : string;

implementation

uses SysUtils, DateUtils, RegExpr;

const
  seconds : uint64 = 1000000000;

function add(const moment : string) : string;
var
  TmpStr, mask : string;
begin
  TmpStr := moment;
  mask   := ReplaceRegExpr('[0-9]', TmpStr, '#', true);
  if mask = '####-##-##' then TmpStr := TmpStr + 'T00:00:00';
  result := FormatDateTime(
    'YYYY-MM-DD"T"hh:mm:ss',
    IncSecond(ISO8601ToDate(TmpStr), seconds)
  );
end;

end.
