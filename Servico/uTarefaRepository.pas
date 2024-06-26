unit uTarefaRepository;
{
 Desenvolvedor: Ricardo Soares.
 Data: 05/06/2024
 Obs.: cria��o da classe de repositorio
}

interface

uses
  System.JSON, Data.Win.ADODB, uTarefa, uDatabaseQueryFactory;

type
  // Interface para o reposit�rio de tarefas
  ITarefaRepository = interface
    ['{8D5E1F59-69E6-4F9E-8985-7E2D4E9D5298}']
    function ListarTarefas: TJSONArray;
    function AdicionarTarefa(Tarefa: TTarefa): Boolean;
    function TarefasId(TarefaID: Integer): TJSONArray;
    function AtualizarStatusTarefa(TarefaID: Integer; NovoStatus: string; DataConclusao: TDate): Boolean;
    function RemoverTarefa(TarefaID: Integer): Boolean;
    function TotalTarefas: Integer;
    function MediaPrioridadePendentes: Double;
    function TarefasConcluidasUltimos7Dias: Integer;
  end;

  // Implementa��o concreta do reposit�rio de tarefas
  TTarefaRepository = class(TInterfacedObject, ITarefaRepository)
  private
    FQueryFactory: IDatabaseQueryFactory;  // Factory para queries
  public
    constructor Create(AQueryFactory: IDatabaseQueryFactory);
    function ListarTarefas: TJSONArray;
    function AdicionarTarefa(Tarefa: TTarefa): Boolean;
    function TarefasId(TarefaID: Integer): TJSONArray;
    function AtualizarStatusTarefa(TarefaID: Integer; NovoStatus: string; DataConclusao: TDate): Boolean;
    function RemoverTarefa(TarefaID: Integer): Boolean;
    function TotalTarefas: Integer;
    function MediaPrioridadePendentes: Double;
    function TarefasConcluidasUltimos7Dias: Integer;
  end;

implementation

uses
  System.SysUtils;

{ TTarefaRepository }

constructor TTarefaRepository.Create(AQueryFactory: IDatabaseQueryFactory);
begin
  FQueryFactory := AQueryFactory;
end;

function TTarefaRepository.ListarTarefas: TJSONArray;
var
  Query: TADOQuery;
  Tarefas: TJSONArray;
  Tarefa: TTarefa;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'SELECT id, titulo, descricao, status, prioridade, ' +
                      'FORMAT(data_criacao, ''dd/MM/yyyy'', ''en-us'') as data_criacao, ' +
                      'FORMAT(data_conclusao, ''dd/MM/yyyy'', ''en-us'') as data_conclusao ' +
                      'FROM Tarefas';
    Query.Open;
    Tarefas := TJSONArray.Create;
    Tarefa := TTarefa.Create;

    while not Query.Eof do
    begin
      Tarefa.ID := Query.FieldByName('id').AsInteger;
      Tarefa.Titulo := Query.FieldByName('titulo').AsString;
      Tarefa.Descricao := Query.FieldByName('descricao').AsString;
      Tarefa.Status := Query.FieldByName('status').AsString;
      Tarefa.Prioridade := Query.FieldByName('prioridade').AsInteger;
      Tarefa.DataCriacao := Query.FieldByName('data_criacao').AsDateTime;
      Tarefa.DataConclusao := Query.FieldByName('data_conclusao').AsDateTime;
      Tarefas.AddElement(Tarefa.ToJSONObject);
      Query.Next;
    end;
    Query.Close;
    Result := Tarefas;
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar tarefas: ' + E.Message);
  end;
  Tarefa.Free;
  Query.Free;
end;

function fConverteDataBR(vldData:String):TDate;
var
  vlsData: String;
  vlsAno,
  vlsMes,
  vlsDia: String;
begin
   vlsAno := Copy(vldData,1,4);
   vlsMes := Copy(vldData,6,2);
   vlsDia := Copy(vldData,9,2);
   vlsData := vlsDia+'/'+vlsMes+'/'+vlsAno;
   Result := StrToDate(vlsData);
end;

function fConverteData(vldData:TDate):String;
var
  vlsData: String;
begin
   vlsData := StringReplace(DateToStr(vldData), '/', '-', [rfReplaceAll]);
   Result := vlsData;
end;

function TTarefaRepository.AdicionarTarefa(Tarefa: TTarefa): Boolean;
var
  Query: TADOQuery;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'INSERT INTO Tarefas (titulo, descricao, status, prioridade, data_criacao, data_conclusao) ' +
                      'VALUES (:Titulo, :Descricao, :Status, :Prioridade, :DataCriacao, :DataConclusao)';

    Query.Parameters.ParamByName('titulo').Value := Tarefa.titulo;
    Query.Parameters.ParamByName('Descricao').Value := Tarefa.Descricao;
    Query.Parameters.ParamByName('Status').Value := Tarefa.Status;
    Query.Parameters.ParamByName('Prioridade').Value := Tarefa.Prioridade;
    Query.Parameters.ParamByName('DataCriacao').Value := fConverteData(Tarefa.DataCriacao);
    Query.Parameters.ParamByName('DataConclusao').Value := fConverteData(Tarefa.DataConclusao);
    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao adicionar tarefa: ' + E.Message);
  end;
  Query.Free;
end;

function TTarefaRepository.AtualizarStatusTarefa(TarefaID: Integer; NovoStatus: string; DataConclusao: TDate): Boolean;
var
  Query: TADOQuery;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'UPDATE Tarefas SET Status = :Status, data_conclusao = :data_conclusao WHERE ID = :ID';
    Query.Parameters.ParamByName('Status').Value := NovoStatus;
    Query.Parameters.ParamByName('ID').Value := TarefaID;
    Query.Parameters.ParamByName('data_conclusao').Value := DataConclusao;
    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao atualizar status da tarefa: ' + E.Message);
  end;
  Query.Free;
end;

function TTarefaRepository.RemoverTarefa(TarefaID: Integer): Boolean;
var
  Query: TADOQuery;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'DELETE FROM Tarefas WHERE ID = :ID';
    Query.Parameters.ParamByName('ID').Value := TarefaID;
    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao remover tarefa: ' + E.Message);
  end;
  Query.Free;
end;

function TTarefaRepository.TotalTarefas: Integer;
var
  Query: TADOQuery;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'SELECT COUNT(*) AS Total FROM Tarefas';
    Query.Open;
    Result := Query.FieldByName('Total').AsInteger;
    Query.Close;
  except
    on E: Exception do
      raise Exception.Create('Erro ao obter total de tarefas: ' + E.Message);
  end;
  Query.Free;
end;

function TTarefaRepository.MediaPrioridadePendentes: Double;
var
  Query: TADOQuery;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'SELECT AVG(Prioridade) AS Media FROM Tarefas WHERE Status = ''Pendente''';
    Query.Open;
    Result := Query.FieldByName('Media').AsFloat;
    Query.Close;
  except
    on E: Exception do
      raise Exception.Create('Erro ao obter m�dia de prioridade das tarefas pendentes: ' + E.Message);
  end;
  Query.Free;
end;

function TTarefaRepository.TarefasConcluidasUltimos7Dias: Integer;
var
  Query: TADOQuery;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'SELECT COUNT(*) AS Total FROM Tarefas WHERE Status = ''Conclu�da'' AND ' +
                      'data_conclusao >= DATEADD(day, -7, GETDATE())';
    Query.Open;
    Result := Query.FieldByName('Total').AsInteger;
    Query.Close;
  except
    on E: Exception do
      raise Exception.Create('Erro ao obter tarefas conclu�das nos �ltimos 7 dias: ' + E.Message);
  end;
  Query.Free;
end;

function TTarefaRepository.TarefasId(TarefaID: Integer): TJSONArray;
var
  Query: TADOQuery;
  Tarefas: TJSONArray;
  Tarefa: TTarefa;
  vlsDataCriacao,
  vlsDataConclusao: String;
begin
  Query := FQueryFactory.CreateQuery;  // Usando a Factory para criar a query
  try
    Query.SQL.Text := 'SELECT * FROM Tarefas WHERE ID = :ID';
    Query.Parameters.ParamByName('ID').Value := TarefaID;
    Query.Open;

    Tarefas := TJSONArray.Create;
    Tarefa := TTarefa.Create;

    while not Query.Eof do
    begin
      Tarefa.ID := Query.FieldByName('id').AsInteger;
      Tarefa.Titulo := Query.FieldByName('titulo').AsString;
      Tarefa.Descricao := Query.FieldByName('descricao').AsString;
      Tarefa.Status := Query.FieldByName('status').AsString;
      Tarefa.Prioridade := Query.FieldByName('prioridade').AsInteger;
      Tarefa.DataCriacao := fConverteDataBR(Query.FieldByName('data_criacao').AsString);
      Tarefa.DataConclusao := fConverteDataBR(Query.FieldByName('data_conclusao').AsString);
      Tarefas.AddElement(Tarefa.ToJSONObject);
      Query.Next;
    end;
    Query.Close;
    Result := Tarefas;
  except
    on E: Exception do
      raise Exception.Create('Erro ao pesquisar tarefas por id: ' + E.Message);
  end;
  Tarefa.Free;
  Query.Free;
end;

end.

