unit RailFenceCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const msg : String; const rails : Smallint) : String;
function decode(const msg : String; const rails : Smallint) : String;

implementation

uses SysUtils;

function cipher(const msg : String; const rails : Smallint; decipher: Boolean) : String;
var
  table : Array of Integer = ();
  rail : Integer;
  direction : Integer;
  acc : Integer;
  entry : Integer;
  index : Integer;
begin
  SetLength(table, rails);
  for rail := 0 to rails - 1 do
    table[rail] := 0;

  rail := 0;
  direction := 1;
  for index := 1 to Length(msg) do
    begin
      entry := table[rail] + 1;
      table[rail] := entry;
      rail := rail + direction;
      if (rail = 0) or (rail + 1 = rails) then
        direction := -direction;
    end;

  acc := 0;
  for rail := 0 to rails - 1 do
    begin
      entry := table[rail];
      table[rail] := acc;
      acc := acc + entry;
    end;

  result := '';
  SetLength(result, Length(msg));

  rail := 0;
  direction := 1;
  for index := 1 to Length(msg) do
    begin
      entry := table[rail] + 1;
      if decipher then
        result[index] := msg[entry]
      else
        result[entry] := msg[index];
      table[rail] := entry;
      rail := rail + direction;
      if (rail = 0) or (rail + 1 = rails) then
        direction := -direction;
    end;
end;

function encode(const msg : String; const rails : Smallint) : String;
begin
  result := cipher(msg, rails, false);
end;

function decode(const msg : String; const rails : Smallint) : String;
begin
  result := cipher(msg, rails, true);
end;

end.
