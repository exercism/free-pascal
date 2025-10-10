Program MatchingBracketsTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, MatchingBrackets;

Begin
    Plan(20);

    TestIs(RunExercise('[]'), true, 'paired square brackets');
    TestIs(RunExercise(''), true, 'empty string');
    TestIs(RunExercise('[['), false, 'unpaired brackets');
    TestIs(RunExercise('}{'), false, 'wrong ordered brackets');
    TestIs(RunExercise('{]'), false, 'wrong closing bracket');
    TestIs(RunExercise('{ }'), true, 'paired with whitespace');
    TestIs(RunExercise('{[])'), false, 'partially paired brackets');
    TestIs(RunExercise('{[]}'), true, 'simple nested brackets');
    TestIs(RunExercise('{}[]'), true, 'several paired brackets');
    TestIs(RunExercise('([{}({}[])])'), true, 'paired and nested brackets');
    TestIs(RunExercise('{[)][]}'), false, 'unopened closing brackets');
    TestIs(RunExercise('([{])'), false, 'unpaired and nested brackets');
    TestIs(RunExercise('[({]})'), false, 'paired and wrong nested brackets');
    TestIs(RunExercise('[({}])'), false, 'paired and wrong nested brackets but innermost are correct');
    TestIs(RunExercise('{}['), false, 'paired and incomplete brackets');
    TestIs(RunExercise('[]]'), false, 'too many closing brackets');
    TestIs(RunExercise(')()'), false, 'early unexpected brackets');
    TestIs(RunExercise('{)()'), false, 'early mismatched brackets');
    TestIs(RunExercise('(((185 + 223.85) * 15) - 543)/2'), true, 'math expression');
    TestIs(RunExercise('\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)'), true, 'complex latex expression');

    DoneTesting;
End.
