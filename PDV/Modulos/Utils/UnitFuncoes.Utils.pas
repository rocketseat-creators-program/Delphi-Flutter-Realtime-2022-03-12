unit UnitFuncoes.Utils;

interface
uses
  System.DateUtils,
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms;

procedure MensagemUsuario(Mensagem: string; TempoSegundos: integer; BotaoOK, Esperar: Boolean);

var UltimaMsg: TTime;

implementation

uses UnitMsgUsuario, UnitPrincipal;

procedure MensagemUsuario(Mensagem: string; TempoSegundos: integer; BotaoOK, Esperar: Boolean);
begin
  if (SecondsBetween(Time, UltimaMsg) > 4) or (Esperar) then
  begin
    if FrmMsgUsuario <> nil then
    begin
      FrmMsgUsuario.Free;
      FrmMsgUsuario := nil;
    end;
  end;
  SetForegroundWindow(Application.Handle);
  if TempoSegundos > 1000 then
    TempoSegundos := Round(TempoSegundos / 1000);
  if FrmMsgUsuario = nil then
    Application.CreateForm(TFrmMsgUsuario, FrmMsgUsuario);
  FrmMsgUsuario.Label1.Caption  := Mensagem;
  FrmMsgUsuario.Timer1.Interval := TempoSegundos * 1000; // Transforma Segundos em Milissegundos
  FrmMsgUsuario.Button1.Visible := BotaoOK;
  UltimaMsg                     := Time;
  if Esperar then
  begin
    FrmMsgUsuario.BringToFront;
    FrmMsgUsuario.ShowModal;
  end
  else
  begin
    FrmMsgUsuario.Show;
    FrmMsgUsuario.FormShow(FrmPrincipal);
  end;
end;

end.
