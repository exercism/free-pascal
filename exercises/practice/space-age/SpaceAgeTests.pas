Program SpaceAgeTests;

{$mode ObjFPC}

Uses TAP, Math, SysUtils, SpaceAge;

Procedure TestExceptionMessage(
    planet: String; seconds: LongInt;
    Expected: String; TestName : String
);
Begin
    Try RunExercise(planet, seconds);
    Except On E: Exception Do
        TestIs(E.Message, Expected, TestName);
    End;
End;

Begin
    Plan(9);

    TestIs(RunExercise('Earth'  , 1000000000), RoundTo( 3169 / 100, -2), 'age on Earth'  );
    TestIs(RunExercise('Mercury', 2134835688), RoundTo(28088 / 100, -2), 'age on Mercury');
    TestIs(RunExercise('Venus'   , 189839836), RoundTo(  978 / 100, -2), 'age on Venus'  );
    TestIs(RunExercise('Mars'   , 2129871239), RoundTo( 3588 / 100, -2), 'age on Mars'   );
    TestIs(RunExercise('Jupiter',  901876382), RoundTo(  241 / 100, -2), 'age on Jupiter');
    TestIs(RunExercise('Saturn' , 2000000000), RoundTo(  215 / 100, -2), 'age on Saturn' );
    TestIs(RunExercise('Uranus' , 1210123456), RoundTo(   46 / 100, -2), 'age on Uranus' );
    TestIs(RunExercise('Neptune', 1821023456), RoundTo(   35 / 100, -2), 'age on Neptune');
    TestExceptionMessage('Sun', 680804807, 'not a planet', 'invalid planet causes error');

    DoneTesting;
End.
