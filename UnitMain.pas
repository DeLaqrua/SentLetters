unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

end.
