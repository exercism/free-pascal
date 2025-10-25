unit PhoneNumber;

{$mode ObjFPC}{$H+}

interface

function clean(const phrase : string) : string;

implementation

uses Character, SysUtils;

var
  NumberString : string;
  chr          : char;
  i            : integer;

function clean(const phrase : string) : string;
begin
  NumberString := '';
  for i := 1 to length(phrase) do
    begin
      chr := copy(phrase, i, 1)[1];
      if IsNumber(chr) then NumberString := NumberString + chr
      else if IsLetter(chr) then
             raise Exception.Create('letters not permitted')
      else if chr in ['@', ':', '!'] then
             raise Exception.Create('punctuations not permitted')
    end;

  if length(NumberString) = 11 then
    begin
      if NumberString[1] = '1' then
        NumberString := RightStr(NumberString, length(NumberString) - 1)
      else raise Exception.Create('11 digits must start with 1');
    end
  else if Length(NumberString) > 11 then
         raise Exception.Create('must not be greater than 11 digits')
  else  if Length(NumberString) < 10 then
          raise Exception.Create('must not be fewer than 10 digits');

  if NumberString[1] = '0' then
    raise Exception.Create('area code cannot start with zero')
  else if NumberString[1] = '1' then
         raise Exception.Create('area code cannot start with one');

  if NumberString[4] = '0' then
    raise Exception.Create('exchange code cannot start with zero')
  else if NumberString[4] = '1' then
         raise Exception.Create('exchange code cannot start with one');

  result := NumberString;
end;

end.
