unit GenAu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TForm10 = class(TForm)
    PageControl1: TPageControl;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    InsertDeleteGenrePanel: TPanel;
    InsertDeleteAuthorPanel: TPanel;
    PanelToPutGenreValue: TPanel;
    PanelToPutAuthorValue: TPanel;
    AddGenreButton: TButton;
    DeleteGenreButton: TButton;
    AddAuthorButton: TButton;
    DeleteAuthorButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    SaveGenreButton: TButton;
    CancelGenre: TButton;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    SaveAuthorButton: TButton;
    CancelAuthorButton: TButton;
    procedure AddGenreButtonClick(Sender: TObject);
    procedure AddAuthorButtonClick(Sender: TObject);
    procedure DeleteGenreButtonClick(Sender: TObject);
    procedure DeleteAuthorButtonClick(Sender: TObject);
    procedure SaveGenreButtonClick(Sender: TObject);
    procedure SaveAuthorButtonClick(Sender: TObject);
    procedure CancelGenreClick(Sender: TObject);
    procedure CancelAuthorButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

uses DataModule, MainForm;


procedure TForm10.AddAuthorButtonClick(Sender: TObject);
begin
if DataModule10.T_authors.State = dsBrowse then
  begin
  DBGrid2.Enabled := False;
  InsertDeleteAuthorPanel.Visible := False;
  PanelToPutAuthorValue.Visible := True;
  DataModule10.T_authors.Append;
  end;
end;

procedure TForm10.AddGenreButtonClick(Sender: TObject);
begin
if DataModule10.T_genres.State = dsBrowse then
  begin
  DBGrid1.Enabled := False;
  InsertDeleteGenrePanel.Visible := False;
  PanelToPutGenreValue.Visible := True;
  DataModule10.T_genres.Append;
  end;
end;

procedure TForm10.CancelAuthorButtonClick(Sender: TObject);
begin
if DataModule10.T_authors.State in [dsInsert, dsEdit] then
begin
  DataModule10.T_authors.Cancel;
  InsertDeleteAuthorPanel.Visible := True;
  PanelToPutAuthorValue.Visible := False;
  DBGrid2.Enabled := True;
end;
end;

procedure TForm10.CancelGenreClick(Sender: TObject);
begin
if DataModule10.T_genres.State in [dsInsert, dsEdit] then
begin
  DataModule10.T_genres.Cancel;
  InsertDeleteGenrePanel.Visible := True;
  PanelToPutGenreValue.Visible := False;
  DBGrid1.Enabled := True;
end;
end;

procedure TForm10.DeleteAuthorButtonClick(Sender: TObject);
begin
if DataModule10.T_authors.State = dsBrowse then
if MessageDlg('Подтвердите удаление записи', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
DataModule10.T_authors.Delete;
end;

procedure TForm10.DeleteGenreButtonClick(Sender: TObject);
begin
if DataModule10.T_genres.State = dsBrowse then
if MessageDlg('Подтвердите удаление записи', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
DataModule10.T_genres.Delete;
end;

procedure TForm10.SaveAuthorButtonClick(Sender: TObject);
begin
if DataModule10.T_authors.State in [dsInsert, dsEdit] then
  begin
    DataModule10.T_authors.Post;
    InsertDeleteAuthorPanel.Visible := True;
    PanelToPutAuthorValue.Visible := False;
    DBGrid2.Enabled := True;
  end;
end;

procedure TForm10.SaveGenreButtonClick(Sender: TObject);
begin
if DataModule10.T_genres.State in [dsInsert, dsEdit] then
  begin
    DataModule10.T_genres.Post;
    InsertDeleteGenrePanel.Visible := True;
    PanelToPutGenreValue.Visible := False;
    DBGrid1.Enabled := True;
  end;
end;

end.
