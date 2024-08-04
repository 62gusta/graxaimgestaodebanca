unit untMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, IBConnection, PQConnection, MSSQLConn, SQLite3Conn,
  DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls, DBGrids, DBCtrls,
  DBExtCtrls, Menus, ActnList, CheckLst, Buttons, ExtCtrls, JSONPropStorage,
  EditBtn, TASources, TAGraph, TARadialSeries, Types, TASeries, TACustomSource,
  TADbSource, TACustomSeries, TAChartLiveView, TAChartCombos, TAMultiSeries,
  DateUtils, Math, Grids, ValEdit, TAChartAxisUtils, FileUtil;

type

  { TformPrincipal }

  TformPrincipal = class(TForm)
    btnLimparFiltroAp: TButton;
    btnFiltrarAp: TButton;
    btnNovaAposta: TButton;
    btnRemoverAposta: TButton;
    btnSalvarBancaInicial: TButton;
    btnTudoGreen: TButton;
    btnTudoRed: TButton;
    btnCashout: TButton;
    btnSalvaAp: TButton;
    btnCancelaAp: TButton;
    cbAno: TComboBox;
    cbCompeticao: TComboBox;
    cbGraficos: TComboBox;
    cbMes: TComboBox;
    cbPerfil: TComboBox;
    cbTime: TComboBox;
    chbMandante: TDBCheckBox;
    chbVisitante: TDBCheckBox;
    chrtAcertAno: TChart;
    chrtAcertMes: TChart;
    chrtAcertMetMes1: TChart;
    chrtAcertMetMes2: TChart;
    chrtAcertMetMes3: TChart;
    chrtAcertMetMes4: TChart;
    chrtLucroAno: TChart;
    chrtLucroMes: TChart;
    chrtLucroMetMes1: TChart;
    chrtLucroMetMes2: TChart;
    chrtLucroMetMes3: TChart;
    chrtLucroMetMes4: TChart;
    conectBancoDados: TSQLite3Connection;
    grdDadosAp: TDBGrid;
    dsDadosAposta: TDataSource;
    dbGraficoAno: TDbChartSource;
    dbGraficoMes: TDbChartSource;
    deFiltroDataFinal: TDateEdit;
    deFiltroDataInicial: TDateEdit;
    dsApostas: TDataSource;
    dsBanca: TDataSource;
    dsCompeticoes: TDataSource;
    dsGraficoAno: TDataSource;
    dsGraficoMes: TDataSource;
    dsMes: TDataSource;
    dsPerfis: TDataSource;
    dsSelecionarPerfil: TDataSource;
    dsSituacao: TDataSource;
    dsUnidades: TDataSource;
    edtBancaInicial: TEdit;
    gbLinha: TGroupBox;
    gbListaLinha: TGroupBox;
    gbListaMetodo: TGroupBox;
    gbMetodo: TGroupBox;
    gbTimes: TGroupBox;
    grbApostas: TGroupBox;
    grbDetalhesAp: TGroupBox;
    grdAno: TDBGrid;
    grdApostas: TDBGrid;
    grdMes: TDBGrid;
    JSONPropStorage1: TJSONPropStorage;
    lbSelecioneAposta: TLabel;
    lbAno: TLabel;
    lbBancaAtual: TLabel;
    lbBancaInicial: TLabel;
    lbLinhas: TDBListBox;
    lbLinhas1: TDBListBox;
    lbLucro: TLabel;
    lbMes: TLabel;
    lbPerfil: TLabel;
    lbUnidade: TLabel;
    lnGraficoLucroAno: TLineSeries;
    lnGraficoLucroMes: TLineSeries;
    lsbTimes: TDBListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
    pcControleMetodos: TPageControl;
    pcPrincipal: TPageControl;
    pcResumo: TPageControl;
    pnGraficos: TPanel;
    pnTabelas: TPanel;
    popupLinhas: TPopupMenu;
    psGraficoGreensReds: TPieSeries;
    psGraficoGreensReds1: TPieSeries;
    qrAno: TSQLQuery;
    qrApostas: TSQLQuery;
    qrApostasBanca_Final: TBCDField;
    qrApostasCod_Aposta: TLongintField;
    qrApostasCompeticao: TStringField;
    qrApostasData: TDateField;
    qrApostasJogo: TStringField;
    qrApostasLucro: TBCDField;
    qrApostasMltipla: TBooleanField;
    qrApostasOdd: TBCDField;
    qrApostasRetorno: TBCDField;
    qrApostasRSBancaFinal: TStringField;
    qrApostasRSLucro: TStringField;
    qrApostasRSRetorno: TStringField;
    qrApostasSelecao: TBooleanField;
    qrApostasStatus: TStringField;
    qrApostasTipoAposta: TStringField;
    qrApostasValor_Aposta: TBCDField;
    qrBanca: TSQLQuery;
    qrBancaAno: TLargeintField;
    qrBancaAno1: TLongintField;
    qrBancaBancaFinalCalc: TStringField;
    qrBancaInicialMoedaStake1: TStringField;
    qrBancaLucro: TFloatField;
    qrBancaLucroCalc: TStringField;
    qrBancaLucroPrCntCalculado1: TStringField;
    qrBancaLucroRCalc: TStringField;
    qrBancaLucroRSCalculado1: TStringField;
    qrBancaLucro_: TFloatField;
    qrBancaLucro_1: TBCDField;
    qrBancaLucro_R1: TBCDField;
    qrBancaMs: TLargeintField;
    qrBancaMs1: TLongintField;
    qrBancaStake: TBCDField;
    qrBancaStake1: TBCDField;
    qrBancaStakeCalc: TStringField;
    qrBancaValorCalculado1: TStringField;
    qrBancaValorFinalCalculado1: TStringField;
    qrBancaValor_Final: TFloatField;
    qrBancaValor_Final1: TBCDField;
    qrBancaValor_Inicial: TBCDField;
    qrBancaValor_Inicial1: TBCDField;
    qrCompeticoes: TSQLQuery;
    qrMes: TSQLQuery;
    qrMesesGreenRed: TSQLQuery;
    qrPerfis: TSQLQuery;
    qrPerfisPerfil: TStringField;
    qrPerfisPerfil1: TStringField;
    qrSelecionarPerfil: TSQLQuery;
    qrSelecionarPerfilPerfilSelecionado: TStringField;
    qrSelecionarPerfilPerfilSelecionado1: TStringField;
    qrSituacao: TSQLQuery;
    qrUnidades: TSQLQuery;
    qrUnidadesUnidade: TStringField;
    qrUnidadesUnidade1: TStringField;
    scriptRemoverAposta: TSQLScript;
    qrDadosAposta: TSQLQuery;
    StatusBar1: TStatusBar;
    tsContrTimes: TTabSheet;
    tsContrPaises: TTabSheet;
    tsContrComp: TTabSheet;
    transactionBancoDAdos: TSQLTransaction;
    cloneMultipla, cloneInfoMult: TPanel;
    tsAcertMetAno: TTabSheet;
    tsAcertMetAno1: TTabSheet;
    tsAcertMetMes: TTabSheet;
    tsAcertMetMes1: TTabSheet;
    tsApostas: TTabSheet;
    tsControleMetodos: TTabSheet;
    tsGraficos: TTabSheet;
    tsGrafMet: TTabSheet;
    tsPainel: TTabSheet;
    tsResumoLista: TTabSheet;
    tsSelecTime: TTabSheet;
    tsTabelaMet: TTabSheet;
    txtBancaAtual: TDBText;
    txtLucroMoeda: TDBText;
    txtLucroPorCento: TDBText;
    txtStake: TDBText;
    procedure DrawGrid1Click(Sender: TObject);
    procedure dsBancaDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure AtualizaMetodoLinha(Sender: TObject);
    procedure CriaMultipla(Contador: integer);
    procedure grdDadosApCellClick(Column: TColumn);
    procedure grdDadosApEditingDone(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure ReiniciarTodosOsQueries;
    procedure MudarCorLucro;
    procedure PerfilDoInvestidor;
    procedure tsApostasContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure tsGrafMetContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure txtStakeClick(Sender: TObject);
  private

  public
    procedure PosAtualizacao;
  end;

var
  ColunaAtual: TColumn;

procedure DefinirStake;

var
  formPrincipal: TformPrincipal;
  estrategia, perfilInvestidor: string;
  stakeAposta, valorInicial: double;
  mesSelecionado, anoSelecionado, contMult: integer;

implementation

uses
  untUpdate, untApostas, untPainel, untSplash, untDatabase, untMultipla, untSobre,
  fpjson, HTTPDefs, fphttpclient, jsonparser, LCLIntf;;

procedure DefinirStake;
var
  query: TSQLQuery;
begin
  query := TSQLQuery.Create(nil);
  query.DataBase := formPrincipal.conectBancoDados;
  try
    if not query.Active then query.Close;
    query.SQL.Text := 'UPDATE Banca SET "Stake" = :stake';
    formPrincipal.PerfilDoInvestidor;
    query.ParamByName('stake').AsFloat := stakeAposta;
    query.ExecSQL;
    formPrincipal.transactionBancoDados.Commit;
  except
    on E: Exception do
    begin
      writeln('Erro: ' + E.Message + ' Abortado');
      formPrincipal.transactionBancoDados.Rollback;
    end;
  end;
  query.Free;
end;

{$R *.lfm}

{ TformPrincipal }

procedure TformPrincipal.FormCreate(Sender: TObject);
var
  TelaSplash: TformSplash;
begin
  {$IFDEF MSWINDOWS}
  AssignFile(Output, GetEnvironmentVariable('PROGRAMFILES') +
    '\Graxaim Gestão de Banca\debug.txt');
  //AssignFile(Output, 'debug.txt');
  Rewrite(Output);
  {$ENDIF}
  writeln('Exibindo tela splash');
  TelaSplash := TformSplash.Create(nil);
  TelaSplash.ShowModal;
  TelaSplash.Free;
end;

procedure TformPrincipal.DrawGrid1Click(Sender: TObject);
begin

end;

procedure TformPrincipal.dsBancaDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TformPrincipal.FormResize(Sender: TObject);
const
  AspectRatio = 0.5;
var
  larguraTotal, alturaTotal, larguraGrafico, alturaGrafico: integer;
begin
  larguraTotal := pnGraficos.ClientWidth;
  alturaTotal := pnGraficos.ClientHeight;

  larguraGrafico := larguraTotal div 2;
  alturaGrafico := trunc(alturaTotal * AspectRatio);
  chrtLucroMes.SetBounds(0, 0, larguraGrafico, alturaGrafico);
  chrtAcertMes.SetBounds(larguraGrafico, 0, larguraGrafico, alturaGrafico);
  chrtLucroAno.SetBounds(0, alturaGrafico, larguraGrafico, alturaGrafico);
  chrtAcertAno.SetBounds(larguraGrafico, alturaGrafico, larguraGrafico, alturaGrafico);
end;

procedure TformPrincipal.AtualizaMetodoLinha(Sender: TObject);
var
  SelectedItem: TMenuItem;
begin
  SelectedItem := TMenuItem(Sender);
  if Assigned(ColunaAtual) and Assigned(SelectedItem) then
  begin
    qrDadosAposta.Edit;
    qrDadosAposta.FieldByName(ColunaAtual.FieldName).AsString := SelectedItem.Caption;
    writeln('Item selecionado: ', SelectedItem.Caption);
    qrDadosAposta.Post;
    qrDadosAposta.ApplyUpdates;
    transactionBancoDados.CommitRetaining;
  end;
end;

procedure TformPrincipal.CriaMultipla(Contador: integer);
begin

end;
procedure TformPrincipal.MudarCorLucro;
var
  lucro: Double;
begin
  lucro := qrBanca.FieldByName('Lucro').AsFloat;

  if lucro > 0 then
  begin
    txtBancaAtual.Font.Color := clGreen;
    txtLucroMoeda.Font.Color := clGreen;
    txtLucroPorcento.Font.Color := clGreen;
  end
  else if lucro < 0 then
  begin
    txtBancaAtual.Font.Color := clRed;
    txtLucroMoeda.Font.Color := clRed;
    txtLucroPorcento.Font.Color := clRed;
  end
  else
  begin
    txtBancaAtual.Font.Color := clDefault;
    txtLucroMoeda.Font.Color := clDefault;
    txtLucroPorcento.Font.Color := clDefault;
  end;
end;

procedure TformPrincipal.PerfilDoInvestidor;
begin

  if perfilInvestidor = 'Conservador' then
    stakeAposta := RoundTo(valorInicial / 100, -2)
  else
  if perfilInvestidor = 'Moderado' then
    stakeAposta := RoundTo(valorInicial / 70, -2)
  else
  if perfilInvestidor = 'Agressivo' then
    stakeAposta := RoundTo(valorInicial / 40, -2);
end;

procedure TformPrincipal.tsApostasContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: boolean);
begin

end;

procedure TformPrincipal.tsGrafMetContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: boolean);
begin

end;

procedure TformPrincipal.txtStakeClick(Sender: TObject);
begin

end;

procedure TformPrincipal.ReiniciarTodosOsQueries;
var
  qrPraReiniciar: TList;
  I: integer;
begin
  qrPraReiniciar := TList.Create;
  try
    qrPraReiniciar.Add(qrApostas);
    qrPraReiniciar.Add(qrBanca);
    qrPraReiniciar.Add(qrCompeticoes);
    qrPraReiniciar.Add(qrSituacao);
    qrPraReiniciar.Add(qrUnidades);
    qrPraReiniciar.Add(qrPerfis);
    qrPraReiniciar.Add(qrSelecionarPerfil);

    //qrApostas.ParamByName('mesSelecionado').AsInteger := MonthOf(Now);
    //qrApostas.ParamByName('anoSelecionado').AsInteger := YearOf(Now);

    for I := 0 to qrPraReiniciar.Count - 1 do
    begin
      if not TSQLQuery(qrPraReiniciar[I]).Active then
      begin
        writeln('Iniciando  ', TComponent(qrPraReiniciar[I]).Name);
        TSQLQuery(qrPraReiniciar[I]).Open;
      end
      else
      begin
        writeln('Reiniciando ', TComponent(qrPraReiniciar[I]).Name);
        TSQLQuery(qrPraReiniciar[I]).Refresh;
      end;
    end;
  except
    on E: Exception do
    begin
      writeln('Erro ao reiniciar os queries.' + E.Message);
      MessageDlg('Erro',
        'Ocorreu um erro. Se o problema persistir favor informar no Github com a seguinte mensagem: '
        + E.Message, mtError, [mbOK], 0);
    end;
  end;
  qrPraReiniciar.Free;
end;

procedure TFormPrincipal.grdDadosApCellClick(Column: TColumn);
var
  P: TPoint;
  Query: TSQLQuery;
  Item: TMenuItem;
begin
  Query := TSQLQuery.Create(nil);
  Query.DataBase := conectBancoDados;
  Screen.Cursor := crAppStart;
  popupLinhas.Items.Clear;

  ColunaAtual := Column;

  case Column.FieldName of
    'Método':
    begin
      if Query.Active then Query.Close;
      Query.SQL.Text := 'SELECT Nome FROM Métodos';
      Query.Open;
      while not Query.EOF do
      begin
        Item := TMenuItem.Create(popupLinhas);
        Item.Caption := Query.FieldByName('Nome').AsString;
        Item.OnClick := @AtualizaMetodoLinha;
        popupLinhas.Items.Add(Item);
        Query.Next;
      end;
    end;
    'Linha':
    begin
      if Query.Active then Query.Close;
      Query.SQL.Text :=
        'SELECT Nome FROM Linhas WHERE Cod_Metodo = (SELECT Cod_Metodo FROM Métodos WHERE Métodos.Nome = :SelecMetodo)';
      Query.ParamByName('SelecMetodo').AsString :=
        qrDadosAposta.FieldByName('Método').AsString;
      Query.Open;
      while not Query.EOF do
      begin
        Item := TMenuItem.Create(popupLinhas);
        Item.Caption := Query.FieldByName('Nome').AsString;
        Item.OnClick := @AtualizaMetodoLinha;
        popupLinhas.Items.Add(Item);
        Query.Next;
      end;
    end;
    'Status':
    begin
      popupLinhas.Items.Clear;
      Item := TMenuItem.Create(popupLinhas);
      Item.Caption := 'Pré-live';
      Item.OnClick := @AtualizaMetodoLinha;
      popupLinhas.Items.Add(Item);

      Item := TMenuItem.Create(popupLinhas);
      Item.Caption := 'Green';
      Item.OnClick := @AtualizaMetodoLinha;
      popupLinhas.Items.Add(Item);

      Item := TMenuItem.Create(popupLinhas);
      Item.Caption := 'Red';
      Item.OnClick := @AtualizaMetodoLinha;
      popupLinhas.Items.Add(Item);

      Item := TMenuItem.Create(popupLinhas);
      Item.Caption := 'Anulada';
      Item.OnClick := @AtualizaMetodoLinha;
      popupLinhas.Items.Add(Item);

      Item := TMenuItem.Create(popupLinhas);
      Item.Caption := 'Meio Green';
      Item.OnClick := @AtualizaMetodoLinha;
      popupLinhas.Items.Add(Item);

      Item := TMenuItem.Create(popupLinhas);
      Item.Caption := 'Meio Red';
      Item.OnClick := @AtualizaMetodoLinha;
      popupLinhas.Items.Add(Item);
    end;
  end;

  P := Mouse.CursorPos;
  popupLinhas.PopUp(P.X, P.Y);
  Screen.Cursor := crDefault;
  Query.Free;
  qrDadosAposta.Edit;
end;

procedure TformPrincipal.grdDadosApEditingDone(Sender: TObject);
begin
  qrDadosAposta.Edit;
  qrDadosAposta.Post;
  qrDadosAposta.ApplyUpdates;
  transactionBancoDados.CommitRetaining;
  qrApostas.Close;
  qrApostas.Open;
end;

procedure TformPrincipal.MenuItem7Click(Sender: TObject);
begin
  formSobre.ShowModal;
end;

procedure TformPrincipal.MenuItem8Click(Sender: TObject);
begin
  openurl('https://link.mercadopago.com.br/graxaimgestaodebanca');
end;

procedure TformPrincipal.pcPrincipalChange(Sender: TObject);
begin
end;

procedure TformPrincipal.PosAtualizacao;
var
  NaoExcluir: TStringList;
  programAtualizado: boolean = False;
  SourceFile, DestFile: string;
begin
  if not JaAtualizado then
  begin
    NaoExcluir := TStringList.Create;
    try
      {$IFDEF MSWINDOWS}
      writeln('Sistema Windows detectado!');
      NaoExcluir.SaveToFile('%APPDATA%\GraxaimBanca\NaoExcluir');
      writeln('Criado arquivo de marcação em %APPDATA%\GraxaimBanca\');
      {$ENDIF}

      {$IFDEF LINUX}
        writeln('Sistema Linux detectado!');
        NaoExcluir.SaveToFile(IncludeTrailingPathDelimiter(GetEnvironmentVariable('HOME')) +
          '.GraxaimBanca/NaoExcluir');
        writeln('Criado arquivo de marcação em $HOME/.GraxaimBanca/');
      {$ENDIF}
    finally
      NaoExcluir.Free;
    end;

    programAtualizado := True;
  end;
end;

end.
