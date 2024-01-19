<img src="postgresql-original.svg" height="40" width="40"/>  <img src="bash-original.svg" height="40" width="40"/>

# World Cup Database

## Description

Bash script that enters information from World Cup games into PostgreSQL, then query the database for useful statistics.

## Usage

### Setup
run
```bash
$ psql -U postgres < worldcup.sql
```
to enter the data into the database:
```bash
$ ./insert_data.sh
```
### Queries
1. Total number of goals in all games from winning teams.
2. Total number of goals in all games from both teams combined.
3. Average number of goals in all games from the winning teams.
4. Average number of goals in all games from the winning teams rounded to two decimal places.
5. Average number of goals in all games from both teams.
6. Most goals scored in a single game by one team.
7. Number of games where the winning team scored more than two goals.
8. Winner of the 2018 tournament team name.
9. List of teams who played in the 2014 'Eighth-Final' round.
10. List of unique winning team names in the whole data set.
11. Year and team name of all the champions.
12. List of teams that start with 'Co'.

### to run the queries:
```bash
$ ./queries.sh
```

## Technologies:

- PostgreSQL
- Bash
