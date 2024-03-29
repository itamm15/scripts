#!/bin/bash

# C++
function run_sfml(){
  g++ $1 -I/opt/homebrew/Cellar/sfml/2.5.1_2/include/ -L/opt/homebrew/Cellar/sfml/2.5.1_2/lib/ -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio
}

function run_all_sfml() {
  g++ *.cpp -I/opt/homebrew/Cellar/sfml/2.5.1_2/include/ -L/opt/homebrew/Cellar/sfml/2.5.1_2/lib/ -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio
}


# Elixir
function mix_all(){
  echo "mix format"
  mix format
  echo "mix static.credo"
  mix static.credo
  echo "mix dialyzer"
  mix dialyzer
  echo "mix test"
  mix test
}

# Git
function count_lines_from_git(){
# If you want to use that function, just change the author with yours nick
git log --author="itamm15" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

# Misc
function create_user(){
  echo "User creation function"
  sudo dscl . -create /Users/$1
  sudo dscl . -create /Users/$1 UserShell /bin/bash
  sudo dscl . -create /Users/$1 RealName $2
  sudo dscl . -create /Users/$1 UniqueID $3
  sudo dscl . -create /Users/$1 PrimaryGroupID 1000
  sudo dscl . -create /Users/username NFSHomeDirectory /Local/Users/$1
  sudo dscl . -passwd /Users/username $4
  if dscl . list /Users | grep $1 ;
  then 
    echo "User has been created!"
  else
    echo "Failed."
  fi
}

