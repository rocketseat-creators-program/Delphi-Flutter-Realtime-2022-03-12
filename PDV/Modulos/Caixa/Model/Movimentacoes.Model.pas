unit Movimentacoes.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TCredito = class;
  TDatahora = class;
  TDebito = class;
  TDescricao = class;

  TCredito = class
  private
    FDoubleValue: double;
  published
    property DoubleValue: double read FDoubleValue write FDoubleValue;
  end;
  
  TDescricao = class
  private
    FStringValue: string;
  published
    property StringValue: string read FStringValue write FStringValue;
  end;
  
  TDebito = class
  private
    FDoubleValue: double;
  published
    property DoubleValue: double read FDoubleValue write FDoubleValue;
  end;
  
  TDatahora = class
  private
    [SuppressZero]
    FTimestampValue: TDateTime;
  published
    property TimestampValue: TDateTime read FTimestampValue write FTimestampValue;
  end;
  
  TFields = class
  private
    FCredito: TCredito;
    FDatahora: TDatahora;
    FDebito: TDebito;
    FDescricao: TDescricao;
  published
    property Credito: TCredito read FCredito;
    property Datahora: TDatahora read FDatahora;
    property Debito: TDebito read FDebito;
    property Descricao: TDescricao read FDescricao;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TModelMovimentacoes = class(TJsonDTO)
  private
    [SuppressZero]
    FCreateTime: TDateTime;
    FFields: TFields;
    FName: string;
    [SuppressZero]
    FUpdateTime: TDateTime;
  published
    property CreateTime: TDateTime read FCreateTime write FCreateTime;
    property Fields: TFields read FFields;
    property Name: string read FName write FName;
    property UpdateTime: TDateTime read FUpdateTime write FUpdateTime;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TFields }

constructor TFields.Create;
begin
  inherited;
  FDatahora := TDatahora.Create;
  FDebito := TDebito.Create;
  FDescricao := TDescricao.Create;
  FCredito := TCredito.Create;
end;

destructor TFields.Destroy;
begin
  FDatahora.Free;
  FDebito.Free;
  FDescricao.Free;
  FCredito.Free;
  inherited;
end;

{ TRoot }

constructor TModelMovimentacoes.Create;
begin
  inherited;
  FFields := TFields.Create;
end;

destructor TModelMovimentacoes.Destroy;
begin
  FFields.Free;
  inherited;
end;

end.
