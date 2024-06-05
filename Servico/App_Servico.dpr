program App_Servico;
{
 Desenvolvedor: Ricardo Soares.
 Data: 05/06/2024
 Obs.: Desenvolvido utilizando Factory Methos com framework horse e com uma
 autenticação basica
}


{$APPTYPE CONSOLE}

uses
  Horse,
  uRoutes,
  Horse.BasicAuthentication,
  System.SysUtils,
  uTarefaRepository in 'uTarefaRepository.pas',
  uDatabaseQueryFactory in 'uDatabaseQueryFactory.pas';

begin
  try
    Writeln('Inicializando Serviço...');
    //Aqui eu instancio a autenticação basica sem a necessdade do JWT
    THorse.Use(HorseBasicAuthentication(
      function(const AUsername, APassword: string): Boolean
      begin
        // Autenticação simples com usuario e senha.
        Result := AUsername.Equals('api') and APassword.Equals('123456');
      end));

    uRoutes.RegistryRoutes;
    //Utilizando o framework Horse
    THorse.Listen(9000);
  except
    on E: Exception do
      Writeln('Erro no serviço: ' + E.Message);
  end;
end.
