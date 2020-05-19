program f_project;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, u_projet, u_feuille_style, u_select_inscrit
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tf_projet, f_projet);
  Application.CreateForm(Tf_select_inscrit, f_select_inscrit);
  Application.Run;
end.

