unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Menus,
  Vcl.Samples.Spin, Vcl.CheckLst, JPEG;

type
  TForm9 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    AddEditDeleteBooksPanel: TPanel;
    AddBookButton: TButton;
    EditBookButton: TButton;
    DeleteBookButton: TButton;
    AddEditDeleteReadersPanel: TPanel;
    PanelToInputReaderValues: TPanel;
    AddReaderButton: TButton;
    EditReaderButton: TButton;
    DeleteReaderButton: TButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SaveReaderButton: TButton;
    CancelReaderButton: TButton;
    DBGrid3: TDBGrid;
    Label8: TLabel;
    DBGrid4: TDBGrid;
    Label9: TLabel;
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    Books_Filter: TEdit;
    Panel2: TPanel;
    Label11: TLabel;
    Readers_Filter: TEdit;
    N4: TMenuItem;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Button2: TButton;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    SpinEdit3: TSpinEdit;
    Label13: TLabel;
    SpinEdit4: TSpinEdit;
    ShowFiltersButton: TButton;
    HideFiltersButton: TButton;
    GroupBox3: TGroupBox;
    CountCondition: TComboBox;
    IssuedCondition: TComboBox;
    RemainingCondition: TComboBox;
    SpinCountValue: TSpinEdit;
    SpinIssuedValue: TSpinEdit;
    SpinRemainingValue: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ChkCount: TCheckBox;
    ChkIssued: TCheckBox;
    ChkRemaining: TCheckBox;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText2: TDBText;
    Panel4: TPanel;
    DBText1: TDBText;
    Label4: TLabel;
    Books_Image: TDBImage;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure AddBookButtonClick(Sender: TObject);
    procedure EditBookButtonClick(Sender: TObject);
    procedure DeleteBookButtonClick(Sender: TObject);
    procedure AddReaderButtonClick(Sender: TObject);
    procedure EditReaderButtonClick(Sender: TObject);
    procedure DeleteReaderButtonClick(Sender: TObject);
    procedure SaveReaderButtonClick(Sender: TObject);
    procedure CancelReaderButtonClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Books_FilterChange(Sender: TObject);
    procedure Readers_FilterChange(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBLookupComboBox3CloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBLookupComboBox4CloseUp(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FilterBooks;
    procedure CheckBox2Click(Sender: TObject);
    procedure ShowFiltersButtonClick(Sender: TObject);
    procedure HideFiltersButtonClick(Sender: TObject);
    procedure ChkCountClick(Sender: TObject);
    procedure ChkIssuedClick(Sender: TObject);
    procedure ChkRemainingClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure UpdateBookCount;
    procedure UpdateReaderCount;
    procedure FormShow(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  CSort_bo: Integer = -1;
  CSort_re: Integer = -1;
  OrderBy_field: string;

implementation

{$R *.dfm}

uses DataModule, GenAu, GivenBooks, AddAuthors, GiveBookProc, Graphs;

procedure TForm9.UpdateBookCount;
begin
  DBText1.Caption := IntToStr(DataModule10.Q_v_books.RecordCount);
end;

procedure TForm9.UpdateReaderCount;
begin
  DBText2.Caption := IntToStr(DataModule10.Q_v_readers.RecordCount);
end;

procedure TForm9.AddBookButtonClick(Sender: TObject);
begin
if (DataModule10.T_books.State = dsBrowse) and
         (DataModule10.T_books_authors.State = dsBrowse) then
  begin
    Books_Image.Picture := nil;
    DBGrid1.Enabled := False;
    AddEditDeleteBooksPanel.Visible := False;
    DataModule10.T_books.Append;

    if Form12.ShowModal = mrOk then
    begin
      DBGrid1.DataSource.DataSet.Close;
      DBGrid1.DataSource.DataSet.Open;
      if DBGrid1.DataSource.DataSet.Locate('IDbook', DataModule10.LastBookID, []) then
        DBGrid1.SelectedRows.CurrentRowSelected := True;
    end
    else
      DataModule10.T_books.Cancel;

    DBGrid1.Enabled := True;
    AddEditDeleteBooksPanel.Visible := True;
  end;
end;

procedure TForm9.AddReaderButtonClick(Sender: TObject);
begin
if DataModule10.T_readers.State = dsBrowse then
    begin
        DBGrid2.Enabled := False;
        AddEditDeleteReadersPanel.Visible := False;
        PanelToInputReaderValues.Visible := True;
        DataModule10.T_readers.Append;
    end;
end;

procedure TForm9.Books_FilterChange(Sender: TObject);
var
  baseSQL, filter_s: string;
begin
DataModule10.Q_v_books.DisableControls;
DataModule10.Q_v_books.Active := false;
baseSQL := 'SELECT * FROM view_books ';
filter_s := '';
if length(Books_Filter.Text) > 0 then
  filter_s := 'WHERE genName LIKE ' + QuotedStr('%' + Books_Filter.Text +
  '%') + ' OR auName LIKE ' + QuotedStr('%' + Books_Filter.Text + '%')
  + ' OR bookName LIKE ' + QuotedStr('%' + Books_Filter.Text + '%');
  DataModule10.Q_v_books.SQL.Text := baseSQL + filter_s;
  DataModule10.Q_v_books.Active := true;
  DataModule10.Q_v_books.EnableControls;
  UpdateBookCount;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
DBLookupComboBox3.KeyValue := null;
DBLookupComboBox3CloseUp(nil);
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
DBLookupComboBox4.KeyValue := null;
DBLookupComboBox4CloseUp(nil);
end;

procedure TForm9.CancelReaderButtonClick(Sender: TObject);
begin
if DataModule10.T_readers.State in [dsInsert, dsEdit] then
  begin
    DataModule10.T_readers.Cancel;
    AddEditDeleteReadersPanel.Visible := True;
    PanelToInputReaderValues.Visible := False;
    DBGrid2.Enabled := True;
  end;
end;

procedure TForm9.CheckBox2Click(Sender: TObject);
var
  baseSQL, filter_s: string;
begin
DataModule10.Q_v_readers.DisableControls;
DataModule10.Q_v_readers.Active := False;
baseSQL := 'SELECT * FROM view_readers ';
filter_s := '';
if CheckBox2.Checked then
  filter_s := ' WHERE readBirth BETWEEN ' + IntToStr(SpinEdit3.Value) + ' AND ' +
      IntToStr(SpinEdit4.Value);
  DataModule10.Q_v_readers.SQL.Text := baseSQL + filter_s;
DataModule10.Q_v_readers.Active := True;
DataModule10.Q_v_readers.EnableControls;
UpdateReaderCount;
end;

procedure TForm9.ChkCountClick(Sender: TObject);
begin
FilterBooks;
end;

procedure TForm9.ChkIssuedClick(Sender: TObject);
begin
FilterBooks;
end;

procedure TForm9.ChkRemainingClick(Sender: TObject);
begin
FilterBooks;
end;

procedure TForm9.FilterBooks;
var
  baseSQL, filter_s, genreFilter, authorFilter, countFilter, issuedFilter,
  remainingFilter, orderBy_s: string;
begin
DataModule10.Q_v_books.DisableControls;
  DataModule10.Q_v_books.Active := False;
  baseSQL := 'SELECT * FROM view_books ';
  genreFilter := '';
  authorFilter := '';
  countFilter := '';
  issuedFilter := '';
  remainingFilter := '';
  orderBy_s :='';

  if DBLookupComboBox3.KeyValue <> null then
    genreFilter := 'genName = ''' + DBLookupComboBox3.KeyValue + '''';

  if DBLookupComboBox4.KeyValue <> null then
    authorFilter := 'auName LIKE ' + QuotedStr('%' + DBLookupComboBox4.KeyValue + '%');

  if ChkCount.Checked then
  begin
    if CountCondition.Text = 'больше' then
      countFilter := 'bookCount > ' + IntToStr(SpinCountValue.Value)
    else if CountCondition.Text = 'от' then
      countFilter := 'bookCount >= ' + IntToStr(SpinCountValue.Value)
    else if CountCondition.Text = 'меньше' then
      countFilter := 'bookCount < ' + IntToStr(SpinCountValue.Value)
    else if CountCondition.Text = 'равно' then
      countFilter := 'bookCount = ' + IntToStr(SpinCountValue.Value);
  end;

  if ChkIssued.Checked then
  begin
    if IssuedCondition.Text = 'больше' then
      issuedFilter := 'booksIssued > ' + IntToStr(SpinIssuedValue.Value)
    else if IssuedCondition.Text = 'от' then
      issuedFilter := 'booksIssued >= ' + IntToStr(SpinIssuedValue.Value)
    else if IssuedCondition.Text = 'меньше' then
      issuedFilter := 'booksIssued < ' + IntToStr(SpinIssuedValue.Value)
    else if IssuedCondition.Text = 'равно' then
      issuedFilter := 'booksIssued = ' + IntToStr(SpinIssuedValue.Value);
  end;

  if ChkRemaining.Checked then
  begin
    if RemainingCondition.Text = 'больше' then
      remainingFilter := 'booksRemaining > ' + IntToStr(SpinRemainingValue.Value)
    else if RemainingCondition.Text = 'от' then
      remainingFilter := 'booksRemaining >= ' + IntToStr(SpinRemainingValue.Value)
    else if RemainingCondition.Text = 'меньше' then
      remainingFilter := 'booksRemaining < ' + IntToStr(SpinRemainingValue.Value)
    else if RemainingCondition.Text = 'равно' then
      remainingFilter := 'booksRemaining = ' + IntToStr(SpinRemainingValue.Value);
  end;

  filter_s := '';
  if genreFilter <> '' then
    filter_s := genreFilter;

  if authorFilter <> '' then
  begin
    if filter_s <> '' then
      filter_s := filter_s + ' AND ' + authorFilter
    else
      filter_s := authorFilter;
  end;

  if countFilter <> '' then
  begin
    if filter_s <> '' then
      filter_s := filter_s + ' AND ' + countFilter
    else
      filter_s := countFilter;
  end;

  if issuedFilter <> '' then
  begin
    if filter_s <> '' then
      filter_s := filter_s + ' AND ' + issuedFilter
    else
      filter_s := issuedFilter;
  end;

  if remainingFilter <> '' then
  begin
    if filter_s <> '' then
      filter_s := filter_s + ' AND ' + remainingFilter
    else
      filter_s := remainingFilter;
  end;

  if filter_s <> '' then
    filter_s := 'WHERE ' + filter_s;

  if length(OrderBy_field) > 0 then
    orderBy_s := ' ORDER BY ' + OrderBy_field;

  DataModule10.Q_v_books.SQL.Text := baseSQL + filter_s + orderBy_s;
  DataModule10.Q_v_books.Active := True;
  DataModule10.Q_v_books.EnableControls;
  UpdateBookCount;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
UpdateBookCount;
UpdateReaderCount;
if DataModule10.Q_v_books.RecordCount > 0 then
  begin
    if not DataModule10.T_books.Active then
      DataModule10.T_books.Open;
      DataModule10.T_books.Locate('IDbook', DataModule10.Q_v_booksIDbook.Value, [])
  end;
end;

procedure TForm9.HideFiltersButtonClick(Sender: TObject);
begin
Panel3.Visible := False;
end;

procedure TForm9.DBGrid1TitleClick(Column: TColumn);
var
  sorttype: string;
begin
if CSort_bo >= 0 then
  begin
    DBGrid1.Columns[CSort_bo].Title.Font.Style := Column.Title.Font.Style - [fsBold];
  end;
  sorttype := '';
  CSort_bo := Column.Index;
  if OrderBy_field <> Column.FieldName + ' DESC' then
  begin
    if OrderBy_field = Column.FieldName then
      sorttype := ' DESC';
    Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
    OrderBy_field := Column.FieldName + sorttype;
  end
  else
    OrderBy_field := '';
    FilterBooks;
end;

procedure TForm9.DBGrid2TitleClick(Column: TColumn);
var
  sorttype: string;
begin
  if CSort_re >= 0 then
    begin
      DBGrid2.Columns[CSort_re].Title.Font.Style := Column.Title.Font.Style - [fsBold];
    end;
  sorttype := '';
  CSort_re := Column.Index;
  if OrderBy_field <> Column.FieldName + ' DESC' then
    begin
      if OrderBy_field = Column.FieldName then
      sorttype := ' DESC';
      Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
      OrderBy_field := Column.FieldName + sorttype;
    end
    else
      OrderBy_field := '';
    Readers_FilterChange(self);
end;

procedure TForm9.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CurrentDate, TableDate: TDate;
begin
  CurrentDate := Date;
  if DataModule10.Q_v_whos_book.FieldByName('backDate').IsNull then
  begin
    DBGrid3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    Exit;
  end;
  TableDate := DataModule10.Q_v_whos_book.FieldByName('backDate').AsDateTime;
  with DBGrid3.Canvas do
  begin
    if TableDate < CurrentDate then
      begin
        Brush.Color := RGB(255, 99, 71);
        Font.Color := clWhite;
      end;
  end;
  DBGrid3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm9.DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CurrentDate, TableDate: TDate;
begin
  CurrentDate := Date;
  if DataModule10.Q_v_readers_hand.FieldByName('backDate').IsNull then
  begin
    DBGrid4.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    Exit;
  end;
  TableDate := DataModule10.Q_v_readers_hand.FieldByName('backDate').AsDateTime;
  with DBGrid4.Canvas do
  begin
    if TableDate < CurrentDate then
      begin
        Brush.Color := RGB(255, 99, 71);
        Font.Color := clWhite;
      end;
  end;
  DBGrid4.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm9.DBLookupComboBox3CloseUp(Sender: TObject);
begin
FilterBooks;
end;

procedure TForm9.DBLookupComboBox4CloseUp(Sender: TObject);
begin
FilterBooks;
end;

procedure TForm9.DeleteBookButtonClick(Sender: TObject);
begin
if (DataModule10.T_books.State = dsBrowse) then
  if MessageDlg('Подтвердите удаление записи', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DataModule10.T_books.Delete;
end;

procedure TForm9.DeleteReaderButtonClick(Sender: TObject);
begin
if DataModule10.T_readers.State = dsBrowse then
  if MessageDlg('Подтвердите удаление записи', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DataModule10.T_readers.Delete;
end;

procedure TForm9.EditBookButtonClick(Sender: TObject);
begin
if (DataModule10.T_books.State = dsBrowse) and
       (DataModule10.T_books_authors.State = dsBrowse) then
  begin
    DBGrid1.Enabled := False;
    AddEditDeleteBooksPanel.Visible := False;
    DataModule10.T_books.Edit;

    if Form12.ShowModal = mrOk then
    begin
      try
        DataModule10.T_books.Post;
      except
        on E: Exception do
        begin
          ShowMessage('Ошибка при изменении книги: ' + E.Message);
          DataModule10.T_books.Cancel;
        end;
      end;
    end
    else
      DataModule10.T_books.Cancel;

    DBGrid1.Enabled := True;
    AddEditDeleteBooksPanel.Visible := True;
  end;
end;

procedure TForm9.EditReaderButtonClick(Sender: TObject);
begin
if DataModule10.T_readers.State = dsBrowse then
    begin
        DBGrid2.Enabled := False;
        PanelToInputReaderValues.Visible := True;
        DataModule10.T_readers.Edit;
    end;
end;


procedure TForm9.N2Click(Sender: TObject);
begin
Application.Terminate;
end;


procedure TForm9.N3Click(Sender: TObject);
begin
Form10.Show;
end;

procedure TForm9.N4Click(Sender: TObject);
begin
Form11.Show;
end;

procedure TForm9.N5Click(Sender: TObject);
begin
  Form14.Show;
end;

procedure TForm9.N7Click(Sender: TObject);
begin
  DataModule10.Rep_reader_tickets.ShowReport();
end;

procedure TForm9.N8Click(Sender: TObject);
begin
  DataModule10.Rep_book_inners.ShowReport();
end;

procedure TForm9.N9Click(Sender: TObject);
begin
  DataModule10.Rep_all_books.ShowReport();
end;

procedure TForm9.Readers_FilterChange(Sender: TObject);
var
  baseSQL, filter_s: string;
  orderBy_s: string;
begin
DataModule10.Q_v_readers.DisableControls;
DataModule10.Q_v_readers.Active := false;
baseSQL := 'SELECT * FROM view_readers ';
filter_s := '';
orderBy_s :='';
if length(Readers_Filter.Text) > 0 then
  filter_s := 'WHERE readName LIKE ' + QuotedStr('%' + Readers_Filter.Text +
'%') + ' OR readBirth LIKE ' + QuotedStr('%' + Readers_Filter.Text + '%')
+ ' OR readPhone LIKE ' + QuotedStr('%' + Readers_Filter.Text + '%')
+ ' OR readTicket LIKE ' + QuotedStr('%' + Readers_Filter.Text + '%');
  if length(OrderBy_field) > 0 then
    orderBy_s := ' ORDER BY ' + OrderBy_field;
  DataModule10.Q_v_readers.SQL.Text := baseSQL + filter_s + orderBy_s;
  DataModule10.Q_v_readers.Active := true;
  DataModule10.Q_v_readers.EnableControls;
  UpdateReaderCount;
end;

procedure TForm9.SaveReaderButtonClick(Sender: TObject);
var
  CurrentYear: string;
  NewID: Integer;
  TicketNumber: string;
begin
if DataModule10.T_readers.State in [dsInsert, dsEdit] then
  begin
    if Length(DBEdit4.Text) <> 4 then
    begin
      ShowMessage('Некорректный ввод года');
      Exit;
    end;

    if (Length(DBEdit3.Text) = 0)  or (Length(DBEdit5.Text) = 0) then
    begin
      ShowMessage('Недопустимы пустые значения');
      Exit;
    end;

    if DataModule10.T_readers.State = dsInsert then
    begin
      CurrentYear := FormatDateTime('yyyy', Now);

      with DataModule10.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) as ReaderCount FROM readers');
        Open;
        NewID := FieldByName('ReaderCount').AsInteger + 1;
      end;

      TicketNumber := Format('%.4d-%s', [NewID, CurrentYear]);

      DataModule10.T_readers.FieldByName('readTicket').AsString := TicketNumber;
    end;

    DataModule10.T_readers.Post;
    AddEditDeleteReadersPanel.Visible := True;
    PanelToInputReaderValues.Visible := False;
    DBGrid2.Enabled := True;
  end;
end;

procedure TForm9.ShowFiltersButtonClick(Sender: TObject);
begin
Panel3.Visible := True;
end;

end.
