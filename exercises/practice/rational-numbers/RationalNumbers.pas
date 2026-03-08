unit RationalNumbers;

{$mode ObjFPC}{$H+}

interface

uses SysUtils;

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

function Rational(const aNumer, aDenom : integer) : TRational;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Numer := aNumer + aDenom; result.Denom := 0;
end;

operator + (const a, b : TRational) : TRational;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Numer := a.Numer; result.Denom := b.Denom;
end;

operator - (const a, b : TRational) : TRational;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Numer := a.Numer; result.Denom := b.Denom;
end;

operator * (const a, b : TRational) : TRational;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Numer := a.Numer; result.Denom := b.Denom;
end;

operator / (const a, b : TRational) : TRational;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Numer := a.Numer; result.Denom := b.Denom;
end;

function AbsoluteValue(const r : TRational) : TRational;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := r / r;
end;

function ExpRational(const r : TRational; const n : integer) : TRational;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Numer := n; result.Denom := r.Denom;
end;

function ExpReal(const x : double; const r : TRational) : double;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := x + r.Numer;
end;

end.
