unit Leap;

{$mode ObjFPC}{$H+}

interface

function LeapYear(const year : integer) : boolean;

implementation

function LeapYear(const year : integer) : boolean;
begin
  result := (
    (year mod 400 = 0) or ((year mod 4 = 0) and (year mod 100 <> 0))
  );
end;

end.
