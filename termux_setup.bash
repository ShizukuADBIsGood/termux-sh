#!/data/data/com.termux/files/usr/bin/bash
pkg install 2048-c android-tools apksigner automake bash build-essential bzip2 chromium clang cmake command-not-found curl dbus dconf debootstrap dpkg fdroidcl ffmpeg fontconfig-utils fontconfig freetype gdb gh git glab-cli golang grep iproute2 make maven mc nano neovim nodejs openjdk-17-x openjdk-17 openssh-sftp-server openssh openssl-tool openssl perl procps proot python-ensurepip-wheels python-pip python qemu-common qemu-system-x86_64 qemu-utils tar termux-am-socket termux-am termux-api termux-auth termux-exec termux-keyring termux-licenses termux-tools termux-x11-nightly tigervnc tmux tor torsocks vim wget which x11-repo xfce4 -y
cd ~ && mkdir .shortcuts && cp -r ~/termux-sh/DOTshortcuts ~/.shortcuts && chmod +x ~/.shortcuts/*sh && cp ~/termux-sh/DOTbashrc ~/.bashrc && source .bashrc && cp ~/termux-sh/DOTshortcuts/* ~ && chmod +x ~/*sh
sed '/allow-external-apps/s/^# //' -i ~/.termux/termux.properties && termux-reload-settings        && wget 'https://github.com/termux/termux-x11/releases/download/nightly/termux-x11-nightly-1.03.01-0-all.deb' -O termux-x11-nightly-all.deb && dpkg -i termux-x11-nightly-all.deb
wget https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-nocloud-amd64.qcow2
wget https://andronixos.sfo2.cdn.digitaloceanspaces.com/OS-Files/setup-audio.sh && chmod +x setup-audio.sh && ./setup-audio.sh && git clone https://github.com/xmrig/xmrig.git && mkdir xmrig/build && cd xmrig/build && cmake .. -DWITH_HWLOC=OFF && make -j$(nproc) && cd ~
go install github.com/danielmiessler/fabric@latest
unset LD_PRELOAD && sed -i 's/^#zh_TW.UTF-8 UTF-8/zh_TW.UTF-8 UTF-8/' $PREFIX/glibc/etc/locale.gen && locale-gen && mkdir ~/.fonts && cd ~/.fonts && wget https://github.com/zanjie1999/windows-fonts/raw/wine/msyh.ttc && wget https://raw.githubusercontent.com/ButTaiwan/iansui/main/fonts%2FIansui-Regular.ttf && cd ~
mkdir debian1 && cd debian1 && wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Debian/debian.sh -O debian.sh && chmod +x debian.sh && cd ~ && mkdir debian2 && cd debian2 && wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Debian/debian-xfce.sh -O debian-xfce.sh && chmod +x debian-xfce.sh && cd ~ && mkdir debian3 && cd debian3 && wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Debian/debian.sh -O debian.sh && chmod +x debian.sh && cd ~
cp ~/termux-sh/debian1_setup.sh ~/debian1/debian-fs/root && cp ~/termux-sh/debian2_setup.sh ~/debian2/debian-fs/root && cp ~/termux-sh/debian3_setup.sh ~/debian3/debian-fs/root
npm install node-html-markdown && npm install showdown && npm install jsdom