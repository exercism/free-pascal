unit uHelloWorld;

interface

  function Hello: string;

implementation

function Hello: string;
begin
  Result := 'Hello, World!';
end;

end.