#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams;")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Insert winner team to the teams Table
  if [[ $WINNER != "winner" ]]
  then
    # Get team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")

    # If not found
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER = "INSERT 0 1" ]]
      then
        echo $WINNER inserted to the teams
      fi
    fi
  fi

   # Insert oppnent team to the teams Table
  if [[ $OPPONENT != "opponent" ]]
  then
    # Get team_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    # If not found
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT = "INSERT 0 1" ]]
      then
        echo $OPPONENT inserted to the teams
      fi
    fi
  fi

  # Get new team_id for winner
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")

  # Get new team_id for opponent
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

  # Insert games
  if [[ -n $WINNER_ID || -n $OPPONENT_ID ]]
  then
    if [[ $YEAR != "year" ]]
    then
      INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERT_GAMES = "INSERT 0 1" ]]
      then
        echo game $WINNER VS $OPPONENT, $YEAR inserted
      fi
    fi
  fi
done
