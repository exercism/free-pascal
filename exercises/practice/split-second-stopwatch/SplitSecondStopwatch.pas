unit SplitSecondStopwatch;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

  TStopwatchState = (ready, running, stopped);

  TStopwatch = class
  private
    { Please implement your solution. }
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

constructor TStopwatch.create();
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

function TStopwatch.state: TStopwatchState;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := stopped;
end;

function TStopwatch.currentLap: String;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := total;
end;

function TStopwatch.previousLaps: TStrArray;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := [currentLap];
end;

function TStopwatch.total: String;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := currentLap;
end;

procedure TStopwatch.start;
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

procedure TStopwatch.stop;
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

procedure TStopwatch.reset;
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

procedure TStopwatch.advanceTime(const by : String);
begin
  if by = by then
    raise ENotImplemented.Create('Please implement your solution.');
end;

procedure TStopwatch.lap;
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

end.
