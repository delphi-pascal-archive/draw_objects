unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DrawObjects1, DrawObjects2, Menus, ComCtrls, Printers,
  Types, ClipBrd, ExtCtrls, ActnList, XPStyleActnCtrls, ActnMan, IniFiles,
  ExtDlgs;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    NewRectangle1: TMenuItem;
    NewDiamond1: TMenuItem;
    NewEllipse1: TMenuItem;
    NewArc1: TMenuItem;
    NewPolygon1: TMenuItem;
    NewStar1: TMenuItem;
    NewSolidArrow1: TMenuItem;
    NewSolidBezier1: TMenuItem;
    N1: TMenuItem;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    N3: TMenuItem;
    Delete1: TMenuItem;
    DisableDesigning1: TMenuItem;
    StatusBar1: TStatusBar;
    ColorDialog1: TColorDialog;
    N4: TMenuItem;
    GrowLine1: TMenuItem;
    N5: TMenuItem;
    NewLine1: TMenuItem;
    NewBezier1: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Rotate1: TMenuItem;
    NewPlainText1: TMenuItem;
    ScrollBox1: TScrollBox;
    N6: TMenuItem;
    Print1: TMenuItem;
    N7: TMenuItem;
    BringtoFront1: TMenuItem;
    SendtoBack1: TMenuItem;
    FontDialog1: TFontDialog;
    N9: TMenuItem;
    NewLLine1: TMenuItem;
    NewZLine1: TMenuItem;
    NewSolidPoint1: TMenuItem;
    SetBackgroundColor1: TMenuItem;
    ActionManager1: TActionManager;
    actRectangle: TAction;
    actDiamond: TAction;
    actEllipse: TAction;
    actPlainText: TAction;
    actArc: TAction;
    actPolygon: TAction;
    actStar: TAction;
    actArrow: TAction;
    actSolidBezier: TAction;
    actSolidPoint: TAction;
    actLine: TAction;
    actLLine: TAction;
    actZLine: TAction;
    actBezier: TAction;
    actBringToFront: TAction;
    actSendToBack: TAction;
    actProperties: TAction;
    Properties1: TMenuItem;
    actDelete: TAction;
    actCopy: TAction;
    actCopyAsBitmap: TAction;
    actPaste: TAction;
    actShrink: TAction;
    actRotate: TAction;
    Object1: TMenuItem;
    Properties2: TMenuItem;
    N10: TMenuItem;
    DeleteObjects1: TMenuItem;
    N11: TMenuItem;
    CopyFocusedObjects1: TMenuItem;
    CopyAllObjectsasImage1: TMenuItem;
    PasteObjects1: TMenuItem;
    N12: TMenuItem;
    GrowLine2: TMenuItem;
    Rotate2: TMenuItem;
    actPrint: TAction;
    actBackground: TAction;
    actSave: TAction;
    actOpen: TAction;
    actCopyAsMetafile: TAction;
    CopyAllObjectsasMetafile1: TMenuItem;
    Configure1: TMenuItem;
    DefaultLineProperties1: TMenuItem;
    DefaultSolidProperties1: TMenuItem;
    N13: TMenuItem;
    New1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    actPic: TAction;
    NewBitmapPic1: TMenuItem;
    actCut: TAction;
    CutFocusedObjects2: TMenuItem;
    SplitPolyButton1: TMenuItem;
    DeletePolyButton1: TMenuItem;
    actGrowTop: TAction;
    GrowLinefromTop1: TMenuItem;
    GrowLinefromTop2: TMenuItem;
    actShrinkTop: TAction;
    actGrow: TAction;
    ShrinkLinefromTop1: TMenuItem;
    ShrinkLinefromBottom1: TMenuItem;
    ShrinkLinefromTop2: TMenuItem;
    ShrinkLinefromBottom2: TMenuItem;
    actFlip: TAction;
    FlipHorizontally1: TMenuItem;
    N8: TMenuItem;
    UseTextDialogPrompt1: TMenuItem;
    actTextBezier: TAction;
    NewTextBezier1: TMenuItem;
    procedure NewSolidBezier1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure DisableDesigning1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure GrowLine1Click(Sender: TObject);
    procedure actSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actOpenClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Rotate1Click(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure actPrintClick(Sender: TObject);
    procedure CopyObject1Click(Sender: TObject);
    procedure PasteObject1Click(Sender: TObject);
    procedure CopyAsBitmapClick(Sender: TObject);
    procedure BringtoFront1Click(Sender: TObject);
    procedure SendtoBack1Click(Sender: TObject);
    procedure Properties1Click(Sender: TObject);
    procedure ScrollBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actBackgroundClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure actCopyAsMetafileClick(Sender: TObject);
    procedure DefaultLineProperties1Click(Sender: TObject);
    procedure DefaultSolidProperties1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCutExecute(Sender: TObject);
    procedure SplitPolyButton1Click(Sender: TObject);
    procedure DeletePolyButton1Click(Sender: TObject);
    procedure ShrinkLine1Click(Sender: TObject);
    procedure actFlipExecute(Sender: TObject);
    procedure UseTextDialogPrompt1Click(Sender: TObject);
  private
    popupPt: TPoint;
    tmpLine: TLine;
    tmpSolid: TRectangle;
    fPastingFromClipboard: boolean;
    procedure DrawFocusRec(Rec: TRect);
    procedure ClearAllDrawObjFocuses;
    function ScrollboxHasDrawObjects: boolean;
    procedure DrawObjMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DrawObjMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DrawObjDblClick(Sender: TObject);
    procedure CountFocusedDrawObjs(out cnt: integer; out last: TDrawObject);
    function GetSolidObjFromScreenPt(pt: TPoint): TSolid;
    procedure DrawObjLoaded(Sender: TObject);
    procedure ObjectInspectorClose(Sender: TObject);
    procedure LoadIniSettings;
    procedure SaveIniSettings;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CF_DRAWOBJECTS: Cardinal;
const
  GridSize: integer = 4; // screen res = 96ppi, so ~4px per mm.

implementation

uses rotation, objInspector, preview;

{$R *.dfm}
{$R winxp.res}

//------------------------------------------------------------------------------
// Miscellaneous functions ...
//------------------------------------------------------------------------------

function min(val1, val2: integer): integer;
begin
  if val2 < val1 then result := val2 else result := val1;
end;
//------------------------------------------------------------------------------

function max(val1, val2: integer): integer;
begin
  if val2 > val1 then result := val2 else result := val1;
end;
//------------------------------------------------------------------------------

function ScreenToPrinterX(pxl: integer): integer;
begin
  Result := round(pxl *
    GetDeviceCaps(Printer.Handle, LOGPIXELSX)/screen.PixelsPerInch);
end;
//------------------------------------------------------------------------------

function ScreenToPrinterY(pxl: integer): integer;
begin
  Result := round(pxl *
    GetDeviceCaps(Printer.Handle, LOGPIXELSY)/screen.PixelsPerInch);
end;
//------------------------------------------------------------------------------

function MakeDarker(color: TColor): TColor;
var
  r,g,b: byte;
begin
  Color := ColorToRGB(color);
  b := (Color shr 16) and $FF;
  g := (Color shr 8) and $FF;
  r := (Color and $FF);
  b := b * 15 div 16;
  g := g * 15 div 16;
  r := r * 15 div 16;
  result := (b shl 16) or (g shl 8) or r;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure TForm1.FormCreate(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(paramstr(0));
  OpenDialog1.InitialDir := ExtractFilePath(paramstr(0));
  OpenPictureDialog1.InitialDir := ExtractFilePath(paramstr(0));
  ColorDialog1.CustomColors.Add('ColorA=' + inttohex(ColorToRGB(color),6));
  ColorDialog1.CustomColors.Add('ColorB=' + inttohex(ColorToRGB(clCream),6));
  ColorDialog1.CustomColors.Add('ColorC=' + inttohex(ColorToRGB(clMoneyGreen),6));
  ColorDialog1.CustomColors.Add('ColorD=' + inttohex(ColorToRGB(clSkyBlue),6));

  tmpLine := TLine.Create(self);
  tmpLine.Name := 'DefaultLine';
  tmpLine.CanFocus := false;
  tmpLine.CanMove := false;
  tmpLine.Arrow2 := true;

  tmpSolid := TRectangle.Create(self);
  tmpSolid.Name := 'DefaultSolid';
  tmpSolid.Strings.Text := 'DefaultSolid';
  tmpSolid.CanFocus := false;
  tmpSolid.CanMove := false;

  LoadIniSettings;
  CF_DRAWOBJECTS := RegisterClipboardFormat('DrawObjects Format');
end;
//------------------------------------------------------------------------------

procedure TForm1.FormDestroy(Sender: TObject);
begin
  SaveIniSettings;
  tmpLine.Free;
  tmpSolid.Free;
end;
//------------------------------------------------------------------------------

procedure TForm1.LoadIniSettings;
var
  l,t,w,h: integer;
begin
  with TIniFile.Create(changeFileExt(paramstr(0),'.ini')) do
  try
    //mainform position ...
    l := ReadInteger('MainWinPos','Left',MaxInt);
    t := ReadInteger('MainWinPos','Top',MaxInt);
    w := ReadInteger('MainWinPos','Width',100);
    h := ReadInteger('MainWinPos','Height',100);
    if (l <> MaxInt) and (t <> MaxInt) and (w > 100) and (h > 100) then
    begin
      if (l < 0) and (t < 0) then
        WindowState := wsMaximized
      else
      begin
        Position := poDesigned;
        if l + w > Screen.WorkAreaWidth then l := Screen.WorkAreaWidth - w;
        if t + h > Screen.WorkAreaHeight then t := Screen.WorkAreaHeight - h;
        setbounds(l,t,w,h);
      end;
    end;

    tmpLine.Color := TColor(ReadInteger('DefLine','Color',$FFFFFF)); //ie filled beziers

    tmpLine.ShadowSize := ReadInteger('DefLine','ShadowSize',2);
    tmpLine.ColorShadow := TColor(ReadInteger('DefLine','ShadowColor',$C0C0C0));

    tmpLine.Pen.Color := TColor(ReadInteger('DefLine','PenColor',$000000));
    tmpLine.Pen.Width := ReadInteger('DefLine','PenWidth', tmpLine.Pen.Width);
    tmpLine.Pen.Style := TPenStyle(byte(ReadInteger('DefLine','PenStyle', 0)));

    tmpSolid.Font.Name := ReadString('DefSolid','FontName', Font.Name);
    tmpSolid.Font.Size := ReadInteger('DefSolid','FontSize', Font.Size);
    tmpSolid.Font.Style := TFontStyles(byte(ReadInteger('DefSolid','FontStyle', 1)));
    tmpSolid.Color := TColor(ReadInteger('DefSolid','Color',$EEEEEE));
    tmpSolid.ShadowSize := ReadInteger('DefSolid','ShadowSize',2);
    tmpSolid.ColorShadow := TColor(ReadInteger('DefSolid','ShadowColor',$C0C0C0));

    tmpSolid.Pen.Color := TColor(ReadInteger('DefSolid','PenColor',$000000));
    tmpSolid.Pen.Width := ReadInteger('DefSolid','PenWidth', tmpLine.Pen.Width);
    tmpSolid.Pen.Style := TPenStyle(byte(ReadInteger('DefSolid','PenStyle', 0)));

    color := TColor(ReadInteger('Background','Color', integer(color)));

  finally
    free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.SaveIniSettings;
begin
  with TIniFile.Create(changeFileExt(paramstr(0),'.ini')) do
  try
    WriteInteger('MainWinPos','Left',left);
    WriteInteger('MainWinPos','Top',top);
    WriteInteger('MainWinPos','Width',width);
    WriteInteger('MainWinPos','Height',height);

    WriteInteger('DefLine','Color',integer(tmpLine.Color));

    WriteInteger('DefLine','ShadowSize',tmpLine.ShadowSize);
    WriteInteger('DefLine','ShadowColor',integer(tmpLine.ColorShadow));

    WriteInteger('DefLine','PenColor',integer(tmpLine.Pen.Color));
    WriteInteger('DefLine','PenWidth', tmpLine.Pen.Width);
    WriteInteger('DefLine','PenStyle', byte(tmpLine.Pen.Style));

    WriteString('DefSolid','FontName', tmpSolid.Font.Name);
    WriteInteger('DefSolid','FontSize', tmpSolid.Font.Size);
    WriteInteger('DefSolid','FontStyle', byte(tmpSolid.Font.Style));
    WriteInteger('DefSolid','Color',integer(tmpSolid.Color));
    WriteInteger('DefSolid','ShadowSize',tmpSolid.ShadowSize);
    WriteInteger('DefSolid','ShadowColor',integer(tmpSolid.ColorShadow));

    WriteInteger('DefSolid','PenColor',integer(tmpSolid.Pen.Color));
    WriteInteger('DefSolid','PenWidth', tmpLine.Pen.Width);
    WriteInteger('DefSolid','PenStyle', byte(tmpSolid.Pen.Style));

    WriteInteger('Background','Color', integer(color));
  finally
    free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.ClearAllDrawObjFocuses;
var
  i: integer;
begin
  //hide design buttons & bounding rect for all TDrawObjects ...
  with ScrollBox1 do
    for i := 0 to controlCount -1 do
      if Controls[i] is TDrawObject then
        TDrawObject(Controls[i]).Focused := false;
end;
//------------------------------------------------------------------------------

function TForm1.ScrollboxHasDrawObjects: boolean;
var
  i: integer;
begin
  result := true;
  with ScrollBox1 do for i := 0 to controlCount -1 do
    if Controls[i] is TDrawObject then exit;
  result := false;
end;
//------------------------------------------------------------------------------

procedure TForm1.CountFocusedDrawObjs(out cnt: integer; out last: TDrawObject);
var
  i: integer;
begin
  //Count 'focused' TDrawObjects (ie with visible designer buttons).
  //nb: TGraphicControl descendants never get real 'focus' (ie they don't
  //respond directly to keyboard input).
  cnt := 0;
  last := nil;
  with ScrollBox1 do
    for i := 0 to controlCount -1 do
      if (Controls[i] is TDrawObject) and TDrawObject(Controls[i]).Focused then
      begin
        last := TDrawObject(Controls[i]);
        inc(cnt);
      end;
end;
//------------------------------------------------------------------------------

procedure TForm1.ScrollBox1Click(Sender: TObject);
begin
  ClearAllDrawObjFocuses;
end;
//------------------------------------------------------------------------------

procedure TForm1.DisableDesigning1Click(Sender: TObject);
var
  i: integer;
begin
  DisableDesigning1.Checked := not DisableDesigning1.Checked;
  with ScrollBox1 do
    for i := 0 to controlCount -1 do
      if Controls[i] is TDrawObject then
      begin
        TDrawObject(Controls[i]).CanFocus := not DisableDesigning1.Checked;
        //nb: objects can still be moved even when not 'Focused' unless ...
        TDrawObject(Controls[i]).CanMove := not DisableDesigning1.Checked;
      end;
end;
//------------------------------------------------------------------------------

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var
  i,cnt: integer;
  drawObj: TDrawObject;
begin
  //first, get the location for the new control (in case adding an Object) ...
  GetCursorPos(popupPt);

  //now only show the popup menuitems relevant to focused controls ...
  CountFocusedDrawObjs(cnt, drawObj);
  ActProperties.Enabled := (cnt = 1);
  actDelete.Visible := (cnt > 0);

  actGrow.Visible := (cnt = 1) and
    (drawObj is TConnector) and not TConnector(drawObj).IsConnected;
  actGrowTop.Visible := actGrow.Visible;

  actShrink.Visible := actGrow.Visible and
    (((drawObj is TBezier) and (drawObj.ButtonCount > 4)) or
    (not (drawObj is TBezier) and (drawObj.ButtonCount > 2)));
  actShrinkTop.Visible := actShrink.Visible;

  actRotate.Visible := (cnt = 1);
  actCut.Enabled := (cnt > 0);
  actCopy.Enabled := (cnt > 0);
  actPaste.Enabled := clipboard.HasFormat(CF_DRAWOBJECTS);
  actCopyAsBitmap.Enabled := ScrollboxHasDrawObjects;
  actCopyAsMetafile.Enabled := actCopyAsBitmap.Enabled;
  actPrint.Enabled := actCopyAsBitmap.Enabled;
  actBringtoFront.Visible := (cnt = 1);
  actSendtoBack.Visible := (cnt = 1);
  actFlip.Visible := (cnt = 1) and
    ((drawObj is TPolygon) or (drawObj is TSolidBezier));

  splitPolyButton1.Visible :=
    (cnt = 1) and (drawObj is TPolygon) and not (drawObj is TStar) and
    (TPolygon(drawObj).BtnIdxFromPt(TPolygon(drawObj).ScreenToClient(popupPt),true,i));
  deletePolyButton1.Visible :=
    splitPolyButton1.Visible and (TPolygon(drawObj).ButtonCount > 3);
end;
//------------------------------------------------------------------------------

procedure TForm1.NewSolidBezier1Click(Sender: TObject);
var
  drawObj: TDrawObject;
  str: string;
begin
  ClearAllDrawObjFocuses;

  //create a new DrawObject control ...
  if Sender = actRectangle then
    drawObj := TRectangle.Create(self)
  else if Sender = actDiamond then
    drawObj := TDiamond.Create(self)
  else if Sender = actEllipse then
    drawObj := TEllipse.Create(self)
  else if Sender = actPlainText then
    drawObj := TText.Create(self)
  else if Sender = actArc then
    drawObj := TArc.Create(self)
  else if Sender = actPolygon then
    drawObj := TPolygon.Create(self)
  else if Sender = actStar then
    drawObj := TStar.Create(self)
  else if Sender = actArrow then
    drawObj := TSolidArrow.Create(self)
  else if Sender = actTextBezier then
    drawObj := TTextBezier.Create(self)
  else if Sender = actSolidBezier then
    drawObj := TSolidBezier.Create(self)
  else if Sender = actLine then
    drawObj := TLine.Create(self)
  else if Sender = actBezier then
    drawObj := TBezier.Create(self)
  else if Sender = actLLine then
    drawObj := TLLine.Create(self)
  else if Sender = actZLine then
    drawObj := TZLine.Create(self)
  else if Sender = actSolidPoint then
    drawObj := TSolidPoint.Create(self)
  else if (Sender = actPic) then
  begin
    if not OpenPictureDialog1.Execute then exit;
    drawObj := TPic.Create(self);
    TPic(drawObj).LoadPicFromFile(OpenPictureDialog1.FileName);
  end
  else exit;

  MakeNameForControl(drawObj);
  drawObj.parent := ScrollBox1;
  DrawObjLoaded(drawObj);
  with ScreenToClient(popupPt) do
  begin
    drawObj.Left := X;
    drawObj.Top := Y;
  end;

  //assign the object with customizable 'default' properties ...
  if (drawObj is TSolidPoint) then
  begin
    drawObj.ShadowSize := tmpLine.ShadowSize;
    drawObj.ColorShadow := tmpLine.ColorShadow;
    drawObj.Pen.Color := tmpLine.Pen.Color;
  end
  else if (drawObj is TTextBezier) then
  begin
    drawObj.ColorShadow := tmpSolid.ColorShadow;
    TTextBezier(drawObj).Font.Assign(tmpSolid.Font);
    TTextBezier(drawObj).Font.Style := [fsBold];
    drawObj.ShadowSize := tmpSolid.ShadowSize;
    if UseTextDialogPrompt1.Checked and
      InputQuery(application.Title, 'Enter caption:', str) then
        TTextBezier(drawObj).Text := str;
  end
  else if (drawObj is TSolid) or (drawObj is TSolidBezier) then
  begin
    drawObj.Color := tmpSolid.Color;
    drawObj.ColorShadow := tmpSolid.ColorShadow;
    if drawObj is TSolidWithText then
    begin
      TSolidWithText(drawObj).Font.Assign(tmpSolid.Font);
      TSolidWithText(drawObj).Padding := tmpSolid.Padding;
    end;
    drawObj.Pen.Assign(tmpSolid.Pen);
    if (drawObj is TSolidBezier) then drawObj.Pen.Width := 20;
    drawObj.ShadowSize := tmpSolid.ShadowSize;

    if drawObj is TSolidWithText and UseTextDialogPrompt1.Checked and
      InputQuery(application.Title, 'Enter caption:', str) then
        TSolidWithText(drawObj).strings.Text := str;

  end
  else if (drawObj is TConnector) then
  begin
    drawObj.Color := tmpLine.Color; //ie 'filled' beziers
    drawObj.ColorShadow := tmpLine.ColorShadow;
    drawObj.Pen.Assign(tmpLine.Pen);
    drawObj.ShadowSize := tmpLine.ShadowSize;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.DrawObjLoaded(Sender: TObject);
begin
  with TDrawObject(Sender) do
  begin
    OnMouseDown := DrawObjMouseDown;
    OnMouseMove := DrawObjMouseMove;
    OnDblClick := DrawObjDblClick;
    CanFocus := not DisableDesigning1.Checked;
    CanMove := CanFocus;
    Focused := CanFocus;
    //if pasting from the clipboard, offset new objects slightly ...
    if fPastingFromClipboard then
    begin
      left := left + 10;
      top := top + 10;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.UseTextDialogPrompt1Click(Sender: TObject);
begin
  UseTextDialogPrompt1.Checked := not UseTextDialogPrompt1.Checked;
end;
//------------------------------------------------------------------------------

procedure TForm1.Delete1Click(Sender: TObject);
var
  i: integer;
begin
  //delete TDrawObject controls that have focus ...
  with ScrollBox1 do
    for i := controlCount -1 downto 0 do
      if (Controls[i] is TDrawObject) and TDrawObject(Controls[i]).Focused then
        Controls[i].Free;
end;
//------------------------------------------------------------------------------

procedure TForm1.BringtoFront1Click(Sender: TObject);
var
  cnt: integer;
  drawObj: TDrawObject;
begin
  CountFocusedDrawObjs(cnt, drawObj);
  if (cnt = 1) then drawObj.BringToFront;
end;
//------------------------------------------------------------------------------

procedure TForm1.SendtoBack1Click(Sender: TObject);
var
  cnt: integer;
  drawObj: TDrawObject;
begin
  CountFocusedDrawObjs(cnt, drawObj);
  if (cnt = 1) then drawObj.SendToBack;
end;
//------------------------------------------------------------------------------

procedure TForm1.actBackgroundClick(Sender: TObject);
begin
  ColorDialog1.Color := color;
  if ColorDialog1.Execute then color := ColorDialog1.Color;
end;
//------------------------------------------------------------------------------

procedure TForm1.CopyObject1Click(Sender: TObject);
var
  i: integer;
  theList: TList;
  theStrings: TStringList;

  Data: THandle;
  DataPtr: Pointer;
  str: string;
begin
  theStrings := TStringList.create;
  theList := TList.create;
  try
    //copy all objects ...
    with ScrollBox1 do for i := 0 to controlCount -1 do
      if Controls[i] is TDrawObject and TDrawObject(Controls[i]).Focused then
        theList.Add(Controls[i]);
    if theList.Count = 0 then exit;
    SaveDrawObjectsToStrings(theList, theStrings);

    //clipboard.AsText := theStrings.Text;
    //let's use a custom clipboard format instead ...
    str := theStrings.Text;
    Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, length(str)+1);
    try
      DataPtr := GlobalLock(Data);
      try
        Move(pchar(str)^, DataPtr^, length(str)+1);
        clipboard.Open;
        try
          clipboard.clear;
          SetClipboardData(CF_DRAWOBJECTS, Data);
        finally
          clipboard.Close;
        end;
      finally
        GlobalUnlock(Data);
      end;
    except
      GlobalFree(Data);
    end;

  finally
    theStrings.Free;
    theList.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.actCutExecute(Sender: TObject);
begin
  CopyObject1Click(Sender);
  Delete1Click(Sender);
end;
//------------------------------------------------------------------------------

procedure TForm1.CopyAsBitmapClick(Sender: TObject);
var
  i,l,t,w,h: integer;
  bmp: TBitmap;
begin
  l := maxInt; t := MaxInt;
  w := 0; h := 0;
  with ScrollBox1 do for i := 0 to controlCount -1 do
    if Controls[i] is TDrawObject then
      with TDrawObject(Controls[i]) do
      begin
        l := min(l, left);
        t := min(t, top);
        w := max(w, left + width);
        h := max(h, top + height);
      end;
  if (w = 0) or (h = 0) then exit;

  bmp := TBitmap.Create;
  bmp.Width := w - l; bmp.Height := h -t;
  bmp.Canvas.Brush.Color := self.Color;
  bmp.Canvas.FillRect(Rect(0,0,w,h));
  try
    //we could use either the DrawObject.bitmap property or
    //the DrawObject.Draw() method here since no scaling is required ...
    with ScrollBox1 do for i := 0 to controlCount -1 do
      if Controls[i] is TDrawObject then
        with TDrawObject(Controls[i]) do
          draw(bmp.Canvas, left -l, top - t);

    Clipboard.SetAsHandle(CF_BITMAP, bmp.Handle);
  finally
    bmp.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.actCopyAsMetafileClick(Sender: TObject);
var
  i,l,t,w,h: integer;
  mf: TMetafile;
  mfc: TMetafileCanvas;
begin
  l := maxInt; t := MaxInt;
  w := 0; h := 0;
  with ScrollBox1 do for i := 0 to controlCount -1 do
    if Controls[i] is TDrawObject then
      with TDrawObject(Controls[i]) do
      begin
        l := min(l, left);
        t := min(t, top);
        w := max(w, left + width);
        h := max(h, top + height);
      end;
  if (w = 0) or (h = 0) then exit;

  mf := TMetafile.Create;
  try
    mf.Width := w - l; mf.Height := h -t;
    mfc := TMetafileCanvas.Create(mf, 0);
    try                              
      with ScrollBox1 do for i := 0 to controlCount -1 do
        if (Controls[i] is TDrawObject) then with TDrawObject(Controls[i]) do
          Draw(mfc, left - l, top - t);
    finally
      FreeAndNil(mfc);
    end;
    ClipBoard.SetAsHandle(CF_ENHMETAFILE, mf.Handle);
  finally
    mf.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.PasteObject1Click(Sender: TObject);
var
  theStrings: TStringList;
  Data: THandle;
  str: string;
begin
  if not clipboard.HasFormat(CF_DRAWOBJECTS) then exit;
  ClearAllDrawObjFocuses;

  fPastingFromClipboard := true;
  theStrings := TStringList.create;
  try

    //theStrings.Text := clipboard.AsText;
    str := '';
    clipboard.Open;
    try
      Data := GetClipboardData(CF_DRAWOBJECTS);
      if Data <> 0 then
      try
        str := PChar(GlobalLock(Data));
      finally
        GlobalUnlock(Data);
      end;
    finally
      clipboard.Close;
    end;
    theStrings.Text := str;

    LoadDrawObjectsFromStrings(theStrings, self, ScrollBox1, DrawObjLoaded);
  finally
    theStrings.Free;
    fPastingFromClipboard := false;
  end;

end;
//------------------------------------------------------------------------------

procedure TForm1.GrowLine1Click(Sender: TObject);
var
  cnt: integer;
  drawObj: TDrawObject;
begin
  CountFocusedDrawObjs(cnt, drawObj);
  if (cnt = 1) and (drawObj is TConnector) and
    not assigned(TConnector(drawObj).Connection2) then
      TConnector(drawObj).Grow( Sender = actGrowTop );
end;
//------------------------------------------------------------------------------

procedure TForm1.ShrinkLine1Click(Sender: TObject);
var
  cnt: integer;
  drawObj: TDrawObject;
begin
  CountFocusedDrawObjs(cnt, drawObj);
  if (cnt = 1) and (drawObj is TConnector) and
    not assigned(TConnector(drawObj).Connection2) then
      TConnector(drawObj).Shrink( Sender = actShrinkTop );
end;
//------------------------------------------------------------------------------

procedure TForm1.Rotate1Click(Sender: TObject);
var
  cnt: integer;
begin
  with TRotationForm.Create(self) do
  try
    //nb: RotationObject owned by TRotationForm
    CountFocusedDrawObjs(cnt, RotationObject);
    if (cnt <> 1) then exit;

    left := ScrollBox1.ClientOrigin.X + RotationObject.Left + RotationObject.Width +10;
    top := ScrollBox1.ClientOrigin.Y + RotationObject.Top + RotationObject.Height +10;

    if RotationObject is TSolidWithText then
      TrackBar1.Position := TSolidWithText(RotationObject).angle
    else if RotationObject is TPic then
      TrackBar1.Position := TPic(RotationObject).angle;
    RotationObject.BeginTransform;
    //TRotationForm calls the DrawObject.Rotate() method passing the
    //rotation angle indicated by TRotationForm's slider position...
    ShowModal;
    RotationObject.EndTransform;
  finally
    free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.SplitPolyButton1Click(Sender: TObject);
var
  i,cnt: integer;
  drawObj: TDrawObject;
begin
  //split a polygon button into 2 buttons ...
  CountFocusedDrawObjs(cnt, drawObj);
  if not (cnt = 1) or not (drawObj is TPolygon) or (drawObj is TStar) then exit;

  with TPolygon(drawObj) do
    if BtnIdxFromPt(ScreenToClient(popupPt),true,i) then DuplicateButton(i);
end;
//------------------------------------------------------------------------------

procedure TForm1.DeletePolyButton1Click(Sender: TObject);
var
  i,cnt: integer;
  drawObj: TDrawObject;
begin
  //remove a polygon button ...
  CountFocusedDrawObjs(cnt, drawObj);
  if not (cnt = 1) or not (drawObj is TPolygon) or (drawObj is TStar) then exit;

  with TPolygon(drawObj) do
    if BtnIdxFromPt(ScreenToClient(popupPt),true,i) then RemoveButton(i);
end;
//------------------------------------------------------------------------------

procedure TForm1.actFlipExecute(Sender: TObject);
var
  cnt: integer;
  drawObj: TDrawObject;
begin
  CountFocusedDrawObjs(cnt, drawObj);
  if (drawObj is TPolygon) then TPolygon(drawObj).Mirror
  else if (drawObj is TSolidBezier) then TSolidBezier(drawObj).Mirror;
end;
//------------------------------------------------------------------------------

var startDragPt: TPoint;
//Implement drag moving of multiple objects ...
procedure TForm1.DrawObjMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not (ssShift in Shift) and not TDrawObject(Sender).Focused then
      ClearAllDrawObjFocuses;
  startDragPt := Point(X,Y);
end;
//------------------------------------------------------------------------------

procedure TForm1.DrawObjMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  i: integer;
begin
  //drag move all focused objects ...
  if not (ssLeft in Shift) then exit;
  with ScrollBox1 do
    for i := 0 to ControlCount -1 do
      if (Controls[i] is TDrawObject) and TDrawObject(Controls[i]).Focused
        and (Controls[i] <> Sender) then //nb: sender moves itself
      begin
        //let connected lines move themselves ...
        if (Controls[i] is TConnector) and
          TConnector(Controls[i]).IsConnected then continue;

        Controls[i].Left := Controls[i].Left + (X - startDragPt.X);
        Controls[i].top := Controls[i].top + (Y - startDragPt.Y);
      end;
end;
//------------------------------------------------------------------------------

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  //because the 'Object Inspector' shows non-Modal we need to block
  //the mainform from responding to shortcut keys until it regains focus ...
  ActionManager1.State := asSuspended;
end;
//------------------------------------------------------------------------------

procedure TForm1.FormActivate(Sender: TObject);
begin
  ActionManager1.State := asNormal;
end;
//------------------------------------------------------------------------------

//Show the 'Object Inspector' to modify the properties of a DrawObject ...
procedure TForm1.Properties1Click(Sender: TObject);
var
  topLeftPt: TPoint;
  cnt: integer;
  drawObj: TDrawObject;
begin
  CountFocusedDrawObjs(cnt, drawObj);
  if (cnt <> 1) then exit;

  //initialize and display the "object inspector" ...
  with TObjInspectForm.Create(self) do
  begin
    //assign the object and list of properties to ignore ...
    if (drawObj is TSolidBezier) or (drawObj is TTextBezier) then
      AssignObj(drawObj, ['Arrow1','Arrow2','Action','ButtonSize',
        'CanFocus','CanMove','Cursor','Filled','Focused','HelpContext','HelpKeyword',
        'HelpType','Hint','ParentFont','PopupMenu','Tag'])
    else if drawObj is TConnector then
      AssignObj(drawObj, ['Action','ButtonSize','CanFocus','CanMove',
      'Cursor','Focused','HelpContext',
        'HelpKeyword','HelpType','Hint','ParentFont','PopupMenu','Tag'])
    else
      AssignObj(drawObj, ['Action','ButtonSize','CanFocus','CanMove','Cursor',
        'Focused','HelpContext','HelpKeyword','HelpType','Hint','ParentFont',
        'PopupMenu','Tag']);

    //position the "object inspector" window ...
    with drawObj do
      topLeftPt := Point(left+width + 10, top -10);
    with self.ClientOrigin do OffsetPt(topLeftPt, X, Y);
    left := topLeftPt.X;
    top := topLeftPt.Y;
    if Top + Height > screen.WorkAreaHeight then
      top := screen.WorkAreaHeight - height;
    //now display it...
    Show;
    //nb: it'll free itself when it loses focus
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.DefaultLineProperties1Click(Sender: TObject);
var
  rec: TRect;
begin
  //initialize and display the "object inspector" ...
  with TObjInspectForm.Create(self) do
  begin
    //a bit of fancy stuff to display the default TLine in
    //the "object inspector" ...
    pnlBottom.Height := 60;
    pnlBottom.ParentBackground := false; //themes workaround
    pnlBottom.Color := self.Color;
    rec := pnlBottom.ClientRect;
    inflateRect(rec,-20,-10);
    tmpLine.Parent := pnlBottom;
    with rec do tmpLine.SetBounds(left,top,right-left,bottom-top);
    OnClosing := ObjectInspectorClose;

    //assign the object and list of properties to ignore ...
    AssignObj(tmpLine, ['Action','Arrow1','Arrow2','ButtonSize','ButtonCount',
      'Canfocus','CanMove','Connection1','Connection2','Cursor',
      'Focused','Height','HelpContext','HelpKeyword','HelpType','Hint',
      'Left','Name','PopupMenu','Tag','Top','Width']);
    position := poMainFormCenter;
    //now display it...
    Show;
    //nb: TObjInspectForm will free itself when it loses focus
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.DefaultSolidProperties1Click(Sender: TObject);
var
  rec: TRect;
begin
  //initialize and display the "object inspector" ...
  with TObjInspectForm.Create(self) do
  begin
    //a bit of fancy stuff to display the default TSolid in
    //the "object inspector" ...
    pnlBottom.Height := 80;
    pnlBottom.ParentBackground := false; //themes workaround
    pnlBottom.Color := self.Color;
    rec := pnlBottom.ClientRect;
    inflateRect(rec,-10,-10);
    tmpSolid.Parent := pnlBottom;
    with rec do tmpSolid.SetBounds(left,top,right-left,bottom-top);
    OnClosing := ObjectInspectorClose;

    //assign the object and list of properties to ignore ...
    AssignObj(tmpSolid, ['Action','Angle','ButtonSize',
      'Canfocus','CanMove','Centered','Cursor','Focused','Height','HelpContext',
      'HelpKeyword','HelpType','Hint','Left','Name','ParentFont',
      'PopupMenu','Rounded','Strings','Tag','Top','Width']);
    position := poMainFormCenter;

    //now display it...
    Show;
    //nb: TObjInspectForm will free itself when it loses focus
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.ObjectInspectorClose(Sender: TObject);
begin
  tmpLine.Parent := nil;
  tmpSolid.Parent := nil;
end;
//------------------------------------------------------------------------------


//GetSolidObjFromScreenPt(): Helper method for attaching TLines to TSolids ...
function TForm1.GetSolidObjFromScreenPt(pt: TPoint): TSolid;
var
  i: integer;
begin
  with ScrollBox1 do
    for i := 0 to controlCount -1 do
      if (Controls[i] is TSolid) and
        TSolid(Controls[i]).PointOverObject(pt) then
      begin
        result := TSolid(Controls[i]);
        exit;
      end;
  result := nil;
end;
//------------------------------------------------------------------------------

//when double-clicking an end button of a line (TConnector) object,
//let's make it connect to an underlying solid object if there is one ...
procedure TForm1.DrawObjDblClick(Sender: TObject);
var
  pt: TPoint;
  btnIdx: integer;
  solid: TSolid;
begin
  //check if there's a TSolid under the cursor point ...
  GetCursorPos(pt);
  solid := GetSolidObjFromScreenPt(pt);
  if not (Sender is TConnector) or not assigned(solid) then
  begin
    Properties1Click(sender);
    exit;
  end;

  //also check if a TDrawObject designer 'button' is under the cursor point ...
  pt := TConnector(Sender).ScreenToClient(pt);
  if not TConnector(Sender).BtnIdxFromPt(pt,true, btnIdx) then
  begin
    Properties1Click(sender);
    exit;
  end;

  if (btnIdx = 0) then
  begin
    //the button at the beginning of the line was clicked, so ...
    TConnector(Sender).Connection1 := solid;
  end else if (btnIdx = TConnector(Sender).ButtonCount -1) then
  begin
    //the button at the end of the line was clicked, so ...
    TConnector(Sender).Connection2 := solid;
    //let's give it an arrow too ...
    TConnector(Sender).Arrow2 := true;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.New1Click(Sender: TObject);
var
  i: integer;
begin
  //clear all DrawObjects
  with ScrollBox1 do
    for i := controlCount -1 downto 0 do
      if Controls[i] is TDrawObject then Controls[i].free;
  caption := Application.title + ' - [untitled]';
  SaveDialog1.FileName := '';
end;
//------------------------------------------------------------------------------

procedure TForm1.actOpenClick(Sender: TObject);
var
  strings: TStringList;
begin
  if not OpenDialog1.Execute then exit;
  //first clear existing objects ...
  New1Click(nil);
  //now load new objects from file ...
  strings := TStringList.Create;
  try
    strings.LoadFromFile(OpenDialog1.FileName);
    DrawObjects1.LoadDrawObjectsFromStrings(strings, self, ScrollBox1, DrawObjLoaded);
    ClearAllDrawObjFocuses;
    caption := Application.title + ' - ' + extractfilename(OpenDialog1.FileName);
    SaveDialog1.FileName := OpenDialog1.FileName;
  finally
    strings.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.actSaveClick(Sender: TObject);
var
  i: integer;
  saveList: TList;
  strings: TStringList;
begin
  saveList := TList.Create;
  strings := TStringList.Create;
  try
    with ScrollBox1 do
      for i := 0 to controlCount -1 do
        if (Controls[i] is TDrawObject) then saveList.Add(Controls[i]);
    if (saveList.Count = 0) or not SaveDialog1.Execute then exit;
    DrawObjects1.SaveDrawObjectsToStrings(saveList, strings);
    strings.SaveToFile(SaveDialog1.FileName);
    caption := Application.title + ' - ' + extractfilename(SaveDialog1.FileName);
  finally
    saveList.Free;
    strings.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.Exit1Click(Sender: TObject);
begin
  close;
end;
//------------------------------------------------------------------------------

procedure TForm1.actPrintClick(Sender: TObject);
var
  i: integer;
  mf: TMetafile;
  mfc: TMetafileCanvas;
  srcRec: TRect;
begin
  srcRec := Rect(maxInt, maxInt, 0, 0);
  mf := TMetafile.Create;
  with ScrollBox1 do
  try
    //first, calculate the dimensions of the metafile ...
    for i := 0 to ControlCount -1 do
      if (Controls[i] is TDrawObject) then
        with TDrawObject(Controls[i]) do
        begin
          srcRec.Left := min(srcRec.Left, left);
          srcRec.Top := min(srcRec.Top, top);

          srcRec.Right := max(srcRec.Right, left + width);
          srcRec.Bottom := max(srcRec.Bottom, top + height);
        end;
    if (srcRec.Left = maxInt) then exit; //ie quit if no objects
    mf.Width := srcRec.Right - srcRec.Left;
    mf.Height := srcRec.Bottom - srcRec.Top;

    //now, draw each DrawObject onto a metafile canvas ...
    //Notes:
    //1. Designer buttons etc will not be drawn using either TDrawObject.Bitmap
    //   property or the TDrawObject.Draw() method.
    //2. When metafile scaling is required (eg when printing, where screen
    //   pixel sizes are (very much) larger than printer pixel sizes), it's
    //   vastly preferable to Draw() to a metafile canvas rather than simply
    //   'stretching' bitmaps to a canvas otherwise marked pixelation will occur.
    mfc := TMetafileCanvas.Create(mf, 0);
    try
      for i := 0 to ControlCount -1 do
        if (Controls[i] is TDrawObject) then with TDrawObject(Controls[i]) do
          Draw(mfc, left - srcRec.Left, top - srcRec.Top);
    finally
      FreeAndNil(mfc);
    end;

    //now preview the metafile ...
    with TPrintPreviewForm.Create(self) do
    try
      assignMetafile(mf);
      ShowModal;
    finally
      free;
    end;
  finally
    mf.Free;
  end;
end;
//------------------------------------------------------------------------------

//Implement rubberband selection of objects ...
var
  SelectionRec: TRect;
  SelectionShape: TShape;

procedure TForm1.DrawFocusRec(Rec: TRect);
begin
  if not Assigned(SelectionShape) then
  begin
    SelectionShape := TShape.create(self);
    SelectionShape.Parent := ScrollBox1;
    SelectionShape.Brush.Style := bsClear;
    SelectionShape.Pen.Style := psDot;
  end;
  with Rec do
    SelectionShape.SetBounds(left,top,right-left, bottom-top);
end;
//------------------------------------------------------------------------------

function NormalizeRect(r: TRect): TRect;
begin
  if r.Left < r.Right then
  begin
    result.Left := r.Left; result.Right := r.Right;
  end else
  begin
    result.Left := r.Right; result.Right := r.Left;
  end;
  if r.Top < r.Bottom then
  begin
    result.Top := r.Top; result.Bottom := r.Bottom;
  end else
  begin
    result.Top := r.Bottom; result.Bottom := r.Top;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.ScrollBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not (ssLeft in Shift) then exit;
  SelectionRec := Rect(X,Y,X,Y);
  DrawFocusRec(SelectionRec);
end;
//------------------------------------------------------------------------------

procedure TForm1.ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if not Assigned(SelectionShape) then exit;
  SelectionRec.Right := X;
  SelectionRec.Bottom := Y;
  DrawFocusRec(NormalizeRect(SelectionRec));
end;
//------------------------------------------------------------------------------

procedure TForm1.ScrollBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: integer;
  dummyRec: TRect;
begin
  if Assigned(SelectionShape) then
  begin
    FreeAndNil(SelectionShape);
    SelectionRec := NormalizeRect(SelectionRec);
    with SelectionRec, ScrollBox1 do
      for i := 0 to ControlCount -1 do
        if (Controls[i] is TDrawObject) then
          with TDrawObject(Controls[i]) do
            Focused := Visible and
              IntersectRect(dummyRec, SelectionRec, BoundsRect);
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    //Escape key will cancel any impending rubberband selection ...
    if Assigned(SelectionShape) then FreeAndNil(SelectionShape);
  end;
end;
//------------------------------------------------------------------------------

end.
