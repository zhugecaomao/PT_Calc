unit PublicUnit;

interface

uses
  Windows, Forms, SysUtils, Registry, Classes, ShlObj, ActiveX, ShellAPI,
  Messages, StdCtrls, ExtCtrls, Menus, ActnList, Buttons, ComCtrls,
  Dialogs, Math, IniFiles, uHexEditor, Graphics;


const
  TITLE = 'PT Calculation tools';
  CO_URL = 'http://www.ppi.sg?from=liming';
  LM_URL = 'http://zhugecaomao.jimdo.com?from=pt_calculation';
  LM_EMAIL = 'zhugecaomao@qq.com';
  CRACK_MSG = 'Please make sure SafeNet Sentinel Runtime / Sentinel HASP LDK'+#10+#13+'has been installed in this computer before run this crack!'
              +#10+#13+#13+'If the User Account Control / Driver Installation window appears,'+#10+#13+'Please select Yes/Install!';
var
  HASP_PATH : PChar;

procedure ExtractFile(FileName: string);
function GetTempDirectory: string; //get temp directory
function IsFileInUse(fName : string) : boolean;
function RebarAreaCalc(RebarSize: Extended): Extended;
function MeshAreaCalc(MeshSize: Extended): Extended;
function SearchLanguagePack:TStrings;
procedure CleanExtractFile;
procedure SaveLanguage;
procedure SetActiveLanguage(LanguageName: string);
procedure LoadCalculateHistory;
procedure LoadEditorProps;



implementation

uses
  uMain, uHex_Editor, uRFT_Calc;

function GetTempDirectory: string; //get temp directory.
var
  TempDir: array[0..255] of Char;
begin
  GetTempPath(255, @TempDir);
  Result := StrPas(TempDir);
end;

function IsFileInUse(fName: string): boolean;
var
  HFileRes: HFILE;
begin
  Result := false; //返回值为假(即文件不被使用)
  if not FileExists(fName) then
    exit; //如果文件不存在则退出
  HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE, 0 {this is the trick!}, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE); //如果CreateFile返回失败 那么Result为真(即文件正在被使用)
  if not Result then //如果CreateFile函数返回是成功
    CloseHandle(HFileRes);   //那么关闭句柄
end;

function RebarAreaCalc(RebarSize: Extended): Extended;//Define function: Get rebar Area base on rebar size, Math needed
begin
  Result := SimpleRoundTo(Sqr(RebarSize / 2) * Pi, -2);
end;

function MeshAreaCalc(MeshSize: Extended): Extended;//Define function: get wire mesh Area base on mesh size, math needed
begin
  Result := SimpleRoundTo((Sqr(MeshSize / 2) * 3.1415926) * 5 + 0.2, 0);
end;

procedure ExtractFile(FileName:string);
var
  DOSBox: TResourceStream;
begin
  if FileName = 'DOSBox' then
  begin
    try
      if IsFileInUse(GetTempDirectory + 'DOSBox.exe')=False then
      begin
        DOSBox := TResourceStream.Create(HInstance, 'DOSBox', 'EXEFILE'); //其中HInstance为一个句柄常量，DOSBox为资源名，exefile为资源类型
        DOSBox.SaveToFile(GetTempDirectory + 'DOSBox.exe');
      end;
      if IsFileInUse(GetTempDirectory + 'Cal.exe')=False then TResourceStream.Create(HInstance, 'Cal', 'EXEFILE').SaveToFile(GetTempDirectory + 'Cal.exe');
      if IsFileInUse(GetTempDirectory + 'SDL.dll')=False then TResourceStream.Create(HInstance, 'SDL', 'FILE').SaveToFile(GetTempDirectory + 'SDL.dll');
      if IsFileInUse(GetTempDirectory + 'SDL_net.dll')=False then TResourceStream.Create(HInstance, 'SDL_net', 'FILE').SaveToFile(GetTempDirectory + 'SDL_net.dll');
    finally
      DOSBox.free;
    end;
  end
  else if FileName = 'HASP' then
  begin
    try
      TResourceStream.Create(HInstance, 'HASP', 'EXEFILE').SaveToFile(GetTempDirectory + '\HASPHL2008.exe');
      TResourceStream.Create(HInstance, 'RAPT', 'FILE').SaveToFile(GetTempDirectory + '\hasp.dng');
      //定义HASPHL软件路径，方便调用
      HASP_PATH := PChar(GetTempDirectory + 'HASPHL2008');
    finally
      ;
    end;
  end
  else if FileName = 'MultiKey_32' then
  begin
    try
      CreateDir(GetTempDirectory + '\MultiKey_32\');//创建文件夹

      TResourceStream.Create(HInstance, 'devcon_exe_32', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'devcon.exe');
      TResourceStream.Create(HInstance, 'multikey_cat_32', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'multikey.cat');
      TResourceStream.Create(HInstance, 'multikey_inf_32', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'multikey.inf');
      TResourceStream.Create(HInstance, 'MultiKey_sys_32', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'MultiKey.sys');
      TResourceStream.Create(HInstance, 'RAPT_reg_32', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'RAPT.reg');
      TResourceStream.Create(HInstance, 'install_cmd_32', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'install.cmd');
      TResourceStream.Create(HInstance, 'remove_cmd_32', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'remove.cmd');
      TResourceStream.Create(HInstance, 'restart_cmd_32', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_32\' + 'restart.cmd');

    finally
      ;
    end;
  end
  else if FileName = 'MultiKey_64' then
  begin
    try
      CreateDir(GetTempDirectory + '\MultiKey_64\');//创建文件夹

      TResourceStream.Create(HInstance, 'devcon_exe_64', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'devcon.exe');
      TResourceStream.Create(HInstance, 'multikey_cat_64', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'multikey.cat');
      TResourceStream.Create(HInstance, 'multikey_inf_64', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'multikey.inf');
      TResourceStream.Create(HInstance, 'MultiKey_sys_64', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'MultiKey.sys');
      TResourceStream.Create(HInstance, 'RAPT_reg_64', 'FILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'RAPT.reg');
      TResourceStream.Create(HInstance, 'install_cmd_64', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'install.cmd');
      TResourceStream.Create(HInstance, 'remove_cmd_64', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'remove.cmd');
      TResourceStream.Create(HInstance, 'restart_cmd_64', 'EXEFILE').SaveToFile(GetTempDirectory + '\MultiKey_64\' + 'restart.cmd');

    finally
      ;
    end;
  end;
end;

procedure CleanExtractFile;
begin
  try
    DeleteFile(GetTempDirectory + 'HASPHL2008.exe');
    DeleteFile(GetTempDirectory + 'hasp.dng');
    DeleteFile(GetTempDirectory + 'DOSBox.exe');
    DeleteFile(GetTempDirectory + 'Cal.exe');
    DeleteFile(GetTempDirectory + 'SDL.dll');
    DeleteFile(GetTempDirectory + 'SDL_net.dll');

    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'devcon.exe');
    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'multikey.cat');
    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'multikey.inf');
    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'MultiKey.sys');
    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'RAPT.reg');
    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'install.cmd');
    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'remove.cmd');
    DeleteFile(GetTempDirectory + '\MultiKey_32\' + 'restart.cmd');

    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'devcon.exe');
    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'multikey.cat');
    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'multikey.inf');
    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'MultiKey.sys');
    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'RAPT.reg');
    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'install.cmd');
    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'remove.cmd');
    DeleteFile(GetTempDirectory + '\MultiKey_64\' + 'restart.cmd');

    RemoveDir(GetTempDirectory + '\MultiKey_32\');
    RemoveDir(GetTempDirectory + '\MultiKey_64\');
  finally
  ;
  end;
end;

function SearchLanguagePack:TStrings;
var
  ResultStrings:TStrings;
  DosError:integer;
  SearchRec:TsearchRec;
begin
  ResultStrings:=TStringList.Create;
  DosError:=FindFirst(ExtractFilePath(ParamStr(0))+'\Lang\*.ini', faAnyFile, SearchRec);
  while DosError=0 do
  begin
    { 返回的文件名并去掉末尾的.ini字符 }
    ResultStrings.Add(ChangeFileExt(SearchRec.Name,''));
    DosError:=FindNext(SearchRec);
  end;
  FindClose(SearchRec);
  Result:=ResultStrings;
end;

procedure SaveLanguage;
var
  i: Integer;
  fmComponent: TComponent;
begin
  try
    //save current language setting
    with FIni do
    begin
      for i := 0 to fmMain.ComponentCount - 1 do
      begin
        fmComponent := fmMain.Components[i];
        if fmComponent is TLabel then
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TLabel).Caption);

        if fmComponent is TCheckBox then
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TCheckBox).Caption);

        if fmComponent is TButton then
        begin
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TButton).Caption);
          WriteString('Translations', fmComponent.Name + '.Hint', (fmComponent as TButton).Hint);
        end;
        if fmComponent is TMenuItem then
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TMenuItem).Caption);
        if fmComponent is TAction then
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TAction).Caption);
        if fmComponent is TBitBtn then
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TBitBtn).Caption);
        if fmComponent is TComboBox then
          WriteString('Translations', fmComponent.Name + '.Text', (fmComponent as TComboBox).Text);
        if fmComponent is TEdit then
          WriteString('Translations', fmComponent.Name + '.Text', (fmComponent as TEdit).Text);
        if fmComponent is TLabeledEdit then
        begin
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TLabeledEdit).EditLabel.Caption);
          WriteString('Translations', fmComponent.Name + '.Text', (fmComponent as TLabeledEdit).Text);
        end;
        if fmComponent is TGroupBox then
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TGroupBox).Caption);
        if fmComponent is TTabSheet then
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TTabSheet).Caption);
        if fmComponent is TToolButton then
        begin
          WriteString('Translations', fmComponent.Name + '.Caption', (fmComponent as TToolButton).Caption);
          WriteString('Translations', fmComponent.Name + '.Hint', (fmComponent as TToolButton).Hint);
        end;

      end;
      for i := 0 to fmRFT_Calc.ComponentCount - 1 do
      begin
        fmComponent := fmRFT_Calc.Components[i];
        if fmComponent is TLabel then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TLabel).Caption);

        if fmComponent is TCheckBox then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TCheckBox).Caption);

        if fmComponent is TButton then
        begin
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TButton).Caption);
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Hint', (fmComponent as TButton).Hint);
        end;
        if fmComponent is TMenuItem then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TMenuItem).Caption);
        if fmComponent is TAction then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TAction).Caption);
        if fmComponent is TBitBtn then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TBitBtn).Caption);
        if fmComponent is TComboBox then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Text', (fmComponent as TComboBox).Text);
        if fmComponent is TEdit then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Text', (fmComponent as TEdit).Text);
        if fmComponent is TLabeledEdit then
        begin
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TLabeledEdit).EditLabel.Caption);
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Text', (fmComponent as TLabeledEdit).Text);
        end;
        if fmComponent is TGroupBox then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TGroupBox).Caption);
        if fmComponent is TTabSheet then
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TTabSheet).Caption);
        if fmComponent is TToolButton then
        begin
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TToolButton).Caption);
          WriteString('Translations', 'RFT_CALC' + fmComponent.Name + '.Hint', (fmComponent as TToolButton).Hint);
        end;

      end;
    end;
  finally
    ;
  end;
end;

procedure SetActiveLanguage(LanguageName: string);
const
  Translations='Translations';
  Messages='Messages';
var
  i: Integer;
  M1:String;
  fmComponent: TComponent;
begin
  with TInifile.Create(ExtractFilePath(ParamStr(0))+'\Lang\'+LanguageName+'.ini') do
    for i := 0 to fmMain.ComponentCount - 1 do
    begin
      fmComponent := fmMain.Components[i];
      if fmComponent is TLabel then
        (fmComponent as TLabel).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TLabel).Caption);
      if fmComponent is TCheckBox then
        (fmComponent as TCheckBox).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TCheckBox).Caption);
      if fmComponent is TButton then
      begin
        (fmComponent as TButton).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TButton).Caption);
        (fmComponent as TButton).Hint := ReadString('Translations', fmComponent.Name + '.Hint', (fmComponent as TButton).Hint);
      end;
      if fmComponent is TMenuItem then
        (fmComponent as TMenuItem).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TMenuItem).Caption);
      if fmComponent is TAction then
        (fmComponent as TAction).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TAction).Caption);
      if fmComponent is TBitBtn then
        (fmComponent as TBitBtn).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TBitBtn).Caption);
      if fmComponent is TComboBox then
        (fmComponent as TComboBox).Text := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TComboBox).Text);
      if fmComponent is TEdit then
        (fmComponent as TEdit).Text := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TEdit).Text);
      if fmComponent is TGroupBox then
        (fmComponent as TGroupBox).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TGroupBox).Caption);
      if fmComponent is TTabSheet then
        (fmComponent as TTabSheet).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TTabSheet).Caption);
      if fmComponent is TToolButton then
      begin
        (fmComponent as TToolButton).Caption := ReadString('Translations', fmComponent.Name + '.Caption', (fmComponent as TToolButton).Caption);
        (fmComponent as TToolButton).Hint := ReadString('Translations', fmComponent.Name + '.Hint', (fmComponent as TToolButton).Hint);
      end;
      M1:=ReadString(Messages,'M1',M1);
    end;
end;

procedure LoadCalculateHistory;
const
  Section_Name='CalculateHistory';

var
  i: Integer;
  fmComponent: TComponent;
begin
  with FIni do
    for i := 0 to fmRFT_Calc.ComponentCount - 1 do
    begin
      fmComponent := fmRFT_Calc.Components[i];

      if fmComponent is TComboBox then
        (fmComponent as TComboBox).Text := ReadString('Translations', 'RFT_CALC' + fmComponent.Name + '.Text', (fmComponent as TComboBox).Text);
      if fmComponent is TEdit then
        (fmComponent as TEdit).Text := ReadString('Translations', 'RFT_CALC' + fmComponent.Name + '.Text', (fmComponent as TEdit).Text);

      if fmComponent is TLabeledEdit then
      begin
        (fmComponent as TLabeledEdit).EditLabel.Caption := ReadString('Translations', 'RFT_CALC' + fmComponent.Name + '.Caption', (fmComponent as TLabeledEdit).EditLabel.Caption);
        (fmComponent as TLabeledEdit).Text := ReadString('Translations', 'RFT_CALC' + fmComponent.Name + '.Text', (fmComponent as TLabeledEdit).Text);
      end;
    end;
end;

procedure LoadEditorProps;
begin

  try
    with FIni do
    begin
      //SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW);//隐藏任务栏及任务管理器图标
      //Application.Title := '';//程序任务栏名称，留空为隐藏任务名称
      //window position
      fmMain.Height := ReadInteger('General', 'Height', fmMain.Height);
      fmMain.Width := ReadInteger('General', 'Width', fmMain.Width);
      fmMain.Top := ReadInteger('General', 'PosTop', ((Screen.Height - fmMain.Height) div 2));
      fmMain.Left := ReadInteger('General', 'PosLeft', ((Screen.Width - fmMain.Width) div 2));
      fmMain.ScreenSnap := True; //窗口吸附
      fmMain.SnapBuffer := 20; //窗口吸附

      if ReadBool('General', 'TopMost', False) = True then
        fmMain.TopMost.Click;

      {//check dongle key
      if ReadString('Dongle', 'Key', 'Non-License') <> 'Liming' then
      begin
        fmLogin := TfmLogin.Create(Application);
        fmLogin.ShowModal; //Can not use Show
      end;}

      //fmMain.PageControl1.ActivePageIndex := ReadInteger('General', 'ActivePage', 1);

      //Load language pack
      SetActiveLanguage(ReadString('Language','Language',''));

    end;
  finally
    ;
  end;

  //Fit TOP MOST checkbox into status bar
  with fmMain.CheckBox1 do
  begin
    Parent := fmMain.StatusBar1;
    Left := 560;
    Top := fmMain.StatusBar1.BorderWidth + 1;
    Height := fmMain.StatusBar1.Height - (fmMain.StatusBar1.BorderWidth + 2);
    Width := fmMain.StatusBar1.Panels[8].Width - 20;
    Visible := True;
  end;

  //KeyPreview设置之后才能响应按键
  fmMain.KeyPreview := True;
  fmMain.StatusBar1.Panels[9].Text := DateToStr(Now);
  //Application.OnHint := ShowHint;
  Application.HintPause:=0; // Hint show immediately
  Application.ShowHint := True;
  Application.HintHidePause := 10000;  // Hint stay 10 seconds
  Application.HintShortPause := 0;  // Hint stay 10 seconds
  Application.HintColor:= clCream;  //Hint background color
  Screen.HintFont.Size := 10;
  Screen.HintFont.Color := clBlack;

  fmMain.TreeView1.FullExpand;

end;



end.
