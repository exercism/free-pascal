Unit Raindrops;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(number: integer) : string;

Implementation

uses sysUtils;

var
   sounds : string;

Function RunExercise(number: integer) : string;
Begin

   sounds := '';

   if number mod 3 = 0 then sounds := sounds + 'Pling';
   if number mod 5 = 0 then sounds := sounds + 'Plang';
   if number mod 7 = 0 then sounds := sounds + 'Plong';

   if sounds = '' then sounds := intToStr(number);

   Result := sounds;

End;

End.
