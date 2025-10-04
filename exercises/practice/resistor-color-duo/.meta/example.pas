Unit ResistorColorDuo;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(colors: Array Of String) : Int8;

Implementation

Uses TypInfo;

Type
    ColorCodes =   (
        black, brown, red, orange, yellow, green, blue, violet, grey, white
    );

Function RunExercise(colors: Array Of String) : Int8;
Begin

   Result := GetEnumValue(TypeInfo(ColorCodes), colors[0]) * 10
           + GetEnumValue(TypeInfo(ColorCodes), colors[1]);

End;

End.
