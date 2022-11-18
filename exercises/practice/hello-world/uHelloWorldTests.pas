unit uHelloWorldTests;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, fpcunit, testregistry;

type
  HelloWorldTest = class(TTestCase)
  published
    procedure Say_hi;
  end;

implementation
uses uHelloWorld;

procedure HelloWorldTest.Say_hi;
var
  Expected: string;
  Actual: string;
begin
  Expected := 'Hello, World';
  Actual := Hello;
  AssertEquals(Expected, Actual);
end;

initialization
  RegisterTest(HelloWorldTest);
end.

