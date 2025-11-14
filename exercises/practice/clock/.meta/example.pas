unit Clock;

{$mode ObjFPC}{$H+}

interface

function create(const hour, minute : integer) : string;
function add(const hour, minute, value : integer) : string;
function subtract(const hour, minute, value : integer) : string;
function equal(const hour1, minute1, hour2, minute2 : integer) : boolean;

implementation

uses SysUtils, DateUtils;

function MakeClock(const hour, minute : integer) : TDateTime;
var
  LDateTime : TDateTime;
begin
  LDateTime := TimeOf(EncodeDateTime(1988, 12, 30, 0, 0, 0, 0));
  LDateTime := IncHour(LDateTime, hour);
  LDateTime := IncMinute(LDateTime, minute);
  result := LDateTime;
end;

function create(const hour, minute : integer) : string;
begin
  result := FormatDateTime('hh:mm', MakeClock(hour, minute));
end;

function add(const hour, minute, value : integer) : string;
var
  LDateTime : TDateTime;
begin
  LDateTime := MakeClock(hour, minute);
  LDateTime := IncMinute(LDateTime, value);
  result := FormatDateTime('hh:mm', LDateTime);
end;

function subtract(const hour, minute, value : integer) : string;
begin
  result := add(hour, minute, value * -1);
end;

function equal(const hour1, minute1, hour2, minute2 : integer) : boolean;
begin
  result := create(hour1, minute1) = create(hour2, minute2);
end;

end.
