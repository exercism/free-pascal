unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  EtlTest = class(TTestCase)
  published
    procedure single_letter;
    procedure single_score_with_multiple_letters;
    procedure multiple_scores_with_multiple_letters;
    procedure multiple_scores_with_differing_numbers_of_letters;
  end;

implementation

uses Etl;

// 78a7a9f9-4490-4a47-8ee9-5a38bb47d28f
procedure EtlTest.single_letter;
var
  expected, actual : TCharIntDict;
  legacy           : TIntCharArrayDict;
begin
  expected := TCharIntDict.Create;
  expected.Add('a', 1);
  legacy := TIntCharArrayDict.Create;
  legacy.Add(1, ['A']);
  actual := Etl.transform(legacy);
  TapAssertTrue(Self, 'single letter', expected, actual);
  expected.Free;
  legacy.Free;
  actual.Free;
end;

// 60dbd000-451d-44c7-bdbb-97c73ac1f497
procedure EtlTest.single_score_with_multiple_letters;
var
  expected, actual : TCharIntDict;
  legacy           : TIntCharArrayDict;
begin
  expected := TCharIntDict.Create;
  expected.Add('a', 1);
  expected.Add('e', 1);
  expected.Add('i', 1);
  expected.Add('o', 1);
  expected.Add('u', 1);
  legacy := TIntCharArrayDict.Create;
  legacy.Add(1, ['A', 'E', 'I', 'O', 'U']);
  actual := Etl.transform(legacy);
  TapAssertTrue(Self, 'single score with multiple letters', expected, actual);
  expected.Free;
  legacy.Free;
  actual.Free;
end;

// f5c5de0c-301f-4fdd-a0e5-df97d4214f54
procedure EtlTest.multiple_scores_with_multiple_letters;
var
  expected, actual : TCharIntDict;
  legacy           : TIntCharArrayDict;
begin
  expected := TCharIntDict.Create;
  expected.Add('a', 1);
  expected.Add('d', 2);
  expected.Add('e', 1);
  expected.Add('g', 2);
  legacy := TIntCharArrayDict.Create;
  legacy.Add(1, ['A', 'E']);
  legacy.Add(2, ['D', 'G']);
  actual := Etl.transform(legacy);
  TapAssertTrue(Self, 'multiple scores with multiple letters', expected, actual);
  expected.Free;
  legacy.Free;
  actual.Free;
end;

// 5db8ea89-ecb4-4dcd-902f-2b418cc87b9d
procedure EtlTest.multiple_scores_with_differing_numbers_of_letters;
var
  expected, actual : TCharIntDict;
  legacy           : TIntCharArrayDict;
begin
  expected := TCharIntDict.Create;
  expected.Add('a', 1);
  expected.Add('b', 3);
  expected.Add('c', 3);
  expected.Add('d', 2);
  expected.Add('e', 1);
  expected.Add('f', 4);
  expected.Add('g', 2);
  expected.Add('h', 4);
  expected.Add('i', 1);
  expected.Add('j', 8);
  expected.Add('k', 5);
  expected.Add('l', 1);
  expected.Add('m', 3);
  expected.Add('n', 1);
  expected.Add('o', 1);
  expected.Add('p', 3);
  expected.Add('q', 10);
  expected.Add('r', 1);
  expected.Add('s', 1);
  expected.Add('t', 1);
  expected.Add('u', 1);
  expected.Add('v', 4);
  expected.Add('w', 4);
  expected.Add('x', 8);
  expected.Add('y', 4);
  expected.Add('z', 10);
  legacy := TIntCharArrayDict.Create;
  legacy.Add(1, ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']);
  legacy.Add(2, ['D', 'G']);
  legacy.Add(3, ['B', 'C', 'M', 'P']);
  legacy.Add(4, ['F', 'H', 'V', 'W', 'Y']);
  legacy.Add(5, ['K']);
  legacy.Add(8, ['J', 'X']);
  legacy.Add(10, ['Q', 'Z']);
  actual := Etl.transform(legacy);
  TapAssertTrue(Self, 'multiple scores with differing numbers of letters', expected, actual);
  expected.Free;
  legacy.Free;
  actual.Free;
end;

initialization
RegisterTest(EtlTest);

end.
