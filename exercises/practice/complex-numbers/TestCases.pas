unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ComplexNumbersTest = class(TTestCase)
  published
    procedure real_part_of_a_purely_real_number;
    procedure real_part_of_a_purely_imaginary_number;
    procedure real_part_of_a_number_with_real_and_imaginary_part;
    procedure imaginary_part_of_a_purely_real_number;
    procedure imaginary_part_of_a_purely_imaginary_number;
    procedure imaginary_part_of_a_number_with_real_and_imaginary_part;
    procedure imaginary_unit;
    procedure add_purely_real_numbers;
    procedure add_purely_imaginary_numbers;
    procedure add_numbers_with_real_and_imaginary_part;
    procedure subtract_purely_real_numbers;
    procedure subtract_purely_imaginary_numbers;
    procedure subtract_numbers_with_real_and_imaginary_part;
    procedure multiply_purely_real_numbers;
    procedure multiply_purely_imaginary_numbers;
    procedure multiply_numbers_with_real_and_imaginary_part;
    procedure divide_purely_real_numbers;
    procedure divide_purely_imaginary_numbers;
    procedure divide_numbers_with_real_and_imaginary_part;
    procedure absolute_value_of_a_positive_purely_real_number;
    procedure absolute_value_of_a_negative_purely_real_number;
    procedure absolute_value_of_a_purely_imaginary_number_with_positive_imaginary_part;
    procedure absolute_value_of_a_purely_imaginary_number_with_negative_imaginary_part;
    procedure absolute_value_of_a_number_with_real_and_imaginary_part;
    procedure conjugate_a_purely_real_number;
    procedure conjugate_a_purely_imaginary_number;
    procedure conjugate_a_number_with_real_and_imaginary_part;
    procedure eulers_identity_formula;
    procedure exponential_of_0;
    procedure exponential_of_a_purely_real_number;
    procedure exponential_of_a_number_with_real_and_imaginary_part;
    procedure exponential_resulting_in_a_number_with_real_and_imaginary_part;
    procedure add_real_number_to_complex_number;
    procedure add_complex_number_to_real_number;
    procedure subtract_real_number_from_complex_number;
    procedure subtract_complex_number_from_real_number;
    procedure multiply_complex_number_by_real_number;
    procedure multiply_real_number_by_complex_number;
    procedure divide_complex_number_by_real_number;
    procedure divide_real_number_by_complex_number;
  end;

implementation

uses ComplexNumbers;

// 9f98e133-eb7f-45b0-9676-cce001cd6f7a
procedure ComplexNumbersTest.real_part_of_a_purely_real_number;
var
  z : TComplex;
begin
  z := Complex(1.0, 0.0);
  TapAssertTrue(Self, 'Real part of a purely real number', 1.0, z.Re, 1e-9);
end;

// 07988e20-f287-4bb7-90cf-b32c4bffe0f3
procedure ComplexNumbersTest.real_part_of_a_purely_imaginary_number;
var
  z : TComplex;
begin
  z := Complex(0.0, 1.0);
  TapAssertTrue(Self, 'Real part of a purely imaginary number', 0.0, z.Re, 1e-9);
end;

// 4a370e86-939e-43de-a895-a00ca32da60a
procedure ComplexNumbersTest.real_part_of_a_number_with_real_and_imaginary_part;
var
  z : TComplex;
begin
  z := Complex(1.0, 2.0);
  TapAssertTrue(Self, 'Real part of a number with real and imaginary part', 1.0, z.Re, 1e-9);
end;

// 9b3fddef-4c12-4a99-b8f8-e3a42c7ccef6
procedure ComplexNumbersTest.imaginary_part_of_a_purely_real_number;
var
  z : TComplex;
begin
  z := Complex(1.0, 0.0);
  TapAssertTrue(Self, 'Imaginary part of a purely real number', 0.0, z.Im, 1e-9);
end;

// a8dafedd-535a-4ed3-8a39-fda103a2b01e
procedure ComplexNumbersTest.imaginary_part_of_a_purely_imaginary_number;
var
  z : TComplex;
begin
  z := Complex(0.0, 1.0);
  TapAssertTrue(Self, 'Imaginary part of a purely imaginary number', 1.0, z.Im, 1e-9);
end;

// 0f998f19-69ee-4c64-80ef-01b086feab80
procedure ComplexNumbersTest.imaginary_part_of_a_number_with_real_and_imaginary_part;
var
  z : TComplex;
begin
  z := Complex(1.0, 2.0);
  TapAssertTrue(Self, 'Imaginary part of a number with real and imaginary part', 2.0, z.Im, 1e-9);
end;

// a39b7fd6-6527-492f-8c34-609d2c913879
procedure ComplexNumbersTest.imaginary_unit;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(0.0, 1.0);
  z2 := Complex(0.0, 1.0);
  actual := z1 * z2;
  TapAssertTrue(Self, 'Imaginary unit', -1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Imaginary unit', 0.0, actual.Im, 1e-9);
end;

// 9a2c8de9-f068-4f6f-b41c-82232cc6c33e
procedure ComplexNumbersTest.add_purely_real_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 0.0);
  z2 := Complex(2.0, 0.0);
  actual := z1 + z2;
  TapAssertTrue(Self, 'Add purely real numbers', 3.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Add purely real numbers', 0.0, actual.Im, 1e-9);
end;

// 657c55e1-b14b-4ba7-bd5c-19db22b7d659
procedure ComplexNumbersTest.add_purely_imaginary_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(0.0, 1.0);
  z2 := Complex(0.0, 2.0);
  actual := z1 + z2;
  TapAssertTrue(Self, 'Add purely imaginary numbers', 0.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Add purely imaginary numbers', 3.0, actual.Im, 1e-9);
end;

// 4e1395f5-572b-4ce8-bfa9-9a63056888da
procedure ComplexNumbersTest.add_numbers_with_real_and_imaginary_part;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 2.0);
  z2 := Complex(3.0, 4.0);
  actual := z1 + z2;
  TapAssertTrue(Self, 'Add numbers with real and imaginary part', 4.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Add numbers with real and imaginary part', 6.0, actual.Im, 1e-9);
end;

// 1155dc45-e4f7-44b8-af34-a91aa431475d
procedure ComplexNumbersTest.subtract_purely_real_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 0.0);
  z2 := Complex(2.0, 0.0);
  actual := z1 - z2;
  TapAssertTrue(Self, 'Subtract purely real numbers', -1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Subtract purely real numbers', 0.0, actual.Im, 1e-9);
end;

// f95e9da8-acd5-4da4-ac7c-c861b02f774b
procedure ComplexNumbersTest.subtract_purely_imaginary_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(0.0, 1.0);
  z2 := Complex(0.0, 2.0);
  actual := z1 - z2;
  TapAssertTrue(Self, 'Subtract purely imaginary numbers', 0.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Subtract purely imaginary numbers', -1.0, actual.Im, 1e-9);
end;

// f876feb1-f9d1-4d34-b067-b599a8746400
procedure ComplexNumbersTest.subtract_numbers_with_real_and_imaginary_part;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 2.0);
  z2 := Complex(3.0, 4.0);
  actual := z1 - z2;
  TapAssertTrue(Self, 'Subtract numbers with real and imaginary part', -2.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Subtract numbers with real and imaginary part', -2.0, actual.Im, 1e-9);
end;

// 8a0366c0-9e16-431f-9fd7-40ac46ff4ec4
procedure ComplexNumbersTest.multiply_purely_real_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 0.0);
  z2 := Complex(2.0, 0.0);
  actual := z1 * z2;
  TapAssertTrue(Self, 'Multiply purely real numbers', 2.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Multiply purely real numbers', 0.0, actual.Im, 1e-9);
end;

// e560ed2b-0b80-4b4f-90f2-63cefc911aaf
procedure ComplexNumbersTest.multiply_purely_imaginary_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(0.0, 1.0);
  z2 := Complex(0.0, 2.0);
  actual := z1 * z2;
  TapAssertTrue(Self, 'Multiply purely imaginary numbers', -2.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Multiply purely imaginary numbers', 0.0, actual.Im, 1e-9);
end;

// 4d1d10f0-f8d4-48a0-b1d0-f284ada567e6
procedure ComplexNumbersTest.multiply_numbers_with_real_and_imaginary_part;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 2.0);
  z2 := Complex(3.0, 4.0);
  actual := z1 * z2;
  TapAssertTrue(Self, 'Multiply numbers with real and imaginary part', -5.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Multiply numbers with real and imaginary part', 10.0, actual.Im, 1e-9);
end;

// b0571ddb-9045-412b-9c15-cd1d816d36c1
procedure ComplexNumbersTest.divide_purely_real_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 0.0);
  z2 := Complex(2.0, 0.0);
  actual := z1 / z2;
  TapAssertTrue(Self, 'Divide purely real numbers', 0.5, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Divide purely real numbers', 0.0, actual.Im, 1e-9);
end;

// 5bb4c7e4-9934-4237-93cc-5780764fdbdd
procedure ComplexNumbersTest.divide_purely_imaginary_numbers;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(0.0, 1.0);
  z2 := Complex(0.0, 2.0);
  actual := z1 / z2;
  TapAssertTrue(Self, 'Divide purely imaginary numbers', 0.5, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Divide purely imaginary numbers', 0.0, actual.Im, 1e-9);
end;

// c4e7fef5-64ac-4537-91c2-c6529707701f
procedure ComplexNumbersTest.divide_numbers_with_real_and_imaginary_part;
var
  z1, z2, actual : TComplex;
begin
  z1 := Complex(1.0, 2.0);
  z2 := Complex(3.0, 4.0);
  actual := z1 / z2;
  TapAssertTrue(Self, 'Divide numbers with real and imaginary part', 0.44, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Divide numbers with real and imaginary part', 0.08, actual.Im, 1e-9);
end;

// c56a7332-aad2-4437-83a0-b3580ecee843
procedure ComplexNumbersTest.absolute_value_of_a_positive_purely_real_number;
var
  z : TComplex;
begin
  z := Complex(5.0, 0.0);
  TapAssertTrue(Self, 'Absolute value of a positive purely real number', 5.0, ComplexNumbers.AbsoluteValue(z), 1e-9);
end;

// cf88d7d3-ee74-4f4e-8a88-a1b0090ecb0c
procedure ComplexNumbersTest.absolute_value_of_a_negative_purely_real_number;
var
  z : TComplex;
begin
  z := Complex(-5.0, 0.0);
  TapAssertTrue(Self, 'Absolute value of a negative purely real number', 5.0, ComplexNumbers.AbsoluteValue(z), 1e-9);
end;

// bbe26568-86c1-4bb4-ba7a-da5697e2b994
procedure ComplexNumbersTest.absolute_value_of_a_purely_imaginary_number_with_positive_imaginary_part;
var
  z : TComplex;
begin
  z := Complex(0.0, 5.0);
  TapAssertTrue(Self, 'Absolute value of a purely imaginary number with positive imaginary part', 5.0, ComplexNumbers.AbsoluteValue(z), 1e-9);
end;

// 3b48233d-468e-4276-9f59-70f4ca1f26f3
procedure ComplexNumbersTest.absolute_value_of_a_purely_imaginary_number_with_negative_imaginary_part;
var
  z : TComplex;
begin
  z := Complex(0.0, -5.0);
  TapAssertTrue(Self, 'Absolute value of a purely imaginary number with negative imaginary part', 5.0, ComplexNumbers.AbsoluteValue(z), 1e-9);
end;

// fe400a9f-aa22-4b49-af92-51e0f5a2a6d3
procedure ComplexNumbersTest.absolute_value_of_a_number_with_real_and_imaginary_part;
var
  z : TComplex;
begin
  z := Complex(3.0, 4.0);
  TapAssertTrue(Self, 'Absolute value of a number with real and imaginary part', 5.0, ComplexNumbers.AbsoluteValue(z), 1e-9);
end;

// fb2d0792-e55a-4484-9443-df1eddfc84a2
procedure ComplexNumbersTest.conjugate_a_purely_real_number;
var
  z, actual : TComplex;
begin
  z := Complex(5.0, 0.0);
  actual := ComplexNumbers.Conjugate(z);
  TapAssertTrue(Self, 'Conjugate a purely real number', 5.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Conjugate a purely real number', 0.0, actual.Im, 1e-9);
end;

// e37fe7ac-a968-4694-a460-66cb605f8691
procedure ComplexNumbersTest.conjugate_a_purely_imaginary_number;
var
  z, actual : TComplex;
begin
  z := Complex(0.0, 5.0);
  actual := ComplexNumbers.Conjugate(z);
  TapAssertTrue(Self, 'Conjugate a purely imaginary number', 0.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Conjugate a purely imaginary number', -5.0, actual.Im, 1e-9);
end;

// f7704498-d0be-4192-aaf5-a1f3a7f43e68
procedure ComplexNumbersTest.conjugate_a_number_with_real_and_imaginary_part;
var
  z, actual : TComplex;
begin
  z := Complex(1.0, 1.0);
  actual := ComplexNumbers.Conjugate(z);
  TapAssertTrue(Self, 'Conjugate a number with real and imaginary part', 1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Conjugate a number with real and imaginary part', -1.0, actual.Im, 1e-9);
end;

// 6d96d4c6-2edb-445b-94a2-7de6d4caaf60
procedure ComplexNumbersTest.eulers_identity_formula;
var
  z, actual : TComplex;
begin
  z := Complex(0.0, Pi);
  actual := ComplexNumbers.Exp(z);
  TapAssertTrue(Self, 'Eulers identity/formula', -1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Eulers identity/formula', 0.0, actual.Im, 1e-9);
end;

// 2d2c05a0-4038-4427-a24d-72f6624aa45f
procedure ComplexNumbersTest.exponential_of_0;
var
  z, actual : TComplex;
begin
  z := Complex(0.0, 0.0);
  actual := ComplexNumbers.Exp(z);
  TapAssertTrue(Self, 'Exponential of 0', 1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Exponential of 0', 0.0, actual.Im, 1e-9);
end;

// ed87f1bd-b187-45d6-8ece-7e331232c809
procedure ComplexNumbersTest.exponential_of_a_purely_real_number;
var
  z, actual : TComplex;
begin
  z := Complex(1.0, 0.0);
  actual := ComplexNumbers.Exp(z);
  TapAssertTrue(Self, 'Exponential of a purely real number', System.Exp(1.0), actual.Re, 1e-9);
  TapAssertTrue(Self, 'Exponential of a purely real number', 0.0, actual.Im, 1e-9);
end;

// 08eedacc-5a95-44fc-8789-1547b27a8702
procedure ComplexNumbersTest.exponential_of_a_number_with_real_and_imaginary_part;
var
  z, actual : TComplex;
begin
  z := Complex(Ln(2), Pi);
  actual := ComplexNumbers.Exp(z);
  TapAssertTrue(Self, 'Exponential of a number with real and imaginary part', -2.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Exponential of a number with real and imaginary part', 0.0, actual.Im, 1e-9);
end;

// d2de4375-7537-479a-aa0e-d474f4f09859
procedure ComplexNumbersTest.exponential_resulting_in_a_number_with_real_and_imaginary_part;
var
  z, actual : TComplex;
begin
  z := Complex(Ln(2)/2, Pi/4);
  actual := ComplexNumbers.Exp(z);
  TapAssertTrue(Self, 'Exponential resulting in a number with real and imaginary part', 1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Exponential resulting in a number with real and imaginary part', 1.0, actual.Im, 1e-9);
end;

// 06d793bf-73bd-4b02-b015-3030b2c952ec
procedure ComplexNumbersTest.add_real_number_to_complex_number;
var
  z1, actual : TComplex;
begin
  z1 := Complex(1.0, 2.0);
  actual := z1 + 5.0;
  TapAssertTrue(Self, 'Add real number to complex number', 6.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Add real number to complex number', 2.0, actual.Im, 1e-9);
end;

// d77dbbdf-b8df-43f6-a58d-3acb96765328
procedure ComplexNumbersTest.add_complex_number_to_real_number;
var
  z2, actual : TComplex;
begin
  z2 := Complex(1.0, 2.0);
  actual := 5.0 + z2;
  TapAssertTrue(Self, 'Add complex number to real number', 6.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Add complex number to real number', 2.0, actual.Im, 1e-9);
end;

// 20432c8e-8960-4c40-ba83-c9d910ff0a0f
procedure ComplexNumbersTest.subtract_real_number_from_complex_number;
var
  z1, actual : TComplex;
begin
  z1 := Complex(5.0, 7.0);
  actual := z1 - 4.0;
  TapAssertTrue(Self, 'Subtract real number from complex number', 1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Subtract real number from complex number', 7.0, actual.Im, 1e-9);
end;

// b4b38c85-e1bf-437d-b04d-49bba6e55000
procedure ComplexNumbersTest.subtract_complex_number_from_real_number;
var
  z2, actual : TComplex;
begin
  z2 := Complex(5.0, 7.0);
  actual := 4.0 - z2;
  TapAssertTrue(Self, 'Subtract complex number from real number', -1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Subtract complex number from real number', -7.0, actual.Im, 1e-9);
end;

// dabe1c8c-b8f4-44dd-879d-37d77c4d06bd
procedure ComplexNumbersTest.multiply_complex_number_by_real_number;
var
  z1, actual : TComplex;
begin
  z1 := Complex(2.0, 5.0);
  actual := z1 * 5.0;
  TapAssertTrue(Self, 'Multiply complex number by real number', 10.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Multiply complex number by real number', 25.0, actual.Im, 1e-9);
end;

// 6c81b8c8-9851-46f0-9de5-d96d314c3a28
procedure ComplexNumbersTest.multiply_real_number_by_complex_number;
var
  z2, actual : TComplex;
begin
  z2 := Complex(2.0, 5.0);
  actual := 5.0 * z2;
  TapAssertTrue(Self, 'Multiply real number by complex number', 10.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Multiply real number by complex number', 25.0, actual.Im, 1e-9);
end;

// 8a400f75-710e-4d0c-bcb4-5e5a00c78aa0
procedure ComplexNumbersTest.divide_complex_number_by_real_number;
var
  z1, actual : TComplex;
begin
  z1 := Complex(10.0, 100.0);
  actual := z1 / 10.0;
  TapAssertTrue(Self, 'Divide complex number by real number', 1.0, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Divide complex number by real number', 10.0, actual.Im, 1e-9);
end;

// 9a867d1b-d736-4c41-a41e-90bd148e9d5e
procedure ComplexNumbersTest.divide_real_number_by_complex_number;
var
  z2, actual : TComplex;
begin
  z2 := Complex(1.0, 1.0);
  actual := 5.0 / z2;
  TapAssertTrue(Self, 'Divide real number by complex number', 2.5, actual.Re, 1e-9);
  TapAssertTrue(Self, 'Divide real number by complex number', -2.5, actual.Im, 1e-9);
end;

initialization
RegisterTest(ComplexNumbersTest);

end.
