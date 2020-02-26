program IlsKafkaBackup;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Form3},
  Ils.Kafka in '..\..\..\IlsSaaSCommon\_Common\Ils.Kafka.pas',
  Ils.Kafka.Conf in '..\..\..\IlsSaaSCommon\_Common\Ils.Kafka.Conf.pas',
  ULibKafka in '..\..\..\IlsSaaSCommon\lib\Kafka\ULibKafka.pas',
  JsonDataObjects in '..\..\..\IlsSaaSCommon\lib\Json\JsonDataObjects.pas',
  Ils.MySql.Conf in '..\..\..\IlsSaaSCommon\_Common\Ils.MySql.Conf.pas',
  Ils.Json.Utils in '..\..\..\IlsSaaSCommon\_Common\Ils.Json.Utils.pas',
  Ils.Utils in '..\..\..\IlsSaaSCommon\_Common\Ils.Utils.pas',
  Ils.Json.Names in '..\..\..\IlsSaaSCommon\_Common\Ils.Json.Names.pas',
  Ils.Logger in '..\..\..\IlsSaaSCommon\_Common\Ils.Logger.pas',
  CINIFilesData in '..\..\..\IlsSaaSCommon\_Common\CINIFilesData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
