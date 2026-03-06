unit RobotSimulator;

{$mode ObjFPC}{$H+}

interface

type
  TPosition = record
    x: Int64;
    y: Int64;
  end;

  TDirection = (north, east, south, west);

  TRobot = class
  private
    { Please implement your solution. }
  public
    constructor Create(const pos: TPosition; const dir: TDirection);
    procedure Move(const instructions : String);
    function ToString: String; override;
  end;

implementation

uses SysUtils;

constructor TRobot.Create(const pos: TPosition; const dir: TDirection);
begin
  if (pos.x = pos.x) and (pos.y = pos.y) and (dir = dir) then
    raise ENotImplemented.Create('Please implement your solution.');
end;

procedure TRobot.Move(const instructions : String);
begin
  if instructions = instructions then
    raise ENotImplemented.Create('Please implement your solution.');
end;

function TRobot.ToString: String;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  result := '';
end;

end.
