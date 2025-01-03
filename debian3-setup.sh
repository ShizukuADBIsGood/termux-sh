apt update -y && apt upgrade -y && apt install automake bash build-essential bzip2 clang cmake command-not-found curl dbus gdb git golang grep libboost-all-dev libssl-dev iproute2 make maven mc nano neovim nodejs openjdk-11-jdk openssh-client openssh-server openssl perl procps python3-pip python3-all-dev python3-venv tar tmux vim wget -y
wget 'https://github.com/cli/cli/releases/download/v2.61.0/gh_2.61.0_linux_arm64.deb'
dpkg -i gh_2.61.0_linux_arm64.deb
rm gh_2.61.0_linux_arm64.deb
wget https://bootstrap.pypa.io/pip/3.7/get-pip.py
python3 -m venv myenv
source myenv/bin/activate
python3 get-pip.py
pip3 install numpy sympy matplotlib setuptools selenium jupyter pandas meson ninja
rm get-pip.py