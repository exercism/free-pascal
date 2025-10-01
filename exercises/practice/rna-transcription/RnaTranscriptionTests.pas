Program RnaTranscriptionTests;

Uses TAP, TAPCore, RnaTranscription;

Begin
    Plan(3);

    TestIs(RunExercise(''), '', 'Empty RNA sequence');
    TestIs(RunExercise('C'), 'G', 'RNA complement of cytosine is guanine');
    TestIs(RunExercise('G'), 'C', 'RNA complement of guanine is cytosine');
    TestIs(RunExercise('T'), 'A', 'RNA complement of thymine is adenine');
    TestIs(RunExercise('A'), 'U', 'RNA complement of adenine is uracil');
    TestIs(RunExercise('ACGTGGTCTTAA'), 'UGCACCAGAAUU', 'RNA complement');

    DoneTesting;
End.
