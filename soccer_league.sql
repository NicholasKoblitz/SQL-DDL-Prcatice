DROP DATABASE IF EXISTS soccer_league;

CREATE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(15) UNIQUE NOT NULL,
    players INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,

);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    first_team INTEGER REFERENCES teams NOT NULL,
    second_team INTEGER REFERENCES teams NOT NULL,
    who_won INTEGER REFERENCES teams NOT NULL,
    referee_id INTEGER REFERENCES referees NOT NULL
);

CREATE TABLE scored_goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players UNIQUE NOT NULL,
    game_id INTEGER REFERENCES games UNIQUE NOT NULL,
    goals INTEGER NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start INTEGER,
    end INTEGER
);

CREATE TABLE rankings
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams UNIQUE NOT NULL,
    rank INTEGER 
);