unit Bob;

{$mode ObjFPC}{$H+}

interface

function response(const HeyBob: string) : string;

implementation

uses SysUtils;

var
  i                  : integer;
  answer             : string;
  HasLetters, IsYell : boolean;

function response(const HeyBob: string) : string;
begin
  answer     := 'Whatever.';
  HasLetters := false;
  IsYell     := false;

  for i := low(HeyBob) to high(HeyBob) do
    begin
      if LowerCase(HeyBob[i]) in ['a'..'z'] then
        begin
          HasLetters := true;
          break;
        end;
    end;
  if HasLetters and (UpperCase(HeyBob) = HeyBob) then IsYell := true;

  if trim(HeyBob) = '' then answer := 'Fine. Be that way!'
  else if copy(trim(HeyBob), length(trim(HeyBob))) = '?' then
         if IsYell then answer := 'Calm down, I know what I''m doing!'
  else answer := 'Sure.'
  else if IsYell then answer := 'Whoa, chill out!';

  result := answer;
end;

end.
