Program BinarySearchTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, BinarySearch;

Procedure TestExceptionMessage(
    Const AArray: Array Of Integer; AValue : Integer;
    Const Expected: String; Const TestName : String
);
Var ErrorMessage :   String;
Begin
    ErrorMessage := '';
    Try RunExercise(AArray, AValue);
    Except On E: Exception Do ErrorMessage := E.Message End;
    TestIs(ErrorMessage, Expected, TestName);
End;

Begin
    Plan(11);

    TestIs(RunExercise([6], 6), 0, 'finds a value in an array with one element');
    TestIs(RunExercise([1,3,4,6,8,9,11], 6), 3, 'finds a value in the middle of an array');
    TestIs(RunExercise([1,3,4,6,8,9,11], 1), 0, 'finds a value at the beginning of an array');
    TestIs(RunExercise([1,3,4,6,8,9,11], 11), 6, 'finds a value at the end of an array');
    TestIs(RunExercise([1,3,5,8,13,21,34,55,89,144,233,377,634], 144), 9, 'finds a value in an array of odd length');
    TestIs(RunExercise([1,3,5,8,13,21,34,55,89,144,233,377], 21), 5, 'finds a value in an array of even length');
    TestExceptionMessage([1,3,4,6,8,9,11], 7, 'value not in array', 'identifies that a value is not included in the array');
    TestExceptionMessage([1,3,4,6,8,9,11], 0, 'value not in array', 'a value smaller than the array''s smallest value is not found');
    TestExceptionMessage([1,3,4,6,8,9,11], 13, 'value not in array', 'a value larger than the array''s largest value is not found');
    TestExceptionMessage([], 1, 'value not in array', 'nothing is found in an empty array');
    TestExceptionMessage([1,2], 0, 'value not in array', 'nothing is found when the left and right bounds cross');

    DoneTesting;
End.
