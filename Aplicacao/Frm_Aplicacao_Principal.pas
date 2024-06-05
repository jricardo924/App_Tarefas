unit Frm_Aplicacao_Principal;
{
 Desenvolvedor: Ricardo Soares.
 Data: 04/06/2024
 Obs.: Desenvolvido interface para consumir o servi�o
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, RESTRequest4D, REST.Client, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON, IPPeerClient, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Mask,
  VclTee.TeeGDIPlus, VCLTee.Series, VCLTee.TeEngine, VCLTee.TeeProcs,
  VCLTee.Chart, RequestFactory ;

type
  TForm_Aplicacao_Principal = class(TForm)
    StatusBar1: TStatusBar;
    PcPrincipal: TPageControl;
    TSTarefas: TTabSheet;
    TbEstatisticas: TTabSheet;
    TabSheet1: TTabSheet;
    SgsListaTarefas: TStringGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BtnAdicionar: TToolButton;
    ToolButton5: TToolButton;
    BtnAtualizar: TToolButton;
    ToolButton7: TToolButton;
    BtnRemover: TToolButton;
    ToolButton8: TToolButton;
    BtnSair: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    LblEdtID: TLabel;
    EdtID: TEdit;
    LblEdtTitulo: TLabel;
    EdtTitulo: TEdit;
    LblMmoDescricao: TLabel;
    cbxPrioridade: TComboBox;
    LblcbxPrioridade: TLabel;
    EdtDat_Criacao: TMaskEdit;
    LblEdtDat_Criacao: TLabel;
    EdtDat_Conclusao: TMaskEdit;
    LblEdtDat_Conclusao: TLabel;
    MmoDescricao: TMemo;
    LblEdtStatus: TLabel;
    ChtTotal: TChart;
    ChtMedia: TChart;
    ChtTotal7Dias: TChart;
    Series2: TBarSeries;
    Series1: TBarSeries;
    Series3: TBarSeries;
    BtnNovo: TToolButton;
    ToolButton3: TToolButton;
    CbxStatus: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure TbEstatisticasShow(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure SgsListaTarefasDblClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure CbxStatusChange(Sender: TObject);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure BtnRemoverClick(Sender: TObject);
    procedure EdtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure cbxPrioridadeKeyPress(Sender: TObject; var Key: Char);
    procedure MmoDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure CbxStatusKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIDExit(Sender: TObject);
  private
    { Private declarations }
    procedure pCamposObrigatorios;
    procedure pEdicao;
    procedure pPesquisaid;
    procedure pAdicionar;
    procedure pAtualizar;
    procedure pRemover;
    procedure pCarregaGraficos;
    procedure pListarTarefas;
    procedure pLimparCampos;
    procedure ParseAndDisplayTarefas(const jsonResponse: TJSONArray);
    procedure ParseAndDisplayTarefasId(const jsonResponse: TJSONArray);
    //Functions
    function fCarregaTotal: Integer;
    function fCarregaMedia: Double;
    function fCarregaTarefasConcluidasSeteDias: Integer;
  public
    { Public declarations }
  end;

var
  Form_Aplicacao_Principal: TForm_Aplicacao_Principal;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm_Aplicacao_Principal.BtnAdicionarClick(Sender: TObject);
begin
   //Verifica se campos obrigat�rios foram preenchidos
   pCamposObrigatorios;
   //Adiciona Tarefa
   pAdicionar;
   //Lista Tarefa
   pListarTarefas;
   //Coloca para Edi��o novamente
   BtnNovoClick(Sender);
end;

procedure TForm_Aplicacao_Principal.BtnAtualizarClick(Sender: TObject);
begin
   pAtualizar;
   pListarTarefas;
   BtnNovoClick(Sender);
end;

procedure TForm_Aplicacao_Principal.BtnNovoClick(Sender: TObject);
begin
   pLimparCampos;
   BtnAdicionar.Enabled := True;
   BtnAtualizar.Enabled := False;
   BtnRemover.Enabled := False;
end;

procedure TForm_Aplicacao_Principal.BtnRemoverClick(Sender: TObject);
begin
  pRemover;
  pListarTarefas;
  BtnNovoClick(Sender);
end;

procedure TForm_Aplicacao_Principal.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Aplicacao_Principal.cbxPrioridadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TForm_Aplicacao_Principal.CbxStatusChange(Sender: TObject);
begin
   if CbxStatus.ItemIndex = 0 then
    EdtDat_Conclusao.Clear
   else
    EdtDat_Conclusao.Text := FormatDateTime('DD/MM/YYYY', Now);
end;

procedure TForm_Aplicacao_Principal.CbxStatusKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TForm_Aplicacao_Principal.EdtIDExit(Sender: TObject);
begin
   if Trim(EdtID.Text) <> '' then
   begin
      if not(BtnAtualizar.Enabled) then
      begin
         pPesquisaid;
      end;
   end;
end;

procedure TForm_Aplicacao_Principal.EdtTituloKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;
end;

function TForm_Aplicacao_Principal.fCarregaMedia: Double;
var
  LResponse: IResponse;
  jsonObject: TJSONObject;
  jsonValue: TJSONValue;
  jsonString: string;
begin
  try
    // Criado a classe TRequestFactory para centralizar os parametros padr�o do request
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/media_priori_pendentes')
                                .AddParam('ParameterName', 'ParameterValue')
                                .Get;

    if LResponse.StatusCode = 200 then
    begin
      jsonObject := nil; // Inicializar jsonObject

      try
        jsonObject := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;

        // Verifica se jsonObject foi corretamente convertido para TJSONObject
        if Assigned(jsonObject) then
        begin
          try
            // Obt�m o valor da chave "media_priori_pendentes"
            jsonValue := jsonObject.GetValue('media_priori_pendentes');
            if Assigned(jsonValue) then
              jsonString := jsonValue.Value
            else
              ShowMessage('Chave "media_priori_pendentes" n�o encontrada no objeto JSON.');
          finally
            jsonObject.Free;
          end;
        end
        else
          ShowMessage('Erro ao converter resposta para JSON Object.');
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao analisar resposta JSON: ' + E.Message);
          if Assigned(jsonObject) then
            jsonObject.Free; // Liberar jsonObject em caso de erro
        end;
      end;
    end
    else
    begin
      ShowMessage('Erro ao listar tarefas: ' + LResponse.StatusText);
    end;

    // Convertendo o resultado para Double
    Result := StrToFloatDef(jsonString, 0.0);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao realizar requisi��o: ' + E.Message);
      Result := 0.0;
    end;
  end;
end;

function TForm_Aplicacao_Principal.fCarregaTotal: Integer;
var
  LResponse: IResponse;
  jsonObject: TJSONObject;
  jsonValue: TJSONValue;
  jsonString: string;
begin
  try
    // Criado a classe TRequestFactory para centralizar os parametros padr�o do request
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/total')
                                .AddParam('ParameterName', 'ParameterValue')
                                .Get;

    if LResponse.StatusCode = 200 then
    begin
      jsonObject := nil; // Inicializar jsonObject

      try
        jsonObject := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;

        // Verifica se jsonObject foi corretamente convertido para TJSONObject
        if Assigned(jsonObject) then
        begin
          try
            // Obt�m o valor da chave "total"
            jsonValue := jsonObject.GetValue('total');
            if Assigned(jsonValue) then
              jsonString := jsonValue.Value
            else
              ShowMessage('Chave "total" n�o encontrada no objeto JSON.');
          finally
            jsonObject.Free;
          end;
        end
        else
          ShowMessage('Erro ao converter resposta para JSON Object.');
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao analisar resposta JSON: ' + E.Message);
          if Assigned(jsonObject) then
            jsonObject.Free; // Liberar jsonObject em caso de erro
        end;
      end;
    end
    else
    begin
      ShowMessage('Erro ao listar tarefas: ' + LResponse.StatusText);
    end;

    // Convertendo o resultado para Integer
    Result := StrToIntDef(jsonString, 0);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao realizar requisi��o: ' + E.Message);
      Result := 0;
    end;
  end;
end;

procedure TForm_Aplicacao_Principal.FormShow(Sender: TObject);
begin
  pListarTarefas;
  EdtTitulo.SetFocus;
end;

procedure TForm_Aplicacao_Principal.MmoDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TForm_Aplicacao_Principal.pAdicionar;
var
  LResponse: IResponse;
  jsonString: string;
  vlsDatacriacao: String;
begin
  try
    vlsDatacriacao := FormatDateTime('DD/MM/YYYY', Now);
    jsonString :=
      '{"Titulo": "' + EdtTitulo.Text + '","Descricao": "' + MmoDescricao.Text + '","Status": "Pendente",' +
      '"Prioridade": "' + cbxPrioridade.Text + '","DataCriacao": "' + vlsDatacriacao + '","DataConclusao": "null"}';

    // Criado a classe TRequestFactory para centralizar os parametros padr�o do request
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/add')
                                .AddBody(jsonString)
                                .Post;

    if LResponse.StatusCode = 200 then
    begin
       if Trim(LResponse.Content) <> '' then
         ShowMessage('Tarefa adicionada com sucesso!');
    end
    else
    begin
      ShowMessage('Erro ao adicionar tarefa: ' + LResponse.StatusText);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao realizar requisi��o: ' + E.Message);
    end;
  end;
end;

function TForm_Aplicacao_Principal.fCarregaTarefasConcluidasSeteDias: Integer;
var
  LResponse: IResponse;
  jsonObject: TJSONObject;
  jsonValue: TJSONValue;
  jsonString: string;
begin
  try
    // Criado a classe TRequestFactory para centralizar os parametros padr�o do request
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/concluidas_sete_dias')
                                .AddParam('ParameterName', 'ParameterValue')
                                .Get;

    if LResponse.StatusCode = 200 then
    begin
      jsonObject := nil; // Inicializar jsonObject

      try
        jsonObject := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;

        // Verifica se jsonObject foi corretamente convertido para TJSONObject
        if Assigned(jsonObject) then
        begin
          try
            // Obt�m o valor da chave "concluidas_sete_dias"
            jsonValue := jsonObject.GetValue('concluidas_sete_dias');
            if Assigned(jsonValue) then
              jsonString := jsonValue.Value
            else
              ShowMessage('Chave "concluidas_sete_dias" n�o encontrada no objeto JSON.');
          finally
            jsonObject.Free;
          end;
        end
        else
          ShowMessage('Erro ao converter resposta para JSON Object.');
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao analisar resposta JSON: ' + E.Message);
          if Assigned(jsonObject) then
            jsonObject.Free; // Liberar jsonObject em caso de erro
        end;
      end;
    end
    else
    begin
      ShowMessage('Erro ao listar tarefas: ' + LResponse.StatusText);
    end;

    // Convertendo o resultado para Integer
    Result := StrToIntDef(jsonString, 0);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao realizar requisi��o: ' + E.Message);
      Result := 0;
    end;
  end;
end;

procedure TForm_Aplicacao_Principal.ParseAndDisplayTarefas(const jsonResponse: TJSONArray);
var
  jsonValue: TJSONValue;
  jsonObject: TJSONObject;
  rowIndex: Integer;
begin
  SgsListaTarefas.RowCount := jsonResponse.Count + 1; // +1 para o cabe�alho
  SgsListaTarefas.ColCount := 7; // N�mero de colunas para Descri��o, Status, Prioridade e etc.

  // Cabe�alhos das colunas
  SgsListaTarefas.ColWidths[0] := 100;
  SgsListaTarefas.Cells[0, 0] := 'Id';
  SgsListaTarefas.ColWidths[1] := 100;
  SgsListaTarefas.Cells[1, 0] := 'Titulo';
  SgsListaTarefas.ColWidths[2] := 400;
  SgsListaTarefas.Cells[2, 0] := 'Descri��o';
  SgsListaTarefas.ColWidths[3] := 100;
  SgsListaTarefas.Cells[3, 0] := 'Prioridade';
  SgsListaTarefas.ColWidths[4] := 100;
  SgsListaTarefas.Cells[4, 0] := 'Status';
  SgsListaTarefas.ColWidths[5] := 200;
  SgsListaTarefas.Cells[5, 0] := 'Data Cria��o';
  SgsListaTarefas.ColWidths[6] := 200;
  SgsListaTarefas.Cells[6, 0] := 'Data Conclus�o';

  // Inicia a partir da segunda linha (a primeira linha � para o cabe�alho)
  rowIndex := 1;
  for jsonValue in jsonResponse do
  begin
    if jsonValue is TJSONObject then
    begin
      jsonObject := TJSONObject(jsonValue);
      SgsListaTarefas.Cells[0, rowIndex] := jsonObject.GetValue<string>('ID');
      SgsListaTarefas.Cells[1, rowIndex] := jsonObject.GetValue<string>('Titulo');
      SgsListaTarefas.Cells[2, rowIndex] := jsonObject.GetValue<string>('Descricao');
      SgsListaTarefas.Cells[3, rowIndex] := jsonObject.GetValue<string>('Prioridade');
      SgsListaTarefas.Cells[4, rowIndex] := jsonObject.GetValue<string>('Status');
      SgsListaTarefas.Cells[5, rowIndex] := jsonObject.GetValue<string>('DataCriacao');
      SgsListaTarefas.Cells[6, rowIndex] := jsonObject.GetValue<string>('DataConclusao');
      // Adicione mais informa��es aqui, se necess�rio
      Inc(rowIndex);
    end;
  end;
end;

procedure TForm_Aplicacao_Principal.ParseAndDisplayTarefasId(
  const jsonResponse: TJSONArray);
var
  jsonValue: TJSONValue;
  jsonObject: TJSONObject;
begin
  for jsonValue in jsonResponse do
  begin
    if jsonValue is TJSONObject then
    begin
       if (MessageDlg('Registro Existente. Deseja Atualizar ou Remover?',
           mtConfirmation, [mbOk, mbNo], 0) = mrOK) then
       begin
          jsonObject := TJSONObject(jsonValue);

          EdtID.Text := jsonObject.GetValue<string>('ID');
          EdtTitulo.Text := jsonObject.GetValue<string>('Titulo');
          MmoDescricao.Text := jsonObject.GetValue<string>('Descricao');
          if jsonObject.GetValue<string>('Status') = 'Pendente'  then
             CbxStatus.ItemIndex := 0
          else
             CbxStatus.ItemIndex := 1;
          cbxPrioridade.ItemIndex := cbxPrioridade.Items.IndexOf(jsonObject.GetValue<string>('Prioridade'));
          EdtDat_Criacao.Text := jsonObject.GetValue<string>('DataCriacao');
          EdtDat_Conclusao.Text := jsonObject.GetValue<string>('DataConclusao');
          pEdicao;
       end
       else
       EdtID.Clear;
    end;
  end;
end;

procedure TForm_Aplicacao_Principal.pAtualizar;
var
  LResponse: IResponse;
  jsonString: string;
  vlsDataConclusao: String;
begin
  try
    vlsDataConclusao := EdtDat_Conclusao.Text;
    if vlsDataConclusao = '  /  /    ' then
      vlsDataConclusao := 'null';
    jsonString :=
      '{"status": "' + CbxStatus.Text + '", "id": "' + EdtID.Text + '", "data_conclusao": "' + vlsDataConclusao + '"}';

    // Criado a classe TRequestFactory para centralizar os parametros padr�o do request
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/status')
                                .AddParam('ParameterName', 'ParameterValue')
                                .AddBody(jsonString)
                                .Put;

    if LResponse.StatusCode = 200 then
    begin
      if Trim(LResponse.Content) <> '' then
        ShowMessage('Tarefa atualizada com sucesso!');
    end
    else
    begin
      ShowMessage('Erro ao atualizar tarefa: ' + LResponse.StatusText);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao realizar requisi��o: ' + E.Message);
    end;
  end;
end;

procedure TForm_Aplicacao_Principal.pCamposObrigatorios;
begin
   if CbxStatus.ItemIndex = -1 then
    raise Exception.Create('Campo obrigat�rio n�o prenchido.Campo: Status.');

   if Trim(EdtTitulo.Text) = '' then
    raise Exception.Create('Campo obrigat�rio n�o prenchido.Campo: Titulo.');

   if Trim(MmoDescricao.Text) = '' then
    raise Exception.Create('Campo obrigat�rio n�o prenchido.Campo: Descricao.');

   if cbxPrioridade.ItemIndex = -1 then
    raise Exception.Create('Campo obrigat�rio n�o prenchido.Campo: Prioridade.');
end;

procedure TForm_Aplicacao_Principal.pCarregaGraficos;
var
  vliTotal: Integer;
  vlrMedia: Double;
  vliConcluidasSeteDias: Integer;
begin
   //Gera Grafico de total
   vliTotal :=  fCarregaTotal;
   ChtTotal.Series[0].Clear;
   ChtTotal.Series[0].AddXY(10, vliTotal, 'Total = ' +IntToStr(vliTotal));

   //Gera grafico de media
   vlrMedia := fCarregaMedia;
   ChtMedia.Series[0].Clear;
   ChtMedia.Series[0].AddXY(10, vlrMedia, 'M�dia = ' +FloatToStr(vlrMedia));

   //Gera grafico de concluidas em 7 dias
   vliConcluidasSeteDias := fCarregaTarefasConcluidasSeteDias;
   ChtTotal7Dias.Series[0].Clear;
   ChtTotal7Dias.Series[0].AddXY(10, vliConcluidasSeteDias, 'Total em 7 dias = ' +FloatToStr(vliConcluidasSeteDias));

end;

procedure TForm_Aplicacao_Principal.pEdicao;
begin
   BtnAdicionar.Enabled := False;
   BtnAtualizar.Enabled := True;
   BtnRemover.Enabled := True;
end;

procedure TForm_Aplicacao_Principal.pLimparCampos;
begin
   EdtID.Clear;
   EdtDat_Criacao.Clear;
   EdtDat_Conclusao.Clear;
   CbxStatus.ItemIndex := 0;
   EdtTitulo.Clear;
   cbxPrioridade.ItemIndex := -1;
   MmoDescricao.Clear;
   EdtTitulo.SetFocus;
end;

procedure TForm_Aplicacao_Principal.pListarTarefas;
var
  LResponse: IResponse;
  jsonResponse: TJSONArray;
begin
  try
    // Criado a classe TRequestFactory para centralizar os parametros padr�o do request
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/list')
                                .AddParam('ParameterName', 'ParameterValue')
                                .Get;

    if LResponse.StatusCode = 200 then
    begin
      jsonResponse := nil; // Inicializar jsonResponse

      try
        // Parse o conte�do da resposta como um array JSON
        jsonResponse := TJSONArray(TJSONObject.ParseJSONValue(LResponse.Content));

        // Verifica se jsonResponse foi corretamente convertido para TJSONArray
        if Assigned(jsonResponse) then
        begin
          ParseAndDisplayTarefas(jsonResponse);
        end
        else
        begin
          ShowMessage('Erro ao converter resposta para JSON Array.');
        end;
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao analisar resposta JSON: ' + E.Message);
        end;
      end;

      // Libera jsonResponse se foi criado
      if Assigned(jsonResponse) then
        jsonResponse.Free;
    end
    else
    begin
      ShowMessage('Erro ao listar tarefas: ' + LResponse.StatusText);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao realizar requisi��o: ' + E.Message);
    end;
  end;
end;


procedure TForm_Aplicacao_Principal.pPesquisaid;
var
  LResponse: IResponse;
  jsonResponse: TJSONArray;
  jsonString: string;
begin
  try
   jsonString :=
   '{"id": "'+EdtID.Text+'"}';
    // Criado a classe TRequestFactory para centralizar os parametros padr�o do request
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/id')
                             .AddBody(jsonString)
                             .put;

    if LResponse.StatusCode = 200 then
    begin
      jsonResponse := nil; // Inicializar jsonResponse

      try
        // Parse o conte�do da resposta como um array JSON
        jsonResponse := TJSONArray(TJSONObject.ParseJSONValue(LResponse.Content));

        // Verifica se jsonResponse foi corretamente convertido para TJSONArray
        if Assigned(jsonResponse) then
        begin
           ParseAndDisplayTarefasId(jsonResponse);
        end
        else
        begin
          ShowMessage('Erro ao converter resposta para JSON Array.');
        end;
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao analisar resposta JSON: ' + E.Message);
        end;
      end;

      // Libera jsonResponse se foi criado
      if Assigned(jsonResponse) then
        jsonResponse.Free;
    end
    else
    begin
      ShowMessage('Erro ao listar tarefas: ' + LResponse.StatusText);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao realizar requisi��o: ' + E.Message);
    end;
  end;
end;

procedure TForm_Aplicacao_Principal.pRemover;
var
  LResponse: IResponse;
  jsonString: string;
begin
  try
    jsonString :=
    '{"id": "'+EdtID.Text+'"}';
    LResponse := TRequestFactory.CreateRequest('http://localhost:9000/tarefas/remover')
                              .AddBody(jsonString)
                              .put;

    if LResponse.StatusCode = 200 then
    begin
      if Trim(LResponse.Content) <> '' then
        ShowMessage('Tarefa Removida com sucesso!');
    end
    else
    begin
      ShowMessage('Erro ao Remover tarefa: ' + LResponse.StatusText);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao Realizar requisi��o: ' + E.Message);
    end;
  end;

end;

procedure TForm_Aplicacao_Principal.SgsListaTarefasDblClick(Sender: TObject);
var
  ClickedRow, ClickedCol: Integer;
  CellData: string;
begin

   // Obt�m a linha e coluna clicadas
  ClickedRow := SgsListaTarefas.Row;

  if ClickedRow > 0 then
  begin
      // Obt�m o conte�do da c�lula
      EdtID.Text := SgsListaTarefas.Cells[0, ClickedRow];
      EdtTitulo.Text := SgsListaTarefas.Cells[1, ClickedRow];
      MmoDescricao.Text := SgsListaTarefas.Cells[2, ClickedRow];
      if SgsListaTarefas.Cells[4, ClickedRow] = 'Pendente' then
        CbxStatus.ItemIndex := 0
      else
        CbxStatus.ItemIndex := 1;
      EdtDat_Criacao.Text := SgsListaTarefas.Cells[5, ClickedRow];
      EdtDat_Conclusao.Text := SgsListaTarefas.Cells[6, ClickedRow];
      cbxPrioridade.ItemIndex := cbxPrioridade.Items.IndexOf(SgsListaTarefas.Cells[3, ClickedRow]);
      PcPrincipal.ActivePageIndex := 0;
      BtnAdicionar.Enabled := False;
      BtnRemover.Enabled := True;
      BtnAtualizar.Enabled := True;
  end;
end;

procedure TForm_Aplicacao_Principal.TbEstatisticasShow(Sender: TObject);
begin
   pCarregaGraficos;
end;

end.
