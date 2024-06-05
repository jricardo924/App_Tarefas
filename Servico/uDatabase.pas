unit uDatabase;

interface

uses
  Data.Win.ADODB, System.SysUtils, Vcl.Dialogs, Winapi.ActiveX, System.Classes;

type
  TDatabaseConnection = class
  private
    class var FConnection: TADOConnection;
    class function GetConnection: TADOConnection;
    class function LoadConnectionString: string;
    class procedure CheckAndCreateTable;
  public
    class function GetInstance: TADOConnection;
    class procedure ReleaseInstance;
  end;

  TDatabaseQuery = class
  private
    class function GetConnection: TADOConnection;
  public
    class function CreateQuery: TADOQuery;
  end;

implementation

{ TDatabaseConnection }

class function TDatabaseConnection.LoadConnectionString: string;
var
  ConnFile: TStringList;
  ConnString: string;
begin
  ConnFile := TStringList.Create;
  try
    ConnFile.LoadFromFile('C:\App-Tarefas\Servico\Conexao DB\StringConexao.txt');
    ConnString := ConnFile.Text;
    Result := ConnString;
  finally
    ConnFile.Free;
  end;
end;

class function TDatabaseConnection.GetConnection: TADOConnection;
begin
  if not Assigned(FConnection) then
  begin
    CoInitialize(nil); // Chame CoInitialize aqui
    FConnection := TADOConnection.Create(nil);
    FConnection.Connected := False;
    FConnection.ConnectionString := LoadConnectionString;

    try
      FConnection.Connected := True;
      CheckAndCreateTable; // Verifica e cria a tabela na primeira conexão
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao conectar: ' + e.Message);
      end;
    end;
  end;
  Result := FConnection;
end;

class procedure TDatabaseConnection.CheckAndCreateTable;
var
  Query: TADOQuery;
  TableExists: Boolean;
begin
  TableExists := False;
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = ''tarefas'') ' +
                      'SELECT 1 ELSE SELECT 0';
    Query.Open;
    TableExists := Query.Fields[0].AsInteger = 1;
    Query.Close;

    if not TableExists then
    begin
      Query.SQL.Text := 'CREATE TABLE Tarefas (' +
                        'Id INT PRIMARY KEY IDENTITY(1,1), ' +
                        'Titulo NVARCHAR(100), ' +
                        'Descricao NVARCHAR(500), ' +
                        'Prioridade INT, ' +
                        'Status NVARCHAR(50), ' +
                        'Data_Criacao DATE, ' +
                        'Data_Conclusao DATE)';
      Query.ExecSQL;
    end;
  finally
    Query.Free;
  end;
end;

class function TDatabaseConnection.GetInstance: TADOConnection;
begin
  Result := GetConnection;
end;

class procedure TDatabaseConnection.ReleaseInstance;
begin
  if Assigned(FConnection) then
  begin
    if not FConnection.Connected then
    begin
      FConnection.Free;
      FConnection := nil;
      CoUninitialize; // Chame CoUninitialize aqui apenas quando não houver mais conexões ativas
    end
    else
    begin
      ShowMessage('A conexão ainda está ativa. Por favor, desconecte-a antes de liberar a instância.');
    end;
  end;
end;

{ TDatabaseQuery }

class function TDatabaseQuery.GetConnection: TADOConnection;
begin
  Result := TDatabaseConnection.GetConnection;
end;

class function TDatabaseQuery.CreateQuery: TADOQuery;
begin
  CoInitialize(nil); // Chame CoInitialize aqui
  Result := TADOQuery.Create(nil); // Primeiro, crie a instância do TADOQuery
  Result.Connection := GetConnection; // Em seguida, atribua a conexão ao objeto Result
end;

end.

