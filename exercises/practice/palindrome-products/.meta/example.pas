unit PalindromeProducts;

{$mode ObjFPC}{$H+}

interface

function smallest(const min, max : UInt64) : UInt64;
function largest(const min, max : UInt64) : UInt64;

implementation

uses SysUtils;

function palindrome(number: UInt64) : Boolean;
var
  digit : UInt64;
  reversed : UInt64;
begin
  if (number mod 10) = 0 then
    begin
      result := (number = 0);
      exit;
    end;

  reversed := 0;
  while number <> 0 do
    begin
      digit := number mod 10;
      number := number div 10;

      if number = reversed then
        begin
          result := true;
          exit;
        end;

      reversed := reversed * 10 + digit;
      if number = reversed then
        begin
          result := true;
          exit;
        end;
    end;

  result := false;
end;

function smallest(const min, max : UInt64) : UInt64;
var
  first : UInt64;
  second : UInt64;
  product : UInt64;
begin
  if min > max then
    raise ENotImplemented.Create('min must be <= max');

  result := min * max + 1;
  for first := min to max do
    for second := first to max do
      begin
        product := first * second;
        if (result > product) and palindrome(product) then
          result := product;
      end;

  if result = min * max + 1 then
    raise ENotImplemented.Create('no solution');
end;

function largest(const min, max : UInt64) : UInt64;
var
  first : UInt64;
  second : UInt64;
  product : UInt64;
begin
  if min > max then
    raise ENotImplemented.Create('min must be <= max');

  result := 0;
  for first := min to max do
    for second := first to max do
      begin
        product := first * second;
        if (result < product) and palindrome(product) then
          result := product;
      end;

  if result = 0 then
    raise ENotImplemented.Create('no solution');
end;

end.
