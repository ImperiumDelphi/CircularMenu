unit uMenuCircular;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Ani, FMX.Filter.Effects;

type
  TForm11 = class(TForm)
    BtMenu: TCircle;
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    ArcMenu: TArc;
    Rectangle1: TRectangle;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    procedure FormShow(Sender: TObject);
    procedure BtMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

procedure TForm11.BtMenuClick(Sender: TObject);
begin
if BtMenu.Tag = 0 then
   Begin
   BtMenu.Tag := 1;
   TAnimator.AnimateFloat(ArcMenu, 'RotationAngle', 0);
//   TAnimator.AnimateColor(ArcMenu, 'Fill.Color',    $FFC66262);
   TAnimator.AnimateFloat(ArcMenu, 'Opacity',       1);
   End
Else
   Begin
   BtMenu.Tag := 0;
   TAnimator.AnimateFloat(ArcMenu, 'RotationAngle', 180);
//   TAnimator.AnimateColor(ArcMenu, 'Fill.Color',    TAlphaColors.White);
   TAnimator.AnimateFloat(ArcMenu, 'Opacity',       0);
   TThread.CreateAnonymousThread(
      Procedure
      Begin
      Sleep(210);
      ArcMenu.RotationAngle := -180;
      End).Start;
   End
end;

procedure TForm11.FormShow(Sender: TObject);
begin
ArcMenu.RotationAngle := -180;
ArcMenu.Opacity       := 0;
end;

end.
