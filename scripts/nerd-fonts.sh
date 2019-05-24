#! /bin/bash

cd /tmp

# font="FiraCode"
# font="FiraMono"
# font="DejaVuSansMono"
font="Iosevka"
# font="FiraCode"
# font="FiraCode"
# font="FiraCode"
# font="FiraCode"
# font="FiraCode"

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/$font.zip

mkdir -p $HOME/.local/share/fonts/NerdFonts

unzip $font.zip -d ~/.local/share/fonts/NerdFonts

fc-cache -f -v
