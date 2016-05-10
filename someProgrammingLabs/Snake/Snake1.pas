unit Snake1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, ExtCtrls, StdCtrls, ImgList, Snake2, Snake3;

type
  TDirections = (ToRight, ToLeft, ToUp, ToDown);

  TSnake = record
    Col: SmallInt;
    Row: SmallInt;
    PrevDir: TDirections;
    CurDir: TDirections;
  end;

  TfmMain = class(TForm)
    sgField: TStringGrid;
    pnlScore: TPanel;
    lblPlayer: TLabel;
    lblRecord: TLabel;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mmiGameRecords: TMenuItem;
    N3: TMenuItem;
    mmiGameStop: TMenuItem;
    mmiGamePause: TMenuItem;
    mmiGameStart: TMenuItem;
    imglSnake: TImageList;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mmiGamePauseClick(Sender: TObject);
    procedure mmiGameRecordsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmiGameStartClick(Sender: TObject);
    procedure mmiGameStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sgFieldDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AddApple;
    procedure DrawHead(OldHeadPosR, OldHeadPosL,
                       OldHeadPosU, OldHeadPosD: string;
                       TypeOfHead: Char);
    procedure DrawTail(Turn1: string; Tail1: Char; Dir1: TDirections;
                       Turn2: string; Tail2: Char; Dir2: TDirections;
                       TypeOfTail: Char);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

type
  TRecords = record
    Name: String[10];
    Date: TDate;
    Score: Integer;
  end;

  TApple = record
    Col, Row: SmallInt;
  end;

var
  Top10: File of TRecords;
  Top10List: array [1..10] of TRecords;
  Apple: TApple;
  Head, Tail: TSnake;
  EndOfGame: Boolean;

{$R *.dfm}

procedure TfmMain.AddApple;
begin
  with sgField do
  begin
    repeat
      Apple.Col := random(14);
      Apple.Row := random(14);
    until Cells[Apple.Col,Apple.Row] = '';
    Cells[Apple.Col,Apple.Row] := '������';
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var MaxScore: Integer;
    FName: String;
    i: Byte;
begin
  FName := ExtractFilePath(Application.ExeName) + 'Top10.dat';
  AssignFile(Top10, FName);
  MaxScore := 0;
  i := 1;
  if not FileExists(FName)
  then Rewrite(Top10)
  else begin
    Reset(Top10);
    while not EOF(Top10) do
    begin
      Read(Top10, Top10List[i]);
      if Top10List[i].Score > MaxScore
        then MaxScore := Top10List[i].Score;
      Inc(i);
    end;
  end;
  CloseFile(Top10);
  lblRecord.Caption := IntToStr(MaxScore);
end;

procedure TfmMain.sgFieldDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var ImgIdx: SmallInt;
begin
  ImgIdx := -1;
  with sgField do
  begin
    if Cells[ACol, ARow] = '�����R' then ImgIdx := 0;
    if Cells[ACol, ARow] = '�����L' then ImgIdx := 1;
    if Cells[ACol, ARow] = '�����U' then ImgIdx := 2;
    if Cells[ACol, ARow] = '�����D' then ImgIdx := 3;
    if Cells[ACol, ARow] = '����RL' then ImgIdx := 4;
    if Cells[ACol, ARow] = '����UD' then ImgIdx := 5;
    if Cells[ACol, ARow] = '������R1' then ImgIdx := 6;
    if Cells[ACol, ARow] = '������R2' then ImgIdx := 7;
    if Cells[ACol, ARow] = '������R3' then ImgIdx := 8;
    if Cells[ACol, ARow] = '������L1' then ImgIdx := 9;
    if Cells[ACol, ARow] = '������L2' then ImgIdx := 10;
    if Cells[ACol, ARow] = '������L3' then ImgIdx := 11;
    if Cells[ACol, ARow] = '������U1' then ImgIdx := 12;
    if Cells[ACol, ARow] = '������U2' then ImgIdx := 13;
    if Cells[ACol, ARow] = '������U3' then ImgIdx := 14;
    if Cells[ACol, ARow] = '������D1' then ImgIdx := 15;
    if Cells[ACol, ARow] = '������D2' then ImgIdx := 16;
    if Cells[ACol, ARow] = '������D3' then ImgIdx := 17;
    if Cells[ACol, ARow] = '�����RD' then ImgIdx := 18;
    if Cells[ACol, ARow] = '�����LU' then ImgIdx := 19;
    if Cells[ACol, ARow] = '�����LD' then ImgIdx := 20;
    if Cells[ACol, ARow] = '�����RU' then ImgIdx := 21;
    if Cells[ACol, ARow] = '������' then ImgIdx := 22;
    Canvas.FillRect(Rect);
    if ImgIdx >= 0
      then imglSnake.Draw(Canvas, Rect.Left - 3, Rect.Top - 3, ImgIdx);
  end;
end;

procedure TfmMain.DrawHead(OldHeadPosR, OldHeadPosL,
                           OldHeadPosU, OldHeadPosD: string;
                           TypeOfHead: Char);
var DistToApple: SmallInt;
    InOneLine: Boolean;
begin
  with sgField do
  begin
    //��������� ������ ������� ������
    case Head.PrevDir of
      ToRight: Cells[Head.Col, Head.Row] := OldHeadPosR;
      ToLeft: Cells[Head.Col, Head.Row] := OldHeadPosL;
      ToUp: Cells[Head.Col, Head.Row] := OldHeadPosU;
      ToDown: Cells[Head.Col, Head.Row] := OldHeadPosD;
    end;
    //������� ������
    if (Head.CurDir = ToRight) or (Head.CurDir = ToLeft)
    then begin
      if Head.CurDir = ToRight then Inc(Head.Col) else Dec(Head.Col);
      if (Head.CurDir = ToRight) and (Head.Col = ColCount)
        then Head.Col := 0;
      if (Head.CurDir = ToLeft) and (Head.Col = -1)
        then Head.Col := ColCount - 1;
      DistToApple := Abs(Apple.Col - Head.Col);
      InOneLine := Apple.Row = Head.Row;
    end else
    begin
      if Head.CurDir = ToDown then Inc(Head.Row) else Dec(Head.Row);
      if (Head.CurDir = ToDown) and (Head.Row = RowCount)
        then Head.Row := 0;
      if (Head.CurDir = ToUp) and (Head.Row = -1)
        then Head.Row := RowCount - 1;
      DistToApple := Abs(Apple.Row - Head.Row);
      InOneLine := Apple.Col = Head.Col;
    end;
    //������ ������
    if (DistToApple = 2) and InOneLine
    then Cells[Head.Col, Head.Row] := '������' + TypeOfHead + '2'
    else if (DistToApple = 1) and InOneLine
         then Cells[Head.Col, Head.Row] := '������' + TypeOfHead + '3'
         else begin
           EndOfGame := (Cells[Head.Col, Head.Row] <> '������') and
                        (Cells[Head.Col, Head.Row] <> '');
           Cells[Head.Col, Head.Row] := '������' + TypeOfHead + '1';
         end;
    Head.PrevDir := Head.Curdir;
  end;
end;

procedure TfmMain.DrawTail(Turn1: string; Tail1: Char; Dir1: TDirections;
                           Turn2: string; Tail2: Char; Dir2: TDirections;
                           TypeofTail: Char);
begin
  with sgField do
  begin
    if (Tail.CurDir = ToRight) or (Tail.CurDir = ToLeft)
    then begin
      if Tail.CurDir = ToRight then Inc(Tail.Col) else Dec(Tail.Col);
      if (Tail.CurDir = ToRight) and (Tail.Col = ColCount)
        then Tail.Col := 0;
      if (Tail.CurDir = ToLeft) and (Tail.Col = -1)
        then Tail.Col := ColCount - 1;
    end else
    begin
      if Tail.CurDir = ToDown then Inc(Tail.Row) else Dec(Tail.Row);
      if (Tail.CurDir = ToDown) and (Tail.Row = RowCount)
        then Tail.Row := 0;
      if (Tail.CurDir = ToUp) and (Tail.Row = -1)
        then Tail.Row := RowCount - 1;
    end;
    //���������, ��� �� ��������
    if Cells[Tail.Col, Tail.Row] = '�����' + Turn1
    then begin
      Cells[Tail.Col, Tail.Row] := '�����' + Tail1;
      Tail.CurDir := Dir1;
    end else
        if Cells[Tail.Col, Tail.Row] = '�����' + Turn2
        then begin
          Cells[Tail.Col, Tail.Row] := '�����' + Tail2;
          Tail.CurDir := Dir2;
        end
        else Cells[Tail.Col, Tail.Row] := '�����' + TypeOfTail;
  end;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
var i,j: Byte;
    FName: String;
begin
  with sgField do
  begin
    //���������� ������ ����
    case Head.CurDir of
      ToRight: DrawHead('����RL', '', '�����LD', '�����LU', 'R');
      ToDown: DrawHead('�����RD', '�����LD', '', '����UD', 'D');
      ToLeft: DrawHead('', '����RL', '�����RD', '�����RU', 'L');
      ToUp: DrawHead('�����RU', '�����LU', '����UD', '', 'U');
    end;
    if EndOfGame
    then begin
      Timer1.Enabled := False;
      mmiGamePause.Enabled := False;
      Beep;
      ShowMessage('���� ��������!'#13'�� ������� ' +
                  pnlScore.Caption + ' �����');
      for i := 1 to 10 do
        if StrToint(pnlScore.Caption) >= Top10List[i].Score
        then begin
          for j := 10 downto i + 1 do
            Top10List[j] := Top10List[j-1];
          Top10List[i].Name := lblPlayer.Caption;
          Top10List[i].Date := Date;
          Top10List[i].Score := StrToint(pnlScore.Caption);
          Break;
        end;
      FName := ExtractFilePath(Application.ExeName) + 'Top10.dat';
      AssignFile(Top10, FName);
      Rewrite(Top10);
      for i := 1 to 10 do Write(Top10, Top10List[i]);
      CloseFile(Top10);
      mmiGameRecords.Click;
    end
    else
    if (Head.Col = Apple.Col) and (Head.Row = Apple.Row)
      then begin
        AddApple; //���� ���� ����� ������, �� ������ ����� ������
        pnlScore.Caption := IntToStr(StrToInt(pnlScore.Caption) + sgField.Tag);
      end else
      begin
        Cells[Tail.Col, Tail.Row] := ''; //������� ������ �����
        //���������� ������ � ����� �������
        case Tail.CurDir of
          ToRight: DrawTail('RD', 'D', ToDown, 'RU', 'U', ToUp, 'R');
          ToDown: DrawTail('LU', 'R', ToRight, 'RU', 'L', ToLeft, 'D');
          ToLeft: DrawTail('LD', 'D', ToDown, 'LU', 'U', ToUp, 'L');
          ToUp: DrawTail('LD', 'R', ToRight, 'RD', 'L', ToLeft, 'U');
        end;
      end;
  end;
end;

procedure TfmMain.mmiGameStopClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.mmiGameStartClick(Sender: TObject);
var i: SmallInt;
begin
  fmStart := TfmStart.Create(Self);
  if fmStart.ShowModal = mrOK
  then begin
    if fmStart.editNew.Text <> ''
      then begin
        lblPlayer.Caption := fmStart.editNew.Text;
        with fmStart.listPlayer.Items do
        begin
          Add(fmStart.editNew.Text);
          SaveToFile(ExtractFilePath(Application.ExeName) + 'Players.dat');
        end;
      end
      else lblPlayer.Caption := fmStart.listPlayer.Items[fmStart.listPlayer.ItemIndex];
    sgField.Tag := fmStart.tbarLevel.Position;
    Timer1.Interval := 300 - 50 * (sgField.Tag - 1);
    pnlScore.Caption := '0';
    sgField.Visible := True;
    Timer1.Enabled := True;
    mmiGamePause.Enabled := True;
    with sgField do
    begin
      for i := 0 to RowCount do Rows[i].Clear;
      Cells[0,0] := '�����R';
      Cells[1,0] := '����RL';  Cells[2,0] := '����RL';
      Cells[3,0] := '����RL';  Cells[4,0] := '����RL';
      Cells[5,0] := '������R1';
    end;
    Randomize;
    AddApple;
    Head.PrevDir := ToRight;
    Head.CurDir := ToRight;
    Head.Col := 5;
    Head.Row := 0;
    Tail.CurDir := ToRight;
    Tail.Col := 0;
    Tail.Row := 0;
  end;
  fmStart.Free;
end;

procedure TfmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if sgField.Visible then
    if (Key >= vk_Left) and (Key <= vk_Down)
    then begin
      Head.PrevDir := Head.CurDir;
      case Key of
        vk_Down: if (Head.CurDir = ToRight) or (Head.CurDir = ToLeft)
                 then Head.CurDir := ToDown;
        vk_Right: if (Head.CurDir = ToDown) or (Head.CurDir = ToUp)
                  then Head.CurDir := ToRight;
        vk_Up: if (Head.CurDir = ToRight) or (Head.CurDir = ToLeft)
               then Head.CurDir := ToUp;
        vk_Left: if (Head.CurDir = ToDown) or (Head.CurDir = ToUp)
                 then Head.CurDir := ToLeft;
      end;
    end;
end;

procedure TfmMain.mmiGameRecordsClick(Sender: TObject);
var i: Integer;
begin
  if mmiGamePause.Enabled then mmiGamePause.Click;
  fmRecords := TfmRecords.Create(Self);
  with fmRecords do
  begin
    sgTop10.Cells[0,0] := '�';
    sgTop10.Cells[1,0] := '���������';
    sgTop10.Cells[2,0] := '�����';
    sgTop10.Cells[3,0] := '����';
    for i := 1 to 10 do
    begin
      sgTop10.Cells[0,i] := IntToStr(i) + '.';
      if Top10List[i].Score > 0 then
      begin
        sgTop10.Cells[1,i] := IntToStr(Top10List[i].Score);
        sgTop10.Cells[2,i] := Top10List[i].Name;
        sgTop10.Cells[3,i] := DateToStr(Top10List[i].Date);
      end;
    end;
    ShowModal;
    Free;
  end;
end;

procedure TfmMain.mmiGamePauseClick(Sender: TObject);
begin
  if mmiGamePause.Caption = '�����'
    then begin
      mmiGamePause.Caption := '����������';
      Timer1.Enabled := False;
    end
    else begin
      mmiGamePause.Caption := '�����';
      Timer1.Enabled := True;
    end;
end;

procedure TfmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['p','P','�','�']) and mmiGamePause.Enabled
    then mmiGamePause.Click;
end;

end.
