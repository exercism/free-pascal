unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SquareRootTest = class(TTestCase)
  published
    procedure root_of_1;
    procedure root_of_4;
    procedure root_of_25;
    procedure root_of_81;
    procedure root_of_196;
    procedure root_of_65025;
  end;

implementation

uses SquareRoot;

// 9b748478-7b0a-490c-b87a-609dacf631fd
procedure SquareRootTest.root_of_1;
begin
  TapAssertTrue(Self, 'root of 1', 1, SquareRoot.SquareRoot(1));
end;

// 7d3aa9ba-9ac6-4e93-a18b-2e8b477139bb
procedure SquareRootTest.root_of_4;
begin
  TapAssertTrue(Self, 'root of 4', 2, SquareRoot.SquareRoot(4));
end;

// 6624aabf-3659-4ae0-a1c8-25ae7f33c6ef
procedure SquareRootTest.root_of_25;
begin
  TapAssertTrue(Self, 'root of 25', 5, SquareRoot.SquareRoot(25));
end;

// 93beac69-265e-4429-abb1-94506b431f81
procedure SquareRootTest.root_of_81;
begin
  TapAssertTrue(Self, 'root of 81', 9, SquareRoot.SquareRoot(81));
end;

// fbddfeda-8c4f-4bc4-87ca-6991af35360e
procedure SquareRootTest.root_of_196;
begin
  TapAssertTrue(Self, 'root of 196', 14, SquareRoot.SquareRoot(196));
end;

// c03d0532-8368-4734-a8e0-f96a9eb7fc1d
procedure SquareRootTest.root_of_65025;
begin
  TapAssertTrue(Self, 'root of 65025', 255, SquareRoot.SquareRoot(65025));
end;

initialization
RegisterTest(SquareRootTest);

end.
