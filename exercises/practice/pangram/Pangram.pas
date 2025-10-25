unit Pangram;

{$mode ObjFPC}{$H+}

interface

function IsPangram(const sentence: string) : boolean;

implementation

uses SysUtils;

function IsPangram(const sentence: string) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := sentence <> sentence;

end;

end.
