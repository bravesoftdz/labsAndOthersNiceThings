unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtDlgs, StdCtrls, ExtCtrls,ComCtrls, ActnMan,
  ActnColorMaps, XPMan, ShellAPI{, Richedit};

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    NewWindow1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SavePictureDialog1: TSavePictureDialog;
    N16: TMenuItem;
    N17: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    FontDialog1: TFontDialog;
    N61: TMenuItem;
    N62: TMenuItem;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    N63: TMenuItem;
    N64: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    XPColorMap1: TXPColorMap;
    N18: TMenuItem;
    N30: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    Win1: TMenuItem;
    DOS1: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    Panel4: TPanel;
    PopupMenu1: TPopupMenu;
    N121211: TMenuItem;
    ffer1: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    RichEdit1: TRichEdit;
    Panel5: TPanel;
    Timer1: TTimer;
    N65: TMenuItem;
    N66: TMenuItem;
    N88: TMenuItem;
    Panel6: TPanel;
    N89: TMenuItem;
    N90: TMenuItem;
    PrintDialog1: TPrintDialog;
    PageSetupDialog1: TPageSetupDialog;
    N91: TMenuItem;
    N92: TMenuItem;
    Panel7: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure Panel3DblClick(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure DOS1Click(Sender: TObject);
    procedure Win1Click(Sender: TObject);
    procedure WMDropFiles(var Msg: TMessage);
    message wm_DropFiles;
    procedure N121211Click(Sender: TObject);
    procedure ffer1Click(Sender: TObject);
    procedure N77Click(Sender: TObject);
    procedure N78Click(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure RichEdit1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure NewWindow1Click(Sender: TObject);
    procedure Panel2DblClick(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure Panel6DblClick(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N88Click(Sender: TObject);
    procedure N90Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure N42Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure N94Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure HighLight;
    procedure UnHighLight;
    function CheckList(InString: string): boolean;
    procedure N95Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure SaveOut(var Msg: TMessage);
    message WM_ACTIVATE;
    //procedure WndProc(var Message: TMessage);
    //message WM_NOTIFY;
    procedure N96Click(Sender: TObject);
    function FindHighLight(a:string):boolean;
    procedure TheListFill(Highfile:String);
    procedure Init;
    procedure SaveInit;
    procedure DelInit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  DateTime : TDateTime;
  str : string;
  Flag1,Flag2,FlagOpen,FlagProcess,FlagNote,FlagPerenos,FlagChange,FlagPos,FlagPodsvetka,FlagAllscreen,Top:Integer;
  FlagSaveOut:Boolean;
  Len:integer;
  B:integer;
  Zakladka,Podsvetka:integer;
  NormalFont:Integer;
  i:integer;
  F: TextFile;
  S: string;
  Filename: array[0 .. 256] of Char;
  FileStr: string;
  percent:Real;
  ProcessHandle,ThreadHandle:THANDLE;
  ProcessID:DWORD;
  fh,rlen,i2:cardinal;
  filesize:cardinal;
  blocksize:cardinal;
  Wnd : hWnd;
  buff : ARRAY[0.. 127] OF Char;
  readbl:array[0..1023] of byte;
  PageScrollPause: integer=0;
  PageScrollPause0: integer=0;
  ScrollPixel: integer=0;
  StringTab:Integer;
  MyBuffer:String;
  BufferDel:String;
  HighLightFlag:BOOL;
  HighLightColor:Integer;
  TheList: array of string;
  stfs:String;
  st2,st3,st4,st5,st6,st7,st8,st9:Integer;
  HighLightFileMas: TStringList;
  HighLightFileName: String='0';

implementation

uses Unit2,Unit3,Unit4,Unit5,Unit6, Unit7;

{$R *.dfm}

procedure TForm1.Init;
var
{$I+}
k:Integer;
s:String;
Fini:TextFile;
begin
assignFile(Fini,'Text.ini');
Reset(Fini);
Readln(Fini,s);
if s='TRUE' then  Form1.N64.Click;
Readln(Fini,k);
RichEdit1.Paragraph.FirstIndent:=k;
Readln(Fini,k);
Form1.BorderWidth:=k;
Readln(Fini,k);
Form1.ClientHeight:=k;
Readln(Fini,k);
Form1.ClientWidth:=k;
Readln(Fini,k);
Form1.Height:=k;
Readln(Fini,k);
Form1.Left:=k;
Readln(Fini,k);
Form1.PixelsPerInch:=k;
Readln(Fini,k);
Form1.Top:=k;
Readln(Fini,k);
Form1.Width:=k;
Readln(Fini,s);
Panel1.Visible:=StrToBool(s);
Readln(Fini,k);
FlagAllscreen:=k;
Readln(Fini,Podsvetka);
Readln(Fini,StringTab);
Readln(Fini,Flag2);//readonly
Readln(Fini,s);
Form1.AlphaBlend:=StrToBool(s);
Readln(Fini,k);
Form1.AlphaBlendValue:=k;
Readln(Fini,k);
RichEdit1.Font.Size:=k;
Readln(Fini,k);
FlagPerenos:=k;
Readln(Fini,k);
Form1.RichEdit1.Color:=k;
Form2.Panel1.Color:=Form1.RichEdit1.Color;
Readln(Fini,k);
Form1.RichEdit1.Font.Color:=k;
Form2.Panel2.Color:=Form1.RichEdit1.Font.Color;
Readln(Fini,k);
HighLightColor:=k;
Form2.Panel3.Color:=HighLightColor;
Readln(Fini,s);
if s='TRUE' then Form2.CheckBox7.Checked:=true;
Readln(Fini,s);
if s='TRUE' then Form2.CheckBox3.Checked:=true;
Readln(Fini,s);
if s='TRUE' then
begin
FlagNote:=1;
Form2.CheckBox2.Checked:=true;
end;
Readln(Fini,s);
if s='TRUE' then Form2.CheckBox6.Checked:=true;
Readln(Fini,s);
if s='TRUE' then Form2.CheckBox5.Checked:=true;
Readln(Fini,s);
if s='TRUE' then Form2.CheckBox1.Checked:=true;
Readln(Fini,s);
if s='TRUE' then
begin
Form2.CheckBox4.Checked:=true;
Form1.Panel7.Visible:=True
end;
Readln(Fini,k);
Form2.TrackBar1.Position:=k;
Readln(Fini,k);
Form4.TrackBar1.Position:=k;
Readln(Fini,s);
if s='TRUE' then
begin
HighLightFlag:=True;
N95.Checked:=True;
end;
Readln(Fini,s);
if s<>'0' then
begin
HighLightFileName:=s;
TheListFill(HighLightFileName);
end;

CloseFile(Fini);
{$I-}
Form2.CheckBox8.Checked:=true;
end;

procedure TForm1.SaveInit;
var
{$I+}
Fini:TextFile;
begin
assignFile(Fini,'Text.ini');
Rewrite(Fini);
//////////////////////////////////////////
Writeln(Fini,RichEdit1.ReadOnly);
Writeln(Fini,RichEdit1.Paragraph.FirstIndent);
Writeln(Fini,Form1.BorderWidth);
Writeln(Fini,Form1.ClientHeight);
Writeln(Fini,Form1.ClientWidth);
Writeln(Fini,Form1.Height);
Writeln(Fini,Form1.Left);
Writeln(Fini,Form1.PixelsPerInch);
Writeln(Fini,Form1.Top);
Writeln(Fini,Form1.Width);
Writeln(Fini,Panel1.Visible);
Writeln(Fini,FlagAllscreen);
Writeln(Fini,Podsvetka);
Writeln(Fini,StringTab);
Writeln(Fini,Flag2);//readonly
Writeln(Fini,Form1.AlphaBlend);
Writeln(Fini,Form1.AlphaBlendValue);
Writeln(Fini,RichEdit1.Font.Size);
Writeln(Fini,FlagPerenos);
Writeln(Fini,Form1.RichEdit1.Color);
Writeln(Fini,Form1.RichEdit1.Font.Color);
Writeln(Fini,HighLightColor);
Writeln(Fini,Form2.CheckBox7.Checked);
Writeln(Fini,Form2.CheckBox3.Checked);
Writeln(Fini,Form2.CheckBox2.Checked);
Writeln(Fini,Form2.CheckBox6.Checked);
Writeln(Fini,Form2.CheckBox5.Checked);
Writeln(Fini,Form2.CheckBox1.Checked);
Writeln(Fini,Form2.CheckBox4.Checked);
Writeln(Fini,Form2.TrackBar1.Position);
Writeln(Fini,Form4.TrackBar1.Position);
Writeln(Fini,HighLightFlag);
Writeln(Fini,HighLightFileName);
//////////////////////////////////////////
CloseFile(Fini);
{$I-}
end;

procedure TForm1.DelInit;
var
{$I+}
Fini:TextFile;
begin
if FileExists('Text.ini') then
begin
assignFile(Fini,'Text.ini');
Erase(Fini);
end;
{$I-}
end;

function TForm1.FindHighLight(a:string):boolean;
var
HighLightFile:tsearchrec;
begin
i:=0;
HighLightFileMas := TStringList.Create;
if FindFirst(ExtractFilePath(ParamStr(0))+'Plugins\*.thf', Faanyfile, HighLightFile) = 0 then
repeat
HighLightFileMas.Add(HighLightFile.Name);
i:=i+1;
until FindNext(HighLightFile)<>0 ;
FindClose(HighLightFile);
if i>0 then Result:=true
else Result:=false;
end;

procedure TForm1.SaveOut(var Msg: TMessage);
var
fActive:Word;
begin
if FlagSaveOut=True then
begin
fActive:= LO(Msg.wParam);
if fActive = WA_INACTIVE then
N2.Click;
end;
end;

procedure TForm1.TheListFill(Highfile:String);
var
{$I+}
i:Integer;
k:Integer;
FList:TextFile;
begin
assignFile(Flist,Highfile);
Reset(Flist);
ReadLn(Flist,k);
SetLength(TheList,k+1);
for i:=1 to k do
ReadLn(Flist,TheList[i]);
CloseFile(Flist);
{$I-}
end;

function TForm1.CheckList(InString: string): boolean;
var
X: integer;
begin
  Result := false;
  X := 1;
  InString := StringReplace(InString, ' ', '',[rfReplaceAll]);
  InString := StringReplace(InString, #$A, '',[rfReplaceAll]);
  InString := StringReplace(InString, #$D, '',[rfReplaceAll]);
  while X < High(TheList) + 1 do
  if TheList[X] = lowercase(InString) then
  begin
    Result := true;
    X := High(TheList) + 1;
  end
  else inc(X);
end;


function SearchFor(WorkSpace, Search: string; Start: integer): integer; 
var Temp: string; 
begin 
  Temp := copy(WorkSpace, Start, length(WorkSpace)); 
  Result := pos(Search, Temp); 
end; 

procedure TForm1.HighLight; 
var WStart, WEnd, WEnd2: integer; 
  WorkSpace, SWord: string; 
begin 
  WStart  :=  1; 
  WEnd  :=  1; 
  with  RichEdit1 do 
  begin 
    WorkSpace  :=  Text + ' ' + #$D#$A; 
    while WEnd > 0 do 
    begin 
      WEnd := SearchFor(WorkSpace, ' ', WStart); 
      WEnd2 := SearchFor(WorkSpace, #$A, WStart); 
      if WEnd2 < WEnd then WEnd := WEnd2; 
      SWord := copy(WorkSpace, WStart, WEnd - 1); 
      if (SWord <> ' ') and (SWord <>'') then 
        if CheckList(SWord) then 
        begin 
          SelStart  := WStart - 1; 
          SelLength := length(SWord); 
          SelAttributes.Style := [fsBOLD];
          SelAttributes.Color := HighLightColor;
          SelStart := WStart + length(SWord) + 1;
          SelAttributes.Style := [];
        end; 
      WStart := WStart + WEnd;
    end;
    SelStart := length(Text);
    SetFocus;
  end;
end;


procedure TForm1.UnHighLight;
var WStart, WEnd, WEnd2: integer;
  WorkSpace, SWord: string;
begin
  WStart  :=  1;
  WEnd  :=  1;
  with  RichEdit1 do
  begin
    WorkSpace  :=  Text + ' ' + #$D#$A;
    while WEnd > 0 do
    begin
      WEnd := SearchFor(WorkSpace, ' ', WStart);
      WEnd2 := SearchFor(WorkSpace, #$A, WStart);
      if WEnd2 < WEnd then WEnd := WEnd2;
      SWord := copy(WorkSpace, WStart, WEnd - 1);
      if (SWord <> ' ') and (SWord <>'') then
        if CheckList(SWord) then
        begin
          SelStart  := WStart - 1;
          SelLength := length(SWord);
          SelAttributes.Style := [];
          SelAttributes.Color := RichEdit1.Font.Color;
          SelStart := WStart + length(SWord) + 1;
          SelAttributes.Style := [];
        end;
      WStart := WStart + WEnd;
    end;
    SelStart := length(Text);
    SetFocus;
  end;
end;




procedure TForm1.N1Click(Sender: TObject);
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
//ThreadHandle:= GetCurrentThread();
//SetThreadPriority(ThreadHandle,HIGH_PRIORITY_CLASS);



if(Flag1=1) then
begin
if(MessageBox(0,'��������� ��������� ?', 'Save file', MB_OKCANCEL)=1) then
begin
N3.Click;
Flag1:=0;
Flag2:=0;
end;
end;

if (OpenDialog1.Execute=True) then
begin


if(FlagPerenos=1)then
RichEdit1.ScrollBars:=ssVertical
else
RichEdit1.ScrollBars:=ssBoth;


FlagOpen:=1;
if(FlagNote=0)then
begin
RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;
end
else
begin
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
if(FlagPerenos=1)then
RichEdit1.ScrollBars:=ssVertical
else
RichEdit1.ScrollBars:=ssBoth;
FlagChange:=1;
Panel2.Enabled:=False;
Panel3.Enabled:=False;
Panel6.Enabled:=False;
Form1.N23.Enabled:=False;
RichEdit1.Lines.Clear;
   s:='';
 blocksize:=1024;
 fh:=Windows.CreateFile(PChar(OpenDialog1.FileName),GENERIC_READ,FILE_SHARE_READ,
  nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
 filesize:=Windows.GetFileSize(fh,nil);
 while filesize>0 do
  begin
   if filesize<blocksize then blocksize:=filesize;
   Windows.ReadFile(fh,readbl,blocksize,rlen,nil);
   for i:=1 to blocksize do
    begin
     case readbl[i-1]of
      $0..$8 : s:=s+' ';
      $E..$1F : s:=s+' ';
      $7F    : s:=s+' ';
      else  s:=s+chr(readbl[i-1]);
      end;
    end;
   filesize:=filesize-blocksize;
  end;
   Form1.RichEdit1.Lines.Add(s);
  Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;
 Windows.CloseHandle(fh);
end;



Form1.Caption:='Text  '+OpenDialog1.FileName;
Application.Title:=ExtractFileName(OpenDialog1.FileName);
Panel2.Caption:='0';
Panel3.Caption:='0'+'%';
Panel4.Caption:='WIN';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
Panel6.Caption:='Autoscroll Disabled';
Panel2.Enabled:=True;
Panel3.Enabled:=True;
Panel6.Enabled:=True;
Form1.N23.Enabled:=True;
end;
if(FlagProcess=0)then
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS)
else
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
if HighLightFlag=True then
HighLight;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
if (SaveDialog1.Execute=True) then
RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
OpenDialog1.FileName:=SaveDialog1.FileName;
Form1.Caption:='Text  '+SaveDialog1.FileName;
Application.Title:=ExtractFileName(SaveDialog1.FileName);
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
Flag1:=0;
FlagOpen:=1;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.N40Click(Sender: TObject);
begin
MessageBox(0,'������ 1.3', 'Version', MB_OK)
end;

procedure TForm1.N17Click(Sender: TObject);
begin
MyBuffer:=MyBuffer+BufferDel+RichEdit1.SelText;
end;

procedure TForm1.N28Click(Sender: TObject);
begin
if(FlagAllscreen=0)then
begin
stfs:=RichEdit1.Lines.Text;
st2:=Form1.BorderWidth;
st3:=Form1.ClientHeight;
st4:=Form1.ClientWidth;
st5:=Form1.Height;
st6:=Form1.Left;
st7:=Form1.PixelsPerInch;
st8:=Form1.Top;
st9:=Form1.Width;
Form1.WindowState:=wsMaximized;
Form1.BorderStyle:=bsNone;
Panel1.Visible:=False;
RichEdit1.Lines.Clear;
RichEdit1.Paragraph.FirstIndent := StringTab;
RichEdit1.Lines.Add(stfs);
Form1.RichEdit1.Lines.Delete(Form1.RichEdit1.Lines.Capacity-1);
FlagAllscreen:=1;

Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;


end
else
begin
Form1.WindowState:=wsNormal;
Form1.BorderStyle:=bsSizeable;
Panel1.Visible:=True;
RichEdit1.Lines.Clear;
RichEdit1.Paragraph.FirstIndent := 0;
RichEdit1.Lines.Add(stfs);
stfs:='';
Form1.RichEdit1.Lines.Delete(Form1.RichEdit1.Lines.Capacity-1);
FlagAllscreen:=0;
Form1.BorderWidth:=st2;
Form1.ClientHeight:=st3;
Form1.ClientWidth:=st4;
Form1.Height:=st5;
Form1.Left:=st6;
Form1.PixelsPerInch:=st7;
Form1.Top:=st8;
Form1.Width:=st9;




Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;


end;
DragAcceptFiles(Handle, True);
end;

procedure TForm1.N62Click(Sender: TObject);
begin
if(FontDialog1.Execute=True)then
RichEdit1.Font:=FontDialog1.Font;
end;

procedure TForm1.N61Click(Sender: TObject);
begin
if(FontDialog1.Execute=True)then
RichEdit1.Font:=FontDialog1.Font;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
FindDialog1.Execute;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
ReplaceDialog1.Execute;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
RichEdit1.Undo;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
Flag1:=1;
DateTime := Time;
str := DateToStr(Date)+' '+TimeToStr(DateTime);
RichEdit1.Lines.Insert(RichEdit1.CaretPos.Y,str);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
if (length(OpenDialog1.FileName)<>0)and(FlagOpen=1) then
begin
RichEdit1.Lines.SaveToFile(OpenDialog1.FileName);
Flag1:=0;
end
else
if (length(ParamStr(1))<>0)and(FlagOpen=1) then
begin
RichEdit1.Lines.SaveToFile(ParamStr(1));
Flag1:=0;
end
else
if (length(Filename)<>0)and(FlagOpen=1) then
begin
RichEdit1.Lines.SaveToFile(Filename);
Flag1:=0;
end
else
begin
if (SaveDialog1.Execute=True) then
begin
RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
FlagOpen:=1;
Form1.Caption:='Text  '+SaveDialog1.FileName;
Application.Title:=ExtractFileName(SaveDialog1.FileName);
OpenDialog1.FileName:=SaveDialog1.FileName;
end;
if(FlagProcess=0)then
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
Flag1:=0;
end;

end;

procedure TForm1.N14Click(Sender: TObject);
begin
RichEdit1.SelectAll;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
RichEdit1.SelectAll;
RichEdit1.CopyToClipboard;
RichEdit1.SelLength:=0;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
RichEdit1.CopyToClipboard;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
FileNameParam:String;////////////////////////
begin
SetLength(TheList,31);
TheList[1]:='begin';
TheList[2]:='or';
TheList[3]:='end';
TheList[4]:='end.';
TheList[5]:='end;';
TheList[6]:='then';
TheList[7]:='var';
TheList[8]:='for';
TheList[9]:='do';
TheList[10]:= 'if';
TheList[11]:='to';
TheList[12]:='string';
TheList[13]:= 'while';
TheList[14]:='until';
TheList[15]:='try';
TheList[16]:='except';
TheList[17]:='library';
TheList[18]:='program';
TheList[19]:='function';
TheList[20]:='procedure';
TheList[21]:='asm';
TheList[22]:='else';
TheList[23]:='uses';
TheList[24]:='interface';
TheList[25]:='type';
TheList[26]:='unit';
TheList[27]:='repeat';
TheList[28]:='integer';
TheList[29]:='array';
TheList[30]:='of';


DragAcceptFiles(Handle, True);
/////////////////////////////////////////////
if (ParamCount=1)then
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
FileNameParam:=(ParamStr(1));
RichEdit1.Lines.LoadFromFile(FileNameParam);
FlagOpen:=1;
RichEdit1.ScrollBars:=ssBoth;
Form1.Caption:='Text  '+FileNameParam;
Application.Title:=ExtractFileName(FileNameParam);
Panel2.Caption:='0';
Panel3.Caption:='0'+'%';
Panel4.Caption:='WIN';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
Panel6.Caption:='Autoscroll Disabled';
Panel2.Enabled:=True;
Panel3.Enabled:=True;
Panel6.Enabled:=True;
Form1.N23.Enabled:=True;
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
end;

/////////////////////////////////////////////
Top:=0;
Flag1:=0;
if (ParamCount=0)then
FlagOpen:=0;
FlagPos:=0;
FlagNote:=0;
FlagChange:=1;
FlagProcess:=0;
FlagPerenos:=0;
FlagPodsvetka:=0;
FlagAllscreen:=0;
FlagSaveOut:=False;
HighLightFlag:=False;
HighLightColor:=clBlack;
Podsvetka:=250;
StringTab:=150;
NormalFont:=RichEdit1.Font.Size;
ProcessID:= GetCurrentProcessId();
ProcessHandle:= OpenProcess(PROCESS_ALL_ACCESS,false,ProcessID);
end;

procedure TForm1.N12Click(Sender: TObject);
begin
Flag1:=1;
RichEdit1.ClearSelection;
end;                        

procedure TForm1.N35Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if(PrintDialog1.Execute=True)then
RichEdit1.Print(Application.Title);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
PageSetupDialog1.Execute;
end;

procedure TForm1.N64Click(Sender: TObject);
begin

if(Flag2=0) then
begin
RichEdit1.ReadOnly:=True;
N64.Caption:='���������';
Flag2:=1;
end
else
begin
RichEdit1.ReadOnly:=False;
N64.Caption:='��������';
Flag2:=0;
end;

end;

procedure TForm1.N11Click(Sender: TObject);
begin
Flag1:=1;
RichEdit1.PasteFromClipboard;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
Flag1:=1;
RichEdit1.CutToClipboard;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
Flag1:=1;
RichEdit1.Lines.Delete(RichEdit1.CaretPos.Y);
end;

procedure TForm1.N27Click(Sender: TObject);
var st:String;
begin
RichEdit1.Paragraph.FirstIndent := 0;
Form1.BorderWidth:=0;
Form1.ClientHeight:=477;
Form1.ClientWidth:=707;
Form1.Height:=523;
Form1.Left:=231;
Form1.PixelsPerInch:=96;
Form1.Top:=102;
Form1.Width:=715;
Form1.BorderStyle:=bsSizeable;
Form1.WindowState:=wsNormal;
Panel1.Visible:=True;
FlagAllscreen:=0;
st:=RichEdit1.Lines.Text;
RichEdit1.Lines.Clear;
RichEdit1.Lines.Add(st);
Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;
st:='';
end;

procedure TForm1.N25Click(Sender: TObject);
begin
RichEdit1.Font.Size:=RichEdit1.Font.Size+2;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
RichEdit1.Font.Size:=RichEdit1.Font.Size-2;
end;

procedure TForm1.N55Click(Sender: TObject);
begin
RichEdit1.Font.Size:=NormalFont;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);

var
  FoundAt,FoundAtUp: LongInt;
  StartPos, ToEnd: Integer;
begin
  with RichEdit1 do
  begin

      if (frDown in FindDialog1.Options)then
    begin
    if SelLength <> 0 then


      StartPos := SelStart + SelLength
    else

      StartPos := SelStart;
    ToEnd := Length(Text) - StartPos;



      if ((frWholeWord in FindDialog1.Options) and (frMatchCase in FindDialog1.Options)) then
       FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase,stWholeWord])
       else
       begin
     if frWholeWord in FindDialog1.Options then
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stWholeWord])
     else
     if frMatchCase in FindDialog1.Options then
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase])
     else
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, []);


     end;

    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(FindDialog1.FindText);
      perform(EM_ScrollCaret,0,0);
    end
    else
    ShowMessage('Not found  '+FindDialog1.FindText);
  end


  else
  begin//////////////////////////////////////////////

      StartPos := 0;
      FoundAt:=0;
      FoundAtUp:=-1;
      ToEnd :=SelStart-Length(FindDialog1.FindText);
      
          while (FoundAt <> -1) do
            begin

      if StartPos<ToEnd then
      begin
      if ((frWholeWord in FindDialog1.Options) and (frMatchCase in FindDialog1.Options)) then
       FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase,stWholeWord])
       else
       begin
     if frWholeWord in FindDialog1.Options then
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stWholeWord])
     else
     if frMatchCase in FindDialog1.Options then
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase])
     else
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, []);
     end;

     if (FoundAt <> -1)and(FoundAt<ToEnd) then
     begin
     StartPos:=FoundAt+Length(FindDialog1.FindText);
     FoundAtUp:=FoundAt;
     end
     else
     StartPos:=FoundAt+Length(FindDialog1.FindText);



     end
     else
     FoundAt:=-1;

     end;

    if FoundAtUp <> -1 then
    begin
      SetFocus;
      SelStart := FoundAtUp;
      SelLength := Length(FindDialog1.FindText);
      perform(EM_ScrollCaret,0,0);
    end
    else
    ShowMessage('Not found  '+FindDialog1.FindText);
  end;



  end;///////////////////////////////////////////////

 N21.Enabled:=True;

end;

procedure TForm1.ReplaceDialog1Find(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
  with RichEdit1 do
  begin
    if SelLength <> 0 then

      StartPos := SelStart + SelLength
    else

      StartPos := SelStart;
    ToEnd := Length(Text) - StartPos;

      if ((frWholeWord in ReplaceDialog1.Options) and (frMatchCase in ReplaceDialog1.Options)) then
       FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, [stMatchCase,stWholeWord])
       else
       begin
     if frWholeWord in ReplaceDialog1.Options then
     FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, [stWholeWord])
     else
     if frMatchCase in ReplaceDialog1.Options then
     FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, [stMatchCase])
     else
     FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, []);

     end;

    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(ReplaceDialog1.FindText);
      perform(EM_ScrollCaret,0,0);
    end
    else
    ShowMessage('Not found  '+ReplaceDialog1.FindText);
  end;

end;

procedure TForm1.N30Click(Sender: TObject);
begin
if(FlagOpen=1)then
if(Timer1.Enabled=False)then
begin
Timer1.Enabled:=True;
Panel6.Caption:='Autoscroll Enabled';
end
else
begin
Timer1.Enabled:=False;
Panel6.Caption:='Autoscroll Disabled';
end;
end;

procedure TForm1.Panel3DblClick(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm1.New1Click(Sender: TObject);
begin
if(Flag1=1) then
begin
if(MessageBox(0,'��������� ��������� ?', 'Save file', MB_OKCANCEL)=1) then
begin
N3.Click;
Flag1:=0;
Flag2:=0;
FlagOpen:=0;
FlagChange:=1;
Panel2.Caption:='';
Panel3.Caption:='';
Panel5.Caption:='';
Panel6.Caption:='';
end;
end;
FlagOpen:=0;
FlagChange:=1;
Panel2.Caption:='';
Panel3.Caption:='';
Panel6.Caption:='';
RichEdit1.Lines.Clear;
Panel2.Enabled:=False;
Panel3.Enabled:=False;
Panel6.Enabled:=False;
Form1.N23.Enabled:=False;
Form1.Caption:='Text ����������';
Application.Title:='����������';
end;

procedure TForm1.N29Click(Sender: TObject);
var st:String;
begin
st:=RichEdit1.Lines.Text;
if(Top=0)then
begin
Form1.FormStyle:=fsStayOnTop;
N29.Caption:='������ ������ ������  ����';
Top:=1;
end
else
begin
Form1.FormStyle:=fsNormal;
N29.Caption:='������ ������ ������  ���';
Top:=0;
end;
RichEdit1.Lines.Clear;
RichEdit1.Lines.Add(st);
Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;
DragAcceptFiles(Handle, True);
st:='';
end;

procedure TForm1.N18Click(Sender: TObject);
begin
Form1.AlphaBlend:=Enabled;
Form4.Show;
end;

procedure TForm1.N33Click(Sender: TObject);
var
TheMStream : TMemoryStream;
Zero : char;
begin
if (OpenDialog1.Execute=True) then
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);

TheMStream := TMemoryStream.Create;
TheMStream.LoadFromFile(OpenDialog1.FileName);
TheMStream.Seek(0, soFromEnd);
Zero := #0;
TheMStream.Write(Zero, 1);
TheMStream.Seek(0, soFromBeginning);
RichEdit1.SetSelTextBuf(TheMStream.Memory);
TheMStream.Free;
Flag1:=1;
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
end;

end;
procedure TForm1.N69Click(Sender: TObject);
begin
if(FlagPerenos=1)then
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
N69.Caption:='������� �� ������ ����';
s:=RichEdit1.Text;
FlagChange:=1;
RichEdit1.Clear;
FlagChange:=1;
RichEdit1.WordWrap:=True;
FlagChange:=1;
RichEdit1.Text:=s;
s:='';
FlagChange:=1;
RichEdit1.ScrollBars:=ssVertical;
FlagPerenos:=0;
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
if(FlagProcess=0)then
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
end
else
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
N69.Caption:='������� �� ������ ���';
s:=RichEdit1.Text;
FlagChange:=1;
RichEdit1.Clear;
FlagChange:=1;
RichEdit1.WordWrap:=False;
FlagChange:=1;
RichEdit1.Text:=s;
s:='';
FlagChange:=1;
RichEdit1.ScrollBars:=ssBoth;
FlagPerenos:=1;
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
if(FlagProcess=0)then
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
end;




end;

procedure TForm1.DOS1Click(Sender: TObject);
var
StrDos:String;
begin
if((Flag1=1)or(FlagOpen=1))then
begin
Flag1:=1;
StrDos:=RichEdit1.Lines.Text;
chartooem(pchar(StrDos),pchar(StrDos));
RichEdit1.Lines.Text:=StrDos;
Panel4.Caption:='DOS';
end;
//RichEdit1.Font.Charset:=OEM_CHARSET;
Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;
end;

procedure TForm1.Win1Click(Sender: TObject);
var
StrWin:Pchar;
begin
if((Flag1=1)or(FlagOpen=1))then
begin
Flag1:=1;
StrWin:=pchar(RichEdit1.Lines.Text);
oemtochar(StrWin,StrWin);
RichEdit1.Lines.Text:=strpas(StrWin);
Panel4.Caption:='WIN';
end;
//RichEdit1.Font.Charset:=DEFAULT_CHARSET;
Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;

end;

Procedure TForm1.WMDropFiles(var Msg: TMessage);

begin
 DragQueryFile( THandle(Msg.WParam), 0, Filename, sizeof(Filename) ) ;

 SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
if(Flag1=1) then
begin
if(MessageBox(0,'��������� ��������� ?', 'Save file', MB_OKCANCEL)=1) then
begin
N3.Click;
Flag1:=0;
Flag2:=0;
end;
end;
FlagChange:=1;
Panel2.Enabled:=False;
Panel3.Enabled:=False;
Panel6.Enabled:=False;
Form1.N23.Enabled:=False;
RichEdit1.Clear;
if(FlagPerenos=1)then
begin
FlagChange:=1;
RichEdit1.ScrollBars:=ssVertical
end
else
begin
FlagChange:=1;
RichEdit1.ScrollBars:=ssBoth;
end;

FlagOpen:=1;
if(FlagNote=0)then
begin
RichEdit1.Lines.LoadFromFile(FileName);
Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;
end
else
begin
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
FlagChange:=1;
Panel2.Enabled:=False;
Panel3.Enabled:=False;
Panel6.Enabled:=False;
Form1.N23.Enabled:=False;
RichEdit1.Lines.Clear;
 s:='';
 blocksize:=1024;
 fh:=Windows.CreateFile(FileName,GENERIC_READ,FILE_SHARE_READ,
  nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
 filesize:=Windows.GetFileSize(fh,nil);
 while filesize>0 do
  begin
   if filesize<blocksize then blocksize:=filesize;
   Windows.ReadFile(fh,readbl,blocksize,rlen,nil);
   for i:=1 to blocksize do
    begin
     case readbl[i-1]of
      $0..$8 : s:=s+' ';
      $E..$1F : s:=s+' ';
      $7F    : s:=s+' ';
      else  s:=s+chr(readbl[i-1]);
      end;
    end;
   filesize:=filesize-blocksize;
  end;
 Windows.CloseHandle(fh);
  Form1.RichEdit1.Lines.Add(s);
 Form1.RichEdit1.Lines.Move(Form1.RichEdit1.Lines.Capacity+1,0);
Form1.RichEdit1.Lines.Delete(0);
if(FlagPos=1) then
Form1.RichEdit1.Modified:=True
else
Form1.RichEdit1.Modified:=False;
end;




Form1.Caption:='Text  '+FileName;
Application.Title:=ExtractFileName(FileName);
Panel2.Caption:='0';
Panel3.Caption:='0'+'%';
Panel4.Caption:='WIN';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
Panel6.Caption:='Autoscroll Disabled';
Panel2.Enabled:=True;
Panel3.Enabled:=True;
Panel6.Enabled:=True;
Form1.N23.Enabled:=True;
if(FlagProcess=0)then
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS)
else
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);

DragFinish(THandle(Msg.WParam));
if HighLightFlag=True then
HighLight;
end; 


procedure TForm1.N121211Click(Sender: TObject);
begin
N9.Click;
end;

procedure TForm1.ffer1Click(Sender: TObject);
begin
N10.Click;
end;

procedure TForm1.N77Click(Sender: TObject);
begin
N11.Click;
end;

procedure TForm1.N78Click(Sender: TObject);
begin
N12.Click;
end;

procedure TForm1.N79Click(Sender: TObject);
begin
N13.Click;
end;

procedure TForm1.N81Click(Sender: TObject);
begin
N14.Click;
end;

procedure TForm1.N82Click(Sender: TObject);
begin
N14.Click;
end;

procedure TForm1.RichEdit1Change(Sender: TObject);
begin
if(RichEdit1.Modified=True)then
begin
Form1.N2.Enabled:=True;
FlagPos:=1;
end;
if(FlagOpen=1) then
begin
Panel2.Caption:=''+IntToStr(RichEdit1.CaretPos.Y+1)+':'+IntToStr(RichEdit1.CaretPos.X);
if RichEdit1.Lines.Capacity<>0 then
percent:=(Round((RichEdit1.CaretPos.Y+1)/(RichEdit1.Lines.Capacity)*100))
else
percent:=0;
if(percent>100)then
percent:=100;
Panel3.Caption:=''+FloatToStr(percent)+'%';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
FlagChange:=0;
end;

end;

procedure TForm1.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
Form1.N2.Enabled:=True;
Flag1:=1;
if(FlagOpen=1) then
begin
Panel2.Caption:=''+IntToStr(RichEdit1.CaretPos.Y+1)+':'+IntToStr(RichEdit1.CaretPos.X);
if RichEdit1.Lines.Capacity<>0 then
percent:=(Round((RichEdit1.CaretPos.Y+1)/(RichEdit1.Lines.Capacity)*100))
else
percent:=0;
if(percent>100)then
percent:=100;
Panel3.Caption:=''+FloatToStr(percent)+'%';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
end;

end;

procedure TForm1.RichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if(FlagOpen=1) then
begin
Panel2.Caption:=''+IntToStr(RichEdit1.CaretPos.Y+1)+':'+IntToStr(RichEdit1.CaretPos.X);
if RichEdit1.Lines.Capacity<>0 then
percent:=(Round((RichEdit1.CaretPos.Y+1)/(RichEdit1.Lines.Capacity)*100))
else
percent:=0;
if(percent>100)then
percent:=100;
Panel3.Caption:=''+FloatToStr(percent)+'%';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
end;

end;

procedure TForm1.RichEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
WEnd, WStart, BCount: integer;
Mark: string;
begin
if(FlagOpen=1) then
begin
Panel2.Caption:=''+IntToStr(RichEdit1.CaretPos.Y+1)+':'+IntToStr(RichEdit1.CaretPos.X);
if RichEdit1.Lines.Capacity<>0 then
percent:=(Round((RichEdit1.CaretPos.Y+1)/(RichEdit1.Lines.Capacity)*100))
else
percent:=0;
if(percent>100)then
percent:=100;
Panel3.Caption:=''+FloatToStr(percent)+'%';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
end;
if HighLightFlag=True then
begin
if (Key = VK_Return) or (Key = VK_Back) or (Key = VK_Space) then 
  begin 
    if RichEdit1.SelStart > 1 then 
    begin 
      WStart := 0; 
      WEnd := RichEdit1.SelStart; 
      BCount := WEnd - 1; 
      while BCount <> 0 do 
      begin 
        Mark := copy(RichEdit1.Text, BCount, 1); 
        if (Mark = ' ') or (Mark = #$A) then 
        begin 
          WStart := BCount; 
          BCount := 1; 
        end; 
        dec(BCount); 
      end; 
      RichEdit1.SelStart := WEnd - (WEnd - WStart); 
      RichEdit1.SelLength := WEnd - WStart; 
      if CheckList(RichEdit1.SelText) then
        begin
          RichEdit1.SelAttributes.Style := [fsBold];
          RichEdit1.SelAttributes.Color := HighLightColor;
        end
      else RichEdit1.SelAttributes.Style := []; 
      RichEdit1.SelStart := WEnd; 
      RichEdit1.SelAttributes.Style := []; 
    end; 
  end;
end;
end;    

procedure TForm1.RichEdit1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
if(FlagOpen=1) then
begin
Panel2.Caption:=''+IntToStr(RichEdit1.CaretPos.Y+1)+':'+IntToStr(RichEdit1.CaretPos.X);
if RichEdit1.Lines.Capacity<>0 then
percent:=(Round((RichEdit1.CaretPos.Y+1)/(RichEdit1.Lines.Capacity)*100))
else
percent:=0;
if(percent>100)then
percent:=100;
Panel3.Caption:=''+FloatToStr(percent)+'%';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
end;
end;

procedure TForm1.RichEdit1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if(FlagOpen=1) then
begin
Panel2.Caption:=''+IntToStr(RichEdit1.CaretPos.Y+1)+':'+IntToStr(RichEdit1.CaretPos.X);
if RichEdit1.Lines.Capacity<>0 then
percent:=(Round((RichEdit1.CaretPos.Y+1)/(RichEdit1.Lines.Capacity)*100))
else
percent:=0;
if(percent>100)then
percent:=100;
Panel3.Caption:=''+FloatToStr(percent)+'%';
Panel5.Caption:=''+IntToStr(RichEdit1.Lines.Capacity)+' ���.';
end;
end;

procedure TForm1.NewWindow1Click(Sender: TObject);
begin
ShellExecute(handle, nil, pchar(ParamStr(0)), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Panel2DblClick(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm1.N73Click(Sender: TObject);
begin
Zakladka:=RichEdit1.CaretPos.Y;
end;

procedure TForm1.N75Click(Sender: TObject);
begin
Zakladka:=0;
end;

procedure TForm1.N74Click(Sender: TObject);
begin
if((Zakladka>0)and(Zakladka<=RichEdit1.Lines.Capacity))then
begin
RichEdit1.Lines.Move(RichEdit1.Lines.Capacity+1,Zakladka);
RichEdit1.Lines.Delete(Zakladka);
if(FlagPos=1) then
RichEdit1.Modified:=True
else
RichEdit1.Modified:=False;

Panel2.Caption:=''+IntToStr(RichEdit1.CaretPos.Y+1)+':'+IntToStr(RichEdit1.CaretPos.X);
percent:=(Round((RichEdit1.CaretPos.Y+1)/(RichEdit1.Lines.Capacity)*99));
if(percent>100)then
percent:=100;
Panel3.Caption:=''+FloatToStr(percent)+'%';
end;
end;

procedure TForm1.N84Click(Sender: TObject);
begin
N73.Click;
end;

procedure TForm1.N85Click(Sender: TObject);
begin
N74.Click;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
nPos,nMax,nMin:integer;
begin
GetScrollRange(RichEdit1.Handle,SB_VERT,nMin,nMax);
nPos:=GetScrollPos (RichEdit1.Handle,SB_VERT);

IF (nPos + RichEdit1.Lines.Capacity-1) < (nMax-nMin) Then
    PageScrollPause:=RichEdit1.Lines.Capacity*RichEdit1.Font.Height;
IF nPos<>nMin Then PageScrollPause0:=0;
IF PageScrollPause0>0 Then dec(PageScrollPause0)
ELSE
 if  (nPos + RichEdit1.Lines.Capacity-1) < (nMax-nMin) Then
 begin
  RichEdit1.ScrollBy(0,-1);
  ScrollPixel:=ScrollPixel+1;
  If ScrollPixel >= RichEdit1.Font.Height Then
     begin
      RichEdit1.Lines.BeginUpdate;
      RichEdit1.Repaint;
      SendMessage(RichEdit1.Handle,WM_VSCROLL,SB_LINEDOWN,0);
      RichEdit1.Lines.EndUpdate;
      ScrollPixel:=0;
     end;
 end;





















end;

procedure TForm1.N87Click(Sender: TObject);
begin
N30.Click;
end;

procedure TForm1.Panel6DblClick(Sender: TObject);
begin
N30.Click;
end;

procedure TForm1.N66Click(Sender: TObject);
begin
if(Form1.Timer1.Interval>=100)then
Form1.Timer1.Interval:=Form1.Timer1.Interval-100;
end;

procedure TForm1.N88Click(Sender: TObject);
begin
if(Form1.Timer1.Interval<=5000)then
Form1.Timer1.Interval:=Form1.Timer1.Interval+100;
end;

procedure TForm1.N90Click(Sender: TObject);
begin
FlagPodsvetka:=1;
Form6.AlphaBlend:=True;
Form6.AlphaBlendValue:=100;
Form6.ClientHeight:=18;
Form6.BorderStyle:=bsNone;
Form6.Top:=Form1.Top+Podsvetka;
Form6.Left:=Form1.Left+7;
Form6.ClientWidth:=Form1.ClientWidth;
Form6.Show;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
if(FlagPodsvetka=1)then
begin
Form6.Top:=Form1.Top+Podsvetka;
Form6.Left:=Form1.Left+7;
Form6.ClientWidth:=Form1.ClientWidth;
end;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
if(FlagPodsvetka=1)then
begin
Form6.Top:=Form1.Top+Podsvetka;
Form6.Left:=Form1.Left+7;
Form6.ClientWidth:=Form1.ClientWidth;
end;
end;

procedure TForm1.N42Click(Sender: TObject);
var CState: Integer;
begin
CState := ShowCursor(False);
N91.Enabled:=True;
N42.Enabled:=False;
end;

procedure TForm1.N91Click(Sender: TObject);
var CState: Integer;
begin
CState := ShowCursor(True);
N91.Enabled:=False;
N42.Enabled:=True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if(Flag1=1) then
begin
B:=MessageBox(0,'��������� ��������� ?', 'Save file', MB_YESNOCANCEL);	
if(B=6) then
begin
SetPriorityClass(ProcessHandle,HIGH_PRIORITY_CLASS);
if (length(OpenDialog1.FileName)<>0) then
begin
RichEdit1.Lines.SaveToFile(OpenDialog1.FileName);
Flag1:=0;
end
else
if (length(ParamStr(1))<>0) then
begin
RichEdit1.Lines.SaveToFile(ParamStr(1));
Flag1:=0;
end
else
begin
if (SaveDialog1.Execute=True) then
RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
if(FlagProcess=0)then
SetPriorityClass(ProcessHandle,NORMAL_PRIORITY_CLASS);
Flag1:=0;
end;
end;
if(B=2) then Action := caNone;
end;
FlagPodsvetka:=0;

if(Form2.CheckBox8.Checked=True)then
Form1.SaveInit;

end;

procedure TForm1.Panel7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

   Wnd:=FindWindow('winamp v1.x',nil);
   GetWindowText (Wnd, buff, sizeof (buff ));
   Panel7.Hint:=StrPas (buff);


   
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
    Label1.Color:=clGray;
    Wnd:=FindWindow('winamp v1.x',nil);
    GetWindowText (Wnd, buff, sizeof (buff ));
    SendMessage(Wnd,WM_COMMAND,40045,0);
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
    Label2.Color:=clGray;
    Wnd:=FindWindow('winamp v1.x',nil);
    GetWindowText (Wnd, buff, sizeof (buff ));
    SendMessage(Wnd,WM_COMMAND,40047,0);
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
    Label3.Color:=clGray;
    Wnd:=FindWindow('winamp v1.x',nil);
    GetWindowText (Wnd, buff, sizeof (buff ));
    SendMessage(Wnd,WM_COMMAND,40046,0);
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
    Label4.Color:=clGray;
    Wnd:=FindWindow('winamp v1.x',nil);
    GetWindowText (Wnd, buff, sizeof (buff ));
    SendMessage(Wnd,WM_COMMAND,40048,0);
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
    Label5.Color:=clGray;
    Wnd:=FindWindow('winamp v1.x',nil);
    GetWindowText (Wnd, buff, sizeof (buff ));
    SendMessage(Wnd,WM_COMMAND,40044,0);
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
    Label6.Color:=clGray;
    Wnd:=FindWindow('winamp v1.x',nil);
    GetWindowText (Wnd, buff, sizeof (buff ));
    SendMessage(Wnd,WM_COMMAND,-25477,0);
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
    Label7 .Color:=clGray;
    Wnd:=FindWindow('winamp v1.x',nil);
    GetWindowText (Wnd, buff, sizeof (buff ));
    SendMessage(Wnd,WM_COMMAND,-25478,0);
end;

procedure TForm1.N21Click(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
if length(FindDialog1.FindText) <> 0 then
begin
  with RichEdit1 do
  begin
    if SelLength <> 0 then

      StartPos := SelStart + SelLength
    else

      StartPos := SelStart;
    ToEnd := Length(Text) - StartPos;

      if ((frWholeWord in FindDialog1.Options) and (frMatchCase in FindDialog1.Options)) then
       FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase,stWholeWord])
       else
       begin
     if frWholeWord in FindDialog1.Options then
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stWholeWord])
     else
     if frMatchCase in FindDialog1.Options then
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase])
     else
     FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, []);

     end;

    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(FindDialog1.FindText);
      perform(EM_ScrollCaret,0,0);
    end
    else
    ShowMessage('Not found  '+FindDialog1.FindText);
  end;
end;
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
  FindFlag:Integer;
begin
FindFlag:=0;
if frReplaceAll in ReplaceDialog1.Options then
while FindFlag=0 do
begin
  with RichEdit1 do
  begin
    if SelLength <> 0 then

      StartPos := SelStart + SelLength
    else

      StartPos := SelStart;
    ToEnd := Length(Text) - StartPos;

      if ((frWholeWord in ReplaceDialog1.Options) and (frMatchCase in ReplaceDialog1.Options)) then
       FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, [stMatchCase,stWholeWord])
       else
       begin
     if frWholeWord in ReplaceDialog1.Options then
     FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, [stWholeWord])
     else
     if frMatchCase in ReplaceDialog1.Options then
     FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, [stMatchCase])
     else
     FoundAt := FindText(ReplaceDialog1.FindText, StartPos, ToEnd, []);

     end;

    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(ReplaceDialog1.FindText);
      RichEdit1.SelText:=ReplaceDialog1.ReplaceText;
    end
    else
    FindFlag:=1;
end;
end
else
RichEdit1.SelText:=ReplaceDialog1.ReplaceText;    

end;

procedure TForm1.Label1MouseLeave(Sender: TObject);
begin
 Label1.Color:=clBtnFace;
end;

procedure TForm1.Label2MouseLeave(Sender: TObject);
begin
 Label2.Color:=clBtnFace;
end;

procedure TForm1.Label3MouseLeave(Sender: TObject);
begin
 Label3.Color:=clBtnFace;
end;

procedure TForm1.Label5MouseLeave(Sender: TObject);
begin
 Label5.Color:=clBtnFace;
end;

procedure TForm1.Label4MouseLeave(Sender: TObject);
begin
 Label4.Color:=clBtnFace;
end;

procedure TForm1.Label6MouseLeave(Sender: TObject);
begin
 Label6.Color:=clBtnFace;
end;

procedure TForm1.Label7MouseLeave(Sender: TObject);
begin
 Label7.Color:=clBtnFace;
end;

procedure TForm1.N94Click(Sender: TObject);
begin
MyBuffer:='';
end;

procedure TForm1.N93Click(Sender: TObject);
begin
Flag1:=1;
RichEdit1.Lines.Insert(RichEdit1.CaretPos.Y,MyBuffer);
end;

procedure TForm1.N95Click(Sender: TObject);
begin
if HighLightFlag=False then
begin
HighLight;
HighLightFlag:=True;
N95.Checked:=True;
end
else
begin
UnHighLight;
HighLightFlag:=False;
N95.Checked:=False;
end;


end;

procedure TForm1.N39Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','iexplore.exe','http://ghost100.at.tut.by/',nil,SW_SHOW);
end;

 {procedure TForm1.WndProc(var Message: TMessage);
var
  p: TENLink;
  strURL: string;
begin
if FlagMask=1 then
  if (Message.Msg = WM_NOTIFY) then
  begin
    if (PNMHDR(Message.lParam).code = EN_LINK) then
    begin
      p := TENLink(Pointer(TWMNotify(Message).NMHdr)^);
      if (p.Msg = WM_LBUTTONDOWN) then
      begin
        SendMessage(RichEdit1.Handle, EM_EXSETSEL, 0, Longint(@(p.chrg)));
        strURL := RichEdit1.SelText;
        ShellExecute(Handle, 'open', PChar(strURL), 0, 0, SW_SHOWNORMAL);
      end;
    end;
  end;
 end; }


procedure TForm1.N96Click(Sender: TObject);
begin
Form7.Show;
end;



end.





