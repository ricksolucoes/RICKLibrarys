program RICKLibrarys;

uses
  System.StartUpCopy,
  FMX.Forms,
  RICK.Librarys in 'src\RICK.Librarys.pas',
  RICK.Librarys.Interfaces in 'src\RICK.Librarys.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
