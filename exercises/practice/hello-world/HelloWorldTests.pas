Program HelloWorldTests;

Uses TAP, TAPCore, HelloWorld;

Begin
    Plan(1);

    TestIs(SayHi(), 'Hello, World!', 'Say Hi!');

    DoneTesting;
End.
