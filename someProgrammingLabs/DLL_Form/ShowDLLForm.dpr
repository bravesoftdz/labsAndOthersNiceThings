program ShowDLLForm;

uses
  Forms,
  DLL_2 in 'DLL_2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
