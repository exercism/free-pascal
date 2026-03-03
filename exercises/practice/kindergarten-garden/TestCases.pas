unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  KindergartenGardenTest = class(TTestCase)
  published
    procedure garden_with_single_student;
    procedure different_garden_with_single_student;
    procedure garden_with_two_students;
    procedure second_students_garden;
    procedure third_students_garden;
    procedure for_alice_first_students_garden;
    procedure for_bob_second_students_garden;
    procedure for_charlie;
    procedure for_david;
    procedure for_eve;
    procedure for_fred;
    procedure for_ginny;
    procedure for_harriet;
    procedure for_ileana;
    procedure for_joseph;
    procedure for_kincaid_second_to_last_students_garden;
    procedure for_larry_last_students_garden;
  end;

implementation

uses KindergartenGarden;

// 1fc316ed-17ab-4fba-88ef-3ae78296b692
procedure KindergartenGardenTest.garden_with_single_student;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('RC'#10'GG', 'Alice');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Radishes);
  TapAssertTrue(Self, 'second', true, garden[1] = Clover);
  TapAssertTrue(Self, 'third', true, garden[2] = Grass);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Grass);
end;

// acd19dc1-2200-4317-bc2a-08f021276b40
procedure KindergartenGardenTest.different_garden_with_single_student;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VC'#10'RC', 'Alice');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Violets);
  TapAssertTrue(Self, 'second', true, garden[1] = Clover);
  TapAssertTrue(Self, 'third', true, garden[2] = Radishes);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Clover);
end;

// c376fcc8-349c-446c-94b0-903947315757
procedure KindergartenGardenTest.garden_with_two_students;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VVCG'#10'VVRC', 'Bob');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Clover);
  TapAssertTrue(Self, 'second', true, garden[1] = Grass);
  TapAssertTrue(Self, 'third', true, garden[2] = Radishes);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Clover);
end;

// 2d620f45-9617-4924-9d27-751c80d17db9
procedure KindergartenGardenTest.second_students_garden;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VVCCGG'#10'VVCCGG', 'Bob');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Clover);
  TapAssertTrue(Self, 'second', true, garden[1] = Clover);
  TapAssertTrue(Self, 'third', true, garden[2] = Clover);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Clover);
end;

// 57712331-4896-4364-89f8-576421d69c44
procedure KindergartenGardenTest.third_students_garden;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VVCCGG'#10'VVCCGG', 'Charlie');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Grass);
  TapAssertTrue(Self, 'second', true, garden[1] = Grass);
  TapAssertTrue(Self, 'third', true, garden[2] = Grass);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Grass);
end;

// 149b4290-58e1-40f2-8ae4-8b87c46e765b
procedure KindergartenGardenTest.for_alice_first_students_garden;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Alice');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Violets);
  TapAssertTrue(Self, 'second', true, garden[1] = Radishes);
  TapAssertTrue(Self, 'third', true, garden[2] = Violets);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Radishes);
end;

// ba25dbbc-10bd-4a37-b18e-f89ecd098a5e
procedure KindergartenGardenTest.for_bob_second_students_garden;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Bob');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Clover);
  TapAssertTrue(Self, 'second', true, garden[1] = Grass);
  TapAssertTrue(Self, 'third', true, garden[2] = Clover);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Clover);
end;

// 566b621b-f18e-4c5f-873e-be30544b838c
procedure KindergartenGardenTest.for_charlie;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Charlie');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Violets);
  TapAssertTrue(Self, 'second', true, garden[1] = Violets);
  TapAssertTrue(Self, 'third', true, garden[2] = Clover);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Grass);
end;

// 3ad3df57-dd98-46fc-9269-1877abf612aa
procedure KindergartenGardenTest.for_david;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'David');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Radishes);
  TapAssertTrue(Self, 'second', true, garden[1] = Violets);
  TapAssertTrue(Self, 'third', true, garden[2] = Clover);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Radishes);
end;

// 0f0a55d1-9710-46ed-a0eb-399ba8c72db2
procedure KindergartenGardenTest.for_eve;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Eve');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Clover);
  TapAssertTrue(Self, 'second', true, garden[1] = Grass);
  TapAssertTrue(Self, 'third', true, garden[2] = Radishes);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Grass);
end;

// a7e80c90-b140-4ea1-aee3-f4625365c9a4
procedure KindergartenGardenTest.for_fred;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Fred');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Grass);
  TapAssertTrue(Self, 'second', true, garden[1] = Clover);
  TapAssertTrue(Self, 'third', true, garden[2] = Violets);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Clover);
end;

// 9d94b273-2933-471b-86e8-dba68694c615
procedure KindergartenGardenTest.for_ginny;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Ginny');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Clover);
  TapAssertTrue(Self, 'second', true, garden[1] = Grass);
  TapAssertTrue(Self, 'third', true, garden[2] = Grass);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Clover);
end;

// f55bc6c2-ade8-4844-87c4-87196f1b7258
procedure KindergartenGardenTest.for_harriet;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Harriet');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Violets);
  TapAssertTrue(Self, 'second', true, garden[1] = Radishes);
  TapAssertTrue(Self, 'third', true, garden[2] = Radishes);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Violets);
end;

// 759070a3-1bb1-4dd4-be2c-7cce1d7679ae
procedure KindergartenGardenTest.for_ileana;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Ileana');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Grass);
  TapAssertTrue(Self, 'second', true, garden[1] = Clover);
  TapAssertTrue(Self, 'third', true, garden[2] = Violets);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Clover);
end;

// 78578123-2755-4d4a-9c7d-e985b8dda1c6
procedure KindergartenGardenTest.for_joseph;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Joseph');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Violets);
  TapAssertTrue(Self, 'second', true, garden[1] = Clover);
  TapAssertTrue(Self, 'third', true, garden[2] = Violets);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Grass);
end;

// 6bb66df7-f433-41ab-aec2-3ead6e99f65b
procedure KindergartenGardenTest.for_kincaid_second_to_last_students_garden;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Kincaid');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Grass);
  TapAssertTrue(Self, 'second', true, garden[1] = Clover);
  TapAssertTrue(Self, 'third', true, garden[2] = Clover);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Grass);
end;

// d7edec11-6488-418a-94e6-ed509e0fa7eb
procedure KindergartenGardenTest.for_larry_last_students_garden;
var
  garden : TPlantArray;
begin
  garden := KindergartenGarden.plants('VRCGVVRVCGGCCGVRGCVCGCGV'#10'VRCCCGCRRGVCGCRVVCVGCGCV', 'Larry');
  TapAssertTrue(Self, 'length', 4, Length(garden));
  TapAssertTrue(Self, 'first', true, garden[0] = Grass);
  TapAssertTrue(Self, 'second', true, garden[1] = Violets);
  TapAssertTrue(Self, 'third', true, garden[2] = Clover);
  TapAssertTrue(Self, 'fourth', true, garden[3] = Violets);
end;

initialization
RegisterTest(KindergartenGardenTest);

end.
