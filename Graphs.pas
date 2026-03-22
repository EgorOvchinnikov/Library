unit Graphs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm14 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    DBChart2: TDBChart;
    Series2: TLineSeries;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    DBChart3: TDBChart;
    Series3: THorizBarSeries;
    Panel2: TPanel;
    SpinEdit1: TSpinEdit;
    CheckBox2: TCheckBox;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

uses AddAuthors, DataModule, GenAu, GiveBookProc, GivenBooks, MainForm;

procedure TForm14.CheckBox1Click(Sender: TObject);
begin
DataModule10.Q_given_count.Filtered := false;
DataModule10.Q_given_count.Filter := 'giveDate >= ' +
QuotedStr(FormatDateTime('YYYY-MM-DD', DateTimePicker1.Date)) +
' and giveDate <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', DateTimePicker2.Date));
DataModule10.Q_given_count.Filtered := CheckBox1.Checked;
DBChart2.RefreshData;
end;

procedure TForm14.CheckBox2Click(Sender: TObject);
var
  baseSQL, filter_s: string;
begin
  baseSQL := 'SELECT * FROM view_popular_books ';
  filter_s := '';
  filter_s := 'WHERE GivenBookCount >= ' + IntToStr(SpinEdit1.Value) +
    ' AND GivenBookCount <= ' + IntToStr(SpinEdit2.Value);
  if CheckBox2.Checked then
    begin
      DataModule10.Q_popular_books.sql.text := baseSQL + filter_s;
    end
  else
     DataModule10.Q_popular_books.sql.text := 'SELECT * FROM view_popular_books' +
      ' WHERE GivenBookCount > 1';
  DataModule10.Q_popular_books.Active := true;
  DBChart3.RefreshData;
end;

end.
