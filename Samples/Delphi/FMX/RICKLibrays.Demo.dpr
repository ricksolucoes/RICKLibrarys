program RICKLibrays.Demo;

uses
  System.StartUpCopy,
  FMX.Forms,
  RICK.Librays.Demo.View.Main in 'RICK.Librays.Demo.View.Main.pas' {frmDemo};

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:= True;
{$ENDIF}
  Application.Initialize;
  Application.CreateForm(TfrmDemo, frmDemo);
  Application.Run;
end.
