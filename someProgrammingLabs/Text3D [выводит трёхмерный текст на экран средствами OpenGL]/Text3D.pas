{******************************************************************************}
//                                                                            //
//         ��������� ������ �� ����� �������������� 3D ������                 //
//         � �������������� OpenGL.                                           //
//         ������ 1.2                                                         // 
//                                                                            //
//         ������� ��� ������������� ����� �������� "OpenGL � Delphi"         //
//                                                                            //
//         Oe-5ye@yandex.ru                                                   //
//         �������� ���������� � 2003                                         //
//                                                                            //
{******************************************************************************}
unit Text3D;

interface
uses
  Forms,
  Graphics,
  Messages,
  Windows,
  OpenGL,
  Classes,
  ExtCtrls;

const
  YAYA_SCALE = 0.7;            // ����� � :-)
  INIT_STRING = '������������� OpenGL...';
  FONT_WEIGHT_SCALER = 0.08;  // ���������� ��������� ����������� ����� ����� � �������� � � ������������
  FONT_HEIGHT = -28;           // ������ ������������ ������

  FONT_SIZE_SCALE = 0.125;     // ���������� ��������� ������� ������
  DEFAULT_PAUSE = 10;          // ����� �����������
  DEFAULT_FONT_SIZE = 40;      // ������ ������ �� ���������
  GLF_START_LIST = 1000;       // ����� ��� ���������� ����
  BASE_SCALE = 0.08;           // ��������� �������

  LITERA_HEIGHT = 2;           // ������ �����
  DEFAULT_DELTA_ROW = 3;       // ���������� ����� �������� �� ���������
  WAVE_AMPLITUDE = 0.3;        // ��������� ����� �� ���������

  ROTATED_LITERAS = 2;         // ���������� �������, ������� ����� ��������� ������ � �����������
  ROTATION_FRAMES = 20;        // ����� ������, �� ������� ���������� ������� (��� atRotation)

  INIT_LINE_STEPS = 20;        // ���������� ������ ��� �������������/�����������
  START_POINT_POS = 40;        // ��������� ����������� ������������ ������

  ROTATION_SPEED = 1;          // ���������� �������� ������ ����� ������� ��� atFixedRotation
  DEFAULT_ROTATION_PERIOD = 6000; // ������ �������� ������� ��� ������� ������� ������������
  DIFFUSION_SCALE = pi/8;        // ������� ��������� ���� ��� ���������� ��������� �����
  DIFFUS_WAVE_SCALE = 0.1;         // ��������� ���������� ����������
  DIFFUS_OFFSET = 5;           // �������� ����������� ����

type
  // �������� ����
  TQualityType = (qtFastest,
                  qtBest);

  // ��������� ���� ��������
  TAnimationType = (atFixedRotation,  // ������� �������� ����� ������
                    atWave,           // �����
                    atHorWave,        // ����� � ��������� ���������
                    atSingleWave,     // ��������� �����
                    atHorSingleWave,  // ��������� ����� � ��������� ���������
                    atZoomWave,       // ��������� ����� � �����������
                    atRotation);      // ������� ���������

  TAnimationSet = set of TAnimationType;

  // ��������� ������� ��������� ������ (���������, �������, ������ ������������)
  TTextCondition = (tcNormal, tcInit, tcGetOut);

  // ��� ����� �����
  TChangeStyle = (csSwitch,            // ������ ������������
                  csRightToLeft,       // ������ ������
                  csLeftToRight,       // ����� �������
                  csLeftAndRight,      // ��������� (� ����������� �� ������� ������)
                  csBottomToTop,       // ����� �����
                  csTopToBottom,       // ������ ����
                  csTopAndBottom,      // ���� � ���
                  csLiterasUpDown,              // ����� ����������� ����� � ���� �� �����������
                  csDiffusion          // ��������
                  );

  TText3D = class (TCustomPanel)
  private
    FDefaultRotationPeriod : word;
    // �������, ����������� ��� ��������� ���������� ����� ��������
    FOnAnimateCycleDone : TNotifyEvent;
    // �������, ����������� ��� ����� �����
    FOnLinesChanging : TNotifyEvent;
    // ����� ������ ��������
    FAnimationSet : TAnimationSet;
    // ������������� �����
    FLightIntensity : byte;
    // �������������� ������ - ���
    FFontName : TFontName;
    // �������������� ������ - ������
    FFontSize : integer;
    // �������������� ������ - �����
    FFontStyle : TFontStyles;
    // �������������� ������ - ����� ��������
    FFontCharset : TFontCharset;
    // �������������� ������ - ����
    FFontColor : TColor;
    // ��������� �����
    FWaveAmplitude : glFloat;
    // ��� ����� �����
    FChangeStyle : TChangeStyle;
    // �������� �������� ��������� ������
    FTextCondition : TTextCondition;
    // ���� ������ - �� ��������� 30 ��������
    FVisionAngle : word;
    // �������� �����
    FLeftOffset : glFloat;
    // �������� �����
    FTopOffset : glFloat;
    // ���������� ����� �������
    FLiterasGap : glFloat;
    // ���������� ����� ���������
    FRowsGap : glFloat;
    // ������� ������
    FLiteraDepth : glFloat;
    // ���������� ������������ ����� , 0 - ��� ������
    FLinesCount : word;
    // ������� ������������ ���������� �����
    FShownRows : word;
    // FRedraw - ���� ����������� ��� ���������� ����������
    FRedraw : boolean;
    // ��������
    FScale : glFloat;
    // ����� ����� �������� � ������
    FNewRowDelay : integer;
    // ���� �� ��� y ( ������� � ��������� ���������)
    FAngleY : glFloat;
    // � �� ��� � - ������� ����� ���������
    FAngleX : glFloat;
    // ������� ������
    FCounter:integer;
    // ���������� ������� ��� ������������� ��������
    FTmpCounter : integer;
    // ������ ������� ������
    FRowIndex:word;
    // ���� ����������
    FActive : boolean;
    // ���� ����
    FBackColor : TColor;
    // ������ �� ��������
    FItems : TStringList;
    // ���������� ������
    FTimer : TTimer;
    // ������� ���������� (��)
    FRefreshDelay: word;
    // �������� ����
    FQualityType : TQualityType;

    FGuidDC : HDC; // �������� ������ ��� GUID
    FGLDC : HGLRC; // �������� ������ ��� OpenGL

    // ��������� ��������
    procedure SetQuality(aQuality : TQualityType);
    // ��������� ��������� ������� ������ �������
    procedure SetRowIndex(Value : word);
    // ��������� ������ ��������
    procedure SetAnimationSet(Value : TAnimationSet);
    // ��������� ���� ������
    procedure SetVisionAngle(Value : word);
    // ��������� �������� ������
    procedure SetFontName(Value : TFontName);
    // ��������� ����� ������
    procedure SetFontStyle(Value : TFontStyles);
    // ��������� ������ ��������
    procedure SetFontCharset(Value : TFontCharset);
    // ��������� �������� ������
    procedure SetFontSize(Value : integer);
    // ��������� �����
    procedure SetItems(Value: TStringList);
    // SetActive - ��������� � ���������� ���������� ��������
    procedure SetActive(State: boolean);
    // SetRefreshDelay - ���������� ����� ����� �������������
    procedure SetRefreshDelay(Delay:word);
    // OnFTimer - ���������� ��� ��� � ��������!
    procedure OnFTimer(Sender:TObject);
    // ��������� ����� ����� ������ � ���������
    procedure InitNewText;
    // ��������� ����������� ����� ������ � ���������
    procedure GetTextOut;
    // InitOpenGL � UnloadOpenGL - ��������� � ���������� ������
    procedure OutText(Text3D: string);
    procedure InitOpenGL;
    procedure UnloadOpenGL;

    // ��� ����������� ���������������
    procedure OnResize(var Msg:TWMSize); message WM_SIZE;
    // ��-�� ����������� ������������ ������ ������ ����� - ���� ���������� :-)
    procedure OnPaint(var Msg:TWMPaint); message WM_PAINT;
  public
    // ������������� ����� ����� �������
    procedure ChangeLines;
    // ������� ������
    property RowIndex : word read FRowIndex write SetRowIndex;
    // �������� - ��������
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  published
    // ���������� � ���� ����������
    property QualityType : TQualityType read FQualityType write SetQuality;
    property RefreshDelay : word read FRefreshDelay write SetRefreshDelay default 30;
    property Active : boolean read FActive write SetActive;
    property Items : TStringList read FItems write SetItems;
    property BackColor : TColor read FBackColor write FBackColor;
    property AngleX : glFloat read FAngleX write FAngleX;
    property AngleY : glFloat read FAngleY write FAngleY;
    property NewRowDelay : integer read FNewRowDelay write FNewRowDelay;
    property Scale : glFloat read FScale write FScale;
    property LinesCount : word read FLinesCount write FLinesCount;
    property LiteraDepth : glFloat read FLiteraDepth write FLiteraDepth;
    property LiterasGap : glFloat read FLiterasGap write FLiterasGap;
    property LeftOffset : glFloat read FLeftOffset write FLeftOffset;
    property TopOffset : glFloat read FTopOffset write FTopOffset;
    property VisionAngle : word read FVisionAngle write SetVisionAngle;
    property ChangeStyle : TChangeStyle read FChangeStyle write FChangeStyle;
    property RowsGap : glFloat read FRowsGap write FRowsGap;
    property WaveAmplitude : glFloat read FWaveAmplitude write FWaveAmplitude;
    property FontName : TFontName read FFontName write SetFontName;
    property FontSize : integer read FFontSize write SetFontSize;
    property FontStyle : TFontStyles read FFontStyle write SetFontStyle;
    property FontCharset : TFontCharset read FFontCharset write SetFontCharset;
    property FontColor : TColor read FFontColor write FFontColor;
    property LightIntensity : byte read FLightIntensity write FLightIntensity;
    property AnimationSet : TAnimationSet read FAnimationSet write SetAnimationSet;
    property DefaultRotationPeriod : word read FDefaultRotationPeriod write FDefaultRotationPeriod;

    property OnLinesChanging : TNotifyEvent read FOnLinesChanging write FOnLinesChanging;
    property OnAnimateCycleDone : TNotifyEvent read FOnAnimateCycleDone write FOnAnimateCycleDone;
    // �� �������
    property Align;
    property Caption;
    property BorderStyle;
    property BorderWIdth;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

procedure TText3D.SetQuality(aQuality : TQualityType);
begin
  // ��������� ������ �������� ��������
  FQualityType := aQuality;
  if FActive then
  begin
    SetActive(false);
    SetActive(true);
  end;
end;

procedure TText3D.ChangeLines;
begin
  // ������� � �����������
  FTextCondition := tcGetOut;
  FTmpCounter := 0;
end;

procedure TText3D.SetRowIndex(Value : word);
begin
  if Value < FItems.Count then
    FRowIndex := Value
  else
    FRowIndex := FItems.Count - 1;
end;

procedure TText3D.SetFontSize(Value : integer);
begin
  FFontSize := Value;
  Self.Canvas.Font.Size := Value;
end;

procedure TText3D.SetFontCharset(Value : TFontCharset);
begin
  Self.Canvas.Font.Charset := Value;
  // �������������� - ����� ������
  if FFontCharset = Value then
    Exit;

  FFontCharset := Value;
  if FActive then
  begin
    SetActive(false);
    SetActive(true);
  end;
end;

procedure TText3D.SetFontStyle(Value : TFontStyles);
begin
  Self.Canvas.Font.Style := Value;
  // �������������� - ����� ������
  if FFontStyle = Value then
    Exit;

  FFontStyle := Value;
  if FActive then
  begin
    SetActive(false);
    SetActive(true);
  end;
end;

procedure TText3D.SetFontName(Value : TFontName);
begin
  Self.Canvas.Font.Name := Value;
  // �������������� - ����� ������
  if FFontName = Value then
    Exit;

  FFontName := Value;
  if FActive then
  begin
    SetActive(false);
    SetActive(true);
  end;
end;

procedure TText3D.InitNewText;
var
  TextLength : glFloat;
  InitDone : boolean;
  TmpStr : string;
  i,j :word;
begin
  InitDone := false;
  // ���� ����� ������������, �� ������ ������
  if FChangeStyle = csSwitch then
    InitDone := true;
  // ���������� ����������� ��������
  inc(FTmpCounter);

  // ������� ����� ������
  if not (FChangeStyle = csSwitch) then
  for j:=1 to FShownRows do
  begin
    // �������-�� � � ���� ������� ������������ �������
    glPushMatrix;
    //������������� ����� ������� ����� ������ +- ���� � ���, ���� ����
    case FChangeStyle of
      csBottomToTop : // ����� �����
      glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
        (LITERA_HEIGHT)/2 - (START_POINT_POS - FTmpCounter), 0.0);

      csTopToBottom : // ������ ����
      glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
        (LITERA_HEIGHT)/2 + (START_POINT_POS - FTmpCounter), 0.0);

      csTopAndBottom : // ���� � ���
      if (j mod 2)= 0 then
        glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
          (LITERA_HEIGHT)/2 + (START_POINT_POS - FTmpCounter), 0.0)
      else
        glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
          (LITERA_HEIGHT)/2 - (START_POINT_POS - FTmpCounter), 0.0);

      else // ��� ���� ��������� �������
      glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
        (LITERA_HEIGHT)/2, 0.0);
    end; {case}

    // ���������� �� ��������� ���������� ������� ������
    TmpStr := Self.FItems[Self.FRowIndex+j-1];

    // ��������� ����� ������ � ������������ � ������ �����������
    TextLength := Self.Canvas.TextWidth(TmpStr)*FONT_WEIGHT_SCALER +
      FFontSize/DEFAULT_FONT_SIZE*FLiterasGap*(Length(TmpStr)-1);

    // ����� ����� �� �������� ����� ������ +- ������ ����������, ���� ����
    case FChangeStyle of
      csRightToLeft : // ������ ������
      glTranslatef( -(TextLength/2)+(START_POINT_POS - FTmpCounter), 0.0, 0.0);

      csLeftToRight : // ����� �������
      glTranslatef( -(TextLength/2)-(START_POINT_POS - FTmpCounter), 0.0, 0.0);

      csLeftAndRight : // � ��� � ���
      if (j mod 2) = 0 then
        glTranslatef( -(TextLength/2)+(START_POINT_POS - FTmpCounter), 0.0, 0.0)
      else
        glTranslatef( -(TextLength/2)-(START_POINT_POS - FTmpCounter), 0.0, 0.0);

      else // �� ���� ��������� �������
      glTranslatef( -(TextLength/2), 0.0, 0.0);
    end; {case}

    for i := 1 to Length(TmpStr) do
    begin
      if (FChangeStyle = csLiterasUpDown) then
      begin
        glTranslatef(0.0, (START_POINT_POS - FTmpCounter)*sin(i*pi+pi/2), 0.0);
        // ������� �������
        OutText(TmpStr[i]);
        glTranslatef(0.0, -(START_POINT_POS - FTmpCounter)*sin(i*pi+pi/2), 0.0);
      end
      // ������� �������
      else
      if (FChangeStyle = csDiffusion) then
      begin
        glTranslatef(0.0, DIFFUS_WAVE_SCALE*(START_POINT_POS - FTmpCounter)*sin((i+DIFFUS_OFFSET+FTmpCounter)*DIFFUSION_SCALE), 0.0);
        // ������� �������
        OutText(TmpStr[i]);
        glTranslatef(0.0, -DIFFUS_WAVE_SCALE*(START_POINT_POS - FTmpCounter)*sin((i+DIFFUS_OFFSET+FTmpCounter)*DIFFUSION_SCALE), 0.0);
      end
      else
      OutText(TmpStr[i]);

      // ��������� �� ���������� ����� �������
      glTranslatef(FLiterasGap,0,0);
    end;
    // ����������� ��� �������
    glPopMatrix;
    // �������� �� ���������� ����� ������ � ������������
    if FTmpCounter = START_POINT_POS then
      InitDone := true;
  end;

  // ���� ���� ��������
  if InitDone then
  begin
    // �� ���� ��������� ��������� �� ����������
    FTextCondition := tcNormal;
    FTmpCounter := 0;
  end;
end;

procedure TText3D.GetTextOut;
var
  TextLength : glFloat;
  GetOutDone : boolean;
  TmpStr : string;
  i,j :word;
begin
  GetOutDone := false;
  // ���������� ����������� ��������
  inc(FTmpCounter);

  if FChangeStyle = csSwitch then
    GetOutDone := true;

  // ������� ������ ������
  if not (FChangeStyle = csSwitch) then
  for j:=1 to FShownRows do
  begin
    // �������-�� � � ���� ������� ������������ �������
    glPushMatrix;
    
    //������������� ����� ������� ����� ������ +- ���� � ���, ���� ����
    case FChangeStyle of
      csBottomToTop : // ����� �����
      glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
        (LITERA_HEIGHT)/2 + FTmpCounter, 0.0);

      csTopToBottom : // ������ ����
      glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
        (LITERA_HEIGHT)/2 - FTmpCounter, 0.0);

      csTopAndBottom : // ���� � ���
      if (j mod 2)= 0 then
        glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
          (LITERA_HEIGHT)/2 - FTmpCounter, 0.0)
      else
        glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
          (LITERA_HEIGHT)/2 + FTmpCounter, 0.0);

      else // ��� ���� ��������� �������
      glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
        (LITERA_HEIGHT)/2, 0.0);
    end; {case}

    // ���������� �� ��������� ���������� ������� ������
    TmpStr := Self.FItems[Self.FRowIndex+j-1];

    // ��������� ����� ������ � ������������ � ������ �����������
    TextLength := Self.Canvas.TextWidth(TmpStr)*FONT_WEIGHT_SCALER +
      FFontSize/DEFAULT_FONT_SIZE*FLiterasGap*(Length(TmpStr)-1);

    // ����� ����� �� �������� ����� ������ +- ������ ����������, ���� ����
    case FChangeStyle of
      csRightToLeft : // ������ ������
      glTranslatef( -(TextLength/2)- FTmpCounter, 0.0, 0.0);

      csLeftToRight : // ����� �������
      glTranslatef( -(TextLength/2)+ FTmpCounter, 0.0, 0.0);

      csLeftAndRight : // � ��� � ���
      if (j mod 2) = 0 then
        glTranslatef( -(TextLength/2) + FTmpCounter, 0.0, 0.0)
      else
        glTranslatef( -(TextLength/2) - FTmpCounter, 0.0, 0.0);

      else // �� ���� ��������� �������
      glTranslatef( -(TextLength/2), 0.0, 0.0);
    end; {case}

    for i := 1 to Length(TmpStr) do
    begin
      if (FChangeStyle = csLiterasUpDown) then
      begin
        glTranslatef(0.0, - FTmpCounter*sin(i*pi+pi/2), 0.0);
        // ������� �������
        OutText(TmpStr[i]);
        glTranslatef(0.0,  FTmpCounter*sin(i*pi+pi/2), 0.0);
      end
      // ������� �������
      else
      if (FChangeStyle = csDiffusion) then
      begin
        glTranslatef(0.0, - DIFFUS_WAVE_SCALE*FTmpCounter*sin((i+DIFFUS_OFFSET+FTmpCounter)*DIFFUSION_SCALE), 0.0);
        // ������� �������
        OutText(TmpStr[i]);
        glTranslatef(0.0,   DIFFUS_WAVE_SCALE*FTmpCounter*sin((i+DIFFUS_OFFSET+FTmpCounter)*DIFFUSION_SCALE), 0.0);
      end
      else
      OutText(TmpStr[i]);

      // ��������� �� ���������� ����� �������
      glTranslatef(FLiterasGap,0,0);
    end;
    // ����������� ��� �������
    glPopMatrix;
    // �������� �� ���������� ������ ������ �� �����
    if FTmpCounter = START_POINT_POS then
      GetOutDone := true;
  end;

  // ���� ����� ��������
  if GetOutDone then
  begin
    // ������� ����� �����
    if Assigned(FOnLinesChanging) then
    begin
      FTimer.Enabled := false;
      FOnLinesChanging(Self);
      FTimer.Enabled := true;
    end;  

    // �� ���� ��������� ��������� �� ������������� ��������� ������
    FTextCondition := tcInit;
    FTmpCounter := 0;

    // ����� ������� ������� ������
    inc(FRowIndex, FLinesCount);
    // �� ��� ���� �� ���� �������� �� ����!
    if FRowIndex > FItems.Count - 1 then
    begin
      FRowIndex := 0;
      FCounter := 0;
    end;
  end;
end;

procedure TText3D.SetVisionAngle(Value : word);
var
  RestoreSize:integer;
begin
  FVisionAngle := Value;
  // ����� ��������� � ������� ��� ������� ������ �����������
  RestoreSize := Self.Height * $FFFF + Self.Width;
  Self.Perform(WM_SIZE, SIZE_RESTORED, RestoreSize);
end;

procedure TText3D.SetItems(Value: TStringList);
begin
  FCounter := 0;
  FRowIndex := 0;
  if FItems <> Value then
    FItems.Assign(Value);
end;

procedure TText3D.SetAnimationSet(Value:TAnimationSet);
// ��������� ���� ������
begin
//  Self.FCounter := 0;
  Self.FAnimationSet := Value;
end;

procedure TText3D.SetRefreshDelay(Delay:word);
begin
  FRefreshDelay := Delay;
  FTimer.Interval := Delay;
end;

procedure TText3D.OnPaint(var Msg:TWMPaint);
begin
  inherited;
  // ��������� ������������� ������
  if Self.Canvas.Font.Size <> FFontSize then
  Self.Canvas.Font.Size := FFontSize;
end;

procedure TText3D.OnResize(var Msg:TWMSize);
begin
  inherited;
  if not FActive then
  exit;// ���� ��� ������ ������, �� ������ ���� ������ �� ����...

  // ����� �������� ����� �����������
  glMatrixMode(GL_PROJECTION); // ������� ������� ������� ��������
  glLoadIdentity;              // �������� ������� ������� �� ���������
  // ����������� ����������� - �� ���������� glu32.dll
  gluPerspective(FVisionAngle,           // ���� ��������� � ����������� ��� Y
                 Self.Width/Self.Height,      // ���� ��������� � ����������� ��� X - ����� ������
                 1,            // ���������� �� ����������� �� ������� ��������� ���������
                 15.0);          // ���������� �� ����������� �� ������� ��������� ���������
  glViewport(0, 0, Self.Width, Self.Height);
  glMatrixMode(GL_MODELVIEW);    // ������� ������� ������� �������
end;

procedure TText3D.InitOpenGL;
// ������������� ������
const
  LightPos: TGLArrayf4 = (3,3,3,0);
  LightDirect: TGLArrayf3 = (-1, -1, -3);
var
  aQuality : glFloat;
  RestoreSize:integer;
  lf : TLOGFONT;
  hFontNew, hOldFont : HFONT;

  procedure SetDCPixelFormat (hdc : HDC);
  var
   pfd : TPixelFormatDescriptor; // ������ ������� ��������
   nPixelFormat : Integer;
  Begin
    FillChar(pfd, SizeOf(pfd), 0);
    With pfd do begin
      dwFlags   := PFD_DRAW_TO_WINDOW or
                   PFD_SUPPORT_OPENGL or
                   PFD_DOUBLEBUFFER;
      cDepthBits:= 32;
    end;
    nPixelFormat := ChoosePixelFormat (hdc, @pfd); // ������ ������� - �������������� �� ��������� ������ ��������
    SetPixelFormat (hdc, nPixelFormat, @pfd);      // ������������� ������ �������� � ��������� ����������
  End;

begin
  // ������������� �������� ��������
  aQuality := 0;
  case FQualityType of
    qtFastest: aQuality := 1000;
    qtBest: aQuality := 0;
  end; {case}
    
  FGuidDC := GetDC (Self.Handle);
  SetDCPixelFormat (FGuidDC);
  FGLDC := wglCreateContext (FGuidDC); // �������� ��������� ���������������
  wglMakeCurrent (FGuidDC, FGLDC);    // ���������� ������� �������� ���������������

  //********* ���������� ������� ***********************************************
  FillChar(lf, SizeOf(lf), 0);
  lf.lfHeight               :=   FONT_HEIGHT ;
  lf.lfWeight               :=   FW_NORMAL ;
  lf.lfCharSet              :=   FFontCharset;
  lf.lfOutPrecision         :=   OUT_DEFAULT_PRECIS ;
  lf.lfClipPrecision        :=   CLIP_DEFAULT_PRECIS ;
  lf.lfQuality              :=   DEFAULT_QUALITY ;
  lf.lfPitchAndFamily       :=   FIXED_PITCH;
  lf.lfPitchAndFamily       :=   FF_DONTCARE OR DEFAULT_PITCH;
  lf.lfItalic               :=   Byte(fsItalic in FFontStyle);
  if (fsBold in FFontStyle) then
  lf.lfWeight               :=   900 else
  lf.lfWeight               :=   0;
  lstrcpy (lf.lfFaceName, PChar(FFontName)) ;
  hFontNew := CreateFontIndirect(lf);
  hOldFont := SelectObject(FGuidDC,hFontNew);
  wglUseFontOutlines(FGuidDC, 0, 255, GLF_START_LIST, aQuality, 1,
    WGL_FONT_POLYGONS, nil);

  DeleteObject(SelectObject(FGuidDC,hOldFont));
  DeleteObject(SelectObject(FGuidDC,hFontNew));
  //************************************************************************

  glEnable(GL_DEPTH_TEST); // ������� ����� ��� ����������
  glEnable(GL_LIGHTING); // ���. ��������� ��������� �����
  glEnable(GL_LIGHT0);  // ���. �������� 0

  // ����� ��������� � ������� ��� ������� ������ �����������
  RestoreSize := Self.Height * $FFFF + Self.Width;
  Self.Perform(WM_SIZE, SIZE_RESTORED, RestoreSize);
end;

procedure TText3D.UnloadOpenGL;
// ����������� ������
begin
  wglMakeCurrent (FGuidDC, 0);
  wglDeleteContext (FGLDC); // �������� ��������� ���������������
end;

procedure TText3D.SetActive(State:boolean);
// ��������� ��������� ������
var
  OldCaption : string;
begin
  FTimer.Enabled := State;
  FActive := State;

  if State then
  begin
    OldCaption := Self.Caption;
    Self.Caption := INIT_STRING;
    Application.ProcessMessages;
    InitOpenGL;
    Self.Caption := OldCaption;
  end
  else begin
    UnloadOpenGL;
    if FRedraw then
    InvalidateRect(Self.Handle, nil, false);
  end;
end;

procedure TText3D.OutText (Text3D : String);
var
  YaYa : boolean;
begin
  YaYa := false;
  // ������� �� ������ �����
  glScale(FFontSize*FONT_SIZE_SCALE, FFontSize*FONT_SIZE_SCALE, FLiteraDepth);
  glTranslatef(0,0,1/2);

  // ������� ����� � - ������� ��������
  if Text3D = '�' then
  begin
    Text3D := '�';
    YaYa := true;
    glScale(YAYA_SCALE,YAYA_SCALE,1);
  end;


  glListBase(GLF_START_LIST);
  glCallLists(Length (Text3D), GL_UNSIGNED_BYTE, PChar(Text3D));

  if YaYa then
    glScale(1/YAYA_SCALE,1/YAYA_SCALE,1);

  glTranslatef(0,0,-1/2);
  // �������������� ��������
  glScale(1/FFontSize/FONT_SIZE_SCALE, 1/FFontSize/FONT_SIZE_SCALE, 1/FLiteraDepth);
end;

procedure SetMaterial(R,G,B,A:GLfloat);
var
  // ������ ������� ���������
  MaterialColor: Array[0..3] of GLfloat;
begin
  MaterialColor[0] := R;
  MaterialColor[1] := G;
  MaterialColor[2] := B;
  MaterialColor[3] := A;
  glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE, @MaterialColor);
end;

function Max(A,B: Integer): Integer;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;

procedure TText3D.OnFTimer;
// ��������� �� �������
var
  TmpAngle, // ���������� ��� �������� ���� ��� �������������
  TextLength : glFloat; // ����� �������� ������ � ��������
  MaxLength:word; // ��� ����������� �������
  i, j:word;
  TmpStr:string;
begin
  // �������, �� �� ��������� �� ������ ������?
  if FRowIndex > FItems.Count - 1 then
    FRowIndex := FItems.Count - 1;
    
  FShownRows := FLinesCount;
  // ��������, �� ���� �� ���������� �� ����� ������
  if FNewRowDelay > 0 then // ��� ������� ���������� ������������ ��� ��������� � ������������
  if FTextCondition = tcNormal then // ������������ ������ ��� ���������� ������
  if not((FRowIndex = 0 ) and (FLinesCount  >= FItems.Count)) then
  if FCounter * FRefreshDelay > (FRowIndex/FLinesCount+1)*FNewRowDelay then
  begin
    // ������� � �����������
    FTextCondition := tcGetOut;
    FTmpCounter := 0;
  end;

  // ���� ������ ���� ���� - �� �������
  if FItems.Count = 0 then
  exit;

  // ������� ������ ������ ��� ����� ������ (�� ������������� � ����������� �����)
  if FTextCondition = tcNormal then
  inc(FCounter);

  // �������� �������� ���-�� ����� ��� ������ (��� ����� ���������� �� FLinesCount)
  if FLinesCount > FItems.Count - FRowIndex then
  FShownRows := (FItems.Count - FRowIndex);

  // ������� �������
  glClear(GL_DEPTH_BUFFER_BIT or GL_COLOR_BUFFER_BIT);
  // �������� ������� ������� �� ���������
  glLoadIdentity;
  // ********************* ���������... ********************************
  // ���� ������� ����
  glClearColor(GetRValue(Self.FBackColor)/255, GetGValue(Self.FBackColor)/255, GetBValue(Self.FBackColor)/255, 0.0);
  // ������ ���� ��� � ������
  SetMaterial(GetRValue(Self.FFontColor)/255*FLightIntensity/255,
    GetGValue(Self.FFontColor)/255*FLightIntensity/255,
      GetBValue(Self.FFontColor)/255*FLightIntensity/255, 1);
  // ������ ����� �� 3 ����
  glTranslatef(0.0, 0.0, -3.0);
  // �������-�� � � ���� ������� ������������ �������
  glPushMatrix;
  // ����� ������� �� ����
  glRotatef(FAngleX, 1.0, 0.0, 0.0);
  glRotatef(FAngleY, 0.0, 1.0, 0.0);
  // �����
  glScale(BASE_SCALE * FScale, BASE_SCALE * FScale, BASE_SCALE * FScale);
  // �������� ����� (�� X)
  glTranslatef( -FLeftOffset, 0.0, 0.0);
  // �������� ����� (�� X)
  glTranslatef( 0.0, FTopOffset, 0.0);

  // ������� ��������
  if FTextCondition = tcNormal then
  begin
    // ���� � ��������� ������������ ���� ������ ��������, �� ��� ��������
    if (atFixedRotation in FAnimationSet) then
    begin
      if FNewRowDelay <> 0 then
        // ������� � ������ ����, ��� ��� ����� ������ ��� ������ ���� �� �����
        glRotatef(FCounter*360/(FNewRowDelay/FRefreshDelay)*ROTATION_SPEED, 0.0, 1.0, 0.0)
      else
        // ������� � ������ ����, ��� ��� ����� ������ ��� ������ ���� �� �����
        glRotatef(FCounter*360/(FDefaultRotationPeriod/FRefreshDelay)*ROTATION_SPEED, 0.0, 1.0, 0.0);
    end;

    for j:=1 to FShownRows do
    begin
      // ���������� �� ��������� ���������� ������� ������
      TmpStr := Self.FItems[Self.FRowIndex+j-1];

      if (atRotation in FAnimationSet) or (atSingleWave in FAnimationSet)
        or (atZoomWave in FAnimationSet) or (atHorSingleWave in FAnimationSet) then
      begin
        MaxLength := 0;
        // ������� ���������
        inc(FTmpCounter);

        // ���������� ������������ �� ����� ������
        for i := 1 to FShownRows do
        MaxLength := Max(MaxLength, Length(Self.FItems[Self.FRowIndex+i-1]));
        // ��������� ���������
        inc(MaxLength, 4 * ROTATED_LITERAS);
        for i:=1 to (ROTATED_LITERAS*2) do
        TmpStr := ' '+TmpStr+' ';

        // ����� �������� ��� ������������
        if FTmpCounter > MaxLength*ROTATION_FRAMES then
        begin
          FTmpCounter := 0;
          // ������� ��������� ����� ��������
          if Assigned(FOnAnimateCycleDone) then
          begin
            FTimer.Enabled := false;
            OnAnimateCycleDone(Self);
            FTimer.Enabled := true;
          end;  
        end;
      end;

      // �������-�� � � ���� ������� ������������ �������
      glPushMatrix;
      // ������������� ����� ������� ����� ������
      glTranslatef( 0.0, (LITERA_HEIGHT + FRowsGap)*((FShownRows-1)/2 - j + 1) -
        (LITERA_HEIGHT)/2, 0.0);

      // ��������� ����� ������ � ������������ � ������ �����������
      TextLength := Self.Canvas.TextWidth(TmpStr)*FONT_WEIGHT_SCALER +
        FFontSize/DEFAULT_FONT_SIZE*FLiterasGap*(Length(TmpStr)-1);
      // ����� ����� �� �������� ����� ������
      glTranslatef( -(TextLength/2), 0.0, 0.0);
      for i := 1 to Length(TmpStr) do
      begin
        // �������-�� � � ���� ������� �������
        glPushMatrix;

        // ���� ���� ���� ����� �� ��� ������ � ��������� ���������
        if (atHorWave in FAnimationSet) then
        // ������� �� ������� ������/���
        glTranslatef(0.0, 0.0, FWaveAmplitude*sin(Self.FCounter/10+i));

        // ���� ���� ���� ��������� ����� � ��������� ���������
        if (atHorSingleWave in FAnimationSet) then
        // ���������, �� ������ �� ����� � ��������
        if (i >= (FTmpCounter div ROTATION_FRAMES)+1 - ROTATED_LITERAS) and
          (i <= (FTmpCounter div ROTATION_FRAMES)+1 + ROTATED_LITERAS) then
        begin
          // ������� ���� ��������
          TmpAngle :=((FTmpCounter div ROTATION_FRAMES)-i+ROTATED_LITERAS+1)*180/(ROTATED_LITERAS*2+1)+
            (FTmpCounter - (FTmpCounter div ROTATION_FRAMES)*ROTATION_FRAMES)*180/ROTATION_FRAMES/(ROTATED_LITERAS*2+1);
          glTranslatef(0.0, 0.0, 2*FWaveAmplitude * sin(pi*TmpAngle/180));
        end;

        // ���� ���� ���� ����� ����������
        if (atZoomWave in FAnimationSet) then
        // ���������, �� ������ �� ����� � ��������
        if (i >= (FTmpCounter div ROTATION_FRAMES)+1 - ROTATED_LITERAS) and
          (i <= (FTmpCounter div ROTATION_FRAMES)+1 + ROTATED_LITERAS) then
        begin
          // ������� ���� ��������
          TmpAngle :=((FTmpCounter div ROTATION_FRAMES)-i+ROTATED_LITERAS+1)*180/(ROTATED_LITERAS*2+1)+
            (FTmpCounter - (FTmpCounter div ROTATION_FRAMES)*ROTATION_FRAMES)*180/ROTATION_FRAMES/(ROTATED_LITERAS*2+1);
          glScale(1+FWaveAmplitude * sin(pi*TmpAngle/180), 1+FWaveAmplitude * sin(pi*TmpAngle/180), 1);
        end;

        // ���� ���� ���� ������������ ��������
        if (atRotation in FAnimationSet) then
        // ���������, �� ������ �� ����� � ��������
        if (i >= (FTmpCounter div ROTATION_FRAMES)+1 - ROTATED_LITERAS) and
          (i <= (FTmpCounter div ROTATION_FRAMES)+1 + ROTATED_LITERAS) then
        begin
          glTranslatef(Self.Canvas.TextWidth(TmpStr[i])*FONT_WEIGHT_SCALER/2, 0.0, 0.0);
          // ������� ���� ��������
          TmpAngle :=((FTmpCounter div ROTATION_FRAMES)-i+ROTATED_LITERAS+1)*360/(ROTATED_LITERAS*2+1)+
            (FTmpCounter - (FTmpCounter div ROTATION_FRAMES)*ROTATION_FRAMES)*360/ROTATION_FRAMES/(ROTATED_LITERAS*2+1);
          // ������� �������
          glRotatef(TmpAngle, 0.0, 1.0, 0.0);
          glTranslatef(-Self.Canvas.TextWidth(TmpStr[i])*FONT_WEIGHT_SCALER/2, 0.0, 0.0);
        end;

        // ���� ���� ���� ��������� �����
        if (atSingleWave in FAnimationSet) then
        // ���������, �� ������ �� ����� � ��������
        if (i >= (FTmpCounter div ROTATION_FRAMES)+1 - ROTATED_LITERAS) and
          (i <= (FTmpCounter div ROTATION_FRAMES)+1 + ROTATED_LITERAS) then
        begin
          // ������� ���� ��������
          TmpAngle :=((FTmpCounter div ROTATION_FRAMES)-i+ROTATED_LITERAS+1)*180/(ROTATED_LITERAS*2+1)+
            (FTmpCounter - (FTmpCounter div ROTATION_FRAMES)*ROTATION_FRAMES)*180/ROTATION_FRAMES/(ROTATED_LITERAS*2+1);
          glTranslatef(0.0, 2*FWaveAmplitude * sin(pi*TmpAngle/180), 0.0);
        end;

        // ���� ���� ���� ����� �� ��� ������
        if (atWave in FAnimationSet) then
        // ������� �� ������� �����/���
        glTranslatef(0.0, FWaveAmplitude*sin(Self.FCounter/10+i), 0.0);

        // ������� �������
        OutText(TmpStr[i]);
        // �������������� ������� �������
        glPopMatrix;
        // ����� ������ �� ����� ���� �����
        glTranslatef(Self.Canvas.TextWidth(TmpStr[i])*FONT_WEIGHT_SCALER +
          FFontSize/DEFAULT_FONT_SIZE*FLiterasGap, 0.0, 0.0);
      end;
      // ����������� ��� �������
      glPopMatrix;
    end;
  end;

  // � ������ ��������, �� ���������� �� ���� �������
  if FTextCondition = tcInit then
  // �� ������ �����
  InitNewText else
  // ���� �� ������ ������
  if FTextCondition = tcGetOut then
  // �� ����� ������ :-)
  GetTextOut;

  // �������������� ������� ������������ �������
  glPopMatrix;

  // ����� ���������
  SwapBuffers(FGuidDC);
end;

constructor TText3D.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  // ��������� ���������� �� ���������
  FAngleY := 0;
  FAngleX := 0;
  Self.Height := 120;
  Self.Width := 300;
  FRefreshDelay := DEFAULT_PAUSE;
  FActive := false;
  FCounter := 0;
  FRowIndex := 0;
  FFontColor := clBlue;
  FBackColor := RGB(0, 0, 0);
  FNewRowDelay := 3000;
  FScale := 1;
  FRedraw := true;
  FLiteraDepth := 1.5;
  FLinesCount := 2;
  FLiterasGap := 0;
  FLeftOffset := 0;
  FTopOffset := 0;
  FVisionAngle := 30;
  FTextCondition := tcInit;
  FChangeStyle := csDiffusion;
  FAnimationSet := [atSingleWave, atRotation];
  FRowsGap := DEFAULT_DELTA_ROW;
  FWaveAmplitude := WAVE_AMPLITUDE;
  FLightIntensity := 127;
  FDefaultRotationPeriod := DEFAULT_ROTATION_PERIOD;
  FQualityType := qtFastest;

  // �������� � ��������� �������
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := false;
  FTimer.Interval := 10;
  FTimer.OnTimer := OnFTimer;

  // �������� ����� � ���������
  FItems := TStringList.Create;
  FItems.Add('�������� ����������');
  FItems.Add('Oe-5ye@yandex.ru');
  FItems.Add('������ :-)');

  // ��������� ������� �����
  Self.Canvas.Font.Height := FONT_HEIGHT;
  FontName := 'Arial Cyr';
  FontSize := DEFAULT_FONT_SIZE;
  FontCharset := Self.Font.Charset;
  FontStyle := FFontStyle;
end;

destructor TText3D.Destroy;
begin
  // �������� ����������� ��� ����������� (� �� ��� ������)
  FRedraw := false;
  // �������� ���������� ������
  SetActive(false);
  // �������� ������
  FTimer.Free;
  // �������� ������
  FItems.Free;
  inherited Destroy;
end;

procedure Register;
begin
  RegisterComponents('Standard', [TText3D]);
end;

end.
