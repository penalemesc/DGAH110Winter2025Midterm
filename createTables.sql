/*
 This file contains all the tables that were used for the creation of this midterm
 to run it, use PostgreSQL, if you are at Carleton College and are able to connect to the Stearns server
 then all you would need to do is copy the entire folder where this file is hosted onto somewhere in that server,
 go into it from terminal run the psql command and then once inside the psql terminal: \i createTables.sql
 You can check whether or not the tables where created by running the command \dt, this will bring up all the 
 tables that are in the system under your username
 */


/*This table includes all the data from the file uncannyxmen100149characters1STRunThrough.csv
 drop table if exists characters;
CREATE TABLE characters(
 issue text not null,
 personaje text not null,
 RenderedUnconcious text,
 Captured text, 
 DeclaredDead text,	
 Redressed text,
 Depowered text,
 ClothingTorn real,
 SubjecttoTorture text,
 QuitsTeam text,
 Surrenders text,
 numberKillsHumans real,
 numberKillsNonhumans real,	
 InitiatesPhysicalConflict text,
 ExpressesReluctancetoFight text,
 Onadatewithwhichcharacter text,
 Kisswithwhichcharacter text,
 Handholdingwithwhichcharacter text,	
 Dancingwithwhichcharacter text,
 Flyingwithanothercharacter text,
 ArminArmwithwhichcharacter text,
 Huggingwithwhichcharacter text,
 PhysicalContactOther text,
 Carryingwithwhichcharacter text,
 SharedBedwithwhichcharacter	text,
 SharedRoomdomesticallywithwhichcharacter text,
 ExplicitlyStatesIloveyoutowhom text,
 SharedUndress text,
 ShowerNumberofpanelsshowerlasts text,	
 BathNumberofpanelsbathlasts	text,
 DepictedEatingFood text,
 VisibleTearsNumberOfPanels text,
 VisibleTearsNumberofIntances text,
 SpecialNotes text
 );
This is the table that was decided as the final relation for the character dataset since these are the pieces 
 of data that were explored for this project*/

DROP TABLE IF EXISTS deathAndTears;
DROP TABLE IF EXISTS bechdelTest;
DROP TABLE IF EXISTS bechdelAndDeathAndTears;
CREATE TABLE deathAndTears(
    issue text NOT NULL,
    personaje text NOT NULL,
    totalKills real,
    numberKillsHumans real,
    numberKillsNonhumans real,
    instancesOfTears real
);
CREATE TABLE bechdelTest(
    issue text NOT NULL,
    passbechdel text,
    PRIMARY KEY(issue, passbechdel)
);


/* \copy characters from 'uncannyxmen100149characters1STRunThrough.csv' DELIMITER ',' CSV */
\copy deathAndTears FROM 'ucxmen100149DeathAndTears.csv' DELIMITER ',' CSV;
\copy bechdelTest FROM 'xmenBechdelTest.csv' DELIMITER ',' CSV;