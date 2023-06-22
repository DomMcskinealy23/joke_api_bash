#!/bin/bash

call_dark_joke () {
  curl -s https://v2.jokeapi.dev/joke/Dark?type=single | jq -r '.joke'
}

call_programming_joke () {
  curl -s https://v2.jokeapi.dev/joke/Programming?type=single | jq -r '.joke'
}

call_misc_joke () {
  curl -s https://v2.jokeapi.dev/joke/Miscellaneous?type=single | jq -r '.joke'
}

call_pun () {
  curl -s https://v2.jokeapi.dev/joke/Pun?type=single | jq -r '.joke'
}

joke () {
  echo Would you like to hear a joke? y or n
  read varname
  if [ "$varname" = "y" ]
  then
    echo -e "What type of joke would you like to hear? \n1:Dark \n2:Programming \n3:Random \n4:Pun"
    read answer
    if [ "$answer" = "1" ]
    then
      call_dark_joke
    elif [ "$answer" = "2" ]
    then
      call_programming_joke
    elif [ "$answer" = "3" ]
    then
      call_misc_joke
    elif [ "$answer" = "4" ]
    then
      call_pun
    fi
  fi
  echo You wanna hear another one? y or n
  read answer
  if [ "$answer" = "y" ]
  then
    joke
  else
    exit
  fi
}

joke