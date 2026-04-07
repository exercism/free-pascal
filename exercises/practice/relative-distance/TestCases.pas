unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RelativeDistanceTest = class(TTestCase)
  published
    procedure direct_parent_child_relation;
    procedure sibling_relationship;
    procedure two_degrees_of_separation_grandchild;
    procedure unrelated_individuals;
    procedure complex_graph_cousins;
    procedure complex_graph_no_shortcut_far_removed_nephew;
    procedure complex_graph_some_shortcuts_cross_down_and_cross_up_cousins_several_times_removed_with_unrelated_family_tree;
  end;

implementation

uses RelativeDistance;

// 4a1ded74-5d32-47fb-8ae5-321f51d06b5b
procedure RelativeDistanceTest.direct_parent_child_relation;
var
  familyTree : TFamilyTree;
begin
  familyTree := TFamilyTree.Create;
  try
    familyTree.Add('Vera', TStrArray.Create('Tomoko'));
    familyTree.Add('Tomoko', TStrArray.Create('Aditi'));
    TapAssertTrue(Self, 'Direct parent-child relation', 1, RelativeDistance.degreeOfSeparation(familyTree, 'Vera', 'Tomoko'));
  finally
    familyTree.Free;
  end;
end;

// 30d17269-83e9-4f82-a0d7-8ef9656d8dce
procedure RelativeDistanceTest.sibling_relationship;
var
  familyTree : TFamilyTree;
begin
  familyTree := TFamilyTree.Create;
  try
    familyTree.Add('Dalia', TStrArray.Create('Olga', 'Yassin'));
    TapAssertTrue(Self, 'Sibling relationship', 1, RelativeDistance.degreeOfSeparation(familyTree, 'Olga', 'Yassin'));
  finally
    familyTree.Free;
  end;
end;

// 8dffa27d-a8ab-496d-80b3-2f21c77648b5
procedure RelativeDistanceTest.two_degrees_of_separation_grandchild;
var
  familyTree : TFamilyTree;
begin
  familyTree := TFamilyTree.Create;
  try
    familyTree.Add('Khadija', TStrArray.Create('Mateo'));
    familyTree.Add('Mateo', TStrArray.Create('Rami'));
    TapAssertTrue(Self, 'Two degrees of separation, grandchild', 2, RelativeDistance.degreeOfSeparation(familyTree, 'Khadija', 'Rami'));
  finally
    familyTree.Free;
  end;
end;

// 34e56ec1-d528-4a42-908e-020a4606ee60
procedure RelativeDistanceTest.unrelated_individuals;
var
  familyTree : TFamilyTree;
begin
  familyTree := TFamilyTree.Create;
  try
    familyTree.Add('Priya', TStrArray.Create('Rami'));
    familyTree.Add('Kaito', TStrArray.Create('Elif'));
    TapAssertTrue(Self, 'Unrelated individuals', -1, RelativeDistance.degreeOfSeparation(familyTree, 'Priya', 'Kaito'));
  finally
    familyTree.Free;
  end;
end;

// 93ffe989-bad2-48c4-878f-3acb1ce2611b
procedure RelativeDistanceTest.complex_graph_cousins;
var
  familyTree : TFamilyTree;
begin
  familyTree := TFamilyTree.Create;
  try
    familyTree.Add('Aiko', TStrArray.Create('Bao', 'Carlos'));
    familyTree.Add('Bao', TStrArray.Create('Dalia', 'Elias'));
    familyTree.Add('Carlos', TStrArray.Create('Fatima', 'Gustavo'));
    familyTree.Add('Dalia', TStrArray.Create('Hassan', 'Isla'));
    familyTree.Add('Elias', TStrArray.Create('Javier'));
    familyTree.Add('Fatima', TStrArray.Create('Khadija', 'Liam'));
    familyTree.Add('Gustavo', TStrArray.Create('Mina'));
    familyTree.Add('Hassan', TStrArray.Create('Noah', 'Olga'));
    familyTree.Add('Isla', TStrArray.Create('Pedro'));
    familyTree.Add('Javier', TStrArray.Create('Quynh', 'Ravi'));
    familyTree.Add('Khadija', TStrArray.Create('Sofia'));
    familyTree.Add('Liam', TStrArray.Create('Tariq', 'Uma'));
    familyTree.Add('Mina', TStrArray.Create('Viktor', 'Wang'));
    familyTree.Add('Noah', TStrArray.Create('Xiomara'));
    familyTree.Add('Olga', TStrArray.Create('Yuki'));
    familyTree.Add('Pedro', TStrArray.Create('Zane', 'Aditi'));
    familyTree.Add('Quynh', TStrArray.Create('Boris'));
    familyTree.Add('Ravi', TStrArray.Create('Celine'));
    familyTree.Add('Sofia', TStrArray.Create('Diego', 'Elif'));
    familyTree.Add('Tariq', TStrArray.Create('Farah'));
    familyTree.Add('Uma', TStrArray.Create('Giorgio'));
    familyTree.Add('Viktor', TStrArray.Create('Hana', 'Ian'));
    familyTree.Add('Wang', TStrArray.Create('Jing'));
    familyTree.Add('Xiomara', TStrArray.Create('Kaito'));
    familyTree.Add('Yuki', TStrArray.Create('Leila'));
    familyTree.Add('Zane', TStrArray.Create('Mateo'));
    familyTree.Add('Aditi', TStrArray.Create('Nia'));
    familyTree.Add('Boris', TStrArray.Create('Oscar'));
    familyTree.Add('Celine', TStrArray.Create('Priya'));
    familyTree.Add('Diego', TStrArray.Create('Qi'));
    familyTree.Add('Elif', TStrArray.Create('Rami'));
    familyTree.Add('Farah', TStrArray.Create('Sven'));
    familyTree.Add('Giorgio', TStrArray.Create('Tomoko'));
    familyTree.Add('Hana', TStrArray.Create('Umar'));
    familyTree.Add('Ian', TStrArray.Create('Vera'));
    familyTree.Add('Jing', TStrArray.Create('Wyatt'));
    familyTree.Add('Kaito', TStrArray.Create('Xia'));
    familyTree.Add('Leila', TStrArray.Create('Yassin'));
    familyTree.Add('Mateo', TStrArray.Create('Zara'));
    familyTree.Add('Nia', TStrArray.Create('Antonio'));
    familyTree.Add('Oscar', TStrArray.Create('Bianca'));
    familyTree.Add('Priya', TStrArray.Create('Cai'));
    familyTree.Add('Qi', TStrArray.Create('Dimitri'));
    familyTree.Add('Rami', TStrArray.Create('Ewa'));
    familyTree.Add('Sven', TStrArray.Create('Fabio'));
    familyTree.Add('Tomoko', TStrArray.Create('Gabriela'));
    familyTree.Add('Umar', TStrArray.Create('Helena'));
    familyTree.Add('Vera', TStrArray.Create('Igor'));
    familyTree.Add('Wyatt', TStrArray.Create('Jun'));
    familyTree.Add('Xia', TStrArray.Create('Kim'));
    familyTree.Add('Yassin', TStrArray.Create('Lucia'));
    familyTree.Add('Zara', TStrArray.Create('Mohammed'));
    TapAssertTrue(Self, 'Complex graph, cousins', 9, RelativeDistance.degreeOfSeparation(familyTree, 'Dimitri', 'Fabio'));
  finally
    familyTree.Free;
  end;
end;

// 2cc2e76b-013a-433c-9486-1dbe29bf06e5
procedure RelativeDistanceTest.complex_graph_no_shortcut_far_removed_nephew;
var
  familyTree : TFamilyTree;
begin
  familyTree := TFamilyTree.Create;
  try
    familyTree.Add('Aiko', TStrArray.Create('Bao', 'Carlos'));
    familyTree.Add('Bao', TStrArray.Create('Dalia', 'Elias'));
    familyTree.Add('Carlos', TStrArray.Create('Fatima', 'Gustavo'));
    familyTree.Add('Dalia', TStrArray.Create('Hassan', 'Isla'));
    familyTree.Add('Elias', TStrArray.Create('Javier'));
    familyTree.Add('Fatima', TStrArray.Create('Khadija', 'Liam'));
    familyTree.Add('Gustavo', TStrArray.Create('Mina'));
    familyTree.Add('Hassan', TStrArray.Create('Noah', 'Olga'));
    familyTree.Add('Isla', TStrArray.Create('Pedro'));
    familyTree.Add('Javier', TStrArray.Create('Quynh', 'Ravi'));
    familyTree.Add('Khadija', TStrArray.Create('Sofia'));
    familyTree.Add('Liam', TStrArray.Create('Tariq', 'Uma'));
    familyTree.Add('Mina', TStrArray.Create('Viktor', 'Wang'));
    familyTree.Add('Noah', TStrArray.Create('Xiomara'));
    familyTree.Add('Olga', TStrArray.Create('Yuki'));
    familyTree.Add('Pedro', TStrArray.Create('Zane', 'Aditi'));
    familyTree.Add('Quynh', TStrArray.Create('Boris'));
    familyTree.Add('Ravi', TStrArray.Create('Celine'));
    familyTree.Add('Sofia', TStrArray.Create('Diego', 'Elif'));
    familyTree.Add('Tariq', TStrArray.Create('Farah'));
    familyTree.Add('Uma', TStrArray.Create('Giorgio'));
    familyTree.Add('Viktor', TStrArray.Create('Hana', 'Ian'));
    familyTree.Add('Wang', TStrArray.Create('Jing'));
    familyTree.Add('Xiomara', TStrArray.Create('Kaito'));
    familyTree.Add('Yuki', TStrArray.Create('Leila'));
    familyTree.Add('Zane', TStrArray.Create('Mateo'));
    familyTree.Add('Aditi', TStrArray.Create('Nia'));
    familyTree.Add('Boris', TStrArray.Create('Oscar'));
    familyTree.Add('Celine', TStrArray.Create('Priya'));
    familyTree.Add('Diego', TStrArray.Create('Qi'));
    familyTree.Add('Elif', TStrArray.Create('Rami'));
    familyTree.Add('Farah', TStrArray.Create('Sven'));
    familyTree.Add('Giorgio', TStrArray.Create('Tomoko'));
    familyTree.Add('Hana', TStrArray.Create('Umar'));
    familyTree.Add('Ian', TStrArray.Create('Vera'));
    familyTree.Add('Jing', TStrArray.Create('Wyatt'));
    familyTree.Add('Kaito', TStrArray.Create('Xia'));
    familyTree.Add('Leila', TStrArray.Create('Yassin'));
    familyTree.Add('Mateo', TStrArray.Create('Zara'));
    familyTree.Add('Nia', TStrArray.Create('Antonio'));
    familyTree.Add('Oscar', TStrArray.Create('Bianca'));
    familyTree.Add('Priya', TStrArray.Create('Cai'));
    familyTree.Add('Qi', TStrArray.Create('Dimitri'));
    familyTree.Add('Rami', TStrArray.Create('Ewa'));
    familyTree.Add('Sven', TStrArray.Create('Fabio'));
    familyTree.Add('Tomoko', TStrArray.Create('Gabriela'));
    familyTree.Add('Umar', TStrArray.Create('Helena'));
    familyTree.Add('Vera', TStrArray.Create('Igor'));
    familyTree.Add('Wyatt', TStrArray.Create('Jun'));
    familyTree.Add('Xia', TStrArray.Create('Kim'));
    familyTree.Add('Yassin', TStrArray.Create('Lucia'));
    familyTree.Add('Zara', TStrArray.Create('Mohammed'));
    TapAssertTrue(Self, 'Complex graph, no shortcut, far removed nephew', 14, RelativeDistance.degreeOfSeparation(familyTree, 'Lucia', 'Jun'));
  finally
    familyTree.Free;
  end;
end;

// 46c9fbcb-e464-455f-a718-049ea3c7400a
procedure RelativeDistanceTest.complex_graph_some_shortcuts_cross_down_and_cross_up_cousins_several_times_removed_with_unrelated_family_tree;
var
  familyTree : TFamilyTree;
begin
  familyTree := TFamilyTree.Create;
  try
    familyTree.Add('Aiko', TStrArray.Create('Bao', 'Carlos'));
    familyTree.Add('Bao', TStrArray.Create('Dalia'));
    familyTree.Add('Carlos', TStrArray.Create('Fatima', 'Gustavo'));
    familyTree.Add('Dalia', TStrArray.Create('Hassan', 'Isla'));
    familyTree.Add('Fatima', TStrArray.Create('Khadija', 'Liam'));
    familyTree.Add('Gustavo', TStrArray.Create('Mina'));
    familyTree.Add('Hassan', TStrArray.Create('Noah', 'Olga'));
    familyTree.Add('Isla', TStrArray.Create('Pedro'));
    familyTree.Add('Javier', TStrArray.Create('Quynh', 'Ravi'));
    familyTree.Add('Khadija', TStrArray.Create('Sofia'));
    familyTree.Add('Liam', TStrArray.Create('Tariq', 'Uma'));
    familyTree.Add('Mina', TStrArray.Create('Viktor', 'Wang'));
    familyTree.Add('Noah', TStrArray.Create('Xiomara'));
    familyTree.Add('Olga', TStrArray.Create('Yuki'));
    familyTree.Add('Pedro', TStrArray.Create('Zane', 'Aditi'));
    familyTree.Add('Quynh', TStrArray.Create('Boris'));
    familyTree.Add('Ravi', TStrArray.Create('Celine'));
    familyTree.Add('Sofia', TStrArray.Create('Diego', 'Elif'));
    familyTree.Add('Tariq', TStrArray.Create('Farah'));
    familyTree.Add('Uma', TStrArray.Create('Giorgio'));
    familyTree.Add('Viktor', TStrArray.Create('Hana', 'Ian'));
    familyTree.Add('Wang', TStrArray.Create('Jing'));
    familyTree.Add('Xiomara', TStrArray.Create('Kaito'));
    familyTree.Add('Yuki', TStrArray.Create('Leila'));
    familyTree.Add('Zane', TStrArray.Create('Mateo'));
    familyTree.Add('Aditi', TStrArray.Create('Nia'));
    familyTree.Add('Boris', TStrArray.Create('Oscar'));
    familyTree.Add('Celine', TStrArray.Create('Priya'));
    familyTree.Add('Diego', TStrArray.Create('Qi'));
    familyTree.Add('Elif', TStrArray.Create('Rami'));
    familyTree.Add('Farah', TStrArray.Create('Sven'));
    familyTree.Add('Giorgio', TStrArray.Create('Tomoko'));
    familyTree.Add('Hana', TStrArray.Create('Umar'));
    familyTree.Add('Ian', TStrArray.Create('Vera'));
    familyTree.Add('Jing', TStrArray.Create('Wyatt'));
    familyTree.Add('Kaito', TStrArray.Create('Xia'));
    familyTree.Add('Leila', TStrArray.Create('Yassin'));
    familyTree.Add('Mateo', TStrArray.Create('Zara'));
    familyTree.Add('Nia', TStrArray.Create('Antonio'));
    familyTree.Add('Oscar', TStrArray.Create('Bianca'));
    familyTree.Add('Priya', TStrArray.Create('Cai'));
    familyTree.Add('Qi', TStrArray.Create('Dimitri'));
    familyTree.Add('Rami', TStrArray.Create('Ewa'));
    familyTree.Add('Sven', TStrArray.Create('Fabio'));
    familyTree.Add('Tomoko', TStrArray.Create('Gabriela'));
    familyTree.Add('Umar', TStrArray.Create('Helena'));
    familyTree.Add('Vera', TStrArray.Create('Igor'));
    familyTree.Add('Wyatt', TStrArray.Create('Jun'));
    familyTree.Add('Xia', TStrArray.Create('Kim'));
    familyTree.Add('Yassin', TStrArray.Create('Lucia'));
    familyTree.Add('Zara', TStrArray.Create('Mohammed'));
    TapAssertTrue(Self, 'Complex graph, some shortcuts, cross-down and cross-up, cousins several times removed, with unrelated family tree', 12, RelativeDistance.degreeOfSeparation(familyTree, 'Wyatt', 'Xia'));
  finally
    familyTree.Free;
  end;
end;

initialization
RegisterTest(RelativeDistanceTest);

end.
