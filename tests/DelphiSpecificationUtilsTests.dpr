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
  Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseInsensitive in 'Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseInsensitive.pas',
  Delphi.SpecificationUtils.Strings in '..\Delphi.SpecificationUtils.Strings.pas',
  Tests.Delphi.SpecificationUtils.Strings.Length in 'Tests.Delphi.SpecificationUtils.Strings.Length.pas',
  Tests.Delphi.SpecificationUtils.Strings.IsEmpty in 'Tests.Delphi.SpecificationUtils.Strings.IsEmpty.pas',
  Delphi.SpecificationUtils.Helper.Strings in '..\Delphi.SpecificationUtils.Helper.Strings.pas',
  Tests.Delphi.SpecificationUtils.Helper.Strings in 'Tests.Delphi.SpecificationUtils.Helper.Strings.pas',
  Delphi.SpecificationUtils.Helper.TGUID in '..\Delphi.SpecificationUtils.Helper.TGUID.pas',
  Delphi.SpecificationUtils.TGUID in '..\Delphi.SpecificationUtils.TGUID.pas',
  Tests.Helper.SysUtilsAccess in 'Tests.Helper.SysUtilsAccess.pas',
  Tests.Delphi.SpecificationUtils.Helper.TGUID in 'Tests.Delphi.SpecificationUtils.Helper.TGUID.pas',
  Delphi.SpecificationUtils.Arrays in '..\Delphi.SpecificationUtils.Arrays.pas',
  Tests.Delphi.SpecificationUtils.Arrays.Length in 'Tests.Delphi.SpecificationUtils.Arrays.Length.pas',
  Tests.Delphi.SpecificationUtils.Arrays.IsEmpty in 'Tests.Delphi.SpecificationUtils.Arrays.IsEmpty.pas',
  Tests.Delphi.SpecificationUtils.Arrays.Contains in 'Tests.Delphi.SpecificationUtils.Arrays.Contains.pas',
  Tests.Delphi.SpecificationUtils.Arrays.ContainsAny in 'Tests.Delphi.SpecificationUtils.Arrays.ContainsAny.pas',
  Tests.Delphi.SpecificationUtils.Arrays.Equals in 'Tests.Delphi.SpecificationUtils.Arrays.Equals.pas',
  Tests.Delphi.SpecificationUtils.Arrays.EqualsInSequence in 'Tests.Delphi.SpecificationUtils.Arrays.EqualsInSequence.pas',
  Tests.Delphi.SpecificationUtils.Arrays.EqualsInLength in 'Tests.Delphi.SpecificationUtils.Arrays.EqualsInLength.pas',
  Delphi.SpecificationUtils.Boolean.Helper in '..\Delphi.SpecificationUtils.Boolean.Helper.pas',
  Delphi.SpecificationUtils.Helper.DateTime in '..\Delphi.SpecificationUtils.Helper.DateTime.pas',
  Delphi.SpecificationUtils.DateTime in '..\Delphi.SpecificationUtils.DateTime.pas',
  Tests.Delphi.SpecificationUtils.Helper.DateTime in 'Tests.Delphi.SpecificationUtils.Helper.DateTime.pas',
  Delphi.SpecificationUtils.DateTime.Types in '..\Delphi.SpecificationUtils.DateTime.Types.pas',
  Delphi.SpecificationUtils.Helper.Integer in '..\Delphi.SpecificationUtils.Helper.Integer.pas';

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
