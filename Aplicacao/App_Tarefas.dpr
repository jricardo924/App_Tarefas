program App_Tarefas;

uses
  Vcl.Forms,
  Frm_Aplicacao_Principal in 'Frm_Aplicacao_Principal.pas' {Form_Aplicacao_Principal},
  RequestFactory in 'RequestFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Aplicacao_Principal, Form_Aplicacao_Principal);
  Application.Run;
end.
