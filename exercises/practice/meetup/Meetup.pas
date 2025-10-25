unit Meetup;

{$mode ObjFPC}{$H+}

interface

function meetup(
  const year, month: integer; const week, ADayOfWeek : string
) : string;

implementation

uses SysUtils;

function meetup(
  const year, month: integer; const week, ADayOfWeek : string
) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.');result:=format('%s%d%s%d',[ADayOfWeek,month,week,year]);

end;

end.
