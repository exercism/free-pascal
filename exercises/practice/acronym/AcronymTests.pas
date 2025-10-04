Program AcronymTests;

{$mode ObjFPC}{$H+}

Uses TAP, TAPCore, SysUtils, Acronym;

Begin
    Plan(9);

    TestIs(RunExercise('Portable Network Graphics'), 'PNG', 'basic');
    TestIs(RunExercise('Ruby on Rails'), 'ROR', 'lowercase words');
    TestIs(RunExercise('First In, First Out'), 'FIFO', 'punctuation');
    TestIs(RunExercise('GNU Image Manipulation Program'), 'GIMP', 'all caps word');
    TestIs(RunExercise('Complementary metal-oxide semiconductor'), 'CMOS', 'punctuation without whitespace');
    TestIs(RunExercise('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'), 'ROTFLSHTMDCOALM', 'very long abbreviation');
    TestIs(RunExercise('Something - I made up from thin air'), 'SIMUFTA', 'consecutive delimiters');
    TestIs(RunExercise('Halley''s Comet'), 'HC', 'apostrophes');
    TestIs(RunExercise('The Road _Not_ Taken'), 'TRNT', 'underscore emphasis');

    DoneTesting;
End.
