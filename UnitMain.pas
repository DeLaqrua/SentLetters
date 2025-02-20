unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, DateUtils, Vcl.FileCtrl, ActiveX, System.Win.ComObj,
  Vcl.Samples.Spin;

type
  TFormMain = class(TForm)
    buttonCheck: TButton;
    labelHelp: TLabel;
    comboboxSelectMO: TComboBox;
    labelSelectMo: TLabel;
    labelDirectorySentMails: TLabel;
    editDirectorySentMails: TEdit;
    buttonDirectorySentMails: TButton;
    groupboxSelectMO: TGroupBox;
    groupboxSelectDirectory: TGroupBox;
    LabelSelectMonth: TLabel;
    comboboxSelectMonth: TComboBox;
    SpinEditYear: TSpinEdit;
    stringgridMails: TStringGrid;
    editDirectoryCryptoarm: TEdit;
    labelDirectoryCryptoarm: TLabel;
    buttonDirectoryCryptoarm: TButton;
    procedure FormCreate(Sender: TObject);
    procedure buttonDirectorySentMailsClick(Sender: TObject);
    procedure buttonCheckClick(Sender: TObject);
    procedure comboboxSelectMonthSelect(Sender: TObject);
    procedure SpinEditYearChange(Sender: TObject);
    procedure stringgridMailsMouseEnter(Sender: TObject);
    procedure stringgridMailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buttonDirectoryCryptoarmClick(Sender: TObject);
  private
    { Private declarations }
  public
    function correctPath(inputDirectory: string): string;
    function checkExcelInstall: boolean;

    procedure searchMails(inputDirectoryArchive: string; //������ ��� ������������ ����� ���� ����� Archive.
                                                         //Ÿ � ����� ��������� ��� ������ �����.
                          inputYear, inputMonth: string;
                          inputCodeMO: string);
  end;

TMail = class(TObject)
  number: integer; //����� �� �������
  codeMO: string;
  codeSMO: string;
  isSent: boolean;
  isInbox: boolean;
  month: string;
  fileName: string;
  fileDateTime: string;
end;

var
  FormMain: TFormMain;

var
  directorySentMails, directorySentMailsArchive, directoryCryptoarm, directoryCryptoarmProcessed: string;
  listCodeMO: TStringList;
  selectedNumberMonth, selectedYear: integer;
  selectedMonth: string;
  imgMailSent, imgMailNotSent: TPicture;
  mails: array of TMail;
  indexMails: integer;
const
  ALLMO = 0;
  ALLMONTH = 0;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
var excelCodeMO: variant;
    i, lastRow: integer;
begin
  stringgridMails.RowCount := 2; //���������� ���������� ����� StringGrid
                                 //������ ���������� �� �� Excel-���������
  stringgridMails.FixedRows := 1; //������ ������ � ���������
  stringgridMails.Cells[0,0] := '��� ��:';
  stringgridMails.Cells[1,0] := '����������:';
  stringgridMails.Cells[2,0] := '��������:';
  stringgridMails.Cells[3,0] := '����� ��������:';
  stringgridMails.Cells[4,0] := '��� �����:';
  stringgridMails.Cells[5,0] := '��������� ���� ��������:';
  imgMailSent := TPicture.Create;
  imgMailNotSent := TPicture.Create;
  imgMailSent.LoadFromFile(ExtractFilePath(ParamStr(0))+'Icons\mailSent32px.bmp');
  imgMailNotSent.LoadFromFile(ExtractFilePath(ParamStr(0))+'Icons\mailNotSent32px.bmp');
  stringgridMails.DefaultRowHeight := 32;

  listCodeMo := TStringList.Create;
  comboboxSelectMo.ItemIndex := ALLMO;
  if FileExists(ExtractFilePath(ParamStr(0))+'codeMO.xls') = True then
    begin
      excelCodeMO := CreateOleObject('Excel.Application');
      try
        excelCodeMO.Workbooks.Open(ExtractFilePath(ParamStr(0))+'codeMO.xls');
        lastRow := excelCodeMO.WorkSheets[1].UsedRange.Rows.Count;
        for i := 2 to lastRow do
          begin
            listCodeMO.Add(VarToStr(excelCodeMO.Range['A'+IntToStr(i)]));
            comboboxSelectMO.Items[i-1] := listCodeMO[i-2] + ' � ' + VarToStr(excelCodeMO.Range['B'+IntToStr(i)]);
          end;

        excelCodeMO.DisplayAlerts := False; //��������� ����������, �����, ����� ���������� Excel-����,
                                            //�� ������������ ��������� �� ����.
      finally
        excelCodeMO.Quit;
      end;
    end
  else
    ShowMessage('� ����� � ���������� ����������� Excel-���� "codeMO.xls". ��� ���������� � ����������. ��� ���� ��������� �������� �� �����');

  selectedYear := YearOf(Date);
  spineditYear.Value := selectedYear;
  selectedNumberMonth := MonthOf(Date);
  comboboxSelectMonth.ItemIndex := selectedNumberMonth;
  case selectedNumberMonth of
    1 : selectedMonth := '������';
    2 : selectedMonth := '�������';
    3 : selectedMonth := '����';
    4 : selectedMonth := '������';
    5 : selectedMonth := '���';
    6 : selectedMonth := '����';
    7 : selectedMonth := '����';
    8 : selectedMonth := '������';
    9 : selectedMonth := '��������';
    10 : selectedMonth := '�������';
    11 : selectedMonth := '������';
    12 : selectedMonth := '�������';
  end;
  labelHelp.Caption := '������ �� ����� ' + selectedMonth + ' ' + IntToStr(selectedYear) + ' ����:';

  directorySentMails := correctPath(editDirectorySentMails.Text);
  directorySentMailsArchive := directorySentMails + 'Archive\';
  directoryCryptoarm := correctPath(editDirectoryCryptoarm.Text);
end;

procedure TFormMain.buttonCheckClick(Sender: TObject);
var i, j, monthNumber, indexMO: integer;
    searchResult: TSearchRec;
begin
  buttonCheck.Enabled := False;

  directorySentMails := correctPath(editDirectorySentMails.Text);
  directorySentMailsArchive := directorySentMails + 'Archive\';
  directoryCryptoarm := correctPath(editDirectoryCryptoarm.Text);
  if System.SysUtils.DirectoryExists(directorySentMails) = False then
    ShowMessage('��������� ����� ��� ����������� ������������ �����. ��������� ����� ����� �� �����.')
  else
  if System.SysUtils.DirectoryExists(directorySentMailsArchive) = False then
    ShowMessage('����������� ����� "Archive" � ���������� ' + directorySentMails + ', � ������� �������� ������������ ������.')
  else
  if System.SysUtils.DirectoryExists(directoryCryptoarm) = False then
    ShowMessage('��������� ����� ��� ��������� � ��������� ��������. ��������� ����� ����� �� �����')
  else
  if checkExcelInstall = False then
    ShowMessage('�� ����� ���������� �� ���������� Excel.')
  else
  if FileExists(ExtractFilePath(ParamStr(0))+'codeMO.xls') = False then
    ShowMessage('� ����� � ���������� ����������� Excel-���� "codeMO.xls". ��� ���������� � ����������. ��� ���� ��������� �������� �� �����.')
  else
    begin
      //������� ������
      if Length(mails) > 0 then
        begin
          for indexMails := 0 to High(mails) do
            begin
              mails[indexMails].Free;
            end;
        end;
      SetLength(mails, 0);
      indexMails := 0;
      //������� StringGrid
      for i := 1 to stringgridMails.RowCount-1 do
        begin
          stringgridMails.Rows[i].Clear;
        end;
      stringgridMails.RowCount := 2;
      stringgridMails.FixedRows := 1; //������ ������ � ���������.
                                      //�� ����� ���� ������ ������ ���������� �����.
                                      //������� RowCount ������ ���� ���� �� 2.

      //���� ������������ ������
      IF comboboxSelectMO.ItemIndex = ALLMO THEN
        BEGIN
          for indexMO := 0 to listCodeMO.Count-1 do
            begin
              if comboboxSelectMonth.ItemIndex = ALLMONTH then
                begin
                  for monthNumber := 1 to comboboxSelectMonth.Items.Count-1 do
                    searchMails(directorySentMailsArchive, IntToStr(selectedYear), comboboxSelectMonth.Items[monthNumber], listCodeMO[indexMO]);
                end
              else
                searchMails(directorySentMailsArchive, IntToStr(selectedYear), comboboxSelectMonth.Text, listCodeMO[indexMO]);
            end;
        END
      ELSE
        BEGIN
          if comboboxSelectMonth.ItemIndex = ALLMONTH then
            begin
              for monthNumber := 1 to comboboxSelectMonth.Items.Count-1 do
                searchMails(directorySentMailsArchive, IntToStr(selectedYear), comboboxSelectMonth.Items[monthNumber], listCodeMO[comboboxSelectMO.ItemIndex-1]);
            end
          else
            searchMails(directorySentMailsArchive, IntToStr(selectedYear), comboboxSelectMonth.Text, listCodeMO[comboboxSelectMO.ItemIndex-1]);
        END;

      //���� ���������� ������ ������ �� ������������
      for i := 0 to High(mails) do
        begin
          if FindFirst(directoryCryptoarm + IntToStr(selectedYear) + '\' +
                       mails[i].month + '\' + mails[i].codeSMO + '\' +
                       '*' + ChangeFileExt(mails[i].fileName, '') + '*', faDirectory, searchResult) = 0 then
            begin
              if (searchResult.Name <> '.') and (searchResult.Name <> '..') then
                begin
                  mails[i].isInbox := True;
                  FindClose(searchResult);
                end;
            end
          else
            begin
              mails[i].isInbox := False;
              FindClose(searchResult);
            end;
        end;

      //�� ������� ������� �������� � StringGrid
      stringgridMails.RowCount := Length(mails)+1; //+1, ����� �������� ����� ��� ���������
      for j := 0 to High(mails) do
        begin
          stringgridMails.Cells[0, mails[j].number] := mails[j].codeMO;
          stringgridMails.Cells[3, mails[j].number] := mails[j].month;
          stringgridMails.Cells[4, mails[j].number] := mails[j].fileName;
          stringgridMails.Cells[5, mails[j].number] := mails[j].fileDateTime;
        end;
    end;

  buttonCheck.Enabled := True;
end;

procedure TFormMain.stringgridMailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect {��� ��� ����� � ��������}: TRect; State: TGridDrawState);
begin
  if ARow <> 0 then
    begin
      //������������ ������������ ������
      if (Length(mails) > 0) and (ACol = 1) and (mails[ARow-1].isSent = True) then
      begin
        //���������� ��������
        Rect.Left := Rect.Left + Round(Rect.Width div 2) - Round(imgMailSent.Bitmap.Width div 2);
        Rect.Right := Rect.Left + imgMailSent.Bitmap.Width;

        stringgridMails.Canvas.StretchDraw(Rect, imgMailSent.Graphic);
      end;
      if (Length(mails) > 0) and (ACol = 1) and (mails[ARow-1].isSent = False) then
      begin
        //���������� ��������
        Rect.Left := Rect.Left + Round(Rect.Width div 2) - Round(imgMailNotSent.Bitmap.Width div 2);
        Rect.Right := Rect.Left + imgMailNotSent.Bitmap.Width;

        stringgridMails.Canvas.StretchDraw(Rect, imgMailNotSent.Graphic);
      end;

      //������������ ���������� ������
      if (Length(mails) > 0) and (ACol = 2) and (mails[ARow-1].isInbox = True) then
      begin
        //���������� ��������
        Rect.Left := Rect.Left + Round(Rect.Width div 2) - Round(imgMailSent.Bitmap.Width div 2);
        Rect.Right := Rect.Left + imgMailSent.Bitmap.Width;

        stringgridMails.Canvas.StretchDraw(Rect, imgMailSent.Graphic);
      end;
      if (Length(mails) > 0) and (ACol = 2) and (mails[ARow-1].isInbox = False) then
      begin
        //���������� ��������
        Rect.Left := Rect.Left + Round(Rect.Width div 2) - Round(imgMailNotSent.Bitmap.Width div 2);
        Rect.Right := Rect.Left + imgMailNotSent.Bitmap.Width;

        stringgridMails.Canvas.StretchDraw(Rect, imgMailNotSent.Graphic);
      end;
    end;
end;

procedure TFormMain.searchMails(inputDirectoryArchive, inputYear, inputMonth, inputCodeMO: string);
var searchResult: TSearchRec;
begin
  if FindFirst(inputDirectoryArchive + inputYear + '\' + inputMonth + '\*' + inputCodeMO + '*', faNormal, searchResult) = 0 then
    begin
      repeat
        SetLength(mails, Length(mails)+1);
        mails[indexMails] := TMail.Create;

        mails[indexMails].number := IndexMails + 1;
        mails[indexMails].codeMO := inputCodeMO;
        mails[indexMails].codeSMO := Copy(searchResult.Name, AnsiPos(mails[indexMails].codeMO, searchResult.Name)+7, 5);
        mails[indexMails].isSent := True;
        mails[indexMails].month := inputMonth;
        mails[indexMails].fileDateTime := DateTimeToStr(FileDateToDateTime(searchResult.Time)); //����� ��������� ����� ������������
                                                                                                //� DOS-�������(Integer)
        mails[indexMails].fileName := searchResult.Name;
        indexMails := IndexMails + 1;
      until FindNext(searchResult) <> 0;
      FindClose(searchResult);
    end
  else
    begin
      SetLength(mails, Length(mails)+1);
      mails[indexMails] := TMail.Create;

      mails[indexMails].number := IndexMails + 1;
      mails[indexMails].codeMO := inputCodeMO;
      mails[indexMails].isSent := False;
      mails[indexMails].month := inputMonth;

      indexMails := IndexMails + 1;

      FindClose(searchResult);
    end;
end;

procedure TFormMain.SpinEditYearChange(Sender: TObject);
begin
  selectedYear := spineditYear.Value;
  if selectedNumberMonth = 0 then
    labelHelp.Caption := '������ �� ��� ������' + ' ' + IntToStr(selectedYear) + ' ����:'
  else
    labelHelp.Caption := '������ �� ����� ' + selectedMonth + ' ' + IntToStr(selectedYear) + ' ����:';
end;

procedure TFormMain.comboboxSelectMonthSelect(Sender: TObject);
begin
  selectedNumberMonth := comboboxSelectMonth.ItemIndex;
  case selectedNumberMonth of
    1 : selectedMonth := '������';
    2 : selectedMonth := '�������';
    3 : selectedMonth := '����';
    4 : selectedMonth := '������';
    5 : selectedMonth := '���';
    6 : selectedMonth := '����';
    7 : selectedMonth := '����';
    8 : selectedMonth := '������';
    9 : selectedMonth := '��������';
    10 : selectedMonth := '�������';
    11 : selectedMonth := '������';
    12 : selectedMonth := '�������';
  else selectedMonth := '��� ������';
  end;
  if selectedNumberMonth = 0 then
    labelHelp.Caption := '������ �� ��� ������' + ' ' + IntToStr(selectedYear) + ' ����:'
  else
    labelHelp.Caption := '������ �� ����� ' + selectedMonth + ' ' + IntToStr(selectedYear) + ' ����:';
end;

procedure TFormMain.buttonDirectorySentMailsClick(Sender: TObject);
begin
  if SelectDirectory('�������� ����� ��� ����������� ������������ �����:', '', directorySentMails, [sdNewFolder, sdShowShares, sdNewUI, sdValidateDir]) then
    editDirectorySentMails.Text := directorySentMails;
end;

procedure TFormMain.buttonDirectoryCryptoarmClick(Sender: TObject);
begin
  if SelectDirectory('�������� ����� ��� ��������� � ����������� ��������:', '', directoryCryptoarm, [sdNewFolder, sdShowShares, sdNewUI, sdValidateDir]) then
    editDirectoryCryptoarm.Text := directoryCryptoarm;
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

function TFormMain.checkExcelInstall;
var ClassID: TCLSID;
    HRES: HRESULT;
begin
  HRES := CLSIDFromProgId( PWideChar(WideString('Excel.Application')), ClassID );
  if HRES = S_OK then
    result := true
  else
    result := false;
end;

procedure TFormMain.stringgridMailsMouseEnter(Sender: TObject);
begin
  stringgridMails.SetFocus;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  imgMailSent.Free;
  imgMailNotSent.Free;
  listCodeMO.Free;
  //������� ������
  if Length(mails) > 0 then
    begin
      for indexMails := 0 to High(mails) do
        begin
          mails[indexMails].Free;
        end;
    end;
  SetLength(mails, 0);
end;

end.
