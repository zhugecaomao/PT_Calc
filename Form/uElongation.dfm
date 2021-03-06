object fmElongation: TfmElongation
  Left = 685
  Top = 257
  Caption = 'Elongation Calculater'
  ClientHeight = 346
  ClientWidth = 805
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 769
    Height = 161
    Hint = 'Basic parameters input area.'
    Caption = 'Basic Parameters'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 14
      Top = 21
      Width = 91
      Height = 22
      Hint = 'Project Name'
      AutoSize = False
      Caption = 'Project Name:'
      ParentShowHint = False
      ShowHint = True
    end
    object lbl4: TLabel
      Left = 290
      Top = 89
      Width = 151
      Height = 22
      Hint = 'Coeff. of Friction (u):'
      AutoSize = False
      Caption = 'Coeff. of Friction:'
    end
    object lbl2: TLabel
      Left = 290
      Top = 21
      Width = 171
      Height = 22
      Hint = 'Strand Size (d) (mm):'
      AutoSize = False
      Caption = 'Strand Size (mm):'
    end
    object lbl7: TLabel
      Left = 14
      Top = 89
      Width = 115
      Height = 22
      Hint = 'Wobble Factor (k):'
      AutoSize = False
      Caption = 'Wobble Factor (k):'
    end
    object lbl6: TLabel
      Left = 14
      Top = 123
      Width = 155
      Height = 22
      Hint = 'Elasticity Mod (E) (KN/mm2):'
      AutoSize = False
      Caption = 'Elasticity Mod (KN/mm2):'
    end
    object lbl5: TLabel
      Left = 286
      Top = 55
      Width = 155
      Height = 22
      Hint = 'Strand Area (A) (mm2):'
      AutoSize = False
      Caption = 'Strand Area (mm2):'
    end
    object lbl3: TLabel
      Left = 494
      Top = 89
      Width = 151
      Height = 22
      Hint = 'Stress Force (Po) (KN):'
      AutoSize = False
      Caption = 'Stress Force (KN):'
    end
    object Label4: TLabel
      Left = 494
      Top = 21
      Width = 151
      Height = 22
      AutoSize = False
      Caption = 'Strand Weight (kg/m):'
    end
    object Label5: TLabel
      Left = 14
      Top = 55
      Width = 151
      Height = 22
      AutoSize = False
      Caption = 'Min. Breaking Load (KN):'
    end
    object Label6: TLabel
      Left = 494
      Top = 55
      Width = 195
      Height = 22
      AutoSize = False
      Caption = 'Min. Ultimate Strength (N/mm2):'
    end
    object Edit11: TEdit
      Left = 168
      Top = 21
      Width = 105
      Height = 22
      Hint = 'Project Name'
      AutoSize = False
      ParentColor = True
      TabOrder = 0
      Text = 'Project Name'
    end
    object Edit6: TEdit
      Left = 413
      Top = 89
      Width = 68
      Height = 22
      Hint = 'Coeff. of Friction (u):'
      AutoSize = False
      ParentColor = True
      TabOrder = 1
      Text = '0.19'
    end
    object ComboBox1: TComboBox
      Left = 413
      Top = 20
      Width = 68
      Height = 21
      Hint = 'Strand Size (d) (mm):'
      Style = csOwnerDrawFixed
      ItemHeight = 15
      ItemIndex = 2
      ParentColor = True
      TabOrder = 2
      Text = '15.24'
      OnChange = ComboBox1Change
      Items.Strings = (
        '12.70'
        '12.90'
        '15.24'
        '15.70')
    end
    object Edit1: TEdit
      Left = 168
      Top = 123
      Width = 105
      Height = 22
      Hint = 'Elasticity Mod (E) (KN/mm2):'
      AutoSize = False
      ParentColor = True
      TabOrder = 5
      Text = '195'
    end
    object Edit2: TEdit
      Left = 413
      Top = 55
      Width = 68
      Height = 22
      Hint = 'Strand Area (A) (mm2):'
      AutoSize = False
      ParentColor = True
      TabOrder = 4
      Text = '139.0'
    end
    object Edit3: TEdit
      Left = 168
      Top = 89
      Width = 105
      Height = 22
      Hint = 'Wobble Factor (k):'
      AutoSize = False
      ParentColor = True
      TabOrder = 6
      Text = '0.003'
    end
    object Edit4: TEdit
      Left = 685
      Top = 89
      Width = 68
      Height = 22
      Hint = 'Stress Force (Po) (KN):'
      AutoSize = False
      ParentColor = True
      TabOrder = 3
      Text = '194.25'
    end
    object Edit22: TEdit
      Left = 685
      Top = 21
      Width = 68
      Height = 22
      Hint = 'Stress Force (Po) (KN):'
      AutoSize = False
      ParentColor = True
      TabOrder = 7
      Text = '1.102'
    end
    object Edit23: TEdit
      Left = 168
      Top = 55
      Width = 105
      Height = 22
      Hint = 'Stress Force (Po) (KN):'
      AutoSize = False
      ParentColor = True
      TabOrder = 8
      Text = '260.7'
    end
    object Edit27: TEdit
      Left = 685
      Top = 55
      Width = 68
      Height = 22
      Hint = 'Stress Force (Po) (KN):'
      AutoSize = False
      ParentColor = True
      TabOrder = 9
      Text = '1860'
    end
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 184
    Width = 769
    Height = 97
    Hint = 'Tendon profile input area.'
    ColCount = 40
    DefaultColWidth = 40
    DefaultRowHeight = 18
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goTabs, goThumbTracking]
    ParentColor = True
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = False
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
  end
  object Button1: TButton
    Left = 144
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Calculate'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Report'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Check'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 504
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 5
    OnClick = Button4Click
  end
  object ComboBox3: TComboBox
    Left = 416
    Top = 144
    Width = 73
    Height = 21
    Style = csOwnerDrawFixed
    ItemHeight = 15
    TabOrder = 6
    TabStop = False
    Visible = False
    OnChange = ComboBox3Change
    OnCloseUp = ComboBox3CloseUp
    Items.Strings = (
      ''
      '1'
      '2')
  end
  object PopupMenu1: TPopupMenu
    Left = 500
    Top = 136
    object Menu_AddRow: TMenuItem
      Caption = 'Add one Row'
      OnClick = Menu_AddRowClick
    end
    object Menu_DeleteRow: TMenuItem
      Caption = 'Delete one Row'
      OnClick = Menu_DeleteRowClick
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 544
    Top = 136
  end
end
