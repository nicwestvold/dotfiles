#! /bin/bash

if ! [ -x "$(command -v asdf)" ]; then
  echo 'Error: asdf is not installed.' >&2
  exit 1
fi

# TODO: check if the plugin is already installed
# install the elixir plugin
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

# get the latest (non-rc) version of elixir
latest=$(asdf list-all elixir | awk '!/rc/ {a=$0} END{print a}')

if [ -x "$(command -v elixir)" ]; then
  curr=$(elixir -v | awk '/Elixir/ {print $2}')
  if [ "$curr" = "$latest" ]; then
    echo 'elixir is at the latest version' >&2
    exit 0
  else
    echo 'elixir is NOT at the latest version' >&2
    echo "current: $curr"
    echo "latest : $latest"
    exit 0
  fi
fi

# TODO: this needs to be updated to parse the latest version coming back from the `list-all` command

# get the OTP version number
otp="otp-$(erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().' -noshell | awk -F. '{print $1}')"

echo "installing version $latest of elixir"
asdf install elixir $latest
asdf global elixir $latest
