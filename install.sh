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

install dotfiles git clone --quiet git@github.com:nicwestvold/dotfiles.git ~/.dotfiles

install nvim sh ~/.dotfiles/scripts/nvim.sh

install tmux sh ~/.dotfiles/scripts/tmux.sh

install alacritty sh ~/.dotfiles/scripts/alacritty.sh

install "nerd fonts" sh ~/.dotfiles/scripts/nerd-fonts.sh

install zsh sh ~/.dotfiles/scripts/zsh.sh

install docker sh ~/.dotfiles/scripts/docker.sh

install "docker compose" sh ~/.dotfiles/scripts/docker-compose.sh

install rust sh ~/.dotfiles/scripts/rust.sh

install asdf sh ~/.dotfiles/scripts/asdf.sh
install go sh ~/.dotfiles/scripts/go.sh
install nodejs sh ~/.dotfiles/scripts/nodejs.sh
install erlang sh ~/.dotfiles/scripts/erlang.sh
install elixir sh ~/.dotfiles/scripts/elixir.sh

install elm sh ~/.dotfiles/scripts/elm.sh

install "Linux Containers" sh ~/.dotfiles/scripts/linuxcontainers.sh

install chrome sh ~/.dotfiles/scripts/chrome.sh

install tweaks sh ~/.dotfiles/scripts/tweaks.sh

install chrome sh ~/.dotfiles/scripts/chrome.sh

install slack sh ~/.dotfiles/scripts/slack.sh

install zoom sh ~/.dotfiles/scripts/zoom.sh

install ack sh ~/.dotfiles/scripts/ack.sh
install balena-etcher sh ~/.dotfiles/scripts/balena-etcher.sh
install boostnote sh ~/.dotfiles/scripts/boostnote.sh
install facetime_camera sh ~/.dotfiles/scripts/facetime_camera.sh
install flutter sh ~/.dotfiles/scripts/flutter.sh
install "Gnome Pomdoro" sh ~/.dotfiles/scripts/gnome-pomdoro.sh
install insomnia sh ~/.dotfiles/scripts/insomnia.sh
install htop sh ~/.dotfiles/scripts/htop.sh
install haskell sh ~/.dotfiles/scripts/haskell.sh
install signal sh ~/.dotfiles/scripts/signal.sh
install sublime-text sh ~/.dotfiles/scripts/sublime-text.sh
install vscode sh ~/.dotfiles/scripts/vscode.sh
install vlc sh ~/.dotfiles/scripts/vlc.sh

chsh -s $(which zsh)

sudo shutdown -r now
