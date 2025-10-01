Program VerifyExercises;

{$mode objfpc}

Uses sysutils, process;

Var
    execdir  :   string;
    rootdir  :   string;
    workdir  :   string;
    FileInfo :   TSearchRec;
    slugs    :   array Of string =   ();
    i        :   integer;
    stdout   :   ansistring;

Begin
    execdir := ExtractFilePath(ParamStr(0));
    rootdir := ExpandFileName(ConcatPaths([execdir, '..']));
    workdir := ConcatPaths([rootdir, 'exercises', 'practice']);
    SetCurrentDir(workdir);

    If FindFirst ('*', faDirectory, FileInfo) = 0 Then
        Begin
            Repeat
                With FileInfo Do
                    Begin
                        If (Attr And faDirectory) = faDirectory Then
                            If (Name <> '.') And (Name <> '..') Then
                                Insert(Name, slugs, 0);
                    End;
            Until FindNext(FileInfo) <> 0;
            FindClose(FileInfo);
        End;

    For i := Low(slugs) To High(slugs) Do
        Begin
            SetCurrentDir(ConcatPaths([workdir, slugs[i]]));
            writeln('exercise: ', slugs[i]);
            If RunCommand('make', [''], stdout) Then writeln(stdout);
        End;

End.
