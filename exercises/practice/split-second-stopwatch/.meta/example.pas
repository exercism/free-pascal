unit SplitSecondStopwatch;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

  TStopwatchState = (ready, running, stopped);

  TStopwatch = class
  private
    fState : TStopwatchState;
    fHistory : Array of UInt32;
    fCurrent : UInt32;
  public
    constructor create();
    function state: TStopwatchState;
    function currentLap: String;
    function previousLaps: TStrArray;
    function total: String;
    procedure start;
    procedure stop;
    procedure reset;
    procedure advanceTime(const by : String);
    procedure lap;
  end;

implementation

uses SysUtils;

function SecondsToTimeStr(n: UInt32): String;
var
  hours, minutes, seconds: UInt32;
begin
  hours := n div 3600;
  minutes := (n mod 3600) div 60;
  seconds := (n mod 3600) mod 60;
  result := SysUtils.Format('%.2d:%.2d:%.2d', [hours, minutes, seconds]);
end;

constructor TStopwatch.create();
begin
  fState := ready;
  fHistory := [];
  fCurrent := 0;
end;

function TStopwatch.state: TStopwatchState;
begin
  result := fState;
end;

function TStopwatch.currentLap: String;
begin
  result := SecondsToTimeStr(fCurrent);
end;

function TStopwatch.previousLaps: TStrArray;
var
  i: Integer;
begin
  result := [];
  SetLength(result, Length(fHistory));
  for i := Low(fHistory) to High(fHistory) do
    result[i] := SecondsToTimeStr(fHistory[i]);
end;

function TStopwatch.total: String;
var
  sum: UInt32;
  i: Integer;
begin
  sum := fCurrent;
  for i := Low(fHistory) to High(fHistory) do
    sum += fHistory[i];
  result := SecondsToTimeStr(sum);
end;

procedure TStopwatch.start;
begin
  if fState = running then
    raise Exception.Create('cannot start an already running stopwatch');
  fState := running;
end;

procedure TStopwatch.stop;
begin
  if fState <> running then
    raise Exception.Create('cannot stop a stopwatch that is not running');
  fState := stopped;
end;

procedure TStopwatch.reset;
begin
  if fState <> stopped then
    raise Exception.Create('cannot reset a stopwatch that is not stopped');
  fState := ready;
  fHistory := [];
  fCurrent := 0;
end;

procedure TStopwatch.advanceTime(const by: String);
var
  hours, minutes, seconds: UInt32;
begin
  if fState <> running then
    exit;
  hours   := StrToInt(Copy(by, 1, 2));
  minutes := StrToInt(Copy(by, 4, 2));
  seconds := StrToInt(Copy(by, 7, 2));
  fCurrent += 3600 * hours + 60 * minutes + seconds;
end;

procedure TStopwatch.lap;
begin
  if fState <> running then
    raise Exception.Create('cannot lap a stopwatch that is not running');
  Insert(fCurrent, fHistory, Length(fHistory));
  fCurrent := 0;
end;

end.
