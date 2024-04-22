#! /bin/bash

# PSQL connection var
PSQL="psql --username=postgres --dbname=number_guess -t --no-align -c"

# greet the player
echo "Enter your username:"
read USERNAME

# check if player exists
PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$USERNAME'")

if [[ -z $PLAYER_ID ]]; then
  # Put new player in DB
  INSERT_NEW_PLAYER=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME')")
  # get new player ID
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else
  # get informationss about player
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM scores WHERE player_id=$PLAYER_ID")
  GAMES_BEST=$($PSQL "SELECT MIN(guesses) FROM scores WHERE player_id=$PLAYER_ID")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $GAMES_BEST guesses."

fi

# start of the game
SECRET_NUMBER=$((RANDOM % 1000 +1))
TRIES=1

echo "Guess the secret number between 1 and 1000:"
while true; do
  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue

  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
    ((TRIES++))
  
  elif [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
    ((TRIES++))
  
  elif [[ $GUESS -eq $SECRET_NUMBER ]]; then
    INSERT_GAME_SCORE=$($PSQL "INSERT INTO scores(player_id,guesses) VALUES($PLAYER_ID,$TRIES)")
    echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break

  fi
done
