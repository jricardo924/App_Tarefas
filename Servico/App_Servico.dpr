program App_Servico;
{
 Desenvolvedor: Ricardo Soares.
 Data: 05/06/2024
 Obs.: Desenvolvido utilizando Factory Methos com framework horse e com uma
 autentica��o basica
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
    Writeln('Inicializando Servi�o...');
    //Aqui eu instancio a autentica��o basica sem a necessdade do JWT
    THorse.Use(HorseBasicAuthentication(
      function(const AUsername, APassword: string): Boolean
      begin
        // Autentica��o simples com usuario e senha.
        Result := AUsername.Equals('api') and APassword.Equals('123456');
      end));

    uRoutes.RegistryRoutes;
    //Utilizando o framework Horse
    THorse.Listen(9000);
  except
    on E: Exception do
      Writeln('Erro no servi�o: ' + E.Message);
  end;
end.
