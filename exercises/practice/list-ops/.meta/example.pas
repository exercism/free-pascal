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

class function TListOps.append(const list1, list2: TArr): TArr;
var
  i, n1, n2: integer;
begin
  result := nil;
  n1 := System.Length(list1);
  n2 := System.Length(list2);
  SetLength(result, n1 + n2);
  for i := Low(list1) to High(list1) do result[i]      := list1[i];
  for i := Low(list2) to High(list2) do result[n1 + i] := list2[i];
end;

class function TListOps.concat(const lists: TArr2D): TArr;
var
  sub: TArr;
  el: T;
  total, idx: integer;
begin
  result := nil;
  total := 0;
  for sub in lists do
    Inc(total, System.Length(sub));
  SetLength(result, total);
  idx := 0;
  for sub in lists do
    for el in sub do
    begin
      result[idx] := el;
      Inc(idx);
    end;
end;

class function TListOps.filter(const list: TArr; func: TFilterFunc): TArr;
var
  el: T;
begin
  result := nil;
  for el in list do
    if func(el) then
      Insert(el, result, System.Length(result));
end;

class function TListOps.len(const list: TArr): integer;
begin
  result := System.Length(list);
end;

class function TListOps.map(const list: TArr; func: TMapFunc): TArr;
var
  i: integer;
begin
  result := nil;
  SetLength(result, System.Length(list));
  for i := Low(list) to High(list) do
    result[i] := func(list[i]);
end;

class function TListOps.foldl(const list: TArr; initial: T; func: TFoldFunc): T;
var
  el: T;
begin
  result := initial;
  for el in list do
    result := func(result, el);
end;

class function TListOps.foldr(const list: TArr; initial: T; func: TFoldFunc): T;
var
  i: integer;
begin
  result := initial;
  for i := High(list) downto Low(list) do
    result := func(result, list[i]);
end;

class function TListOps.reverse(const list: TArr): TArr;
var
  i, n: integer;
begin
  result := nil;
  n := System.Length(list);
  SetLength(result, n);
  for i := Low(list) to High(list) do
    result[i] := list[High(list) - i];
end;

end.
