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
    fpos: TPosition;
    fdir: TDirection;
  public
    constructor Create(const pos: TPosition; const dir: TDirection);
    procedure Move(const instructions : String);
    function ToString: String; override;
  end;

implementation

uses SysUtils;

constructor TRobot.Create(const pos: TPosition; const dir: TDirection);
begin
  fpos := pos;
  fdir := dir;
end;

procedure TRobot.Move(const instructions : String);
var
  c : Char;
begin
  for c in instructions do
    case c of
      'R':
        case fdir of
          north: fdir := east;
          east: fdir := south;
          south: fdir := west;
          west: fdir := north;
        end;
      'L':
        case fdir of
          north: fdir := west;
          east: fdir := north;
          south: fdir := east;
          west: fdir := south;
        end;
      'A':
        case fdir of
          north: fpos.y := fpos.y + 1;
          east: fpos.x := fpos.x + 1;
          south: fpos.y := fpos.y - 1;
          west: fpos.x := fpos.x - 1;
        end;
    else
      raise Exception.Create('invalid instruction');
    end;
end;

function TRobot.ToString: String;
var
  direction : String;
begin
  case fdir of
    north:
      direction := 'N';
    east:
      direction := 'E';
    south:
      direction := 'S';
    west:
      direction := 'W';
  end;
  result := format('%d,%d %s', [fpos.x, fpos.y, direction]);
end;

end.
