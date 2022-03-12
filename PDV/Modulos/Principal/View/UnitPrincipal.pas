unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ImageList: TImageList;
    actSair: TAction;
    actCaixa: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Image1: TImage;
    procedure actSairExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCaixaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UnitFechamentoCaixa;

procedure TFrmPrincipal.actCaixaExecute(Sender: TObject);
begin
  if FrmControleCaixa = nil then
    FrmControleCaixa := TFrmControleCaixa.Create(nil);
  FrmControleCaixa.ShowModal;
end;

procedure TFrmPrincipal.actSairExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente sair da aplicação?', 'Sair', MB_YESNO) = mrYes then
    Close;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  FrmPrincipal := nil;
end;

end.
