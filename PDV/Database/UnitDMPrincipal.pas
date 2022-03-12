unit UnitDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMPrincipal = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQRMovimentacoes: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDTransaction1: TFDTransaction;
    FDQRMovimentacoesMOV_CODIGO: TIntegerField;
    FDQRMovimentacoesMOV_CREDITO: TCurrencyField;
    FDQRMovimentacoesMOV_DEBITO: TCurrencyField;
    FDQRMovimentacoesMOV_DESCRICAO: TStringField;
    FDQRMovimentacoesMOV_SALDOANT: TCurrencyField;
    FDQRMovimentacoesMOV_CON: TSmallintField;
    FDQRMovimentacoesMOV_DATAHORA: TSQLTimeStampField;
    FDQRMovimentacoesMOV_NOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
