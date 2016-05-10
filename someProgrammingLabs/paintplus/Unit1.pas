unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, Buttons, StdCtrls, ExtDlgs;

type
    TToolType=(ttline, ttrect, ttellipse, ttroundrect, ttspray, ttpen);
    TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;

    ColorDialog1: TColorDialog;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label1: TLabel;
    
    procedure SpeedButton1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);

    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);

    procedure N2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);



    procedure SpeedButton7Click(Sender: TObject);

   
  private
    { Private declarations }
  public
    { Public declarations }
    PenWide: Integer;
    Drawing: Boolean;
    mousepos1, mousepos2: TPoint;
    activeTool: TToolType;
    procedure DrawShape(TopLeft, BottomRight: TPoint; AMode: TPenMode);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
label1.Visible:=true;
speedbutton9.Visible:=false;
speedbutton8.Visible:=true;
activetool:= ttpen;
statusbar1.Panels[1].Text:='���������� ���������: ��������'
end;

procedure TForm1.N6Click(Sender: TObject);
begin
close;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if openpicturedialog1.Execute then
image1.Picture.LoadFromFile(openpicturedialog1.FileName);
end;



procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Drawing:=true;
mousepos1:=point(x,y);
mousepos2:=mousepos1;

image1.Canvas.MoveTo(x,y);
end;


procedure TForm1.DrawShape(TopLeft, BottomRight: TPoint; AMode: TPenMode);
var
i:integer;
begin
  with Image1.Canvas do
  begin
    Pen.Mode := AMode;
    case activeTool of
      ttpen:
        begin
          image1.Canvas.Pen.Width:=40;
          Image1.Canvas.LineTo(BottomRight.X, BottomRight.Y);
        end;
      ttLine:
        begin
          Image1.Canvas.MoveTo(TopLeft.X, TopLeft.Y);
          Image1.Canvas.LineTo(BottomRight.X, BottomRight.Y);
        end;
      ttRect:
        begin
          image1.Canvas.Brush.Style:=bsclear;
          Image1.Canvas.Rectangle(TopLeft.X, TopLeft.Y, BottomRight.X,BottomRight.Y);
        end;
      ttEllipse:
        begin
          image1.Canvas.Brush.Style:=bsclear;
          Image1.Canvas.Ellipse(Topleft.X, TopLeft.Y, BottomRight.X, BottomRight.Y);
        end;
      ttRoundRect:
        begin
          image1.Canvas.Brush.Style:=bsclear;
          Image1.Canvas.RoundRect(TopLeft.X, TopLeft.Y, BottomRight.X, BottomRight.Y, (TopLeft.X - BottomRight.X) div 2, (TopLeft.Y - BottomRight.Y) div 2);
        end;
      ttspray:                                                                                                   begin
          randomize;
    image1.Canvas.Pixels[topleft.x+random(image1.Canvas.Pen.Width), topleft.y+random(image1.Canvas.Pen.Width)]:=image1.Canvas.Pen.Color;
    image1.Canvas.Pixels[bottomright.x+random(image1.Canvas.Pen.Width), bottomright.y+random(image1.Canvas.Pen.Width)]:=image1.Canvas.Pen.Color;
          end;
        end;
    end;
 end;



procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Drawing then
  begin
    DrawShape(mousepos1, Point(X, Y), pmCopy);
    Drawing := False;
  end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Drawing then
  begin
    DrawShape(mousepos1, mousepos2, pmNotXor);
    mousepos2 := Point(X, Y);
    DrawShape(mousepos1, mousepos2, pmNotXor);
  end;
  StatusBar1.Panels[0].Text := Format('X=%d, Y=%d', [X, Y]);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  label1.Visible:=true;
  speedbutton9.Visible:=false;
  speedbutton8.Visible:=true;
  activetool:= ttline;
  statusbar1.Panels[1].Text:='���������� ���������: �����'
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
label1.Visible:=true;
speedbutton9.Visible:=false;
speedbutton8.Visible:=true;
activetool:=ttellipse;
statusbar1.Panels[1].Text:='���������� ���������: ������'
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
label1.Visible:=true;
speedbutton9.Visible:=false;
speedbutton8.Visible:=true;
activetool:=ttrect;
statusbar1.Panels[1].Text:='���������� ���������: �������������'
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
label1.Visible:=true;
speedbutton9.Visible:=false;
speedbutton8.Visible:=true;
activetool:=ttroundrect;
statusbar1.Panels[1].Text:='���������� ���������: ����������� �������������'
end;

procedure TForm1.N2Click(Sender: TObject);
  var
  Bitmap: TBitmap;
begin
  Bitmap := nil;
  try
    Bitmap := TBitmap.Create;
    Bitmap.Width := 800;
    Bitmap.Height := 800;
    Image1.Picture.Graphic := Bitmap;
  finally
    Bitmap.Free;
  end;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
if colordialog1.Execute then
 image1.Canvas.Pen.Color:=colordialog1.Color;
 speedbutton8.Glyph:=tbitmap.create;
 speedbutton8.Glyph.Width:=speedbutton8.Width;
 speedbutton8.Glyph.Height:=speedbutton8.Height;
 speedbutton8.Glyph.Canvas.Brush.Color:=colordialog1.Color;
 speedbutton8.Caption:='';
 speedbutton8.Glyph.Canvas.Rectangle(2,2,speedbutton8.Width-6,speedbutton8.Height-6);
end;
procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  label1.Visible:=true;
  speedbutton9.Visible:=false;
  speedbutton8.Visible:=true;
  activetool:=ttspray;
end;

end.
