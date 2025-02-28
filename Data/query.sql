/* 
    These queries were created to make the unlcean versions of the kills/tears and bechdel relations
    the reason as for why they are unclean is that to the best of my knowledge, group by with this data set
    creates an empty row for every item that does have a value in either tears or kills, so there are 2 rows for
    those issues when there should be one in reality, because the amount for both was less than 10 combined
    I exported the tables and cleaned them manually using Excel
 */

DROP TABLE IF EXISTS killsAndBechdel;
DROP TABLE IF EXISTS tearsAndBechdel;
DROP TABLE IF EXISTS bechdelAndDeathAndTears;
DROP TABLE IF EXISTS noBechdel;

CREATE TABLE killsAndBechdel AS
SELECT
    bt.issue,
    dat.totalKills
FROM
    deathAndTears dat,
    bechdelTest bt
WHERE
    dat.issue = bt.issue
    AND passbechdel = 'Y'
GROUP BY
    bt.issue,
    dat.totalKills
ORDER BY
    bt.issue ASC;


CREATE TABLE tearsAndBechdel AS
SELECT 
    distinct bt.issue,
    dat.instancesOfTears
FROM
    deathAndTears dat,
    bechdelTest bt
WHERE
    dat.issue = bt.issue
    AND passbechdel = 'Y'
GROUP BY
    bt.issue, dat.instancesOfTears
ORDER BY
    bt.issue ASC;

CREATE TABLE bechdelAndDeathAndTears AS
SELECT 
    bt.issue,
    bt.passbechdel,
    dat.totalKills,
    dat.instancesOfTears
FROM
    deathAndTears dat,
    bechdelTest bt
WHERE
    dat.issue = bt.issue
GROUP BY
    bt.issue, bt.passbechdel, dat.totalKills, dat.instancesOfTears
ORDER BY
    bt.issue ASC;

CREATE TABLE noBechdel AS
SELECT 
    bt.issue,
    bt.passbechdel,
    dat.totalKills,
    dat.instancesOfTears
FROM
    deathAndTears dat,
    bechdelTest bt
WHERE
    dat.issue = bt.issue 
    AND bt.passbechdel = 'N'
GROUP BY
    bt.issue, bt.passbechdel, dat.totalKills, dat.instancesOfTears
ORDER BY
    bt.issue ASC;


\COPY killsAndBechdel TO '/Accounts/penalemesc/DGAH110Midterm/killsAndBechdel.csv' DELIMITER ',' CSV HEADER;
\COPY tearsAndBechdel TO '/Accounts/penalemesc/DGAH110Midterm/tearsAndBechdel.csv' DELIMITER ',' CSV HEADER;
\COPY bechdelAndDeathAndTears TO '/Accounts/penalemesc/DGAH110Midterm/bechdelAndDeathAndTears.csv' DELIMITER ',' CSV HEADER;
\COPY noBechdel TO '/Accounts/penalemesc/DGAH110Midterm/noBechdel.csv' DELIMITER ',' CSV HEADER;