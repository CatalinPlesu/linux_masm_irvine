#!/bin/sh 
mkdir -p ~/.local/share/wineprefixes/masm/
alias wine_masm="WINEARCH=win32 WINEPREFIX=~/.local/share/wineprefixes/masm/ wine"

wine_masm install.exe
mv ./irvine ~/.local/share/wineprefixes/masm/drive_c/Irvine

wine_masm regedit /C wine_masm_irvine.reg

echo "If you want this script in your path provide sudo access"
sudo cp build_masm /usr/local/bin/

