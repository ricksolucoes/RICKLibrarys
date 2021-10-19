unit RICK.Librays.Demo.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TfrmDemo = class(TForm)
    imgLogo: TImage;
    Layout1: TLayout;
    lytInputData: TLayout;
    edtData: TEdit;
    lnData: TLine;
    lblData: TLabel;
    lytTypeData: TLayout;
    cbxDataFormat: TComboBox;
    lblDataFormat: TLabel;
    Layout2: TLayout;
    lblResult: TLabel;
    StyleBook: TStyleBook;
    btnExecute: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure cbxDataFormatChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemo: TfrmDemo;

implementation

{$R *.fmx}

uses
  RICK.Librarys,
  RICK.Librarys.Interfaces;

procedure TfrmDemo.cbxDataFormatChange(Sender: TObject);
begin
  case cbxDataFormat.ItemIndex of
    0: edtData.Text:= 'OK';
    1: edtData.Text:= '456OK123';
    2: edtData.Text:= '123OK232';
    3: edtData.Text:= '12312313';
    4: edtData.Text:= '123123232123';
    5: edtData.Text:= '31122100';
    6: edtData.Text:= '010199';
    7: edtData.Text:= '233821';
  else
    Exit;
  end;
  edtData.SetFocus;
  TRICKLibrarys.New.HideKeyboard(edtData);
end;

procedure TfrmDemo.FormShow(Sender: TObject);
begin
  edtData.SetFocus;
end;

procedure TfrmDemo.SpeedButton1Click(Sender: TObject);
var
  LRICKLibrarys: iRICKLibrarys;
begin
  LRICKLibrarys := TRICKLibrarys.New;

  case cbxDataFormat.ItemIndex of
    0:
      if LRICKLibrarys.StringInSet(edtData.Text.ToLower, ['ok', 'cancel']) then
        lblResult.Text:= 'There is'
      else
        lblResult.Text:= 'Does Not Exist';
    1:
      lblResult.Text:= LRICKLibrarys.OnlyNumber(edtData.Text);
    2:
      lblResult.Text:= LRICKLibrarys.Mask('###-###', edtData.Text);
    3:
      lblResult.Text:= LRICKLibrarys.IEFormat(edtData.Text, 'RJ');
    4:
      lblResult.Text:= LRICKLibrarys.FormatValue(edtData.Text);
    5:
      lblResult.Text:= LRICKLibrarys.FormatDate(edtData.Text);
    6:
      lblResult.Text:= LRICKLibrarys.FormatDate(edtData.Text, True);
    7:
      lblResult.Text:= LRICKLibrarys.FormatPeso(edtData.Text);
    8:
      LRICKLibrarys.DelayedSetFocus(edtData);

  end;
end;


end.
