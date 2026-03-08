unit RationalNumbers;

{$mode ObjFPC}{$H+}

interface

type
  TRational = record
    Numer : integer;
    Denom : integer;
  end;

function Rational(const aNumer, aDenom : integer) : TRational;

operator + (const a, b : TRational) : TRational;
operator - (const a, b : TRational) : TRational;
operator * (const a, b : TRational) : TRational;
operator / (const a, b : TRational) : TRational;

function AbsoluteValue(const r : TRational) : TRational;
function ExpRational(const r : TRational; const n : integer) : TRational;
function ExpReal(const x : double; const r : TRational) : double;

implementation

uses Math;

function GCD(a, b : integer) : integer;
var
  remainder : integer;
begin
  while b <> 0 do
  begin
    remainder := a mod b;
    a := b;
    b := remainder;
  end;
  result := a;
end;

function Rational(const aNumer, aDenom : integer) : TRational;
var
  num : integer;
  den : integer;
  divisor : integer;
begin
  if aNumer = 0 then
    begin
      result.Numer := 0;
      result.Denom := 1;
      exit;
    end;

  if aDenom >= 0 then
    begin
      num := aNumer;
      den := aDenom;
    end
  else
    begin
      num := -aNumer;
      den := -aDenom;
    end;

  divisor := GCD(System.Abs(num), den);
  result.Numer := num div divisor;
  result.Denom := den div divisor;
end;

operator + (const a, b : TRational) : TRational;
begin
  result := Rational(a.Numer * b.Denom + b.Numer * a.Denom, a.Denom * b.Denom);
end;

operator - (const a, b : TRational) : TRational;
begin
  result := Rational(a.Numer * b.Denom - b.Numer * a.Denom, a.Denom * b.Denom);
end;

operator * (const a, b : TRational) : TRational;
begin
  result := Rational(a.Numer * b.Numer, a.Denom * b.Denom);
end;

operator / (const a, b : TRational) : TRational;
begin
  result := Rational(a.Numer * b.Denom, a.Denom * b.Numer);
end;

function AbsoluteValue(const r : TRational) : TRational;
begin
  result := Rational(System.Abs(r.Numer), r.Denom);
end;

function IntegerPow(base, exp : integer) : integer;
var
  i : integer;
begin
  result := 1;
  for i := 1 to exp do
    result := result * base;
end;

function ExpRational(const r : TRational; const n : integer) : TRational;
begin
  if n >= 0 then
    result := Rational(IntegerPow(r.Numer, n), IntegerPow(r.Denom, n))
  else
    result := Rational(IntegerPow(r.Denom, -n), IntegerPow(r.Numer, -n));
end;

function ExpReal(const x : double; const r : TRational) : double;
begin
  result := Power(x, r.Numer / r.Denom);
end;

end.
