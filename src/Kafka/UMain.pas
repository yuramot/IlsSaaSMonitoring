unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Ils.Kafka, JsonDataObjects,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Ils.Utils, Vcl.ComCtrls, Ils.MySql.Conf, DateUtils, IniFiles;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    edtStartOffset: TEdit;
    edtCount: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    edtBootstrap: TEdit;
    edtTopic: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FbFired: TDateTime;
    FeFired: TDateTime;
    FoFired: Int64;
    FKafka: TKafkaConsumer;
    Fini: TIniFile;
    fs: TFileStream;
    sw: TStreamWriter;

    function OnKafkaMessage(const AMessage: AnsiString; const AOffset: Int64; const ATopic: AnsiString): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

function OnKafkaLog(const AMessage: string; const ASkipTimeStamp: Boolean = False): string;
begin
  Result := '';


end;

procedure TForm3.Button1Click(Sender: TObject);
var
  conf: TMySQLDatabaseConfig;
begin
  conf.Host := 'monitoring.ils-glonass.ru';
  conf.Port := 3362;
  conf.Login := 'test';
  conf.Password := 'ILS123';
  conf.Database := 'saas.release';
  conf.Protocol := 'mysql-5';


  FKafka.Free;

  FKafka := TKafkaConsumer.Create(edtBootstrap.Text, 'backup-random', edtTopic.Text, OnKafkaMessage, OnKafkaLog);

  FbFired := 0;
  FeFired := 0;
  FoFired := 0;

  fs := TFileStream.Create(ChangeFileExt(Application.ExeName, '_kafka.log'), fmShareDenyWrite + fmOpenWrite + fmCreate);
  sw := TStreamWriter.Create(fs);

  Memo1.Lines.Add('start - ' + FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now));


  FKafka.Start(StrToInt64(edtStartOffset.Text));
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  FKafka.Free;
end;

function TForm3.OnKafkaMessage(const AMessage: AnsiString; const AOffset: Int64; const ATopic: AnsiString): Boolean;
var
  json: TJsonObject;
//  dt: TDateTime;
//  dtR: TDateTime;
  p: Integer;
  Msg: string;
begin
  Result := True;
  try
    json := TJsonObject(TJsonObject.Parse(string(AMessage)));
    try
      p := Round(((AOffset - StrToInt64(edtStartOffset.Text))/(StrToInt64(edtCount.Text))) * 100);
      if p <> ProgressBar1.Position then
        ProgressBar1.Position := p;
        Msg := json.ToJSON();
  //      sw.Write(Length(Msg));
        sw.Write(IntToStr(AOffset) + ',' + Msg);
        sw.WriteLine;

  //    if json.L['i'] = FIMEI then
  //    begin
  //
  //      dt := IlsToDateTime(json.S['dt'], 0);
  //      dtr := IlsToDateTime(json.S['r'], 0);
  //
  //      if ((dt+(3*OneHour)) >= dtpFrom.Date) and ((dt+(3 * OneHour)) < dtpTill.Date) then
  //      begin
  //        if FbFired = 0 then
  //        begin
  //          FbFired := dt;
  //          FoFired := AOffset;
  //          Memo1.Lines.Add('begin ' + FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz: ', dt) + IntToStr(AOffset));
  //        end;
  //
  //        FQuery.ParamByName('IMEI').AsLargeInt := FIMEI;
  //        FQuery.ParamByName('FIMEI').AsLargeInt := FFIMEI;
  //        FQuery.ParamByName('DT').AsDateTime := dt;
  //        FQuery.ParamByName('JSON').AsString := AMessage;
  //        FQuery.ParamByName('Recieved').AsDateTime := dtr;
  //        FQuery.ParamByName('Offset').AsLargeInt := AOffset;
  ////        FQuery.ExecSQL;
  //      end else begin
  //
  //        if (FbFired <> 0) and (FeFired = 0)then
  //        begin
  //          FeFired := dt;
  //          Memo1.Lines.Add('end ' + FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz: ', dt) + IntToStr(AOffset) + ', count=' + IntToStr(AOffset - FoFired));
  //          Result := False;
  //          Exit;
  //        end;
  //      end;
  //
  //      Result := AOffset < StrToInt64(edtEndOffset.Text);
  //    end;
    finally
      json.Free;
    end;
    if not Result then
      Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now));
    if AOffset >= (StrToInt64(edtStartOffset.Text) + StrToInt64(edtCount.Text)) then
    begin
      FreeAndNil(sw);
      FreeAndNil(fs);
      Memo1.Lines.Add('finish - ' + FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now));
      Exit(False);
    end;
  except

  end;
end;

end.
