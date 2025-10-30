unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TwoFerTest = class(TTestCase)
  published
    procedure no_name_given;
    procedure a_name_given;
    procedure another_name_given;
  end;

implementation

uses TwoFer;

// 1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce
procedure TwoFerTest.no_name_given;
begin
  TapAssertTrue(Self, 'no name given', 'One for you, one for me.', TwoFer.TwoFer(''));
end;

// b4c6dbb8-b4fb-42c2-bafd-10785abe7709
procedure TwoFerTest.a_name_given;
begin
  TapAssertTrue(Self, 'a name given', 'One for Alice, one for me.', TwoFer.TwoFer('Alice'));
end;

// 3549048d-1a6e-4653-9a79-b0bda163e8d5
procedure TwoFerTest.another_name_given;
begin
  TapAssertTrue(Self, 'another name given', 'One for Bob, one for me.', TwoFer.TwoFer('Bob'));
end;

initialization
RegisterTest(TwoFerTest);

end.
