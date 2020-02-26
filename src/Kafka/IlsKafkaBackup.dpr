program IlsKafkaBackup;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Form3},
  Ils.Kafka in '..\_Common\Ils.Kafka.pas',
  Ils.Kafka.Conf in '..\_Common\Ils.Kafka.Conf.pas',
  ULibKafka in '..\..\lib\Kafka\ULibKafka.pas',
  JsonDataObjects in '..\..\lib\Json\JsonDataObjects.pas',
  Ils.MySql.Conf in '..\_Common\Ils.MySql.Conf.pas',
  Ils.Json.Utils in '..\_Common\Ils.Json.Utils.pas',
  Ils.Utils in '..\_Common\Ils.Utils.pas',
  Ils.Json.Names in '..\_Common\Ils.Json.Names.pas',
  Ils.Logger in '..\_Common\Ils.Logger.pas',
  CINIFilesData in '..\_Common\CINIFilesData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
