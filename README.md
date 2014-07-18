# Mesorotshot

Simple screenshot utility for Windows, using Autohotkey and IrfanView

## Installation
To make the utility works, we need to install the following softwares:
- [IrfanView](http://www.irfanview.com/)

Then, you can copy the mesorotshot directory where you want and just execute it.

## Run on Startup
Windows has a nice and easy to use startup folder, create a shortcut to
`mesorotshot.exe` and copy/paste it into Start -> All Programs -> Startup folder.  
The path to this folder usually is:
```
%appdata%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
```

## Configuration
- **IrfanView Path:** must be the full path to irfanview executable
- **Image Path:** path to folder where you want to save screenshots. I suggest
  you to use a folder inside Dropbox Public folder, so you can give people links
- **Image Quality:** JPEG quality of the image (less, smaller file size, but
  also uglier), value must be from 1 to 100 (values over 100 are considered 100)
- **Dropbox UrlPrefix:** This is optional and should be the url path to your
  public folder in dropbox, which is usually:
  ```
  https://dl.dropboxusercontent.com/u/DROPBOX_ID
  ```
- **Hotkeys Window:** this is the hotkey used to take screenshot only of the
  current window. By default is Ctrl + Win + F10.
  Hotkeys are defined following Autohotkey syntax, which can be found:
  - http://www.autohotkey.com/docs/Hotkeys.htm
  - http://www.autohotkey.com/docs/KeyList.htm
- **Hotkeys Monitor:** this is the hotkey used to take the screenshot of current
  monitor, by default is Ctrl + Win + F11
- **Hotkeys Full:** this is the hotkey used to take the screenshot of all
  monitors, by default is Ctrl + Win + F12

## Usage
Very simple, after you managed to install and execute it, just press one of the
hotkeys to take a screenshot. If you set UrlPrefix, you will be able to paste
the url to your screenshot.

## TODO
- Make an auto installer
- Add a way to enable and disable autorun

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request