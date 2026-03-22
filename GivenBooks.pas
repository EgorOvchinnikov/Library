unit GivenBooks;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TForm11 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    CheckBox2: TCheckBox;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    GiveBookButton: TButton;
    EditGivenButton: TButton;
    DeleteGivenButton: TButton;
    Label4: TLabel;
    Given_Filter: TEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DeleteGivenButtonClick(Sender: TObject);
    procedure Given_FilterChange(Sender: TObject);
    procedure GiveBookButtonClick(Sender: TObject);
    procedure EditGivenButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  CSort_gb: Integer = -1;

implementation

{$R *.dfm}

uses DataModule, GenAu, MainForm, GiveBookProc;

procedure TForm11.CheckBox1Click(Sender: TObject);
begin
DataModule10.Q_v_given_books.Filtered := false;
DataModule10.Q_v_given_books.Filter := 'giveDate >= ' +
QuotedStr(FormatDateTime('YYYY-MM-DD', DateTimePicker1.Date)) +
' and giveDate <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', DateTimePicker2.Date));
DataModule10.Q_v_given_books.Filtered := CheckBox1.Checked;
end;

procedure TForm11.CheckBox2Click(Sender: TObject);
begin
DataModule10.Q_v_given_books.Filtered := false;
DataModule10.Q_v_given_books.Filter := 'backDate >= ' +
QuotedStr(FormatDateTime('YYYY-MM-DD', DateTimePicker3.Date)) +
' and backDate <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', DateTimePicker4.Date));
DataModule10.Q_v_given_books.Filtered := CheckBox2.Checked;
end;

procedure TForm11.DateTimePicker1Change(Sender: TObject);
begin
CheckBox1Click(nil);
end;

procedure TForm11.DateTimePicker2Change(Sender: TObject);
begin
CheckBox1Click(nil);
end;

procedure TForm11.DateTimePicker3Change(Sender: TObject);
begin
CheckBox2Click(nil);
end;

procedure TForm11.DateTimePicker4Change(Sender: TObject);
begin
CheckBox2Click(nil);
end;

procedure TForm11.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CurrentDate, TableDate: TDate;
begin
  CurrentDate := Date;
  if DataModule10.Q_v_given_books.FieldByName('backDate').IsNull then
  begin
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    Exit;
  end;
  TableDate := DataModule10.Q_v_given_books.FieldByName('backDate').AsDateTime;
  with DBGrid1.Canvas do
  begin
    if TableDate < CurrentDate then
      begin
        Brush.Color := RGB(255, 99, 71);
        if (gdSelected in State) then
          Brush.Color := RGB(205, 92, 92);
        Font.Color := clWhite;
      end;
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm11.DBGrid1TitleClick(Column: TColumn);
var
  sorttype: string;
begin
  if CSort_gb >= 0 then
    begin
      DBGrid1.Columns[CSort_gb].Title.Font.Style := Column.Title.Font.Style - [fsBold];
    end;
  sorttype := '';
  CSort_gb := Column.Index;
  if DataModule10.Q_v_given_books.Sort <> Column.FieldName + ' DESC' then
    begin
      if DataModule10.Q_v_given_books.Sort = Column.FieldName then
        sorttype := ' DESC';
      Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
      DataModule10.Q_v_given_books.Sort := Column.FieldName + sorttype;
    end
    else
      DataModule10.Q_v_given_books.Sort := '';
end;

procedure TForm11.DeleteGivenButtonClick(Sender: TObject);
begin
if (DataModule10.T_given_books.State = dsBrowse) then
  if MessageDlg('Подтвердите удаление записи', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DataModule10.T_given_books.Delete;
end;

procedure TForm11.EditGivenButtonClick(Sender: TObject);
begin
if DataModule10.T_given_books.State = dsBrowse then
    begin
        DBGrid1.Enabled := False;
        DataModule10.T_given_books.Edit;
    end;
Form13.ShowModal;
end;

procedure TForm11.GiveBookButtonClick(Sender: TObject);
begin
if DataModule10.T_given_books.State = dsBrowse then
    begin
        DBGrid1.Enabled := False;
        DataModule10.T_given_books.Insert;
    end;
Form13.ShowModal;
end;

procedure TForm11.Given_FilterChange(Sender: TObject);
var
  baseSQL, filter_s: string;
begin
  DataModule10.Q_v_given_books.DisableControls;
  DataModule10.Q_v_given_books.Active := false;
  baseSQL := 'SELECT * FROM view_given_books ';
  filter_s := '';
  if length(Given_Filter.Text) > 0 then
    filter_s := 'WHERE expr1 LIKE ' + QuotedStr('%' + Given_Filter.Text +
    '%') + ' OR expr2 LIKE ' + QuotedStr('%' + Given_Filter.Text + '%')
    + ' OR readTicket LIKE ' + QuotedStr('%' + Given_Filter.Text + '%');
    DataModule10.Q_v_given_books.SQL.Text := baseSQL + filter_s;
    DataModule10.Q_v_given_books.Active := true;
    DataModule10.Q_v_given_books.EnableControls;
end;

end.
