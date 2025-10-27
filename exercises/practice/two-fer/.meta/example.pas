unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils;

function TwoFer(const name : string) : string;
var
  who : string;
begin
  who := name;
  if who = '' then who := 'you';
  result := format('One for %s, one for me.', [who]);
end;

end.
