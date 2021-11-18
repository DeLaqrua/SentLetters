unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, DateUtils, Vcl.FileCtrl;

type
  TFormMain = class(TForm)
    buttonCheck: TButton;
    labelPrevious: TLabel;
    labelCurrent: TLabel;
    labelPreviousMonth: TLabel;
    LabelCurrentMonth: TLabel;
    drawgridPreviousMonth: TDrawGrid;
    comboboxSelectMO: TComboBox;
    drawgridCurrentMonth: TDrawGrid;
    labelSelectMo: TLabel;
    labelSelectDirectory: TLabel;
    editSelectDirectory: TEdit;
    buttonSelectDirectory: TButton;
    groupboxSelectMO: TGroupBox;
    groupboxSelectDirectory: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure buttonSelectDirectoryClick(Sender: TObject);
    procedure buttonCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    function correctPath(inputDirectory: string): string;
  end;

var
  FormMain: TFormMain;

var
  directoryRoot: string;
const
  ALLMO = 1;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
var currentMonth, previousMonth: string;
    test: integer;
begin
  comboboxSelectMo.ItemIndex := 0;

  case MonthOf(IncMonth(Date, -1)) of
    1 : previousMonth := '������';
    2 : previousMonth := '�������';
    3 : previousMonth := '����';
    4 : previousMonth := '������';
    5 : previousMonth := '���';
    6 : previousMonth := '����';
    7 : previousMonth := '����';
    8 : previousMonth := '������';
    9 : previousMonth := '��������';
    10 : previousMonth := '�������';
    11 : previousMonth := '������';
    12 : previousMonth := '�������';
  else previousMonth := '����������� ����� ��';
  end;
  labelPreviousMonth.Caption := '(' + previousMonth + ')';

  case MonthOf(Date) of
    1 : currentMonth := '������';
    2 : currentMonth := '�������';
    3 : currentMonth := '����';
    4 : currentMonth := '������';
    5 : currentMonth := '���';
    6 : currentMonth := '����';
    7 : currentMonth := '����';
    8 : currentMonth := '������';
    9 : currentMonth := '��������';
    10 : currentMonth := '�������';
    11 : currentMonth := '������';
    12 : currentMonth := '�������';
  else currentMonth := '����������� ����� ��';
  end;
  labelCurrentMonth.Caption := '(' + currentMonth + ')';

  directoryRoot := correctPath(editSelectDirectory.Text);
end;

procedure TFormMain.buttonCheckClick(Sender: TObject);
begin
  buttonCheck.Enabled := false;
  directoryRoot := correctPath(editSelectDirectory.Text);
  if System.SysUtils.DirectoryExists(DirectoryRoot) = False then
      ShowMessage('��������� ����� ��� ����������� �����. ��������� ����� ����� �� �����.');
  buttonCheck.Enabled := true;
end;

procedure TFormMain.buttonSelectDirectoryClick(Sender: TObject);
begin
  if SelectDirectory('�������� ����� ��� ������ ���������������:', '', directoryRoot, [sdNewFolder, sdShowShares, sdNewUI, sdValidateDir]) then
    editSelectDirectory.Text := directoryRoot;
end;

function TFormMain.correctPath(inputDirectory: string): string;
begin
  if inputDirectory = '' then
    Result := ''
  else
    begin
      inputDirectory := Trim(inputDirectory);

      if Pos('/', inputDirectory) <> 0 then
        begin
          inputDirectory := StringReplace(inputDirectory, '/', '\', [rfReplaceAll]);
        end;

      if inputDirectory[length(inputDirectory)] <> '\' then
        Result := inputDirectory + '\'
      else
        Result := inputDirectory;
    end;
end;

end.
