{ Unit HelloWorld; }

{ Interface }
{ Function SayHi:   string; }

{ Implementation }

{ Function SayHi:   string; }
{ Begin }
{     SayHi := 'Goodbye, Mars!'; }
{ End; }

{ End. }

Unit HelloWorld;

Interface
Function SayHi:   string;

Implementation

Function SayHi:   string;
Begin
    SayHi := 'Hello, World!';
End;

End.
