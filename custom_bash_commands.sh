#!/bin/bash

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