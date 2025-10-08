Unit SecretHandshake;

{$mode ObjFPC}{$H+}

Interface

Type
    DynStringArray =   Array Of String;

Function RunExercise(Const number : Integer) :   DynStringArray;

Implementation

Type
    TOperation     =   Record
        bit  :   Integer;
        action :   String
    End;

Const
    OperationList:   Array Of TOperation =   (
        (bit: %00001; action: 'wink'           ),
        (bit: %00010; action: 'double blink'   ),
        (bit: %00100; action: 'close your eyes'),
        (bit: %01000; action: 'jump'           )
    );

Function RunExercise(Const number : Integer ) :   DynStringArray;
Var
    i, idx     :   integer;
    operations :   DynStringArray;
Begin
    operations := [];
    For i := Low(OperationList) To High(OperationList) Do
        Begin
            If number And OperationList[i].bit <> 0 Then
                Begin
                    If number And %10000 <> 0 Then idx := 0
                    else idx := Length(operations);
                    Insert(OperationList[i].action, operations, idx);
                End;
        End;
    Result := operations;
End;

End.
