program SimpleRunner;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ShellApi,
  Windows;

const
  FileName = 'PIEFree.exe';
  Args = '-mousejoystick.pie';

var
  ExeInf: TShellExecuteInfo;
  Status : Boolean;

begin
  FillChar(ExeInf,SizeOf(ExeInf), 0);
  status:=False;
  with ExeInf do
  begin
    cbSize:=SizeOf(ExeInf);
    fMask:=SEE_MASK_NOCLOSEPROCESS;
    lpFile:=PChar(FileName);
    lpParameters:=PChar(Args);
    nShow:=SW_SHOWNORMAL;
  end;
  try
    Status:=ShellExecuteEx(@ExeInf);
  finally
    if not Status then
    begin
      WriteLn('Error ', GetLastError);
      WriteLn('Press Enter to exit.');
      ReadLn;
    end;
  end;
end.
 