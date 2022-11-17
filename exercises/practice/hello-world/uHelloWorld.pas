unit uHelloWorld;

{$mode ObjFPC}{$H+}

interface

  function Hello: string;

implementation

function Hello: string;
begin
  Result := 'Goodbye, Mars!';
end;

end.

