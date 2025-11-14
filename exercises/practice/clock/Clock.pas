unit Clock;

{$mode ObjFPC}{$H+}

interface

function create(const hour, minute : integer) : string;
function add(const hour, minute, value : integer) : string;
function subtract(const hour, minute, value : integer) : string;
function equal(const hour1, minute1, hour2, minute2 : integer) : boolean;

implementation

uses SysUtils, DateUtils;

function create(const hour, minute : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := format('%d', [hour * minute ]);

end;

function add(const hour, minute, value : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := format('%d', [hour * minute * value]);

end;

function subtract(const hour, minute, value : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := format('%d', [hour * minute * value]);

end;

function equal(const hour1, minute1, hour2, minute2 : integer) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := hour1 * minute1 <> hour2 * minute2;

end;

end.
