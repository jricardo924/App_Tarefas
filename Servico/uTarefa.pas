unit uTarefa;
{
 Desenvolvedor: Ricardo Soares.
 Data: 05/06/2024
 Obs.: criação da classe de tarefa
}

interface

uses
  System.JSON, System.SysUtils;

type
  TTarefa = class
  private
    FID: Integer;
    FTitulo: String;
    FDescricao: string;
    FStatus: string;
    FPrioridade: Integer;
    FDataCriacao: TDate;
    FDataConclusao: TDate;

  public
    property ID: Integer read FID write FID;
    property Titulo: string read FTitulo write FTitulo;
    property Descricao: string read FDescricao write FDescricao;
    property Status: string read FStatus write FStatus;
    property Prioridade: Integer read FPrioridade write FPrioridade;
    property DataCriacao: TDate read FDataCriacao write FDataCriacao;
    property DataConclusao: TDate read FDataConclusao write FDataConclusao;


    function ToJSONObject: TJSONObject;
  end;

implementation

function TTarefa.ToJSONObject: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('ID', TJSONNumber.Create(FID));
  Result.AddPair('Titulo', TJSONString.Create(FTitulo));
  Result.AddPair('Descricao', TJSONString.Create(FDescricao));
  Result.AddPair('Status', TJSONString.Create(FStatus));
  Result.AddPair('Prioridade', TJSONNumber.Create(FPrioridade));
  Result.AddPair('DataCriacao', TJSONString.Create(DateToStr(FDataCriacao)));
  Result.AddPair('DataConclusao', TJSONString.Create(DateToStr(FDataConclusao)));
end;

end.

