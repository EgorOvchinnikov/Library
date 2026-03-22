unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.Variants,
  Data.FMTBcd, Data.SqlExpr, frxSmartMemo, frxClass, frCoreClasses, frxDBSet;

type
  TDataModule10 = class(TDataModule)
    ADOConnection1: TADOConnection;
    T_authors: TADOTable;
    T_genres: TADOTable;
    T_readers: TADOTable;
    T_given_books: TADOTable;
    Q_v_books: TADOQuery;
    Q_v_readers_hand: TADOQuery;
    Q_v_whos_book: TADOQuery;
    DS_T_genres: TDataSource;
    DS_T_authors: TDataSource;
    DS_T_readers: TDataSource;
    DS_T_given_books: TDataSource;
    DS_Q_v_books: TDataSource;
    DS_Q_v_readershand: TDataSource;
    DS_Q_v_whos_book: TDataSource;
    T_genresIDgen: TAutoIncField;
    T_genresgenName: TWideStringField;
    T_authorsIDau: TAutoIncField;
    T_authorsauName: TWideStringField;
    T_readersIDread: TAutoIncField;
    T_readersreadName: TWideStringField;
    T_readersreadBirth: TWideStringField;
    T_readersreadPhone: TWideStringField;
    T_given_booksIDread: TIntegerField;
    T_given_booksIDbook: TIntegerField;
    T_given_booksgiveDate: TDateField;
    T_given_booksbackDate: TDateField;
    Q_v_booksIDbook: TIntegerField;
    Q_v_booksgenName: TWideStringField;
    Q_v_booksauName: TWideStringField;
    Q_v_booksbookName: TWideStringField;
    Q_v_readers_handIDread: TIntegerField;
    Q_v_readers_handgiveDate: TDateField;
    Q_v_readers_handbackDate: TDateField;
    Q_v_whos_bookIDbook: TIntegerField;
    Q_v_whos_bookreadName: TWideStringField;
    Q_v_whos_bookreadPhone: TWideStringField;
    Q_v_whos_bookgiveDate: TDateField;
    Q_v_whos_bookbackDate: TDateField;
    Q_v_whos_bookIDread: TAutoIncField;
    Q_v_readers_handIDbook: TAutoIncField;
    T_books: TADOTable;
    DS_T_books: TDataSource;
    Q_v_readers: TADOQuery;
    DS_Q_v_readers: TDataSource;
    Q_v_readersIDread: TAutoIncField;
    Q_v_readersreadName: TWideStringField;
    Q_v_readersreadBirth: TWideStringField;
    Q_v_readersreadPhone: TWideStringField;
    Q_v_given_books: TADOQuery;
    DS_Q_v_given_books: TDataSource;
    Q_v_given_booksexpr1: TWideStringField;
    Q_v_given_booksexpr2: TWideStringField;
    Q_v_given_booksgiveDate: TDateField;
    Q_v_given_booksbackDate: TDateField;
    Q_v_booksbookCount: TIntegerField;
    T_books_authors: TADOTable;
    DS_T_books_authors: TDataSource;
    Q_v_booksbooksIssued: TIntegerField;
    Q_v_booksbooksRemaining: TIntegerField;
    Q_v_readers_handexpr1: TWideStringField;
    Q_v_books_authors: TADOQuery;
    DS_Q_v_books_authors: TDataSource;
    Q_v_books_authorsIDbook: TIntegerField;
    Q_v_books_authorsIDau: TIntegerField;
    Q_v_books_authorsauName: TWideStringField;
    T_readersreadTicket: TWideStringField;
    Q_v_readersreadTicket: TWideStringField;
    ADOQuery1: TADOQuery;
    Q_v_given_booksreadTicket: TWideStringField;
    Q_v_whos_bookreadTicket: TWideStringField;
    Q_v_given_booksIDbook: TIntegerField;
    Q_v_given_booksIDread: TIntegerField;
    Q_v_available_books: TADOQuery;
    Q_v_available_booksIDbook: TIntegerField;
    Q_v_available_booksexpr1: TWideStringField;
    Q_v_available_booksbooksRemaining: TIntegerField;
    DS_Q_v_available_books: TDataSource;
    T_booksIDbook: TAutoIncField;
    T_booksIDgen: TIntegerField;
    T_booksbookName: TWideStringField;
    T_booksbookCount: TIntegerField;
    T_booksbooksIssued: TIntegerField;
    T_booksbooksRemaining: TIntegerField;
    T_booksbookPhoto: TBlobField;
    Q_genres_count: TADOQuery;
    Q_given_count: TADOQuery;
    Q_popular_books: TADOQuery;
    Q_popular_booksAuthorBook: TWideStringField;
    Q_popular_booksGivenBookCount: TLargeintField;
    DS_reader_tickets: TfrxDBDataset;
    Rep_reader_tickets: TfrxReport;
    DS_book_inners1: TfrxDBDataset;
    Rep_book_inners: TfrxReport;
    DS_all_books: TfrxDBDataset;
    Rep_all_books: TfrxReport;
    procedure Q_v_booksAfterScroll(DataSet: TDataSet);
    procedure T_booksAfterDelete(DataSet: TDataSet);
    procedure T_booksAfterPost(DataSet: TDataSet);
    procedure Q_v_whos_bookAfterScroll(DataSet: TDataSet);
    procedure Q_v_readers_handAfterScroll(DataSet: TDataSet);
    procedure Q_v_readersAfterScroll(DataSet: TDataSet);
    procedure T_readersAfterPost(DataSet: TDataSet);
    procedure T_readersAfterDelete(DataSet: TDataSet);
    procedure T_given_booksAfterDelete(DataSet: TDataSet);
    procedure Q_v_given_booksAfterScroll(DataSet: TDataSet);
    procedure Q_v_available_booksAfterScroll(DataSet: TDataSet);
    procedure T_given_booksAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FLastBookID: Integer;
    FLastReadID: Integer;
    FLastGivenBookID: Integer;
    FLastGivenReaderID: Integer;
  public
    { Public declarations }
    property LastBookID: Integer read FLastBookID write FLastBookID;
  end;

var
  DataModule10: TDataModule10;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses GenAu, MainForm, GivenBooks, AddAuthors, GiveBookProc, Graphs;

{$R *.dfm}

procedure TDataModule10.Q_v_available_booksAfterScroll(DataSet: TDataSet);
begin
if Q_v_available_books.RecordCount > 0 then
  begin
    if not T_books.Active then
      T_books.Open;
      T_books.Locate('IDbook', Q_v_available_booksIDbook.Value, [])
  end;
end;

procedure TDataModule10.Q_v_booksAfterScroll(DataSet: TDataSet);
begin
if Q_v_books.RecordCount > 0 then
  begin
    if not T_books.Active then
      T_books.Open;
      T_books.Locate('IDbook', Q_v_booksIDbook.Value, [])
  end;
end;

procedure TDataModule10.Q_v_given_booksAfterScroll(DataSet: TDataSet);
begin
if Q_v_given_books.RecordCount > 0 then
  T_given_books.Locate('IDbook;IDread', VarArrayOf([Q_v_given_booksIDbook.Value,
    Q_v_given_booksIDread.Value]), [])
end;

procedure TDataModule10.Q_v_readersAfterScroll(DataSet: TDataSet);
begin
if Q_v_readers.RecordCount > 0 then
  T_readers.Locate('IDread', Q_v_readersIDread.Value, [])
end;

procedure TDataModule10.Q_v_readers_handAfterScroll(DataSet: TDataSet);
begin
T_given_books.Locate('IDbook;IDread',
  VarArrayOf([Q_v_readers_handIDbook.Value, Q_v_readers_handIDread.Value]), [])
end;

procedure TDataModule10.Q_v_whos_bookAfterScroll(DataSet: TDataSet);
begin
T_given_books.Locate('IDbook;IDread',
  VarArrayOf([Q_v_whos_bookIDbook.Value, Q_v_whos_bookIDread.Value]), [])
end;

procedure TDataModule10.T_booksAfterDelete(DataSet: TDataSet);
begin
Q_v_books.DisableControls();
Q_v_books.Requery();
Q_v_books.EnableControls();
end;

procedure TDataModule10.T_booksAfterPost(DataSet: TDataSet);
begin
FLastBookID := DataSet.FieldByName('IDbook').AsInteger;
Q_v_books.Close;
Q_v_books.Open;
Q_v_books.Locate('IDbook', FLastBookID, []);
end;

procedure TDataModule10.T_given_booksAfterDelete(DataSet: TDataSet);
begin
Q_v_given_books.DisableControls();
Q_v_given_books.Requery();
Q_v_given_books.EnableControls();
Q_v_whos_book.DisableControls();
Q_v_whos_book.Requery();
Q_v_whos_book.EnableControls();
Q_v_readers_hand.DisableControls();
Q_v_readers_hand.Requery();
Q_v_readers_hand.EnableControls();
Q_v_books.DisableControls();
Q_v_books.Requery();
Q_v_books.EnableControls();
end;

procedure TDataModule10.T_given_booksAfterPost(DataSet: TDataSet);
begin
FLastGivenBookID := DataSet.FieldByName('IDbook').AsInteger;
FLastGivenReaderID := DataSet.FieldByName('IDread').AsInteger;
Q_v_given_books.Close;
Q_v_given_books.Open;
Q_v_given_books.Locate('IDbook;IDread', VarArrayOF([Q_v_given_booksIDbook.Value,
  Q_v_given_booksIDread.Value]), []);
Q_v_whos_book.DisableControls();
Q_v_whos_book.Requery();
Q_v_whos_book.EnableControls();
Q_v_readers_hand.DisableControls();
Q_v_readers_hand.Requery();
Q_v_readers_hand.EnableControls();
Q_v_books.DisableControls();
Q_v_books.Requery();
Q_v_books.EnableControls();
Q_v_available_books.DisableControls();
Q_v_available_books.Requery();
Q_v_available_books.EnableControls();
end;

procedure TDataModule10.T_readersAfterDelete(DataSet: TDataSet);
begin
Q_v_readers.DisableControls();
Q_v_readers.Requery();
Q_v_readers.EnableControls();
end;

procedure TDataModule10.T_readersAfterPost(DataSet: TDataSet);
begin
FLastReadID := DataSet.FieldByName('IDread').AsInteger;
Q_v_readers.Close;
Q_v_readers.Open;
Q_v_readers.Locate('IDread', FLastReadID, []);
end;

end.
