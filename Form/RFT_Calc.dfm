object fmRFT_Calc: TfmRFT_Calc
  Left = 0
  Top = 0
  Caption = 'Reinforcement Calc'
  ClientHeight = 283
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 209
    Hint = 'Basic parameters input area.'
    Caption = 'Total Rebar Area :'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object Label20: TLabel
      Left = 22
      Top = 64
      Width = 92
      Height = 22
      AutoSize = False
      Caption = 'Rebar Size (mm):'
    end
    object ComboBox7: TComboBox
      Left = 120
      Top = 61
      Width = 65
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '10'
      OnChange = ComboBox7Change
      Items.Strings = (
        '10'
        '13'
        '16'
        '20'
        '22'
        '25'
        '32'
        '40')
    end
    object LabeledEdit1: TLabeledEdit
      Left = 119
      Top = 21
      Width = 66
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = 'Span Width (m):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 0
      Text = '1'
      OnChange = LabeledEdit1Change
    end
    object LabeledEdit2: TLabeledEdit
      Left = 120
      Top = 100
      Width = 66
      Height = 21
      EditLabel.Width = 100
      EditLabel.Height = 13
      EditLabel.Caption = 'Rebar Spacing (mm):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 2
      Text = '300'
      OnChange = LabeledEdit2Change
    end
    object LabeledEdit3: TLabeledEdit
      Left = 120
      Top = 137
      Width = 66
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = 'Total Area (mm2):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      ReadOnly = True
      TabOrder = 3
      Text = '314.0'
    end
    object LabeledEdit4: TLabeledEdit
      Left = 120
      Top = 175
      Width = 66
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = 'Rebar Qty (Nos.):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 4
      Text = '10'
      OnChange = LabeledEdit4Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 224
    Top = 8
    Width = 217
    Height = 209
    Hint = 'Basic parameters input area.'
    Caption = 'Rebar Qty Needed :'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object Label19: TLabel
      Left = 28
      Top = 75
      Width = 90
      Height = 22
      AutoSize = False
      Caption = 'Rebar Size (mm):'
    end
    object ComboBox8: TComboBox
      Left = 128
      Top = 72
      Width = 65
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '10'
      OnChange = LabeledEdit5Change
      Items.Strings = (
        '10'
        '13'
        '16'
        '20'
        '22'
        '25'
        '32'
        '40')
    end
    object LabeledEdit5: TLabeledEdit
      Left = 127
      Top = 33
      Width = 66
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = 'Total Area (mm2):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 0
      Text = '314.0'
      OnChange = LabeledEdit5Change
    end
    object LabeledEdit6: TLabeledEdit
      Left = 127
      Top = 152
      Width = 66
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = 'Rebar Qty (Nos.):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      ReadOnly = True
      TabOrder = 3
      Text = '5'
    end
    object LabeledEdit7: TLabeledEdit
      Left = 127
      Top = 112
      Width = 66
      Height = 21
      EditLabel.Width = 71
      EditLabel.Height = 13
      EditLabel.Caption = 'Safety factor :'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 2
      Text = '1'
      OnChange = LabeledEdit5Change
    end
  end
  object GroupBox5: TGroupBox
    Left = 447
    Top = 8
    Width = 234
    Height = 209
    Hint = 'Basic parameters input area.'
    Caption = 'Wire Mesh Area :'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    object Label18: TLabel
      Left = 39
      Top = 63
      Width = 99
      Height = 22
      AutoSize = False
      Caption = 'Top Mesh Size A:'
    end
    object Label27: TLabel
      Left = 39
      Top = 136
      Width = 91
      Height = 22
      AutoSize = False
      Caption = 'Btm Mesh Size A:'
    end
    object ComboBox9: TComboBox
      Left = 144
      Top = 60
      Width = 65
      Height = 21
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 1
      Text = '7'
      OnChange = ComboBox9Change
      OnClick = LabeledEdit8Change
      Items.Strings = (
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13')
    end
    object ComboBox10: TComboBox
      Left = 144
      Top = 136
      Width = 65
      Height = 21
      ItemHeight = 13
      ItemIndex = 4
      TabOrder = 3
      Text = '9'
      OnChange = ComboBox10Change
      OnClick = LabeledEdit8Change
      Items.Strings = (
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13')
    end
    object LabeledEdit8: TLabeledEdit
      Left = 143
      Top = 21
      Width = 66
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = 'Span Width (m):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 0
      Text = '1'
      OnChange = LabeledEdit8Change
    end
    object LabeledEdit9: TLabeledEdit
      Left = 143
      Top = 99
      Width = 66
      Height = 21
      EditLabel.Width = 109
      EditLabel.Height = 13
      EditLabel.Caption = 'Top Mesh Area (mm2):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      ReadOnly = True
      TabOrder = 2
      Text = '193'
    end
    object LabeledEdit10: TLabeledEdit
      Left = 143
      Top = 174
      Width = 66
      Height = 21
      EditLabel.Width = 109
      EditLabel.Height = 13
      EditLabel.Caption = 'Btm Mesh Area (mm2):'
      LabelPosition = lpLeft
      LabelSpacing = 10
      ReadOnly = True
      TabOrder = 4
      Text = '318'
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 223
    Width = 674
    Height = 57
    Hint = 'Basic parameters input area.'
    Caption = 'Convenient formula :'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    DesignSize = (
      674
      57)
    object Edit17: TEdit
      Left = 16
      Top = 23
      Width = 241
      Height = 25
      Anchors = [akLeft]
      AutoSize = False
      BevelEdges = [beLeft, beBottom]
      BevelKind = bkFlat
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentBiDiMode = False
      TabOrder = 0
      Text = 'INPUT FORMULA HERE'
      OnChange = Edit17Change
      OnEnter = Edit17Enter
    end
    object Edit16: TEdit
      Left = 280
      Top = 23
      Width = 217
      Height = 25
      Anchors = [akLeft]
      AutoSize = False
      BevelEdges = [beLeft, beBottom]
      BevelKind = bkFlat
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      ParentBiDiMode = False
      TabOrder = 1
      Text = 'RESULT'
      OnChange = Edit16Change
    end
    object Edit26: TEdit
      Left = 519
      Top = 23
      Width = 129
      Height = 25
      Anchors = [akLeft]
      AutoSize = False
      BevelEdges = [beLeft, beBottom]
      BevelKind = bkFlat
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      ParentBiDiMode = False
      TabOrder = 2
      Text = 'RESULT'
    end
  end
end
