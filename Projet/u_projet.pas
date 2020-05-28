unit u_projet;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls;

type

  { Tf_projet }

  Tf_projet = class(TForm)
    item_accueil: TMenuItem;
    item_inscrit: TMenuItem;
    item_filiere: TMenuItem;
    item_quitter: TMenuItem;
    item_liste_filiere: TMenuItem;
    item_stat: TMenuItem;
    item_liste_inscrit: TMenuItem;
    item_archive: TMenuItem;
    item_archN1: TMenuItem;
    item_archN2: TMenuItem;
    lbl_titre: TLabel;
    mnu_main: TMainMenu;
    pnl_selection: TPanel;
    pnl_travail: TPanel;
    pnl_info: TPanel;
    pnl_ariane: TPanel;
    procedure FormShow(Sender: TObject);
    procedure item_quitterClick(Sender: TObject);
    procedure mnu_item_Click(Sender : TObject);
    procedure choix_item_liste;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_projet: Tf_projet;

implementation

{$R *.lfm}

{ Tf_projet }
uses u_feuille_style, u_select_inscrit;

procedure Tf_projet.item_quitterClick(Sender: TObject);
begin
  Close;
end;

procedure Tf_projet.choix_item_liste;
begin
      f_select_inscrit.borderstyle := bsNone;
      f_select_inscrit.parent          := pnl_selection;
      f_select_inscrit.align            := alClient;
      f_select_inscrit.init;
      f_select_inscrit.show;
end;

procedure Tf_projet.mnu_item_Click(Sender: TObject);
var
   item : TMenuItem;
begin
   pnl_selection.show;

   pnl_ariane.Caption := '';
   item := TmenuItem(Sender);
   repeat
         pnl_ariane.caption := ' >' + item.caption +pnl_ariane.Caption;
         item := item.parent;
   until item.parent = nil;
   item := TmenuItem(Sender);
   if item=item_liste_inscrit then choix_item_liste;
end;

procedure Tf_projet.FormShow(Sender: TObject);
begin
     style.panel_selection (pnl_ariane);
     style.panel_defaut     (pnl_selection);
     style.panel_travail     (pnl_travail);
     style.panel_defaut     (pnl_info);
     f_projet.width := 1200;
     f_projet.height :=  800;
end;

end.

