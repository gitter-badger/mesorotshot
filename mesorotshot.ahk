#SingleInstance force
#InstallKeybdHook

;# WIN
;! ALT
;^ CTRL

UI:
  Title = Mesorotshot - By Francesco Belladonna (Fire-Dragon-DoL)
  Menu , Tray , Icon , %A_ScriptDir%\mesorotshot.ico ,, 1
  Menu , Tray , Tip , %Title%

  GoSub InitConfig
  GoSub LoadConfig
Return

InitConfig:
  ConfigFileDir = %A_ScriptDir%
  ConfigFilePath = %ConfigFileDir%\mesorotshot_settings.ini
Return

LoadConfig:
  ; Writes options configuration
  IniRead , ImagePath , %ConfigFilePath% , Image , Path , C:
  IniRead , IrfanViewPath , %ConfigFilePath% , IrfanView , Path , C:\Program Files (x86)\IrfanView\i_view32.exe
  IniRead , ImageQuality , %ConfigFilePath% , Image , Quality , 100
  IniRead , DropboxUrlPrefix , %ConfigFilePath% , Dropbox , UrlPrefix ,
  IniRead , HotkeysWindow , %ConfigFilePath% , Hotkeys , Window , ^#F10
  IniRead , HotkeysMonitor , %ConfigFilePath% , Hotkeys , Monitor , ^#F11
  IniRead , HotkeysFull , %ConfigFilePath% , Hotkeys , Full , ^#F12
  If (HotkeysWindow)
  {
    Hotkey , %HotkeysWindow% , OnWindowShot
  }
  If (HotkeysWindow)
  {
    Hotkey , %HotkeysMonitor% , OnMonitorShot
  }
  If (HotkeysFull)
  {
    Hotkey , %HotkeysFull% , OnFullShot
  }
Return

OnWindowShot:
  TakeScreenshot(2)
Return

OnMonitorShot:
  TakeScreenshot(1)
Return

OnFullShot:
  TakeScreenshot(0)
Return

; http://stackoverflow.com/questions/12851677/dynamically-create-autohotkey-hotkey-to-function-subroutine
; http://www.etcwiki.org/wiki/IrfanView_Command_Line_Options
; http://www.makeuseof.com/tag/10-useful-commandline-irfanview-tools-working-images/
; "i_view32.exe /capture=0 /convert=c:\temp\capture_$U(%d%m%Y_%H%M%S).jpg"
; Capture can be:
; 0 = whole screen 
; 1 = current monitor, where mouse is located
; 2 = foreground window
; 3 = foreground window - client area
; 4 = rectangle selection
; 5 = object selected with the mouse
; 6 = start in capture mode (can't be combined with other commandline options)
; 7 = fixed rectangle (using capture dialog values)


TakeScreenshot(captureMode)
{
  global IrfanViewPath
  global ImageQuality
  global DropboxUrlPrefix
  global ImagePath

  FormatTime , FileName,, yyyy-MM-dd_HH-mm-ss
  FileName = %FileName%.jpg
  FilePath = %ImagePath%\%FileName%
  Run %IrfanViewPath% /jpgq=%ImageQuality% /capture=%captureMode% /convert=%FilePath%

  If (DropboxUrlPrefix)
  {
    Clipboard = %DropboxUrlPrefix%/%FileName%
  }

  SoundBeep

  Return
}

GuiClose:
  ExitApp