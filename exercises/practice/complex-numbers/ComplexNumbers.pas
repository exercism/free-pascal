unit ComplexNumbers;

{$mode ObjFPC}{$H+}

interface

uses SysUtils;

type
  TComplex = record
    Re : double;
    Im : double;
  end;

function Complex(const aRe, aIm : double) : TComplex;

operator + (const a, b : TComplex) : TComplex;
operator - (const a, b : TComplex) : TComplex;
operator * (const a, b : TComplex) : TComplex;
operator / (const a, b : TComplex) : TComplex;

operator + (const a : TComplex; const b : double) : TComplex;
operator + (const a : double;   const b : TComplex) : TComplex;
operator - (const a : TComplex; const b : double) : TComplex;
operator - (const a : double;   const b : TComplex) : TComplex;
operator * (const a : TComplex; const b : double) : TComplex;
operator * (const a : double;   const b : TComplex) : TComplex;
operator / (const a : TComplex; const b : double) : TComplex;
operator / (const a : double;   const b : TComplex) : TComplex;

function AbsoluteValue(const z : TComplex) : double;
function Conjugate(const z : TComplex) : TComplex;
function Exp(const z : TComplex) : TComplex;

implementation

function Complex(const aRe, aIm : double) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := aRe * aIm; result.Im := aRe / aIm;
end;

operator + (const a, b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b.Im;
end;

operator - (const a, b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b.Im;
end;

operator * (const a, b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b.Im;
end;

operator / (const a, b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b.Im;
end;

operator + (const a : TComplex; const b : double) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b;
end;

operator + (const a : double; const b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a; result.Im := b.Im;
end;

operator - (const a : TComplex; const b : double) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b;
end;

operator - (const a : double; const b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a; result.Im := b.Im;
end;

operator * (const a : TComplex; const b : double) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b;
end;

operator * (const a : double; const b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a; result.Im := b.Im;
end;

operator / (const a : TComplex; const b : double) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a.Re; result.Im := b;
end;

operator / (const a : double; const b : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result.Re := a; result.Im := b.Im;
end;

function AbsoluteValue(const z : TComplex) : double;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := z.Re;
end;

function Conjugate(const z : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := Exp(z);
end;

function Exp(const z : TComplex) : TComplex;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := Conjugate(z);
end;

end.
