unit PerfectNumbers;

{$mode ObjFPC}{$H+}

interface

function classify(const number : integer) : string;

implementation

uses SysUtils;

function classify(const number : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := IntToStr(number);

end;

end.
