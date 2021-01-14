unit uJPGRAR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, ComCtrls, ExtCtrls;

type
  TfmJPGRAR = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    Button3: TButton;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJPGRAR: TForm;

implementation

uses uMain;//��������������

var
  i : Integer = 0;

{$R *.dfm}

procedure TfmJPGRAR.Button1Click(Sender: TObject);
begin
  fmMain.OpenDialog1.Options:=fmMain.OpenDialog1.Options+[ofAllowMultiSelect];
  fmMain.OpenDialog1.Filter := 'ͼƬ�ļ�(.jpg)|*.jpg';
  fmMain.OpenDialog1.Title := 'ѡ��ͼƬ';
  if fmMain.OpenDialog1.Execute then
    ListBox1.Items :=fmMain.OpenDialog1.Files
  else
  Exit;
end;

procedure TfmJPGRAR.Button2Click(Sender: TObject);
begin
  fmMain.OpenDialog1.Options:=fmMain.OpenDialog1.Options+[ofAllowMultiSelect];
  fmMain.OpenDialog1.Filter := 'ѹ���ļ�(.rar;.zip)|*.rar;*.zip';
  fmMain.OpenDialog1.Title := 'ѡ��ѹ���ļ�';
  if fmMain.OpenDialog1.Execute then
    ListBox2.Items :=fmMain.OpenDialog1.Files
  else
  Exit;
end;

procedure TfmJPGRAR.Button3Click(Sender: TObject);


begin
  Self.ProgressBar1.Step := ListBox2.Count;
  Self.ProgressBar1.Max := ListBox2.Count;
  //ShowMessage(IntToStr(Self.ProgressBar1.Step));
  if (ListBox1.Count < 1)or(ListBox2.Count < 1) then
  begin
    MessageBox(Handle,PChar('����δ���������ļ���'), '��ʾ', MB_OK + MB_ICONASTERISK + MB_TOPMOST);
  end
  else
  begin
    Timer1.Enabled := True;
    ShellExecute(Handle,nil,'cmd.exe',pchar('/c copy /b "' + ListBox1.Items.Strings[0] + '" + "'
    + ListBox2.Items.Strings[i] + '" "' + ListBox2.Items.Strings[i] + '.jpg"&Echo.>> "'
    + ListBox2.Items.Strings[i] + '.log"'),nil,SW_HIDE);
  end;


  {begin
    for i := 0 to ListBox2.Items.Count - 1 do
    begin
      ShellExecute(Handle,nil,'cmd.exe',pchar('/c copy /b "' + ListBox1.Items.Strings[0] + '" + "' + ListBox2.Items.Strings[i] + '" "' + ListBox2.Items.Strings[i] + '.jpg"&Echo.>> "' + ListBox2.Items.Strings[i] + '.log"'),nil,SW_SHOW);
      //ShowMessage(ListBox2.Items.Strings[i] + '.txt');
      if FileExists(ListBox2.Items.Strings[i] + '.txt') then
      begin
        DeleteFile(ListBox2.Items.Strings[i] + '.txt');
        case MessageBox(Handle,PChar('�ϲ�' + ListBox2.Items.Strings[i] + '.jpg' + '��ɣ�' + #13 + #13 + '�Ѿ���' + IntToStr(i + 1) + '���ļ���ɺϲ������ȷ�������ϲ������ȡ�������ϲ���'), '��ʾ',
        MB_OKCANCEL + MB_ICONINFORMATION + MB_TOPMOST) of
        IDOK:
          begin
          //ShellExecute(Handle,nil,'cmd.exe',pchar('/c copy /b "' + ListBox1.Items.Strings[0] + '" + "' + ListBox2.Items.Strings[i] + '" "' + ListBox2.Items.Strings[i] + '.jpg"'),nil,SW_HIDE);
          end;
        IDCANCEL:
          begin
          Break;
          end;
        end;
      end
      else
      begin
      end;
    end;
  end;}
end;

procedure TfmJPGRAR.Timer1Timer(Sender: TObject);
begin

//ShowMessage(ListBox2.Items.Strings[i] + '.log');
  if FileExists(ListBox2.Items.Strings[i] + '.log') then
  begin
    DeleteFile(ListBox2.Items.Strings[i] + '.log');

    if i < ListBox2.Items.Count - 1 then
    begin
      i := i + 1;
      Self.ProgressBar1.Visible := True;
      Self.ProgressBar1.StepBy(1);
      //ShowMessage(ListBox2.Items.Strings[i] + '.log');
      Button3.Click;
    end
    else
    begin
      Timer1.Enabled := False;
      Self.ProgressBar1.Visible := True;
      Self.ProgressBar1.StepBy(1);
      MessageBox(Handle,PChar('����ɹ���ɣ����ϲ�' + IntToStr(i + 1) + '���ļ���'), '��ʾ', MB_OK + MB_ICONASTERISK + MB_TOPMOST);
      Self.ProgressBar1.Visible := False;
      Self.ProgressBar1.Position := 0;
    end;

  end
  else
  begin
  
  end;

{  begin

  for i := 1 to ListBox2.Items.Count - 1 do
    begin
      ShellExecute(Handle,nil,'cmd.exe',pchar('/c copy /b "' + ListBox1.Items.Strings[0] + '" + "' + ListBox2.Items.Strings[i] + '" "' + ListBox2.Items.Strings[i] + '.jpg"&Echo.>> "' + ListBox2.Items.Strings[i] + '.txt"'),nil,SW_SHOW);
      //ShowMessage(ListBox2.Items.Strings[i] + '.txt');
      if FileExists(ListBox2.Items.Strings[i] + '.txt') then
      begin
        //j := True;
        DeleteFile(ListBox2.Items.Strings[i] + '.txt');
        case MessageBox(Handle,PChar('�ϲ�' + ListBox2.Items.Strings[i] + '.jpg' + '��ɣ�' + #13 + #13 + '�Ѿ���' + IntToStr(i + 1) + '���ļ���ɺϲ������ȷ�������ϲ������ȡ�������ϲ���'), '��ʾ',
        MB_OKCANCEL + MB_ICONINFORMATION + MB_TOPMOST) of
        IDOK:
          begin
          //ShellExecute(Handle,nil,'cmd.exe',pchar('/c copy /b "' + ListBox1.Items.Strings[0] + '" + "' + ListBox2.Items.Strings[i] + '" "' + ListBox2.Items.Strings[i] + '.jpg"'),nil,SW_HIDE);
          end;
        IDCANCEL:
          begin
          Break;
          end;
        end;
      end
      else
      begin
      //j := False;
      end;

    end;
  end;}
end;

procedure TfmJPGRAR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fmJPGRAR := nil;
end;

procedure TfmJPGRAR.FormCreate(Sender: TObject);
begin
  ProgressBar1.Parent:= fmMain.StatusBar1;
  ProgressBar1.Left:= 400;
  ProgressBar1.Top:= fmMain.StatusBar1.BorderWidth + 2;
  ProgressBar1.Height:= fmMain.StatusBar1.Height - (fmMain.StatusBar1.BorderWidth + 2);
  ProgressBar1.Width:= fmMain.StatusBar1.Panels[7].Width + fmMain.StatusBar1.BorderWidth - 2;
  ProgressBar1.Position:= 0;
end;

procedure TfmJPGRAR.Button5Click(Sender: TObject);
begin
case MessageBox(Handle, 
  '�������ܹ������Ľ�JPGͼƬ��ʽ�ļ���RAR|ZIP��ʽѹ���ļ�' + #13#10#13#10
  + '���кϲ����ϲ�֮����ļ�Ĭ�ϴ����ѹ���ļ������ļ����У�' + #13#10 +
  #13#10 + '�ϲ�֮����ļ���׺��ʽ��ΪJPG��Ϊ֮ǰ������ͼƬ����Ϊ' + #13#10 +
  #13#10 + 'RAR|ZIP��Ϊ֮ǰ������ѹ���ļ�����������ô��ܶ࣬����' + #13#10#13#10
  + 'һ���ǿ��ԱȽϺõ����ظ����ļ�����ַ��������������...' + #13#10#13#10 +
   '�����ȷ���������ҵ�΢���������ȡ����������������' + #13#10 + #13#10 +
   '                ��By ����ñ 2013.7��', '����˵����', MB_OKCANCEL +
  MB_ICONINFORMATION + MB_TOPMOST) of
  IDOK:
    begin
    ShellExecute(Handle,nil,'explorer.exe',pchar('http://weibo.com/zhugecaomao'),nil,SW_Hide);
    end;
  IDCANCEL:
    begin

    end;
end;
end;

end.