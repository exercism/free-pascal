Unit PigLatin;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const phrase : String ) :   String;

Implementation

Uses Character, StrUtils;

Function IsVowel(Const chr : Char) :   Boolean;
Begin
    Result := chr In ['a', 'e', 'i', 'o', 'u'];
End;

Function IsConsonant(Const chr : Char) :   Boolean;
Begin
    Result := IsLetter(chr) And Not(IsVowel(chr));
End;

Function RunExercise(Const phrase : String ) :   String;

Var
    translate  :   String;
    words      :   Array Of String;
    i, j, clen :   Integer;
Begin
    words := SplitString(phrase, ' ');
    For i := Low(words) To High(words) Do
        Begin
            If IsVowel(words[i][1]) Or
               (Copy(words[i], 1, 2) = 'xr') Or
               (Copy(words[i], 1, 2) = 'yt') Then
                words[i] := words[i] + 'ay'
            Else If IsConsonant(words[i][1]) Then
                     Begin
                         clen := 1;
                         For j := 2 To Length(words[i]) Do
                             Begin
                                 If IsConsonant(words[i][j]) And
                                    (words[i][j] <> 'y') Then
                                     Inc(clen)
                                 Else break;
                             End;
                         If (Copy(words[i], clen, 2) = 'qu') Then Inc(clen);
                         words[i] := Copy(words[i], clen + 1) +
                                     Copy(words[i], 1, clen)  +
                                     'ay';
                     End;
        End;

    translate := '';
    For i := Low(words) To High(words) Do
        If translate = '' Then translate := words[i]
        Else translate := translate + ' ' + words[i];

    Result := translate;

End;

End.
