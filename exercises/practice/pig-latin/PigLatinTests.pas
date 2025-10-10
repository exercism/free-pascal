Program PigLatinTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, PigLatin;

Begin
    Plan(23);

    TestIs(RunExercise('apple'), 'appleay', 'word beginning with a');
    TestIs(RunExercise('ear'), 'earay', 'word beginning with e');
    TestIs(RunExercise('igloo'), 'iglooay', 'word beginning with i');
    TestIs(RunExercise('object'), 'objectay', 'word beginning with o');
    TestIs(RunExercise('under'), 'underay', 'word beginning with u');
    TestIs(RunExercise('equal'), 'equalay', 'word beginning with a vowel and followed by a qu');
    TestIs(RunExercise('pig'), 'igpay', 'word beginning with p');
    TestIs(RunExercise('koala'), 'oalakay', 'word beginning with k');
    TestIs(RunExercise('xenon'), 'enonxay', 'word beginning with x');
    TestIs(RunExercise('qat'), 'atqay', 'word beginning with q without a following u');
    TestIs(RunExercise('liquid'), 'iquidlay', 'word beginning with consonant and vowel containing qu');
    TestIs(RunExercise('chair'), 'airchay', 'word beginning with ch');
    TestIs(RunExercise('queen'), 'eenquay', 'word beginning with qu');
    TestIs(RunExercise('square'), 'aresquay', 'word beginning with qu and a preceding consonant');
    TestIs(RunExercise('therapy'), 'erapythay', 'word beginning with th');
    TestIs(RunExercise('thrush'), 'ushthray', 'word beginning with thr');
    TestIs(RunExercise('school'), 'oolschay', 'word beginning with sch');
    TestIs(RunExercise('yttria'), 'yttriaay', 'word beginning with yt');
    TestIs(RunExercise('xray'), 'xrayay', 'word beginning with xr');
    TestIs(RunExercise('yellow'), 'ellowyay', 'y is treated like a consonant at the beginning of a word');
    TestIs(RunExercise('rhythm'), 'ythmrhay', 'y is treated like a vowel at the end of a consonant cluster');
    TestIs(RunExercise('my'), 'ymay', 'y as second letter in two letter word');
    TestIs(RunExercise('quick fast run'), 'ickquay astfay unray', 'a whole phrase');

    DoneTesting;
End.
