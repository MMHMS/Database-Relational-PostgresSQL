+----------------+-----------------------+-----------+----------+--------------------------------------------------+
|     Column     |         Type          | Collation | Nullable |                     Default                      |
+----------------+-----------------------+-----------+----------+--------------------------------------------------+
| character_id   | integer               |           | not null | nextval('characters_character_id_seq'::regclass) |
| name           | character varying(30) |           | not null |                                                  |
| homeland       | character varying(60) |           |          |                                                  |
| favorite_color | character varying(30) |           |          |                                                  |
+----------------+-----------------------+-----------+----------+--------------------------------------------------+

INSERT INTO characters(name, homeland, favorite_color)
mario_database-# VALUES
mario_database-#   ('Mario', 'Mushroom Kingdom', 'Red'),
mario_database-#   ('Luigi', 'Mushroom Kingdom', 'Green'),
mario_database-#   ('Peach', 'Mushroom Kingdom', 'Pink'),
mario_database-#   ('Toadstool', 'Mushroom Kingdom', 'Red'),
mario_database-#   ('Bowser', 'Mushroom Kingdom', 'Green'),
mario_database-#   ('Daisy', 'Sarasaland', 'Yellow'),
mario_database-#   ('Yoshi', 'Dinosaur Land', 'Green');
INSERT 0 7
mario_database=# SELECT * FROM characters;
                                
+--------------+-----------+------------------+----------------+
| character_id |   name    |     homeland     | favorite_color |
+--------------+-----------+------------------+----------------+
|            1 | Mario     | Mushroom Kingdom | Red            |
|            2 | Luigi     | Mushroom Kingdom | Green          |
|            3 | Peach     | Mushroom Kingdom | Pink           |
|            4 | Toadstool | Mushroom Kingdom | Red            |
|            5 | Bowser    | Mushroom Kingdom | Green          |
|            6 | Daisy     | Sarasaland       | Yellow         |
|            7 | Yoshi     | Dinosaur Land    | Green          |
+--------------+-----------+------------------+----------------+
(7 rows)

mario_database=# UPDATE characters SET favorite_color = 'Orange' WHERE name = 'Daisy';
UPDATE 1
mario_database=# UPDATE characters SET name = 'Toad' WHERE favorite_color = 'Red';
mario_database=# UPDATE 2
UPDATE characters SET name = 'Mario' WHERE character_id = (SELECT MIN(character_id) FROM characters WHERE name = 'Toad');
mario_database=# UPDATEUPDATE 1
 characters SET favorite_color = 'Blue' WHERE name = 'Toad';
mario_database=# UPDATE 1
UPDATE characters SET favorite_color = 'Yellow' WHERE name = 'Bowser';
mario_database=# UPDATE 1
UPDATE characters SET homeland = 'Koopa Kingdom' WHERE name = 'Bowser';
mario_database=# UPDATE 1
SELECT * FROM characters ORDER BY character_id;
mario_database=#                                
+--------------+--------+------------------+----------------+
| character_id |  name  |     homeland     | favorite_color |
+--------------+--------+------------------+----------------+
|            1 | Mario  | Mushroom Kingdom | Red            |
|            2 | Luigi  | Mushroom Kingdom | Green          |
|            3 | Peach  | Mushroom Kingdom | Pink           |
|            4 | Toad   | Mushroom Kingdom | Blue           |
|            5 | Bowser | Koopa Kingdom    | Yellow         |
|            6 | Daisy  | Sarasaland       | Orange         |
|            7 | Yoshi  | Dinosaur Land    | Green          |
+--------------+--------+------------------+----------------+
(7 rows)

ALTER TABLE characters ADD PRIMARY KEY(name);
mario_database=# ALALTER TABLE
TER TABLE characters DROP CONSTRAINT characters_pkey;
mario_database=# ALTER TABLE
ALTER TABLE characters ADD PRIMARY KEY(character_id);
mario_database=# ALTER TABLE
CREATE TABLE more_info (
mario_database(#   more_info_id SERIAL PRIMARY KEY,
mario_database(#   birthday DATE,
mario_database(#   height INT,
mario_database(#   weight NUMERIC(4,1)
mario_database(# );
mario_database=# CREATE TABLE
ALTER TABLE more_info ADD COLUMN character_id INT REFERENCES characters(character_id);
ALTER TABLE
mario_database=# ALTER TABLE more_info ADD UNIQUE(character_id);
ALTER TABLE
mario_database=# ALTER TABLE more_info ALTER COLUMN character_id SET NOT NULL;
ALTER TABLE
mario_database=# SELECT character_id, name FROM characters;
mario_database=#              
+--------------+--------+
| character_id |  name  |
+--------------+--------+
|            2 | Luigi  |
|            3 | Peach  |
|            7 | Yoshi  |
|            6 | Daisy  |
|            1 | Mario  |
|            4 | Toad   |
|            5 | Bowser |
+--------------+--------+
(7 rows)


mario_database=# \d more_info
                                        Table "public.more_info"
+--------------+--------------+-----------+----------+-------------------------------------------------+
|    Column    |     Type     | Collation | Nullable |                     Default                     |
+--------------+--------------+-----------+----------+-------------------------------------------------+
| more_info_id | integer      |           | not null | nextval('more_info_more_info_id_seq'::regclass) |
| birthday     | date         |           |          |                                                 |
| height       | integer      |           |          |                                                 |
| weight       | numeric(4,1) |           |          |                                                 |
| character_id | integer      |           | not null |                                                 |
+--------------+--------------+-----------+----------+-------------------------------------------------+
Indexes:
    "more_info_pkey" PRIMARY KEY, btree (more_info_id)
    "more_info_character_id_key" UNIQUE CONSTRAINT, btree (character_id)
Foreign-key constraints:
    "more_info_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)

mario_database=# insert into more_info(birthday, height, weight, character_id) values ('1981-07-09',155,64.5,1);
mario_database=# INSERT 0 1

mario_database=# select*from more_info
mario_database-# ;
mario_database=#                                
+--------------+------------+--------+--------+--------------+
| more_info_id |  birthday  | height | weight | character_id |
+--------------+------------+--------+--------+--------------+
|            1 | 1981-07-09 |    155 |   64.5 |            1 |
+--------------+------------+--------+--------+--------------+
(1 row)

select CHA
mario_database-# 
mario_database-# select charactere_id, name from characteres;
ERROR:  syntax error at or near "sele"
LINE 1: sele
        ^
mario_database=# select charactere_id, name from characteres;
ERROR:  relation "characteres" does not exist
LINE 1: select charactere_id, name from characteres;
                                        ^
mario_database=# select character_id, name from characteres;
ERROR:  relation "characteres" does not exist
LINE 1: select character_id, name from characteres;
                                       ^
mario_database=# select character_id, name from characters;
mario_database=#              
+--------------+--------+
| character_id |  name  |
+--------------+--------+
|            2 | Luigi  |
|            3 | Peach  |
|            7 | Yoshi  |
|            6 | Daisy  |
|            1 | Mario  |
|            4 | Toad   |
|            5 | Bowser |
+--------------+--------+
(7 rows)

                 insert into more_info(birthday, height, weight, character_id) values ('1983-07-14',175,48.8,2);
mario_database=# INSERT 0 1
select * from more_info;
                               
+--------------+------------+--------+--------+--------------+
| more_info_id |  birthday  | height | weight | character_id |
+--------------+------------+--------+--------+--------------+
|            1 | 1981-07-09 |    155 |   64.5 |            1 |
|            2 | 1983-07-14 |    175 |   48.8 |            2 |
+--------------+------------+--------+--------+--------------+
(2 rows)

mario_database=# select character_id, name from characters;
             
+--------------+--------+
| character_id |  name  |
+--------------+--------+
|            2 | Luigi  |
|            3 | Peach  |
|            7 | Yoshi  |
|            6 | Daisy  |
|            1 | Mario  |
|            4 | Toad   |
|            5 | Bowser |
+--------------+--------+
(7 rows)

mario_database=# insert into more_info(birthday, height, weight, character_id) values ('1985-10-18',173,52.2,3);
INSERT 0 1
mario_database=# select character_id, name from characters where name = 'Toad';
mario_database=#             
+--------------+------+
| character_id | name |
+--------------+------+
|            4 | Toad |
+--------------+------+
(1 row)

                 insert into more_info(birthday, height, weight, character_id) values ('1950-01-10',66,35.6,4);
INSERT 0 1
mario_database=# select * from more_info;
                               
+--------------+------------+--------+--------+--------------+
| more_info_id |  birthday  | height | weight | character_id |
+--------------+------------+--------+--------+--------------+
|            1 | 1981-07-09 |    155 |   64.5 |            1 |
|            2 | 1983-07-14 |    175 |   48.8 |            2 |
|            3 | 1985-10-18 |    173 |   52.2 |            3 |
|            4 | 1950-01-10 |     66 |   35.6 |            4 |
+--------------+------------+--------+--------+--------------+
(4 rows)

mario_database=# select character_id, name from characters where name = 'Bowser';
             
+--------------+--------+
| character_id |  name  |
+--------------+--------+
|            5 | Bowser |
+--------------+--------+
(1 row)

mario_database=# insert into more_info(birthday, height, weight, character_id) values ('1990-10-29',258,300,5);
mario_database=# INSERT 0 1
                 select character_id, name from characters where name = 'Daisy';
mario_database=#             
+--------------+-------+
| character_id | name  |
+--------------+-------+
|            6 | Daisy |
+--------------+-------+
(1 row)

                 insert into more_info(birthday, height, weight, character_id) values ('1989-07-31',NULL,NULL,6);
INSERT 0 1
mario_database=# select * from more_info;
mario_database=#                                
+--------------+------------+--------+--------+--------------+
| more_info_id |  birthday  | height | weight | character_id |
+--------------+------------+--------+--------+--------------+
|            1 | 1981-07-09 |    155 |   64.5 |            1 |
|            2 | 1983-07-14 |    175 |   48.8 |            2 |
|            3 | 1985-10-18 |    173 |   52.2 |            3 |
|            4 | 1950-01-10 |     66 |   35.6 |            4 |
|            5 | 1990-10-29 |    258 |  300.0 |            5 |
|            6 | 1989-07-31 |        |        |            6 |
+--------------+------------+--------+--------+--------------+
(6 rows)

                 select character_id, name from characters where name = 'Yoshi';
mario_database=#             
+--------------+-------+
| character_id | name  |
+--------------+-------+
|            7 | Yoshi |
+--------------+-------+
(1 row)

                 insert into more_info(birthday, height, weight, character_id) values ('1990-04-13',162,59.1,7);
mario_database=# INSERT 0 1

mario_database=# select * from more_info;
                               
+--------------+------------+--------+--------+--------------+
| more_info_id |  birthday  | height | weight | character_id |
+--------------+------------+--------+--------+--------------+
|            1 | 1981-07-09 |    155 |   64.5 |            1 |
|            2 | 1983-07-14 |    175 |   48.8 |            2 |
|            3 | 1985-10-18 |    173 |   52.2 |            3 |
|            4 | 1950-01-10 |     66 |   35.6 |            4 |
|            5 | 1990-10-29 |    258 |  300.0 |            5 |
|            6 | 1989-07-31 |        |        |            6 |
|            7 | 1990-04-13 |    162 |   59.1 |            7 |
+--------------+------------+--------+--------+--------------+
(7 rows)

mario_database=# alter table more_info rename column height to height_in_cm;
ALTER TABLE
mario_database=# alter table more_info rename column weight to weight_in_kg;
ALTER TABLE
mario_database=# select * from more_info;
mario_database=#                                      
+--------------+------------+--------------+--------------+--------------+
| more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+------------+--------------+--------------+--------------+
|            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | 1990-10-29 |          258 |        300.0 |            5 |
|            6 | 1989-07-31 |              |              |            6 |
|            7 | 1990-04-13 |          162 |         59.1 |            7 |
+--------------+------------+--------------+--------------+--------------+
(7 rows)


mario_database=# create table sounds(sound_id SERIAL PRIMARY KEY);
mario_database=# CREATE TABLE
\d mario                 _database
Did not find any relation named "mario_database".
mario_database=# \d mario_database;
Did not find any relation named "mario_database".
mario_database=# \l mario_database;
mario_database=#                                  List of databases
+----------------+--------------+----------+---------+---------+-------------------+
|      Name      |    Owner     | Encoding | Collate |  Ctype  | Access privileges |
+----------------+--------------+----------+---------+---------+-------------------+
| mario_database | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                   |
+----------------+--------------+----------+---------+---------+-------------------+
(1 row)

\d
mario_database=#                         List of relations
+--------+-----------------------------+----------+--------------+
| Schema |            Name             |   Type   |    Owner     |
+--------+-----------------------------+----------+--------------+
| public | characters                  | table    | freecodecamp |
| public | characters_character_id_seq | sequence | freecodecamp |
| public | more_info                   | table    | freecodecamp |
| public | more_info_more_info_id_seq  | sequence | freecodecamp |
| public | sounds                      | table    | freecodecamp |
| public | sounds_sound_id_seq         | sequence | freecodecamp |
+--------+-----------------------------+----------+--------------+
(6 rows)


mario_database=# alter table sounds add column filename varchar(40) not null unique;
ALTER TABLE
mario_database=# \d sounds;
                                        Table "public.sounds"
+----------+-----------------------+-----------+----------+------------------------------------------+
|  Column  |         Type          | Collation | Nullable |                 Default                  |
+----------+-----------------------+-----------+----------+------------------------------------------+
| sound_id | integer               |           | not null | nextval('sounds_sound_id_seq'::regclass) |
| filename | character varying(40) |           | not null |                                          |
+----------+-----------------------+-----------+----------+------------------------------------------+
Indexes:
    "sounds_pkey" PRIMARY KEY, btree (sound_id)
    "sounds_filename_key" UNIQUE CONSTRAINT, btree (filename)

mario_database=# alter table sounds add column character_id int not null references  characters(character_id);
ALTER TABLE
mario_database=# \d sounds;
                                          Table "public.sounds"
+--------------+-----------------------+-----------+----------+------------------------------------------+
|    Column    |         Type          | Collation | Nullable |                 Default                  |
+--------------+-----------------------+-----------+----------+------------------------------------------+
| sound_id     | integer               |           | not null | nextval('sounds_sound_id_seq'::regclass) |
| filename     | character varying(40) |           | not null |                                          |
| character_id | integer               |           | not null |                                          |
+--------------+-----------------------+-----------+----------+------------------------------------------+
Indexes:
    "sounds_pkey" PRIMARY KEY, btree (sound_id)
    "sounds_filename_key" UNIQUE CONSTRAINT, btree (filename)
Foreign-key constraints:
    "sounds_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)

mario_database=# select * from characters order by character_id;
mario_database=#                                
+--------------+--------+------------------+----------------+
| character_id |  name  |     homeland     | favorite_color |
+--------------+--------+------------------+----------------+
|            1 | Mario  | Mushroom Kingdom | Red            |
|            2 | Luigi  | Mushroom Kingdom | Green          |
|            3 | Peach  | Mushroom Kingdom | Pink           |
|            4 | Toad   | Mushroom Kingdom | Blue           |
|            5 | Bowser | Koopa Kingdom    | Yellow         |
|            6 | Daisy  | Sarasaland       | Orange         |
|            7 | Yoshi  | Dinosaur Land    | Green          |
+--------------+--------+------------------+----------------+
(7 rows)

inserti                 ;
ERROR:  syntax error at or near ";"
LINE 1: insert ;
               ^
mario_database=# insert into sounds(filename,character_id) values (its-a-me.wav,1);
ERROR:  column "its" does not exist
LINE 1: insert into sounds(filename,character_id) values (its-a-me.w...
                                                          ^
mario_database=# insert into sounds(filename,character_id) values ('its-a-me.wav',1);
INSERT 0 1
mario_database=# insert into sounds(filename,character_id) values ('yippee.wav',1);
mario_database=# INSERT 0 1
                 insert into sounds(filename,character_id) values ('ha-ha.wav',2);
mario_database=# INSERT 0 1
                 insert into sounds(filename,character_id) values ('oh-yeah.wav',2);
INSERT 0 1
mario_database=# insert into sounds(filename,character_id) values ('yay.wav',3),('woo-hoo.wav',3);
INSERT 0 2
mario_database=# insert into sounds(filename,character_id) values ('mm-hmm.wav',3),('yahoo.wav',1);
INSERT 0 2
mario_database=# select * from sounds;
                     
+----------+--------------+--------------+
| sound_id |   filename   | character_id |
+----------+--------------+--------------+
|        1 | its-a-me.wav |            1 |
|        2 | yippee.wav   |            1 |
|        3 | ha-ha.wav    |            2 |
|        4 | oh-yeah.wav  |            2 |
|        5 | yay.wav      |            3 |
|        6 | woo-hoo.wav  |            3 |
|        7 | mm-hmm.wav   |            3 |
|        8 | yahoo.wav    |            1 |
+----------+--------------+--------------+
(8 rows)

mario_database=# create table actions(action_id serial primary key);
CREATE TABLE
mario_database=# alter table actions add column action varchar(20) unique not null;
ALTER TABLE
mario_database=# insert into actions(action) values('run');
INSERT 0 1
mario_database=# insert into actions(action) values('jump');
INSERT 0 1
mario_database=# insert into actions(action) values('duck');
INSERT 0 1
mario_database=# select * from actions;
           
+-----------+--------+
| action_id | action |
+-----------+--------+
|         1 | run    |
|         2 | jump   |
|         3 | duck   |
+-----------+--------+
(3 rows)

mario_database=# create table character_actions();
mario_database=# CREATE TABLE
atle             ;
mario_database=# alter table character_action add column character_id int not null;
ERROR:  relation "character_action" does not exist
mario_database=# alter table character_actions add column character_id int not null;
ALTER TABLE
mario_database=# alter table character_actions add foreign key(character_id) references characters(character_id);
ALTER TABLE
mario_database=# \d character_actions;
mario_database=#              Table "public.character_actions"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| character_id | integer |           | not null |         |
+--------------+---------+-----------+----------+---------+
Foreign-key constraints:
    "character_actions_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)

alter ta          ;
ERROR:  syntax error at or near "a"
LINE 1: a;
        ^
mario_database=# alter table character_actions add column action_id int not null;
mario_database=# ALTER TABLE
                 alter table character_actions add foreign key(action_id) references actions(action_id);
ALTER TABLE
mario_database=# \d character_actions;
mario_database=#              Table "public.character_actions"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| character_id | integer |           | not null |         |
| action_id    | integer |           | not null |         |
+--------------+---------+-----------+----------+---------+
Foreign-key constraints:
    "character_actions_action_id_fkey" FOREIGN KEY (action_id) REFERENCES actions(action_id)
    "character_actions_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)


mario_database=# ALTER TABLE table_name ADD PRIMARY KEY(character_id, action_id);
ERROR:  relation "table_name" does not exist
mario_database=# ALTER TABLE character_actions ADD PRIMARY KEY(character_id, action_id);
mario_database=# ALTER TABLE
\d ca                ;
Did not find any relation named "c".
mario_database=# \d character_actions;
mario_database=#              Table "public.character_actions"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| character_id | integer |           | not null |         |
| action_id    | integer |           | not null |         |
+--------------+---------+-----------+----------+---------+
Indexes:
    "character_actions_pkey" PRIMARY KEY, btree (character_id, action_id)
Foreign-key constraints:
    "character_actions_action_id_fkey" FOREIGN KEY (action_id) REFERENCES actions(action_id)
    "character_actions_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)

insert into character;
ERROR:  syntax error at or near "inse"
LINE 1: inse;
        ^
mario_database=# insert into character_actions (character_id,action_id) values (2,1),(2,2),(2,3);
mario_database=# INSERT 0 3
                 insert into character_actions (character_id,action_id) values (7,1),(7,2),(7,3);
mario_database=# INSERT 0 3
select * from character_actions;
mario_database=#               
+--------------+-----------+
| character_id | action_id |
+--------------+-----------+
|            2 |         1 |
|            2 |         2 |
|            2 |         3 |
|            7 |         1 |
|            7 |         2 |
|            7 |         3 |
+--------------+-----------+
(6 rows)

                 insert into character_actions (character_id,action_id) values (6,1),(6,2),(6,3);
mario_database=# INSERT 0 3
                 insert into character_actions (character_id,action_id) values (5,1),(5,2),(5,3);
INSERT 0 3
mario_database=# insert into character_actions (character_id,action_id) values (4,1),(4,2),(4,3);
INSERT 0 3
mario_database=# insert into character_actions (character_id,action_id) values (3,1),(3,2),(3,3);
mario_database=# INSERT 0 3
                 insert into character_actions (character_id,action_id) values (2,1),(2,2),(2,3);
ERROR:  duplicate key value violates unique constraint "character_actions_pkey"
DETAIL:  Key (character_id, action_id)=(2, 1) already exists.
mario_database=# delete from character_actions where character_id = 2;
DELETE 3
mario_database=# insert into character_actions (character_id,action_id) values (2,1),(2,2),(2,3);
mario_database=# INSERT 0 3
                 insert into character_actions (character_id,action_id) values (1,1),(1,2),(1,3);
INSERT 0 3
mario_database=# select * from character_actions;
mario_database=#               
+--------------+-----------+
| character_id | action_id |
+--------------+-----------+
|            7 |         1 |
|            7 |         2 |
|            7 |         3 |
|            6 |         1 |
|            6 |         2 |
|            6 |         3 |
|            5 |         1 |
|            5 |         2 |
|            5 |         3 |
|            4 |         1 |
|            4 |         2 |
|            4 |         3 |
|            3 |         1 |
|            3 |         2 |
|            3 |         3 |
|            2 |         1 |
|            2 |         2 |
|            2 |         3 |
|            1 |         1 |
|            1 |         2 |
|            1 |         3 |
+--------------+-----------+
(21 rows)

\d
mario_database=#                         List of relations
+--------+-----------------------------+----------+--------------+
| Schema |            Name             |   Type   |    Owner     |
+--------+-----------------------------+----------+--------------+
| public | actions                     | table    | freecodecamp |
| public | actions_action_id_seq       | sequence | freecodecamp |
| public | character_actions           | table    | freecodecamp |
| public | characters                  | table    | freecodecamp |
| public | characters_character_id_seq | sequence | freecodecamp |
| public | more_info                   | table    | freecodecamp |
| public | more_info_more_info_id_seq  | sequence | freecodecamp |
| public | sounds                      | table    | freecodecamp |
| public | sounds_sound_id_seq         | sequence | freecodecamp |
+--------+-----------------------------+----------+--------------+
(9 rows)

                 select * from character;
ERROR:  relation "character" does not exist
LINE 1: select * from character;
                      ^
mario_database=# select * from characters;
mario_database=#                                
+--------------+--------+------------------+----------------+
| character_id |  name  |     homeland     | favorite_color |
+--------------+--------+------------------+----------------+
|            2 | Luigi  | Mushroom Kingdom | Green          |
|            3 | Peach  | Mushroom Kingdom | Pink           |
|            7 | Yoshi  | Dinosaur Land    | Green          |
|            6 | Daisy  | Sarasaland       | Orange         |
|            1 | Mario  | Mushroom Kingdom | Red            |
|            4 | Toad   | Mushroom Kingdom | Blue           |
|            5 | Bowser | Koopa Kingdom    | Yellow         |
+--------------+--------+------------------+----------------+
(7 rows)

more i               ;
ERROR:  syntax error at or near "more"
LINE 1: more;
        ^
mario_database=# select * from more_info;
                                     
+--------------+------------+--------------+--------------+--------------+
| more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+------------+--------------+--------------+--------------+
|            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | 1990-10-29 |          258 |        300.0 |            5 |
|            6 | 1989-07-31 |              |              |            6 |
|            7 | 1990-04-13 |          162 |         59.1 |            7 |
+--------------+------------+--------------+--------------+--------------+
(7 rows)

mario_database=# SELECT character, more_info FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
ERROR:  column "character" does not exist
LINE 1: SELECT character, more_info FROM characters FULL JOIN more_i...
               ^
HINT:  Perhaps you meant to reference the column "characters.character_id" or the column "more_info.character_id".
mario_database=# SELECT character_id FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
ERROR:  column reference "character_id" is ambiguous
LINE 1: SELECT character_id FROM characters FULL JOIN more_info ON c...
               ^
mario_database=# SELECT characters.character_id, more_info.character_id FROM characters FULL JOIN more_info ON characters.character
_id = more_info.character_id;
mario_database=#                 
+--------------+--------------+
| character_id | character_id |
+--------------+--------------+
|            1 |            1 |
|            2 |            2 |
|            3 |            3 |
|            4 |            4 |
|            5 |            5 |
|            6 |            6 |
|            7 |            7 |
+--------------+--------------+
(7 rows)

                 SELECT characters.*, more_info.* FROM characters FULL JOIN more_info ON characters.character_id = more_info.charac
ter_id;
mario_database=#                                                                    
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
| character_id |  name  |     homeland     | favorite_color | more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
|            1 | Mario  | Mushroom Kingdom | Red            |            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            2 | Luigi  | Mushroom Kingdom | Green          |            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | Peach  | Mushroom Kingdom | Pink           |            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            4 | Toad   | Mushroom Kingdom | Blue           |            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | Bowser | Koopa Kingdom    | Yellow         |            5 | 1990-10-29 |          258 |        300.0 |            5 |
|            6 | Daisy  | Sarasaland       | Orange         |            6 | 1989-07-31 |              |              |            6 |
|            7 | Yoshi  | Dinosaur Land    | Green          |            7 | 1990-04-13 |          162 |         59.1 |            7 |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
(7 rows)

mario_database=# SELECT characters.character_id, more_info.character_id FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
                
+--------------+--------------+
| character_id | character_id |
+--------------+--------------+
|            1 |            1 |
|            2 |            2 |
|            3 |            3 |
|            4 |            4 |
|            5 |            5 |
|            6 |            6 |
|            7 |            7 |
+--------------+--------------+
(7 rows)

mario_database=# SELECT characters.character_id, more_info.character_id FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
mario_database=#                 
+--------------+--------------+
| character_id | character_id |
+--------------+--------------+
|            1 |            1 |
|            2 |            2 |
|            3 |            3 |
|            4 |            4 |
|            5 |            5 |
|            6 |            6 |
|            7 |            7 |
+--------------+--------------+
(7 rows)

                 SELECT characters.*, more_info.* FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
                                                                   
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
| character_id |  name  |     homeland     | favorite_color | more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
|            1 | Mario  | Mushroom Kingdom | Red            |            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            2 | Luigi  | Mushroom Kingdom | Green          |            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | Peach  | Mushroom Kingdom | Pink           |            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            4 | Toad   | Mushroom Kingdom | Blue           |            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | Bowser | Koopa Kingdom    | Yellow         |            5 | 1990-10-29 |          258 |        300.0 |            5 |
|            6 | Daisy  | Sarasaland       | Orange         |            6 | 1989-07-31 |              |              |            6 |
|            7 | Yoshi  | Dinosaur Land    | Green          |            7 | 1990-04-13 |          162 |         59.1 |            7 |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
(7 rows)

mario_database=# SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
                                                                   
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
| character_id |  name  |     homeland     | favorite_color | more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
|            1 | Mario  | Mushroom Kingdom | Red            |            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            2 | Luigi  | Mushroom Kingdom | Green          |            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | Peach  | Mushroom Kingdom | Pink           |            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            4 | Toad   | Mushroom Kingdom | Blue           |            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | Bowser | Koopa Kingdom    | Yellow         |            5 | 1990-10-29 |          258 |        300.0 |            5 |
|            6 | Daisy  | Sarasaland       | Orange         |            6 | 1989-07-31 |              |              |            6 |
|            7 | Yoshi  | Dinosaur Land    | Green          |            7 | 1990-04-13 |          162 |         59.1 |            7 |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
(7 rows)

mario_database=# SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
                                                                   
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
| character_id |  name  |     homeland     | favorite_color | more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
|            1 | Mario  | Mushroom Kingdom | Red            |            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            2 | Luigi  | Mushroom Kingdom | Green          |            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | Peach  | Mushroom Kingdom | Pink           |            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            4 | Toad   | Mushroom Kingdom | Blue           |            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | Bowser | Koopa Kingdom    | Yellow         |            5 | 1990-10-29 |          258 |        300.0 |            5 |
|            6 | Daisy  | Sarasaland       | Orange         |            6 | 1989-07-31 |              |              |            6 |
|            7 | Yoshi  | Dinosaur Land    | Green          |            7 | 1990-04-13 |          162 |         59.1 |            7 |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
(7 rows)

mario_database=# SELECT * FROM characters FULL JOIN sounds ON characters.character_id = sounds.character_id;
                                                   
+--------------+--------+------------------+----------------+----------+--------------+--------------+
| character_id |  name  |     homeland     | favorite_color | sound_id |   filename   | character_id |
+--------------+--------+------------------+----------------+----------+--------------+--------------+
|            1 | Mario  | Mushroom Kingdom | Red            |        1 | its-a-me.wav |            1 |
|            1 | Mario  | Mushroom Kingdom | Red            |        2 | yippee.wav   |            1 |
|            2 | Luigi  | Mushroom Kingdom | Green          |        3 | ha-ha.wav    |            2 |
|            2 | Luigi  | Mushroom Kingdom | Green          |        4 | oh-yeah.wav  |            2 |
|            3 | Peach  | Mushroom Kingdom | Pink           |        5 | yay.wav      |            3 |
|            3 | Peach  | Mushroom Kingdom | Pink           |        6 | woo-hoo.wav  |            3 |
|            3 | Peach  | Mushroom Kingdom | Pink           |        7 | mm-hmm.wav   |            3 |
|            1 | Mario  | Mushroom Kingdom | Red            |        8 | yahoo.wav    |            1 |
|            5 | Bowser | Koopa Kingdom    | Yellow         |          |              |              |
|            6 | Daisy  | Sarasaland       | Orange         |          |              |              |
|            4 | Toad   | Mushroom Kingdom | Blue           |          |              |              |
|            7 | Yoshi  | Dinosaur Land    | Green          |          |              |              |
+--------------+--------+------------------+----------------+----------+--------------+--------------+
(12 rows)

mario_database=# SELECT * FROM character_actions FULL JOIN characters ON character_actions.character_id = characters.character_id FULL JOIN actions ON character_actions.action_id = actions.action_id;
mario_database=#                                                        
+--------------+-----------+--------------+--------+------------------+----------------+-----------+--------+
| character_id | action_id | character_id |  name  |     homeland     | favorite_color | action_id | action |
+--------------+-----------+--------------+--------+------------------+----------------+-----------+--------+
|            7 |         1 |            7 | Yoshi  | Dinosaur Land    | Green          |         1 | run    |
|            7 |         2 |            7 | Yoshi  | Dinosaur Land    | Green          |         2 | jump   |
|            7 |         3 |            7 | Yoshi  | Dinosaur Land    | Green          |         3 | duck   |
|            6 |         1 |            6 | Daisy  | Sarasaland       | Orange         |         1 | run    |
|            6 |         2 |            6 | Daisy  | Sarasaland       | Orange         |         2 | jump   |
|            6 |         3 |            6 | Daisy  | Sarasaland       | Orange         |         3 | duck   |
|            5 |         1 |            5 | Bowser | Koopa Kingdom    | Yellow         |         1 | run    |
|            5 |         2 |            5 | Bowser | Koopa Kingdom    | Yellow         |         2 | jump   |
|            5 |         3 |            5 | Bowser | Koopa Kingdom    | Yellow         |         3 | duck   |
|            4 |         1 |            4 | Toad   | Mushroom Kingdom | Blue           |         1 | run    |
|            4 |         2 |            4 | Toad   | Mushroom Kingdom | Blue           |         2 | jump   |
|            4 |         3 |            4 | Toad   | Mushroom Kingdom | Blue           |         3 | duck   |
|            3 |         1 |            3 | Peach  | Mushroom Kingdom | Pink           |         1 | run    |
|            3 |         2 |            3 | Peach  | Mushroom Kingdom | Pink           |         2 | jump   |
|            3 |         3 |            3 | Peach  | Mushroom Kingdom | Pink           |         3 | duck   |
|            2 |         1 |            2 | Luigi  | Mushroom Kingdom | Green          |         1 | run    |
|            2 |         2 |            2 | Luigi  | Mushroom Kingdom | Green          |         2 | jump   |
|            2 |         3 |            2 | Luigi  | Mushroom Kingdom | Green          |         3 | duck   |
|            1 |         1 |            1 | Mario  | Mushroom Kingdom | Red            |         1 | run    |
|            1 |         2 |            1 | Mario  | Mushroom Kingdom | Red            |         2 | jump   |
|            1 |         3 |            1 | Mario  | Mushroom Kingdom | Red            |         3 | duck   |
+--------------+-----------+--------------+--------+------------------+----------------+-----------+--------+
(21 rows)
