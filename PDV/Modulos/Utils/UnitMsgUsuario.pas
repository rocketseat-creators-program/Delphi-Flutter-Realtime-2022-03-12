unit UnitMsgUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmMsgUsuario = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Altura, Largura, Esquerda, Topo: integer;
  end;

var
  FrmMsgUsuario: TFrmMsgUsuario;

implementation

{$R *.dfm}

procedure TFrmMsgUsuario.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TFrmMsgUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TFrmMsgUsuario.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMsgUsuario.FormDeactivate(Sender: TObject);
begin
  // FrmMsgUsuario.BringToFront;
end;

procedure TFrmMsgUsuario.FormShow(Sender: TObject);
begin
  Timer1.Enabled := (Timer1.Interval > 0) and (not Button1.Visible);
  { if (FrmFinalizaVenda <> nil) and (not Button1.Visible) then
    begin
    Topo := FrmFinalizaVenda.Top + FrmFinalizaVenda.Height;
    Esquerda := round((FrmFinalizaVenda.Left+(FrmFinalizaVenda.Width/2))-(FrmMsgUsuario.Width/2));
    FrmFinalizaVenda.SetFocus;
    end else
    begin }
  Topo     := round((Application.MainForm.Top + (Application.MainForm.Height / 2)) - (FrmMsgUsuario.Height / 2));
  Esquerda := round((Application.MainForm.Left + (Application.MainForm.Width / 2)) - (FrmMsgUsuario.Width / 2));
  // end;
  Height         := Altura;
  Width          := Largura;
  Left           := Esquerda;
  Top            := Topo;
  Image1.Top     := 0;
  Label1.Top     := 0;
  Image2.Visible := Button1.Visible;
  if Button1.Visible then
  begin
    // Image1.Height := 135;
    // Button1.Top := Image1.Top + Image1.Height - Button1.Height - 2;
    Image2.Top  := Image1.Top + Image1.Height + 1;
    Button1.Top := Image2.Top + 2;
    if Button1.CanFocus then
      Button1.SetFocus;
  end;
  // SetBounds(Esquerda, Topo, Largura, Altura);
  // Application.BringToFront;
  // FrmMsgUsuario.BringToFront;
  FrmMsgUsuario.Refresh;
  Label1.Refresh;
  SetForegroundWindow(FrmMsgUsuario.Handle);
end;

end.
