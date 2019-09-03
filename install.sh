#! /bin/bash

sudo echo ""
install() {
  local name="$1"
  shift 1
  ("$@" >/dev/null 2>&1 ; /bin/false) &

	# ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏

  tput civis -- invisible

  pid=$! ; i=0
  while ps -a | awk '{print $name}' | grep -q "${pid}"
  do
    c=`expr ${i} % 10`
    case ${c} in
      0) echo -e " \033[0;36m⠋\033[0m Installing $name\r\c" ;;
      1) echo -e " \033[0;36m⠙\033[0m Installing $name\r\c" ;;
      2) echo -e " \033[0;36m⠹\033[0m Installing $name\r\c" ;;
      3) echo -e " \033[0;36m⠸\033[0m Installing $name\r\c" ;;
      4) echo -e " \033[0;36m⠼\033[0m Installing $name\r\c" ;;
      5) echo -e " \033[0;36m⠴\033[0m Installing $name\r\c" ;;
      6) echo -e " \033[0;36m⠦\033[0m Installing $name\r\c" ;;
      7) echo -e " \033[0;36m⠧\033[0m Installing $name\r\c" ;;
      8) echo -e " \033[0;36m⠇\033[0m Installing $name\r\c" ;;
      9) echo -e " \033[0;36m⠏\033[0m Installing $name\r\c" ;;
    esac
    i=`expr ${i} + 1`
    # change the speed of the spinner by altering the 1 below
    sleep 0.1
  done

  echo -e " \033[1;32m✓ \033[0m $name installed\r"

  tput cnorm -- normal

  # Collect the return code from the background process

  wait ${pid}
  ret=$?

  # You can report on any errors due to a non zero return code here

  # exit ${ret}
}

waitFor () {
  echo -e $1
  stty -echo
  read x
  stty echo
    tput el
}

echo "Name:"
read name

echo "Email:"
read email

init() {
  echo "StrictHostKeyChecking no" > ~/.ssh/config
  sudo apt-get update

  sudo apt-get install -y \
    git \
    xclip \
    curl \
    bash-completion

  git config --global user.name "$name"
  git config --global user.email "$email"

  ssh-keygen -t rsa -b 4096 -C "$email" -P "" -f ~/ssh/my_key
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/my_key 2> /dev/null
}

install "Git" init

cat ~/.ssh/my_key.pub|xclip -i -selection clipboard
waitFor "Add key to GitHub and press <enter> to continue installation\r\c"

install snap sudo apt-get install -y snapd

mkdir $HOME/Development

dotpath=~/Development/nic/dotfiles

install dotfiles git clone --quiet git@github.com:nicwestvold/dotfiles.git $dotpath

install nvim sh $dotpath/scripts/nvim.sh

install tmux sh $dotpath/scripts/tmux.sh

install alacritty sh $dotpath/scripts/alacritty.sh

install "nerd fonts" sh $dotpath/scripts/nerd-fonts.sh

install zsh sh $dotpath/scripts/zsh.sh

install docker sh $dotpath/scripts/docker.sh

install "docker compose" sh $dotpath/scripts/docker-compose.sh

install rust sh $dotpath/scripts/rust.sh

install asdf sh $dotpath/scripts/asdf.sh
install go sh $dotpath/scripts/go.sh
install nodejs sh $dotpath/scripts/nodejs.sh
install erlang sh $dotpath/scripts/erlang.sh
install elixir sh $dotpath/scripts/elixir.sh

install elm sh $dotpath/scripts/elm.sh

install "Linux Containers" sh $dotpath/scripts/linuxcontainers.sh

install chrome sh $dotpath/scripts/chrome.sh

install tweaks sh $dotpath/scripts/tweaks.sh

install chrome sh $dotpath/scripts/chrome.sh

install slack sh $dotpath/scripts/slack.sh

install zoom sh $dotpath/scripts/zoom.sh

install ack sh $dotpath/scripts/ack.sh
install htop sh $dotpath/scripts/htop.sh

install "Gnome Pomdoro" sh $dotpath/scripts/gnome-pomdoro.sh
install insomnia sh $dotpath/scripts/insomnia.sh
install vscode sh $dotpath/scripts/vscode.sh
install sublime-text sh $dotpath/scripts/sublime-text.sh
install haskell sh $dotpath/scripts/haskell.sh
install flutter sh $dotpath/scripts/flutter.sh

install signal sh $dotpath/scripts/signal.sh
install boostnote sh $dotpath/scripts/boostnote.sh

install facetime_camera sh $dotpath/scripts/facetime_camera.sh
install balena-etcher sh $dotpath/scripts/balena-etcher.sh
install vlc sh $dotpath/scripts/vlc.sh

chsh -s $(which zsh)

sudo shutdown -r now
