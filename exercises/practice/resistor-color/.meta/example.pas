Unit ResistorColor;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(color: String) :   Int8;
Function RunExercise() :              String;

Implementation

Uses TypInfo;

Type
    ColorCodes =   (
        black, brown, red, orange, yellow, green, blue, violet, grey, white
    );

Var
    id        :   ColorCodes;
    ColorName, ColorList :   String;

Function RunExercise(color: String) :   Int8;
Begin
    Result := GetEnumValue(TypeInfo(ColorCodes), color);
End;

Function RunExercise() :   String;
Begin
    ColorList := '';
    For id := Low(ColorCodes) To High(ColorCodes) Do
        Begin
            WriteStr(ColorName, id);
            If ColorList = '' Then ColorList := ColorName
            Else ColorList := ColorList + ', ' + ColorName;
        End;
    Result := ColorList;
End;

End.
