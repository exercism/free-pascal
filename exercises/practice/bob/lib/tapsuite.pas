{
	TAPSuite is a framework for execution of tests using pascal-tap. The goal
	is to group multiple test cases into one program which compiles and
	executes faster.

	TODO: parallelization.

	For usage examples, see the tests of this module.
}
unit TAPSuite;

{$mode objfpc}{$H+}{$J-}
{$interfaces corba}
{$modeswitch advancedrecords}

interface

uses TAP, TAPCore, fgl, sysutils;

type
	TTAPScenarioRunner = procedure() of object;
	TTAPScenario = record
		Runner: TTAPScenarioRunner;
		ScenarioName: String;
		class operator= (R1, R2: TTAPScenario): Boolean;
	end;

	TTAPScenarios = specialize TFPGList<TTAPScenario>;

	{
		Implementing this interface marks the entire suite as skipped.
	}
	ITAPSuiteSkip = interface
	['{06671f72-3010-11ee-86c0-002b67685373}']
	end;

	{
		Implementing this interface marks the entire suite as essential.
		Essential suites will halt the execution if they bail or error out.
	}
	ITAPSuiteEssential = interface
	['{98a0e1bd-301c-11ee-86c0-002b67685373}']
	end;

	{
		Extend this abstract class and add an object of it into TAPSuites list
		(with Suite procedure) for the test to be run during RunAllSuites.
	}
	TTAPSuite = class abstract
	protected
		FScenarios: TTAPScenarios;
		FSuiteName: String;

		{
			Add a scenario to be run in this suite. Should be run in the constructor.
			A scenario is a method (procedure).
		}
		procedure Scenario(Runner: TTAPScenarioRunner; const TestName: String = '');

	public
		constructor Create(); virtual;
		destructor Destroy; override;

		procedure Setup(); virtual;
		procedure Teardown(); virtual;

		property SuiteName: String read FSuiteName write FSuiteName;
		property Scenarios: TTAPScenarios read FScenarios;
	end;

	TTAPSuites = specialize TFPGObjectList<TTAPSuite>;
	TTAPSuiteClass = class of TTAPSuite;

var
	TAPSuites: TTAPSuites;

{
	Add a suite to the tests. Suites will be run in the same order they were
	added.
}
procedure Suite(SuiteClass: TTAPSuiteClass);

{
	Run all registered test suites.
}
procedure RunAllSuites();

implementation

class operator TTAPScenario.= (R1, R2: TTAPScenario): Boolean;
begin
	result := R1.Runner = R2.Runner;
end;

procedure Suite(SuiteClass: TTAPSuiteClass);
begin
	TAPSuites.Add(SuiteClass.Create);
end;

procedure RunAllSuites();
var
	LSuite: TTAPSuite;
	LScenario: TTAPScenario;
	LError: String;
begin
	Note('Running tests with pascal-tap suite runner.');
	Plan(TAPSuites.Count);

	for LSuite in TAPSuites do begin
		SubtestBegin('testing suite: ' + LSuite.SuiteName);

		if LSuite is ITAPSuiteSkip then begin
			SkipAll('suite ' + LSuite.SuiteName + ' is skipped');
			SubtestEnd;
			continue;
		end;

		for LScenario in LSuite.Scenarios do begin
			LError := '';

			SubtestBegin('testing scenario: ' + LScenario.ScenarioName);
			TAPGlobalContext.BailoutBehavior := btExceptionNoOutput;
			LSuite.Setup();

			try
				LScenario.Runner();
			except
				on E: Exception do begin
					LError := E.Message;
					if E is EBailout then
						Diag('!! bailed out: ' + LError)
					else
						Diag('!! encountered an exception: ' + LError);
				end;
			end;

			LSuite.Teardown();
			SubtestEnd;

			if length(LError) > 0 then begin
				if LSuite is ITAPSuiteEssential then
					BailOut('essential scenario "' + LScenario.ScenarioName + '" failed: ' + LError)
				else
					TestFail('scenario "' + LScenario.ScenarioName + '" failed: ' + LError, 'scenario finishing without exceptions');
			end;
		end;

		SubtestEnd;
	end;
end;

procedure TTAPSuite.Scenario(Runner: TTAPScenarioRunner; const TestName: String = '');
var
	LScenario: TTAPScenario;
begin
	LScenario.Runner := Runner;
	if length(TestName) > 0 then
		LScenario.ScenarioName := TestName
	else
		LScenario.ScenarioName := '(unnamed)';

	FScenarios.Add(LScenario);
end;

constructor TTAPSuite.Create();
begin
	FScenarios := TTAPScenarios.Create;
	FSuiteName := self.ClassName;
end;

destructor TTAPSuite.Destroy;
begin
	if FScenarios <> nil then
		FScenarios.Free;

	inherited;
end;

procedure TTAPSuite.Setup();
begin
end;

procedure TTAPSuite.Teardown();
begin
end;

initialization
	TAPSuites := TTAPSuites.Create;

finalization
	if TAPSuites <> nil then
		TAPSuites.Free;

end.

