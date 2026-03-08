unit HelloWorld;

{$mode ObjFPC}{$H+}

interface

function SayHi : string;

implementation

function SayHi : string;
begin
  result := 'Hello, World!';
end;

end.
