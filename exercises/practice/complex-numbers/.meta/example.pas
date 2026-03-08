unit ComplexNumbers;

{$mode ObjFPC}{$H+}

interface

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
  result.Re := aRe;
  result.Im := aIm;
end;

operator + (const a, b : TComplex) : TComplex;
begin
  result.Re := a.Re + b.Re;
  result.Im := a.Im + b.Im;
end;

operator - (const a, b : TComplex) : TComplex;
begin
  result.Re := a.Re - b.Re;
  result.Im := a.Im - b.Im;
end;

operator * (const a, b : TComplex) : TComplex;
begin
  result.Re := a.Re * b.Re - a.Im * b.Im;
  result.Im := a.Re * b.Im + a.Im * b.Re;
end;

operator / (const a, b : TComplex) : TComplex;
var
  denom : double;
begin
  denom     := b.Re * b.Re + b.Im * b.Im;
  result.Re := (a.Re * b.Re + a.Im * b.Im) / denom;
  result.Im := (a.Im * b.Re - a.Re * b.Im) / denom;
end;

operator + (const a : TComplex; const b : double) : TComplex;
begin
  result.Re := a.Re + b;
  result.Im := a.Im;
end;

operator + (const a : double; const b : TComplex) : TComplex;
begin
  result.Re := a + b.Re;
  result.Im := b.Im;
end;

operator - (const a : TComplex; const b : double) : TComplex;
begin
  result.Re := a.Re - b;
  result.Im := a.Im;
end;

operator - (const a : double; const b : TComplex) : TComplex;
begin
  result.Re := a - b.Re;
  result.Im := -b.Im;
end;

operator * (const a : TComplex; const b : double) : TComplex;
begin
  result.Re := a.Re * b;
  result.Im := a.Im * b;
end;

operator * (const a : double; const b : TComplex) : TComplex;
begin
  result.Re := a * b.Re;
  result.Im := a * b.Im;
end;

operator / (const a : TComplex; const b : double) : TComplex;
begin
  result.Re := a.Re / b;
  result.Im := a.Im / b;
end;

operator / (const a : double; const b : TComplex) : TComplex;
var
  denom : double;
begin
  denom     := b.Re * b.Re + b.Im * b.Im;
  result.Re :=  (a / denom) * b.Re;
  result.Im :=  (a / denom) * (-b.Im);
end;

function AbsoluteValue(const z : TComplex) : double;
begin
  result := Sqrt(z.Re * z.Re + z.Im * z.Im);
end;

function Conjugate(const z : TComplex) : TComplex;
begin
  result.Re :=  z.Re;
  result.Im := -z.Im;
end;

function Exp(const z : TComplex) : TComplex;
var
  factor : double;
begin
  factor    := System.Exp(z.Re);
  result.Re := factor * Cos(z.Im);
  result.Im := factor * Sin(z.Im);
end;

end.
