#!/bin/bash

call_dark_joke_1 () {
  curl -s https://v2.jokeapi.dev/joke/Dark?type=single | jq -r '.joke'
}

call_dark_joke_2 () {
  curl -s https://v2.jokeapi.dev/joke/Dark?type=twopart | jq -r '.[setup]  .[delivery]'
}

#TOP_10_STORIES=$(curl -s https://hacker-news.firebaseio.com/v0/topstories.json | jq -r '.[0:10] | .[]')

call_programming_joke_1 () {
  curl -s https://v2.jokeapi.dev/joke/Programming?type=single | jq -r '.joke'
}

call_programming_joke_2 () {
  curl -s https://v2.jokeapi.dev/joke/Programming?type=twopart | jq -r '.setup'
}

call_misc_joke_1 () {
  curl -s https://v2.jokeapi.dev/joke/Miscellaneous?type=single | jq -r '.joke'
}

call_misc_joke_2 () {
  curl -s https://v2.jokeapi.dev/joke/Miscellaneous?type=twopart | jq -r '.setup'
}

call_pun () {
  curl -s https://v2.jokeapi.dev/joke/Pun?type=single | jq -r '.joke'
}


joke () {
echo -e "What type of joke would you like to hear? \n1:Dark \n2:Programming \n3:Random \n4:Pun"
read answer
  if [ "$answer" = "1" ]
  then
    echo "You want a one liner or two part? 1 or 2"
    read one_two
      if [ "$one_two" = "1" ]
      then
        call_dark_joke_1
      elif [ "$one_two" = "2" ]
      then  
        call_dark_joke_2
      fi    
  elif [ "$answer" = "2" ]
  then
    echo "You want a one liner or two part? 1 or 2"
    read one_two
      if [ "$one_two" = "1" ]
      then
        call_programming_joke_1
      elif [ "$one_two" = "2" ]
      then  
        call_programming_joke_2
      fi    
  elif [ "$answer" = "3" ]
  then
    echo "You want a one liner or two part? 1 or 2"
    read one_two
      if [ "$one_two" = "1" ]
      then
        call_misc_joke_1
      elif [ "$one_two" = "2" ]
      then  
        call_misc_joke_2
      fi
  elif [ "$answer" = "4" ]
  then
    call_pun
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

delivery() {
  echo Would you like to hear a joke? y or n
  read varname
  if [ "$varname" = "y" ]
  then
    joke
  else
    quit
  fi
}

delivery