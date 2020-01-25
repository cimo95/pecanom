object _0: T_0
  Left = 711
  Top = 317
  BorderStyle = bsToolWindow
  Caption = 'PecaNom'
  ClientHeight = 169
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object _1: TLabel
    Left = 8
    Top = 16
    Width = 67
    Height = 13
    Caption = 'Nominal : Rp. '
  end
  object _2: TEdit
    Left = 80
    Top = 12
    Width = 121
    Height = 21
    MaxLength = 19
    TabOrder = 0
    Text = '0'
    OnChange = _2Change
    OnKeyPress = _2KeyPress
  end
  object _3: TListView
    Left = 16
    Top = 40
    Width = 169
    Height = 121
    Columns = <
      item
        Caption = 'Pecahan'
        Width = 90
      end
      item
        Caption = 'Jumlah'
      end>
    ColumnClick = False
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object XPManifest1: TXPManifest
    Left = 136
    Top = 88
  end
end
