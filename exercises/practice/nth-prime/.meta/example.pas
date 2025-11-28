unit NthPrime;

{$mode ObjFPC}{$H+}

interface

function prime(const number : dword) : cardinal;

implementation

uses SysUtils;

var
  primes : Array Of Dword = (2, 3);

function IsPrime(const number : dword) : boolean;
var
  i : dword;
begin
  if number <= 1 then exit(false);
  if number in [2, 3] then exit(true);
  for i := 2 to number div 2 do if number mod i = 0 then exit(false);
  result := true;
end;

function prime(const number : dword) : cardinal;
var
  i, nth : dword;
begin
  if number = 0 then raise Exception.Create('there is no zeroth prime');
  nth := length(primes);
  if nth >= number then exit(primes[number - 1]);
  i := primes[nth - 1];
  while nth < number do
    begin
      inc(i, 2);
      if IsPrime(i) then
        begin
          inc(nth);
          insert(i, primes, nth - 1);
        end;
    end;
  result := i;
end;

end.
