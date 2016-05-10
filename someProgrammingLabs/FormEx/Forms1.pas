unit Forms1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TformMain = class(TForm)
    btnPassword: TButton;
    btnNewForm: TButton;
    btnMsg: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure btnMsgClick(Sender: TObject);
    procedure btnNewFormClick(Sender: TObject);
    procedure btnPasswordClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

uses Password;

{$R *.dfm}

procedure TformMain.btnClick(Sender: TObject);
begin
  Caption := TButton(Sender).Caption;
end;

procedure TformMain.btnPasswordClick(Sender: TObject);
begin
  Application.CreateForm(TPasswordDlg,PasswordDlg);
  if PasswordDlg.ShowModal = mrOK
    then Caption := '������ ������ ��'
    else Caption := '������ ������ Cancel';
  PasswordDlg.Free;
end;


procedure TformMain.btnNewFormClick(Sender: TObject);
var NewForm: TForm;
begin
  Application.CreateForm(TForm,NewForm);
  NewForm.InsertControl(TButton.Create(NewForm));
  NewForm.InsertControl(TButton.Create(NewForm));
  with TButton(NewForm.Components[0]) do
  begin
    Caption := 'OK';
    ModalResult := mrOK;
    OnClick := btnClick;
  end;
  with NewForm.Components[1] as TButton do
  begin
    Caption := '������';
    ModalResult := mrCancel;
    Left := 80;
    OnClick := btnClick;
  end;
  NewForm.ShowModal;
  NewForm.Free;
end;

procedure TformMain.btnMsgClick(Sender: TObject);
var i, BtnCount, EditCount: Integer;
    s: String;
begin
  BtnCount := 0;
  EditCount := 0;
  with formMain do
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TButton then Inc(BtnCount);
      if Components[i] is TEdit then Inc(EditCount);
    end;
  Edit1.Text := '������ - ' + IntToStr(BtnCount);
  Edit2.Text := '����� ����� - ' + IntToStr(EditCount);
  if Application.MessageBox('������� ������ ��',
                            '��������',
                            MB_OKCANCEL) = IDOK
  then ShowMessage('�� ��� ������� ���������!')
  else begin
    MessageDlg('�� �� ����������� � ������ ������ ������!', mtError,[mbOK],0);
    while MessageDlg('������ �� ������ �������� �� �������� ������.'#13 +
                     '��������?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes do ;
    s := '';
    repeat
      InputQuery('������ �� �������...', '��� ����� ������ ���� �����?',s);
    until s = '���� ����';
    ShowMessage('�����!');
  end;
end;

end.
