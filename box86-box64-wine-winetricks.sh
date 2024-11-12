dpkg --add-architecture armhf
cd ~/
apt update && apt install gpg -y
wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list
wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
apt install box86-android box64-android nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf zenity mesa-vulkan-drivers mesa-vulkan-drivers:armhf libvulkan1 libvulkan1:armhf -y
wget https://github.com/Kron4ek/Wine-Builds/releases/download/9.7/wine-9.7-amd64.tar.xz
wget https://github.com/Kron4ek/Wine-Builds/releases/download/9.7/wine-9.7-x86.tar.xz
tar xvf wine-9.7-amd64.tar.xz
tar xvf wine-9.7-x86.tar.xz
rm wine-9.7-amd64.tar.xz wine-9.7-x86.tar.xz
mv wine-9.7-amd64 wine64
mv wine-9.7-x86 wine
echo '#!/bin/bash
export WINEPREFIX=~/.wine32
box86 '"$HOME/wine/bin/wine "'"$@"' > /usr/local/bin/wine
chmod +x /usr/local/bin/wine
echo '#!/bin/bash
export WINEPREFIX=~/.wine64
box64 '"$HOME/wine64/bin/wine64 "'"$@"' > /usr/local/bin/wine64
chmod +x /usr/local/bin/wine64
echo 'export DISPLAY=:0
export BOX86_PATH=~/wine/bin/
export BOX86_LD_LIBRARY_PATH=~/wine/lib/wine/i386-unix/:/lib/i386-linux-gnu/:/lib/aarch64-linux-gnu/:/lib/arm-linux-gnueabihf/:/usr/lib/aarch64-linux-gnu/:/usr/lib/arm-linux-gnueabihf/:/usr/lib/i386-linux-gnu/
export BOX64_PATH=~/wine64/bin/
export BOX64_LD_LIBRARY_PATH=~/wine64/lib/i386-unix/:~/wine64/lib/wine/x86_64-unix/:/lib/i386-linux-gnu/:/lib/x86_64-linux-gnu:/lib/aarch64-linux-gnu/:/lib/arm-linux-gnueabihf/:/usr/lib/aarch64-linux-gnu/:/usr/lib/arm-linux-gnueabihf/:/usr/lib/i386-linux-gnu/:/usr/lib/x86_64-linux-gnu' >> ~/.bashrc
source ~/.bashrc
cd ~/
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
mv winetricks /usr/local/bin/
echo '#!/bin/bash
export BOX86_NOBANNER=1 WINE=wine WINEPREFIX=~/.wine32 WINESERVER=~/wine/bin/wineserver
wine '"/usr/local/bin/winetricks "'"$@"' > /usr/local/bin/winetricks32
chmod +x /usr/local/bin/winetricks32
echo '#!/bin/bash
export BOX64_NOBANNER=1 WINE=wine64 WINEPREFIX=~/.wine64 WINESERVER=~/wine64/bin/wineserver
wine64 '"/usr/local/bin/winetricks "'"$@"' > /usr/local/bin/winetricks64
chmod +x /usr/local/bin/winetricks64
wget https://github.com/doitsujin/dxvk/releases/download/v2.4.1/dxvk-2.4.1.tar.gz
tar -xvf dxvk-2.4.1.tar.gz && cd dxvk-2.4.1
WINEPREFIX=~/.wine32
cp x32/* "$WINEPREFIX/drive_c/windows/system32"
cp x32/*.dll "$WINEPREFIX/drive_c/windows/syswow64"
WINEPREFIX=~/.wine64
cp x64/* "$WINEPREFIX/drive_c/windows/system32"
cp x64/*.dll "$WINEPREFIX/drive_c/windows/syswow64"
cd ~/
rm -rf dxvk-2.4.1.tar.gz dxvk-2.4.1