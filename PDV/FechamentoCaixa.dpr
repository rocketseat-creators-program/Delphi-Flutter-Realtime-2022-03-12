program FechamentoCaixa;

uses
  Vcl.Forms,
  UnitPrincipal in 'Modulos\Principal\View\UnitPrincipal.pas' {FrmPrincipal},
  UnitFechamentoCaixa in 'Modulos\Caixa\View\UnitFechamentoCaixa.pas' {FrmControleCaixa},
  UnitDMPrincipal in 'Database\UnitDMPrincipal.pas' {DMPrincipal: TDataModule},
  Pkg.Json.DTO in 'Modulos\Caixa\Model\Pkg.Json.DTO.pas',
  Movimentacoes.Model in 'Modulos\Caixa\Model\Movimentacoes.Model.pas',
  UnitFuncoes.Utils in 'Modulos\Utils\UnitFuncoes.Utils.pas',
  UnitMsgUsuario in 'Modulos\Utils\UnitMsgUsuario.pas' {FrmMsgUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmMsgUsuario, FrmMsgUsuario);
  Application.Run;
end.
