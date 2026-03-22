program LibraryAutomatedSystem;

uses
  Vcl.Forms,
  MainForm in '..\MainForm.pas' {Form9},
  DataModule in '..\DataModule.pas' {DataModule10: TDataModule},
  GenAu in '..\GenAu.pas' {Form10},
  GivenBooks in '..\GivenBooks.pas' {Form11},
  AddAuthors in '..\AddAuthors.pas' {Form12},
  GiveBookProc in '..\GiveBookProc.pas' {Form13},
  Graphs in '..\Graphs.pas' {Form14};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TDataModule10, DataModule10);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.Run;
end.
