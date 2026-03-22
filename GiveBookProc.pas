unit GiveBookProc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPickers, Vcl.ExtCtrls;

type
  TForm13 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Panel2: TPanel;
    PickGiveDate: TDatePicker;
    PickBackDate: TDatePicker;
    Label3: TLabel;
    Label4: TLabel;
    PickBookButton: TButton;
    PickReaderButton: TButton;
    SaveGiveButton: TButton;
    CancelGiveButton: TButton;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure PickBookButtonClick(Sender: TObject);
    procedure PickReaderButtonClick(Sender: TObject);
    procedure SaveGiveButtonClick(Sender: TObject);
    procedure CancelGiveButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PickBackDateChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FSelectedBookID: Integer;
    FSelectedReaderID: Integer;
  public
    { Public declarations }
    property SelectedBookID: Integer read FSelectedBookID write FSelectedBookID;
    property SelectedReaderID: Integer read FSelectedReaderID write FSelectedReaderID;
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses AddAuthors, DataModule, GenAu, GivenBooks, MainForm;

procedure TForm13.CancelGiveButtonClick(Sender: TObject);
begin
  DataModule10.T_given_books.Cancel;
  Form11.DBGrid1.Enabled := True;
  SelectedBookID := 0;
  SelectedReaderID := 0;
  Close;
end;

procedure TForm13.Edit1Change(Sender: TObject);
var
  baseSQL, filter_s: string;
begin
  DataModule10.Q_v_available_books.DisableControls;
  DataModule10.Q_v_available_books.Active := false;
  baseSQL := 'SELECT * FROM view_available_books ';
  filter_s := '';
  if length(Edit1.Text) > 0 then
    filter_s := 'WHERE expr1 LIKE ' + QuotedStr('%' + Edit1.Text + '%');
    DataModule10.Q_v_available_books.SQL.Text := baseSQL + filter_s;
    DataModule10.Q_v_available_books.Active := true;
    DataModule10.Q_v_available_books.EnableControls;
end;

procedure TForm13.Edit2Change(Sender: TObject);
var
  baseSQL, filter_s: string;
begin
  DataModule10.Q_v_readers.DisableControls;
  DataModule10.Q_v_readers.Active := false;
  baseSQL := 'SELECT * FROM view_readers ';
  filter_s := '';
  if length(Edit2.Text) > 0 then
    filter_s := 'WHERE readName LIKE ' + QuotedStr('%' + Edit2.Text + '%')
      + ' OR readTicket LIKE ' + QuotedStr('%' + Edit2.Text + '%')
        + ' OR readPhone LIKE ' + QuotedStr('%' + Edit2.Text + '%');
    DataModule10.Q_v_readers.SQL.Text := baseSQL + filter_s;
    DataModule10.Q_v_readers.Active := true;
    DataModule10.Q_v_readers.EnableControls;
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form11.DBGrid1.Enabled := True;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  DataModule10.Q_v_available_books.DisableControls();
  DataModule10.Q_v_available_books.Requery();
  DataModule10.Q_v_available_books.EnableControls();

  DBText1.DataSource := nil;
  DBText2.DataSource := nil;

  PickGiveDate.Date := Date;
  PickBackDate.Date := Date + 14;

  if DataModule10.T_given_books.State = dsEdit then
  begin
    SelectedBookID := DataModule10.T_given_books.FieldByName('IDbook').AsInteger;
    SelectedReaderID := DataModule10.T_given_books.FieldByName('IDread').AsInteger;
    PickGiveDate.Date := DataModule10.T_given_books.FieldByName('giveDate').AsDateTime;
    PickBackDate.Date := DataModule10.T_given_books.FieldByName('backDate').AsDateTime;

    if DataModule10.Q_v_given_books.Locate('IDbook;IDread',
       VarArrayOf([SelectedBookID, SelectedReaderID]), []) then
    begin
      DBText1.DataField := 'expr1';
      DBText1.DataSource := DataModule10.DS_Q_v_given_books;
      DBText2.DataField := 'readName';
      DBText2.DataSource := DataModule10.DS_Q_v_readers;
    end;
  end;
end;

procedure TForm13.PickBackDateChange(Sender: TObject);
begin
if PickBackDate.Date <= PickGiveDate.Date then
  begin
    ShowMessage('Дата возврата должна быть позже даты выдачи!');
    PickBackDate.Date := PickGiveDate.Date + 1;
  end;
end;

procedure TForm13.PickBookButtonClick(Sender: TObject);
begin
try
    if DataModule10.Q_v_available_books.RecordCount > 0 then
    begin
      SelectedBookID := DataModule10.Q_v_available_booksIDbook.Value;
      DBText1.DataField := 'expr1';
      DBText1.DataSource := DataModule10.DS_Q_v_available_books;

      if not (DataModule10.T_given_books.State in [dsEdit, dsInsert]) then
        DataModule10.T_given_books.Append;
    end;
except
    on E: Exception do
      ShowMessage('Ошибка при выборе книги: ' + E.Message);
end;
end;

procedure TForm13.PickReaderButtonClick(Sender: TObject);
begin
try
    if DataModule10.Q_v_readers.RecordCount > 0 then
    begin
      SelectedReaderID := DataModule10.Q_v_readersIDread.Value;
      DBText2.DataField := 'readName';
      DBText2.DataSource := DataModule10.DS_Q_v_readers;

      if not (DataModule10.T_given_books.State in [dsEdit, dsInsert]) then
        DataModule10.T_given_books.Append;
    end;
except
    on E: Exception do
      ShowMessage('Ошибка при выборе читателя: ' + E.Message);
end;
end;

procedure TForm13.SaveGiveButtonClick(Sender: TObject);
begin
  if (SelectedBookID > 0) and (SelectedReaderID > 0) then
  begin
    try
      if not (DataModule10.T_given_books.State in [dsEdit, dsInsert]) then
      begin
        if DataModule10.T_given_books.State = dsBrowse then
          DataModule10.T_given_books.Append
        else
          DataModule10.T_given_books.Edit;
      end;

      with DataModule10.T_given_books do
      begin
        FieldByName('IDbook').AsInteger := SelectedBookID;
        FieldByName('IDread').AsInteger := SelectedReaderID;
        FieldByName('giveDate').AsDateTime := PickGiveDate.Date;
        FieldByName('backDate').AsDateTime := PickBackDate.Date;
        Post;
      end;

      Form11.DBGrid1.Enabled := True;
      SelectedBookID := 0;
      SelectedReaderID := 0;
      Close;
    except
      on E: Exception do
      begin
        ShowMessage('Ошибка при сохранении: ' + E.Message);
        if DataModule10.T_given_books.State in [dsEdit, dsInsert] then
          DataModule10.T_given_books.Cancel;
      end;
    end;
  end
  else
    ShowMessage('Необходимо выбрать книгу и читателя!');
end;

end.
