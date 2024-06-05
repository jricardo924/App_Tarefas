unit uDatabaseQueryFactory;

interface

uses
  Data.Win.ADODB;

type
  // Interface para a Factory de queries
  IDatabaseQueryFactory = interface
    ['{8D5E1F59-69E6-4F9E-8985-7E2D4E9D5298}']
    function CreateQuery: TADOQuery;
  end;

  // Implementação concreta da Factory de queries
  TDatabaseQueryFactory = class(TInterfacedObject, IDatabaseQueryFactory)
  public
    function CreateQuery: TADOQuery;
  end;

implementation

uses
  uDatabase;

{ TDatabaseQueryFactory }

function TDatabaseQueryFactory.CreateQuery: TADOQuery;
begin
  Result := TDatabaseQuery.CreateQuery;
end;

end.

