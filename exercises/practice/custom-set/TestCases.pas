unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  CustomSetTest = class(TTestCase)
  published
    procedure sets_with_no_elements_are_empty;
    procedure sets_with_elements_are_not_empty;
    procedure nothing_is_contained_in_an_empty_set;
    procedure when_the_element_is_in_the_set;
    procedure when_the_element_is_not_in_the_set;
    procedure empty_set_is_a_subset_of_another_empty_set;
    procedure empty_set_is_a_subset_of_non_empty_set;
    procedure non_empty_set_is_not_a_subset_of_empty_set;
    procedure set_is_a_subset_of_set_with_exact_same_elements;
    procedure set_is_a_subset_of_larger_set_with_same_elements;
    procedure set_is_not_a_subset_of_set_that_does_not_contain_its_elements;
    procedure the_empty_set_is_disjoint_with_itself;
    procedure empty_set_is_disjoint_with_non_empty_set;
    procedure non_empty_set_is_disjoint_with_empty_set;
    procedure sets_are_not_disjoint_if_they_share_an_element;
    procedure sets_are_disjoint_if_they_share_no_elements;
    procedure empty_sets_are_equal;
    procedure empty_set_is_not_equal_to_non_empty_set;
    procedure non_empty_set_is_not_equal_to_empty_set;
    procedure sets_with_the_same_elements_are_equal;
    procedure sets_with_different_elements_are_not_equal;
    procedure set_is_not_equal_to_larger_set_with_same_elements;
    procedure set_is_equal_to_a_set_constructed_from_an_array_with_duplicates;
    procedure add_to_empty_set;
    procedure add_to_non_empty_set;
    procedure adding_an_existing_element_does_not_change_the_set;
    procedure intersection_of_two_empty_sets_is_an_empty_set;
    procedure intersection_of_an_empty_set_and_non_empty_set_is_an_empty_set;
    procedure intersection_of_a_non_empty_set_and_an_empty_set_is_an_empty_set;
    procedure intersection_of_two_sets_with_no_shared_elements_is_an_empty_set;
    procedure intersection_of_two_sets_with_shared_elements_is_a_set_of_the_shared_elements;
    procedure difference_of_two_empty_sets_is_an_empty_set;
    procedure difference_of_empty_set_and_non_empty_set_is_an_empty_set;
    procedure difference_of_a_non_empty_set_and_an_empty_set_is_the_non_empty_set;
    procedure difference_of_two_non_empty_sets_is_a_set_of_elements_that_are_only_in_the_first_set;
    procedure difference_removes_all_duplicates_in_the_first_set;
    procedure union_of_empty_sets_is_an_empty_set;
    procedure union_of_an_empty_set_and_non_empty_set_is_the_non_empty_set;
    procedure union_of_a_non_empty_set_and_empty_set_is_the_non_empty_set;
    procedure union_of_non_empty_sets_contains_all_unique_elements;
  end;

implementation

uses CustomSet;

// 20c5f855-f83a-44a7-abdd-fe75c6cf022b
procedure CustomSetTest.sets_with_no_elements_are_empty;
begin
  TapAssertTrue(Self, 'sets with no elements are empty', true, CustomSet.empty([]));
end;

// d506485d-5706-40db-b7d8-5ceb5acf88d2
procedure CustomSetTest.sets_with_elements_are_not_empty;
begin
  TapAssertTrue(Self, 'sets with elements are not empty', false, CustomSet.empty([1]));
end;

// 759b9740-3417-44c3-8ca3-262b3c281043
procedure CustomSetTest.nothing_is_contained_in_an_empty_set;
begin
  TapAssertTrue(Self, 'nothing is contained in an empty set', false, CustomSet.contains([], 1));
end;

// f83cd2d1-2a85-41bc-b6be-80adbff4be49
procedure CustomSetTest.when_the_element_is_in_the_set;
begin
  TapAssertTrue(Self, 'when the element is in the set', true, CustomSet.contains([1, 2, 3], 1));
end;

// 93423fc0-44d0-4bc0-a2ac-376de8d7af34
procedure CustomSetTest.when_the_element_is_not_in_the_set;
begin
  TapAssertTrue(Self, 'when the element is not in the set', false, CustomSet.contains([1, 2, 3], 4));
end;

// c392923a-637b-4495-b28e-34742cd6157a
procedure CustomSetTest.empty_set_is_a_subset_of_another_empty_set;
begin
  TapAssertTrue(Self, 'empty set is a subset of another empty set', true, CustomSet.subset([], []));
end;

// 5635b113-be8c-4c6f-b9a9-23c485193917
procedure CustomSetTest.empty_set_is_a_subset_of_non_empty_set;
begin
  TapAssertTrue(Self, 'empty set is a subset of non-empty set', true, CustomSet.subset([], [1]));
end;

// 832eda58-6d6e-44e2-92c2-be8cf0173cee
procedure CustomSetTest.non_empty_set_is_not_a_subset_of_empty_set;
begin
  TapAssertTrue(Self, 'non-empty set is not a subset of empty set', false, CustomSet.subset([1], []));
end;

// c830c578-8f97-4036-b082-89feda876131
procedure CustomSetTest.set_is_a_subset_of_set_with_exact_same_elements;
begin
  TapAssertTrue(Self, 'set is a subset of set with exact same elements', true, CustomSet.subset([1, 2, 3], [1, 2, 3]));
end;

// 476a4a1c-0fd1-430f-aa65-5b70cbc810c5
procedure CustomSetTest.set_is_a_subset_of_larger_set_with_same_elements;
begin
  TapAssertTrue(Self, 'set is a subset of larger set with same elements', true, CustomSet.subset([1, 2, 3], [4, 1, 2, 3]));
end;

// d2498999-3e46-48e4-9660-1e20c3329d3d
procedure CustomSetTest.set_is_not_a_subset_of_set_that_does_not_contain_its_elements;
begin
  TapAssertTrue(Self, 'set is not a subset of set that does not contain its elements', false, CustomSet.subset([1, 2, 3], [4, 1, 3]));
end;

// 7d38155e-f472-4a7e-9ad8-5c1f8f95e4cc
procedure CustomSetTest.the_empty_set_is_disjoint_with_itself;
begin
  TapAssertTrue(Self, 'the empty set is disjoint with itself', true, CustomSet.disjoint([], []));
end;

// 7a2b3938-64b6-4b32-901a-fe16891998a6
procedure CustomSetTest.empty_set_is_disjoint_with_non_empty_set;
begin
  TapAssertTrue(Self, 'empty set is disjoint with non-empty set', true, CustomSet.disjoint([], [1]));
end;

// 589574a0-8b48-48ea-88b0-b652c5fe476f
procedure CustomSetTest.non_empty_set_is_disjoint_with_empty_set;
begin
  TapAssertTrue(Self, 'non-empty set is disjoint with empty set', true, CustomSet.disjoint([1], []));
end;

// febeaf4f-f180-4499-91fa-59165955a523
procedure CustomSetTest.sets_are_not_disjoint_if_they_share_an_element;
begin
  TapAssertTrue(Self, 'sets are not disjoint if they share an element', false, CustomSet.disjoint([1, 2], [2, 3]));
end;

// 0de20d2f-c952-468a-88c8-5e056740f020
procedure CustomSetTest.sets_are_disjoint_if_they_share_no_elements;
begin
  TapAssertTrue(Self, 'sets are disjoint if they share no elements', true, CustomSet.disjoint([1, 2], [3, 4]));
end;

// 4bd24adb-45da-4320-9ff6-38c044e9dff8
procedure CustomSetTest.empty_sets_are_equal;
begin
  TapAssertTrue(Self, 'empty sets are equal', true, CustomSet.equal([], []));
end;

// f65c0a0e-6632-4b2d-b82c-b7c6da2ec224
procedure CustomSetTest.empty_set_is_not_equal_to_non_empty_set;
begin
  TapAssertTrue(Self, 'empty set is not equal to non-empty set', false, CustomSet.equal([], [1, 2, 3]));
end;

// 81e53307-7683-4b1e-a30c-7e49155fe3ca
procedure CustomSetTest.non_empty_set_is_not_equal_to_empty_set;
begin
  TapAssertTrue(Self, 'non-empty set is not equal to empty set', false, CustomSet.equal([1, 2, 3], []));
end;

// d57c5d7c-a7f3-48cc-a162-6b488c0fbbd0
procedure CustomSetTest.sets_with_the_same_elements_are_equal;
begin
  TapAssertTrue(Self, 'sets with the same elements are equal', true, CustomSet.equal([1, 2], [2, 1]));
end;

// dd61bafc-6653-42cc-961a-ab071ee0ee85
procedure CustomSetTest.sets_with_different_elements_are_not_equal;
begin
  TapAssertTrue(Self, 'sets with different elements are not equal', false, CustomSet.equal([1, 2, 3], [1, 2, 4]));
end;

// 06059caf-9bf4-425e-aaff-88966cb3ea14
procedure CustomSetTest.set_is_not_equal_to_larger_set_with_same_elements;
begin
  TapAssertTrue(Self, 'set is not equal to larger set with same elements', false, CustomSet.equal([1, 2, 3], [1, 2, 3, 4]));
end;

// d4a1142f-09aa-4df9-8b83-4437dcf7ec24
procedure CustomSetTest.set_is_equal_to_a_set_constructed_from_an_array_with_duplicates;
begin
  TapAssertTrue(Self, 'set is equal to a set constructed from an array with duplicates', true, CustomSet.equal([1], [1, 1]));
end;

// 8a677c3c-a658-4d39-bb88-5b5b1a9659f4
procedure CustomSetTest.add_to_empty_set;
begin
  TapAssertTrue(Self, 'add to empty set', [3], CustomSet.add([], 3));
end;

// 0903dd45-904d-4cf2-bddd-0905e1a8d125
procedure CustomSetTest.add_to_non_empty_set;
begin
  TapAssertTrue(Self, 'add to non-empty set', [1, 2, 3, 4], CustomSet.add([1, 2, 4], 3));
end;

// b0eb7bb7-5e5d-4733-b582-af771476cb99
procedure CustomSetTest.adding_an_existing_element_does_not_change_the_set;
begin
  TapAssertTrue(Self, 'adding an existing element does not change the set', [1, 2, 3], CustomSet.add([1, 2, 3], 3));
end;

// 893d5333-33b8-4151-a3d4-8f273358208a
procedure CustomSetTest.intersection_of_two_empty_sets_is_an_empty_set;
begin
  TapAssertTrue(Self, 'intersection of two empty sets is an empty set', [], CustomSet.intersection([], []));
end;

// d739940e-def2-41ab-a7bb-aaf60f7d782c
procedure CustomSetTest.intersection_of_an_empty_set_and_non_empty_set_is_an_empty_set;
begin
  TapAssertTrue(Self, 'intersection of an empty set and non-empty set is an empty set', [], CustomSet.intersection([], [3, 2, 5]));
end;

// 3607d9d8-c895-4d6f-ac16-a14956e0a4b7
procedure CustomSetTest.intersection_of_a_non_empty_set_and_an_empty_set_is_an_empty_set;
begin
  TapAssertTrue(Self, 'intersection of a non-empty set and an empty set is an empty set', [], CustomSet.intersection([1, 2, 3, 4], []));
end;

// b5120abf-5b5e-41ab-aede-4de2ad85c34e
procedure CustomSetTest.intersection_of_two_sets_with_no_shared_elements_is_an_empty_set;
begin
  TapAssertTrue(Self, 'intersection of two sets with no shared elements is an empty set', [], CustomSet.intersection([1, 2, 3], [4, 5, 6]));
end;

// af21ca1b-fac9-499c-81c0-92a591653d49
procedure CustomSetTest.intersection_of_two_sets_with_shared_elements_is_a_set_of_the_shared_elements;
begin
  TapAssertTrue(Self, 'intersection of two sets with shared elements is a set of the shared elements', [2, 3], CustomSet.intersection([1, 2, 3, 4], [3, 2, 5]));
end;

// c5e6e2e4-50e9-4bc2-b89f-c518f015b57e
procedure CustomSetTest.difference_of_two_empty_sets_is_an_empty_set;
begin
  TapAssertTrue(Self, 'difference of two empty sets is an empty set', [], CustomSet.difference([], []));
end;

// 2024cc92-5c26-44ed-aafd-e6ca27d6fcd2
procedure CustomSetTest.difference_of_empty_set_and_non_empty_set_is_an_empty_set;
begin
  TapAssertTrue(Self, 'difference of empty set and non-empty set is an empty set', [], CustomSet.difference([], [3, 2, 5]));
end;

// e79edee7-08aa-4c19-9382-f6820974b43e
procedure CustomSetTest.difference_of_a_non_empty_set_and_an_empty_set_is_the_non_empty_set;
begin
  TapAssertTrue(Self, 'difference of a non-empty set and an empty set is the non-empty set', [1, 2, 3, 4], CustomSet.difference([1, 2, 3, 4], []));
end;

// c5ac673e-d707-4db5-8d69-7082c3a5437e
procedure CustomSetTest.difference_of_two_non_empty_sets_is_a_set_of_elements_that_are_only_in_the_first_set;
begin
  TapAssertTrue(Self, 'difference of two non-empty sets is a set of elements that are only in the first set', [1, 3], CustomSet.difference([3, 2, 1], [2, 4]));
end;

// 20d0a38f-7bb7-4c4a-ac15-90c7392ecf2b
procedure CustomSetTest.difference_removes_all_duplicates_in_the_first_set;
begin
  TapAssertTrue(Self, 'difference removes all duplicates in the first set', [], CustomSet.difference([1, 1], [1]));
end;

// c45aed16-5494-455a-9033-5d4c93589dc6
procedure CustomSetTest.union_of_empty_sets_is_an_empty_set;
begin
  TapAssertTrue(Self, 'union of empty sets is an empty set', [], CustomSet.union([], []));
end;

// 9d258545-33c2-4fcb-a340-9f8aa69e7a41
procedure CustomSetTest.union_of_an_empty_set_and_non_empty_set_is_the_non_empty_set;
begin
  TapAssertTrue(Self, 'union of an empty set and non-empty set is the non-empty set', [2], CustomSet.union([], [2]));
end;

// 3aade50c-80c7-4db8-853d-75bac5818b83
procedure CustomSetTest.union_of_a_non_empty_set_and_empty_set_is_the_non_empty_set;
begin
  TapAssertTrue(Self, 'union of a non-empty set and empty set is the non-empty set', [1, 3], CustomSet.union([1, 3], []));
end;

// a00bb91f-c4b4-4844-8f77-c73e2e9df77c
procedure CustomSetTest.union_of_non_empty_sets_contains_all_unique_elements;
begin
  TapAssertTrue(Self, 'union of non-empty sets contains all unique elements', [1, 2, 3], CustomSet.union([1, 3], [2, 3]));
end;

initialization
RegisterTest(CustomSetTest);

end.
