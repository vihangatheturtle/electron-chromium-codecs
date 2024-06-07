echo Updating apt repos
sudo apt-get update
sudo apt-get install -y build-essential clang libdbus-1-dev libgtk-3-dev \
    libnotify-dev libasound2-dev libcap-dev \
    libcups2-dev libxtst-dev \
    libxss1 libnss3-dev gcc-multilib g++-multilib curl \
    gperf bison python3-dbusmock openjdk-8-jre \
    git npm
sudo rm -r depot_tools
echo Cloning depot_tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
echo Adding depot_tools to PATH
export PATH=/workspace/electron-chromium-codecs/depot_tools:$PATH
sudo rm -r electron
mkdir electron && cd electron
echo Running gclient config...
../depot_tools/gclient config --name "src/electron" --unmanaged https://github.com/electron/electron
../depot_tools/gclient sync --with_branch_heads --with_tags