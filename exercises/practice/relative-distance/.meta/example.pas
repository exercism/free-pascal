unit RelativeDistance;

{$mode ObjFPC}{$H+}

{$WARN 4046 OFF}
{$WARN 5024 OFF}
{$WARN 5062 OFF}
{$WARN 5071 OFF}
{$WARN 6058 OFF}

interface

uses Generics.Collections;

type
  TStrArray   = Array of String;
  TFamilyTree = specialize TDictionary<String, TStrArray>;

function degreeOfSeparation(const familyTree : TFamilyTree;
  const personA, personB : String) : integer;

implementation

uses Classes;

type
  TStringSet  = specialize THashSet<String>;
  TGraph      = specialize TDictionary<String, TStringSet>;
  TDistances  = specialize TDictionary<String, Integer>;

function degreeOfSeparation(const familyTree : TFamilyTree;
  const personA, personB : String) : integer;
var
  graph     : TGraph;
  pair      : TFamilyTree.TDictionaryPair;
  child     : String;
  children  : TStrArray;
  sibling   : String;
  neighbors : TStringSet;
  queue     : TStringList;
  current   : String;
  dist      : integer;
  head      : integer;
  distances : TDistances;
  neighbor  : String;
begin
  result := -1;

  graph := TGraph.Create;
  try
    for pair in familyTree do
    begin
      if not graph.ContainsKey(pair.Key) then
        graph.Add(pair.Key, TStringSet.Create);

      children := pair.Value;
      for child in children do
      begin
        if not graph.ContainsKey(child) then
          graph.Add(child, TStringSet.Create);

        graph[pair.Key].Add(child);
        graph[child].Add(pair.Key);

        for sibling in children do
          if sibling <> child then
            graph[child].Add(sibling);
      end;
    end;

    if (not graph.ContainsKey(personA)) or (not graph.ContainsKey(personB)) then
      exit;

    distances := TDistances.Create;
    queue := TStringList.Create;
    try
      distances.Add(personA, 0);
      queue.Add(personA);
      head := 0;

      while head < queue.Count do
      begin
        current := queue[head];
        Inc(head);
        dist := distances[current];

        neighbors := graph[current];
        for neighbor in neighbors do
        begin
          if not distances.ContainsKey(neighbor) then
          begin
            if neighbor = personB then
              exit(dist + 1);
            distances.Add(neighbor, dist + 1);
            queue.Add(neighbor);
          end;
        end;
      end;
    finally
      distances.Free;
      queue.Free;
    end;
  finally
    for neighbors in graph.Values do
      neighbors.Free;
    graph.Free;
  end;
end;

end.
