program DelphiSpecificationUtilsTests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
uses
  SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  Tests.Delphi.SpecificationUtils.Strings.Contains.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.Contains.CaseSensitive.pas',
  Delphi.SpecificationUtils in '..\Delphi.SpecificationUtils.pas',
  Delphi.SpecificationUtils.Strings.CaseSensitive in '..\Delphi.SpecificationUtils.Strings.CaseSensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.Contains.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.Contains.CaseInsensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.Equals.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.Equals.CaseSensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.Equals.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.Equals.CaseInsensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.ContainsAny.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.ContainsAny.CaseSensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.ContainsAny.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.ContainsAny.CaseInsensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.EqualsAny.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.EqualsAny.CaseSensitive.pas',
  Delphi.SpecificationUtils.Strings.CaseInsensitive in '..\Delphi.SpecificationUtils.Strings.CaseInsensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.StartsWith.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.StartsWith.CaseSensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.StartsWith.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.StartsWith.CaseInsensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.StartsWithAny.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.StartsWithAny.CaseSensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.EndsWith.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.EndsWith.CaseInsensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.EndsWith.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.EndsWith.CaseSensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseSensitive in 'Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseSensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.StartsWithAny.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.StartsWithAny.CaseInsensitive.pas',
  Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseInsensitive.pas';

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //tell the runner how we will log things
    //Log to the console window
    logger := TDUnitXConsoleLogger.Create(true);
    runner.AddLogger(logger);
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.
