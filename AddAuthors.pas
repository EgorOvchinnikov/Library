unit AddAuthors;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  TForm12 = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Label4: TLabel;
    AddAuthorButton: TButton;
    DBGrid1: TDBGrid;
    SaveAuthorButton: TButton;
    CancelAuthorButton: TButton;
    DeleteAuthorButton: TButton;
    DBLookupComboBox2: TDBLookupComboBox;
    SetImageButton: TButton;
    ClearImageButton: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure AddAuthorButtonClick(Sender: TObject);
    procedure CancelAuthorButtonClick(Sender: TObject);
    procedure DeleteAuthorButtonClick(Sender: TObject);
    procedure SaveAuthorButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetImageButtonClick(Sender: TObject);
    procedure ClearImageButtonClick(Sender: TObject);
  private
    { Private declarations }
    FCurrentBookID: Integer;
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses DataModule, GenAu, GivenBooks, MainForm;

procedure TForm12.AddAuthorButtonClick(Sender: TObject);
begin
 if DBLookupComboBox2.KeyValue = null then
  begin
    ShowMessage('Выберите автора');
    Exit;
  end;

  try
    DataModule10.T_books_authors.DisableControls;
    try
      with DataModule10.T_books_authors do
      begin
        Close;
        Open;

        First;
        while not Eof do
        begin
          if (FieldByName('IDbook').AsInteger = FCurrentBookID) and
             (FieldByName('IDau').AsInteger = DBLookupComboBox2.KeyValue) then
          begin
            ShowMessage('Этот автор уже добавлен к книге');
            Exit;
          end;
          Next;
        end;

        Append;
        FieldByName('IDbook').AsInteger := FCurrentBookID;
        FieldByName('IDau').AsInteger := Integer(DBLookupComboBox2.KeyValue);
        Post;
      end;
    finally
      DataModule10.T_books_authors.EnableControls;
    end;

    with DataModule10.Q_v_books_authors do
    begin
      Close;
      Parameters.ParamByName('IDbook').Value := FCurrentBookID;
      Open;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Ошибка при добавлении автора: ' + E.Message);
      if DataModule10.T_books_authors.State in [dsInsert, dsEdit] then
        DataModule10.T_books_authors.Cancel;
    end;
  end;
end;

procedure TForm12.Button1Click(Sender: TObject);
var
  NewBookID: Integer;
begin
if DataModule10.T_books.State in [dsInsert, dsEdit] then
  begin
    if StrToInt(DBEdit2.Text) < 0 then
    begin
      ShowMessage('Некорректный ввод количества');
      Exit;
    end;

    try
      DataModule10.T_books.FieldByName('IDgen').Value := DBLookupComboBox1.KeyValue;
      DataModule10.T_books.FieldByName('bookName').Value := DBEdit1.Text;
      DataModule10.T_books.FieldByName('bookCount').Value := StrToInt(DBEdit2.Text);

      if DataModule10.T_books.State = dsInsert then
      begin
        DataModule10.T_books.Post;
        NewBookID := DataModule10.LastBookID;
      end
      else
        NewBookID := DataModule10.T_books.FieldByName('IDbook').AsInteger;

      with DataModule10.Q_v_books_authors do
      begin
        Close;
        Parameters.ParamByName('IDbook').Value := NewBookID;
        Open;
      end;

      Panel2.Visible := True;
      FCurrentBookID := NewBookID;
    except
      on E: Exception do
      begin
        ShowMessage('Ошибка при сохранении книги: ' + E.Message);
        if DataModule10.T_books.State in [dsInsert, dsEdit] then
          DataModule10.T_books.Cancel;
      end;
    end;
  end;
end;

procedure TForm12.CancelAuthorButtonClick(Sender: TObject);
begin
try
    if DataModule10.T_books_authors.State in [dsInsert, dsEdit] then
      DataModule10.T_books_authors.Cancel;

    if DataModule10.T_books.State in [dsInsert, dsEdit] then
    begin
      DataModule10.T_books.Cancel;
      if DataModule10.T_books.State = dsInsert then
      begin
        DataModule10.T_books_authors.First;
        while not DataModule10.T_books_authors.Eof do
          DataModule10.T_books_authors.Delete;
      end;
    end;

    ModalResult := mrCancel;
  except
    on E: Exception do
      ShowMessage('Ошибка при отмене: ' + E.Message);
  end;
end;

procedure TForm12.ClearImageButtonClick(Sender: TObject);
begin
  DataModule10.T_booksbookPhoto.Clear;
  Form9.Books_Image.Picture := nil;
end;

procedure TForm12.DeleteAuthorButtonClick(Sender: TObject);
var
  CurrentIDbook, CurrentIDau: Integer;
begin
if DataModule10.Q_v_books_authors.RecordCount = 0 then Exit;

  if MessageDlg('Удалить выбранного автора?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      CurrentIDbook := DataModule10.Q_v_books_authors.FieldByName('IDbook').AsInteger;
      CurrentIDau := DataModule10.Q_v_books_authors.FieldByName('IDau').AsInteger;

      with DataModule10.T_books_authors do
      begin
        First;
        while not Eof do
        begin
          if (FieldByName('IDbook').AsInteger = CurrentIDbook) and
             (FieldByName('IDau').AsInteger = CurrentIDau) then
          begin
            Delete;
            Break;
          end;
          Next;
        end;
      end;

      DataModule10.Q_v_books_authors.Close;
      DataModule10.Q_v_books_authors.Open;
    except
      on E: Exception do
        ShowMessage('Ошибка при удалении автора: ' + E.Message);
    end;
  end;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
if DataModule10.T_books.State = dsInsert then
  begin
    Panel2.Visible := False;
    FCurrentBookID := 0;
  end
  else
  begin
    FCurrentBookID := DataModule10.T_books.FieldByName('IDbook').AsInteger;
    Panel2.Visible := True;

    with DataModule10.Q_v_books_authors do
    begin
      Close;
      Parameters.ParamByName('IDbook').Value := FCurrentBookID;
      Open;
    end;
  end;

  if not DataModule10.T_books_authors.Active then
    DataModule10.T_books_authors.Open;
end;

procedure TForm12.SaveAuthorButtonClick(Sender: TObject);
begin
try
    if DataModule10.T_books_authors.State in [dsInsert, dsEdit] then
      DataModule10.T_books_authors.Post;

    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ShowMessage('Ошибка при сохранении: ' + E.Message);
    end;
  end;
end;

procedure TForm12.SetImageButtonClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    if FileExists(OpenPictureDialog1.FileName) then
      begin
        Form9.Books_Image.Picture.LoadFromFile(OpenPictureDialog1.FileName);
        DataModule10.T_booksbookPhoto.LoadFromFile(OpenPictureDialog1.FileName);
      end;
end;

end.
