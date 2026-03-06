unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SplitSecondStopwatchTest = class(TTestCase)
  published
    procedure new_stopwatch_starts_in_ready_state;
    procedure new_stopwatchs_current_lap_has_no_elapsed_time;
    procedure new_stopwatchs_total_has_no_elapsed_time;
    procedure new_stopwatch_does_not_have_previous_laps;
    procedure start_from_ready_state_changes_state_to_running;
    procedure start_does_not_change_previous_laps;
    procedure start_initiates_time_tracking_for_current_lap;
    procedure start_initiates_time_tracking_for_total;
    procedure start_cannot_be_called_from_running_state;
    procedure stop_from_running_state_changes_state_to_stopped;
    procedure stop_pauses_time_tracking_for_current_lap;
    procedure stop_pauses_time_tracking_for_total;
    procedure stop_cannot_be_called_from_ready_state;
    procedure stop_cannot_be_called_from_stopped_state;
    procedure start_from_stopped_state_changes_state_to_running;
    procedure start_from_stopped_state_resumes_time_tracking_for_current_lap;
    procedure start_from_stopped_state_resumes_time_tracking_for_total;
    procedure lap_adds_current_lap_to_previous_laps;
    procedure lap_resets_current_lap_and_resumes_time_tracking;
    procedure lap_continues_time_tracking_for_total;
    procedure lap_cannot_be_called_from_ready_state;
    procedure lap_cannot_be_called_from_stopped_state;
    procedure stop_does_not_change_previous_laps;
    procedure reset_from_stopped_state_changes_state_to_ready;
    procedure reset_resets_current_lap;
    procedure reset_clears_previous_laps;
    procedure reset_cannot_be_called_from_ready_state;
    procedure reset_cannot_be_called_from_running_state;
    procedure supports_very_long_laps;
  end;

implementation

uses SplitSecondStopwatch;

type
  TMethodPtr = procedure of object;

procedure TapAssertExpectionMessage(
  ACase             : TTestCase  ;
  const AMessage    : string     ;
  const expected    : string     ;
  const command     : TMethodPtr
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    command;
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// ddb238ea-99d4-4eaa-a81d-3c917a525a23
procedure SplitSecondStopwatchTest.new_stopwatch_starts_in_ready_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  TapAssertTrue(Self, 'new stopwatch starts in ready state', true, stopwatch.state = ready);
  stopwatch.Free;
end;

// b19635d4-08ad-4ac3-b87f-aca10e844071
procedure SplitSecondStopwatchTest.new_stopwatchs_current_lap_has_no_elapsed_time;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  TapAssertTrue(Self, 'new stopwatchs current lap has no elapsed time', '00:00:00', stopwatch.currentLap);
  stopwatch.Free;
end;

// 492eb532-268d-43ea-8a19-2a032067d335
procedure SplitSecondStopwatchTest.new_stopwatchs_total_has_no_elapsed_time;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  TapAssertTrue(Self, 'new stopwatchs total has no elapsed time', '00:00:00', stopwatch.total);
  stopwatch.Free;
end;

// 8a892c1e-9ef7-4690-894e-e155a1fe4484
procedure SplitSecondStopwatchTest.new_stopwatch_does_not_have_previous_laps;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  TapAssertTrue(Self, 'new stopwatch does not have previous laps', [], stopwatch.previousLaps);
  stopwatch.Free;
end;

// 5b2705b6-a584-4042-ba3a-4ab8d0ab0281
procedure SplitSecondStopwatchTest.start_from_ready_state_changes_state_to_running;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  TapAssertTrue(Self, 'start from ready state changes state to running', true, stopwatch.state = running);
  stopwatch.Free;
end;

// 748235ce-1109-440b-9898-0a431ea179b6
procedure SplitSecondStopwatchTest.start_does_not_change_previous_laps;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  TapAssertTrue(Self, 'start does not change previous laps', [], stopwatch.previousLaps);
  stopwatch.Free;
end;

// 491487b1-593d-423e-a075-aa78d449ff1f
procedure SplitSecondStopwatchTest.start_initiates_time_tracking_for_current_lap;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:05');
  TapAssertTrue(Self, 'start initiates time tracking for current lap', '00:00:05', stopwatch.currentLap);
  stopwatch.Free;
end;

// a0a7ba2c-8db6-412c-b1b6-cb890e9b72ed
procedure SplitSecondStopwatchTest.start_initiates_time_tracking_for_total;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:23');
  TapAssertTrue(Self, 'start initiates time tracking for total', '00:00:23', stopwatch.total);
  stopwatch.Free;
end;

// 7f558a17-ef6d-4a5b-803a-f313af7c41d3
procedure SplitSecondStopwatchTest.start_cannot_be_called_from_running_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  TapAssertExpectionMessage(Self, 'start cannot be called from running state', 'cannot start an already running stopwatch', @stopwatch.start);
  stopwatch.Free;
end;

// 32466eef-b2be-4d60-a927-e24fce52dab9
procedure SplitSecondStopwatchTest.stop_from_running_state_changes_state_to_stopped;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.stop;
  TapAssertTrue(Self, 'stop from running state changes state to stopped', true, stopwatch.state = stopped);
  stopwatch.Free;
end;

// 621eac4c-8f43-4d99-919c-4cad776d93df
procedure SplitSecondStopwatchTest.stop_pauses_time_tracking_for_current_lap;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:05');
  stopwatch.stop;
  stopwatch.advanceTime('00:00:08');
  TapAssertTrue(Self, 'stop pauses time tracking for current lap', '00:00:05', stopwatch.currentLap);
  stopwatch.Free;
end;

// 465bcc82-7643-41f2-97ff-5e817cef8db4
procedure SplitSecondStopwatchTest.stop_pauses_time_tracking_for_total;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:13');
  stopwatch.stop;
  stopwatch.advanceTime('00:00:44');
  TapAssertTrue(Self, 'stop pauses time tracking for total', '00:00:13', stopwatch.total);
  stopwatch.Free;
end;

// b1ba7454-d627-41ee-a078-891b2ed266fc
procedure SplitSecondStopwatchTest.stop_cannot_be_called_from_ready_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  TapAssertExpectionMessage(Self, 'stop cannot be called from ready state', 'cannot stop a stopwatch that is not running', @stopwatch.stop);
  stopwatch.Free;
end;

// 5c041078-0898-44dc-9d5b-8ebb5352626c
procedure SplitSecondStopwatchTest.stop_cannot_be_called_from_stopped_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.stop;
  TapAssertExpectionMessage(Self, 'stop cannot be called from stopped state', 'cannot stop a stopwatch that is not running', @stopwatch.stop);
  stopwatch.Free;
end;

// 3f32171d-8fbf-46b6-bc2b-0810e1ec53b7
procedure SplitSecondStopwatchTest.start_from_stopped_state_changes_state_to_running;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.stop;
  stopwatch.start;
  TapAssertTrue(Self, 'start from stopped state changes state to running', true, stopwatch.state = running);
  stopwatch.Free;
end;

// 626997cb-78d5-4fe8-b501-29fdef804799
procedure SplitSecondStopwatchTest.start_from_stopped_state_resumes_time_tracking_for_current_lap;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:01:20');
  stopwatch.stop;
  stopwatch.advanceTime('00:00:20');
  stopwatch.start;
  stopwatch.advanceTime('00:00:08');
  TapAssertTrue(Self, 'start from stopped state resumes time tracking for current lap', '00:01:28', stopwatch.currentLap);
  stopwatch.Free;
end;

// 58487c53-ab26-471c-a171-807ef6363319
procedure SplitSecondStopwatchTest.start_from_stopped_state_resumes_time_tracking_for_total;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:23');
  stopwatch.stop;
  stopwatch.advanceTime('00:00:44');
  stopwatch.start;
  stopwatch.advanceTime('00:00:09');
  TapAssertTrue(Self, 'start from stopped state resumes time tracking for total', '00:00:32', stopwatch.total);
  stopwatch.Free;
end;

// 091966e3-ed25-4397-908b-8bb0330118f8
procedure SplitSecondStopwatchTest.lap_adds_current_lap_to_previous_laps;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:01:38');
  stopwatch.lap;
  TapAssertTrue(Self, 'lap adds current lap to previous laps', ['00:01:38'], stopwatch.previousLaps);
  stopwatch.advanceTime('00:00:44');
  stopwatch.lap;
  TapAssertTrue(Self, 'lap adds current lap to previous laps', ['00:01:38', '00:00:44'], stopwatch.previousLaps);
  stopwatch.Free;
end;

// 1aa4c5ee-a7d5-4d59-9679-419deef3c88f
procedure SplitSecondStopwatchTest.lap_resets_current_lap_and_resumes_time_tracking;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:08:22');
  stopwatch.lap;
  TapAssertTrue(Self, 'lap resets current lap and resumes time tracking', '00:00:00', stopwatch.currentLap);
  stopwatch.advanceTime('00:00:15');
  TapAssertTrue(Self, 'lap resets current lap and resumes time tracking', '00:00:15', stopwatch.currentLap);
  stopwatch.Free;
end;

// 4b46b92e-1b3f-46f6-97d2-0082caf56e80
procedure SplitSecondStopwatchTest.lap_continues_time_tracking_for_total;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:22');
  stopwatch.lap;
  stopwatch.advanceTime('00:00:33');
  TapAssertTrue(Self, 'lap continues time tracking for total', '00:00:55', stopwatch.total);
  stopwatch.Free;
end;

// ea75d36e-63eb-4f34-97ce-8c70e620bdba
procedure SplitSecondStopwatchTest.lap_cannot_be_called_from_ready_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  TapAssertExpectionMessage(Self, 'lap cannot be called from ready state', 'cannot lap a stopwatch that is not running', @stopwatch.lap);
  stopwatch.Free;
end;

// 63731154-a23a-412d-a13f-c562f208eb1e
procedure SplitSecondStopwatchTest.lap_cannot_be_called_from_stopped_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.stop;
  TapAssertExpectionMessage(Self, 'lap cannot be called from stopped state', 'cannot lap a stopwatch that is not running', @stopwatch.lap);
  stopwatch.Free;
end;

// e585ee15-3b3f-4785-976b-dd96e7cc978b
procedure SplitSecondStopwatchTest.stop_does_not_change_previous_laps;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:11:22');
  stopwatch.lap;
  TapAssertTrue(Self, 'stop does not change previous laps', ['00:11:22'], stopwatch.previousLaps);
  stopwatch.stop;
  TapAssertTrue(Self, 'stop does not change previous laps', ['00:11:22'], stopwatch.previousLaps);
  stopwatch.Free;
end;

// fc3645e2-86cf-4d11-97c6-489f031103f6
procedure SplitSecondStopwatchTest.reset_from_stopped_state_changes_state_to_ready;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.stop;
  stopwatch.reset;
  TapAssertTrue(Self, 'reset from stopped state changes state to ready', true, stopwatch.state = ready);
  stopwatch.Free;
end;

// 20fbfbf7-68ad-4310-975a-f5f132886c4e
procedure SplitSecondStopwatchTest.reset_resets_current_lap;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:10');
  stopwatch.stop;
  stopwatch.reset;
  TapAssertTrue(Self, 'reset resets current lap', '00:00:00', stopwatch.currentLap);
  stopwatch.Free;
end;

// 00a8f7bb-dd5c-43e5-8705-3ef124007662
procedure SplitSecondStopwatchTest.reset_clears_previous_laps;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('00:00:10');
  stopwatch.lap;
  stopwatch.advanceTime('00:00:20');
  stopwatch.lap;
  TapAssertTrue(Self, 'reset clears previous laps', ['00:00:10', '00:00:20'], stopwatch.previousLaps);
  stopwatch.stop;
  stopwatch.reset;
  TapAssertTrue(Self, 'reset clears previous laps', [], stopwatch.previousLaps);
  stopwatch.Free;
end;

// 76cea936-6214-4e95-b6d1-4d4edcf90499
procedure SplitSecondStopwatchTest.reset_cannot_be_called_from_ready_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  TapAssertExpectionMessage(Self, 'reset cannot be called from ready state', 'cannot reset a stopwatch that is not stopped', @stopwatch.reset);
  stopwatch.Free;
end;

// ba4d8e69-f200-4721-b59e-90d8cf615153
procedure SplitSecondStopwatchTest.reset_cannot_be_called_from_running_state;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  TapAssertExpectionMessage(Self, 'reset cannot be called from running state', 'cannot reset a stopwatch that is not stopped', @stopwatch.reset);
  stopwatch.Free;
end;

// 0b01751a-cb57-493f-bb86-409de6e84306
procedure SplitSecondStopwatchTest.supports_very_long_laps;
var
  stopwatch : TStopwatch;
begin
  stopwatch := SplitSecondStopwatch.TStopwatch.create;
  stopwatch.start;
  stopwatch.advanceTime('01:23:45');
  TapAssertTrue(Self, 'supports very long laps', '01:23:45', stopwatch.currentLap);
  stopwatch.lap;
  TapAssertTrue(Self, 'supports very long laps', ['01:23:45'], stopwatch.previousLaps);
  stopwatch.advanceTime('04:01:40');
  TapAssertTrue(Self, 'supports very long laps', '04:01:40', stopwatch.currentLap);
  TapAssertTrue(Self, 'supports very long laps', '05:25:25', stopwatch.total);
  stopwatch.lap;
  TapAssertTrue(Self, 'supports very long laps', ['01:23:45', '04:01:40'], stopwatch.previousLaps);
  stopwatch.advanceTime('08:43:05');
  TapAssertTrue(Self, 'supports very long laps', '08:43:05', stopwatch.currentLap);
  TapAssertTrue(Self, 'supports very long laps', '14:08:30', stopwatch.total);
  stopwatch.lap;
  TapAssertTrue(Self, 'supports very long laps', ['01:23:45', '04:01:40', '08:43:05'], stopwatch.previousLaps);
  stopwatch.Free;
end;

initialization
RegisterTest(SplitSecondStopwatchTest);

end.
