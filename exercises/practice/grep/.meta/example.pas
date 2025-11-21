unit Grep;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function grep(
  const pattern : string;
  const flags   : TStrArray;
  const files   : TStrArray
) : TStrArray;

implementation

uses SysUtils, StrUtils, Classes;

function grep(
  const pattern : string;
  const flags   : TStrArray;
  const files   : TStrArray
) : TStrArray;
var
  i               : integer;
  LineContent     : string;
  LineNumber      : integer;
  LText, LPattern : string;
  PatternCount    : integer = 0;
  PatternContent  : string;
  TFIn            : TextFile;
  FlagN           : boolean = false;
  FlagL           : boolean = false;
  FlagI           : boolean = false;
  FlagV           : boolean = false;
  FlagX           : boolean = false;
begin
  for i := low(flags) to high(flags) do
    begin
      case flags[i] of
        '-n' : FlagN := true;
        '-l' : FlagL := true;
        '-i' : FlagI := true;
        '-v' : FlagV := true;
        '-x' : FlagX := true;
      end;
    end;
  result := [];
  LPattern := IfThen(FlagI, LowerCase(pattern), pattern);
  for i := low(files) to high(files) do
    begin
      LineNumber := 0;
      AssignFile(TFIn, files[i]);
      reset(TFIn);
      while not eof(TFIn) do
        begin
          PatternContent := '';
          inc(LineNumber);
          ReadLn(TFIn, LineContent);
          LText := IfThen(FlagI, LowerCase(LineContent), LineContent);
          if FlagX then
            begin
              if FlagV then
                begin
                  if LPattern <> LText then PatternContent := LineContent;
                end
              else
                begin
                  if LPattern = LText then PatternContent := LineContent;
                end
            end
          else if FlagV then
            begin
              if pos(LPattern, LText) = 0 then PatternContent := LineContent;
            end
          else if pos(LPattern, LText) > 0 then PatternContent := LineContent;
          if PatternContent <> '' then
          begin
            if FlagL then
              begin
                insert(files[i], result, length(result));
                break;
              end;
            inc(PatternCount);
            if FlagN then
              PatternContent := format('%d:%s', [LineNumber, PatternContent]);
            if length(files) > 1 then
              PatternContent := format('%s:%s', [files[i], PatternContent]);
            insert(PatternContent, result, PatternCount - 1);
          end;
        end;
      CloseFile(TFIn);
    end;
end;

end.
