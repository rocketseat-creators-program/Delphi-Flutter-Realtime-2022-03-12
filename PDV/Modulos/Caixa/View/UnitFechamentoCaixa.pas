unit UnitFechamentoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin;

type
  TFrmControleCaixa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    actSair: TAction;
    DSMovimentacoes: TDataSource;
    ToolBar1: TToolBar;
    ImageList: TImageList;
    actEnviarDados: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEnviarDadosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControleCaixa: TFrmControleCaixa;

implementation

{$R *.dfm}

uses
  UnitDMPrincipal,
  RESTRequest4D,
  Movimentacoes.Model, UnitFuncoes.Utils;

procedure TFrmControleCaixa.actEnviarDadosExecute(Sender: TObject);
var
  LResponse: IResponse;
  ModelMovimentacoes: TModelMovimentacoes;
begin
  if Application.MessageBox('Deseja realmente enviar dados para o servidor?', 'Enviar Dados', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    MensagemUsuario('Aguarde, enviando dados para o Cloud Firestore...', 1, False, False);
    DMPrincipal.FDQRMovimentacoes.DisableControls;
    DMPrincipal.FDQRMovimentacoes.First;
    while not DMPrincipal.FDQRMovimentacoes.Eof do
    begin
      ModelMovimentacoes := TModelMovimentacoes.Create;
      try
        ModelMovimentacoes.CreateTime := Now;
        ModelMovimentacoes.UpdateTime := Now;
        ModelMovimentacoes.Name := 'projects/movimentacoes-caixa/databases/(default)/documents/movimentacoes/' + DMPrincipal.FDQRMovimentacoesMOV_CODIGO.AsString;
        ModelMovimentacoes.Fields.Credito.DoubleValue     := DMPrincipal.FDQRMovimentacoesMOV_CREDITO.AsFloat;
        ModelMovimentacoes.Fields.Datahora.TimestampValue := DMPrincipal.FDQRMovimentacoesMOV_DATAHORA.AsDateTime;
        ModelMovimentacoes.Fields.Debito.DoubleValue      := DMPrincipal.FDQRMovimentacoesMOV_DEBITO.AsFloat;
        ModelMovimentacoes.Fields.Descricao.StringValue   := DMPrincipal.FDQRMovimentacoesMOV_DESCRICAO.AsString;
        LResponse := TRequest.New
                        .BaseURL('https://firestore.googleapis.com/v1/projects/movimentacoes-caixa/databases/(default)/documents/movimentacoes/' + DMPrincipal.FDQRMovimentacoesMOV_CODIGO.AsString)
                        .AddBody(ModelMovimentacoes.AsJson)
                        .Accept('application/json')
                        .Patch;
      finally
        ModelMovimentacoes.free;
      end;
      DMPrincipal.FDQRMovimentacoes.Next;
    end;
    DMPrincipal.FDQRMovimentacoes.First;
    DMPrincipal.FDQRMovimentacoes.EnableControls;
    MensagemUsuario('Dados enviados com sucesso!', 1, False, False);
  end;
end;

procedure TFrmControleCaixa.actSairExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente sair do Controle de Caixa?', 'Sair', MB_YESNO) = mrYes then
    Close;
end;

procedure TFrmControleCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TFrmControleCaixa.FormDestroy(Sender: TObject);
begin
  FrmControleCaixa := nil;
end;

procedure TFrmControleCaixa.FormShow(Sender: TObject);
begin
  DMPrincipal.FDQRMovimentacoes.Close;
  DMPrincipal.FDQRMovimentacoes.Active := True;
end;

end.
