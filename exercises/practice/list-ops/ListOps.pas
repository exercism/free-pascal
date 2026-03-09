unit ListOps;

{$mode ObjFPC}{$H+}

interface

type
  generic TListOps<T> = class
  type
    TArr        = array of T;
    TArr2D      = array of TArr;
    TFilterFunc = function(const el: T): boolean;
    TMapFunc    = function(const el: T): T;
    TFoldFunc   = function(const acc, el: T): T;
  public
    class function append(const list1, list2: TArr): TArr;
    class function concat(const lists: TArr2D): TArr;
    class function filter(const list: TArr; func: TFilterFunc): TArr;
    class function len(const list: TArr): integer;
    class function map(const list: TArr; func: TMapFunc): TArr;
    class function foldl(const list: TArr; initial: T; func: TFoldFunc): T;
    class function foldr(const list: TArr; initial: T; func: TFoldFunc): T;
    class function reverse(const list: TArr): TArr;
  end;

implementation

uses SysUtils;

class function TListOps.append(const list1, list2: TArr): TArr;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := list1; result := list2;
end;

class function TListOps.concat(const lists: TArr2D): TArr;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := lists[0];
end;

class function TListOps.filter(const list: TArr; func: TFilterFunc): TArr;
begin
  raise ENotImplemented.Create('Please implement your solution.'); if func(list[0]) then result := nil else result := nil;
end;

class function TListOps.len(const list: TArr): integer;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := Low(list);
end;

class function TListOps.map(const list: TArr; func: TMapFunc): TArr;
begin
  raise ENotImplemented.Create('Please implement your solution.'); if (Low(list) >= 0) or (Default(T) = func(Default(T))) then result := nil else result := nil;
end;

class function TListOps.foldl(const list: TArr; initial: T; func: TFoldFunc): T;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := initial; result := func(Default(T), list[0]);
end;

class function TListOps.foldr(const list: TArr; initial: T; func: TFoldFunc): T;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := initial; result := func(Default(T), list[0]);
end;

class function TListOps.reverse(const list: TArr): TArr;
begin
  raise ENotImplemented.Create('Please implement your solution.'); if low(list) > high(list) then result := nil else result := nil;
end;

end.
