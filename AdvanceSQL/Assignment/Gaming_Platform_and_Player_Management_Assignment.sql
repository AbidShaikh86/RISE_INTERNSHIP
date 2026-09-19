CREATE DATABASE Gaming_Platform_and_Player_Management

USE Gaming_Platform_and_Player_Management

CREATE TABLE players 
(
    player_id INT PRIMARY KEY IDENTITY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    level INT DEFAULT 1 CHECK (level >= 1),
    coins INT DEFAULT 0 CHECK (coins >= 0),
    status VARCHAR(20) CHECK (status IN ('Active', 'Banned', 'Inactive'))
);
CREATE TABLE games (
    game_id INT PRIMARY KEY IDENTITY,
    game_name VARCHAR(100) NOT NULL UNIQUE,
    genre VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL,
    developer VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating >= 1.0 AND rating <= 5.0),
    price DECIMAL(8,2) DEFAULT 0.00 CHECK (price >= 0),
    downloads INT DEFAULT 0 CHECK (downloads >= 0)
);
CREATE TABLE matches (
    match_id INT PRIMARY KEY IDENTITY,
    player_id INT NOT NULL,
    game_id INT NOT NULL,
    match_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    score INT NOT NULL CHECK (score >= 0),
    duration_min INT NOT NULL CHECK (duration_min > 0),
    result VARCHAR(10) CHECK (result IN ('Win', 'Loss', 'Draw')),
    mode VARCHAR(20) CHECK (mode IN ('Solo', 'Duo', 'Squad', 'Team')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);
CREATE TABLE tournaments (
    tournament_id INT PRIMARY KEY IDENTITY,
    tournament_name VARCHAR(100) NOT NULL,
    game_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    prize_pool DECIMAL(10,2) NOT NULL CHECK (prize_pool > 0),
    winner_id INT,
    status VARCHAR(20) CHECK (status IN ('Upcoming', 'Ongoing', 'Completed')),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (winner_id) REFERENCES players(player_id)
);
CREATE TABLE achievements (
    achievement_id INT PRIMARY KEY IDENTITY,
    player_id INT NOT NULL,
    game_id INT NOT NULL,
    achievement_name VARCHAR(100) NOT NULL,
    description TEXT DEFAULT NULL,
    earned_date DATE DEFAULT CURRENT_DATE,
    rarity VARCHAR(20) CHECK (rarity IN ('Common', 'Rare', 'Epic', 'Legendary')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY IDENTITY,
    player_id INT NOT NULL,
    game_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    amount DECIMAL(8,2) NOT NULL CHECK (amount > 0),
    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('Card', 'UPI', 'Wallet', 'PayPal')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

INSERT INTO players VALUES
(  'ProGamer123',    'progamer123@gmail.com',      'Aarav Sharma',      'India',    '2021-03-15', 45,  12500, 'Active'),
(  'NinjaKiller',    'ninjakiller@yahoo.com',      'Rohan Verma',       'India',    '2021-06-20', 38,  9800,  'Active'),
(  'LegendSlayer',   'legendslayer@gmail.com',     'Priya Mehta',       'India',    '2021-09-10', 52,  18400, 'Active'),
(  'DragonMaster',   'dragonmaster@hotmail.com',   'Vikram Singh',      'India',    '2022-01-05', 41,  11200, 'Active'),
(  'ShadowHunter',   'shadowhunter@gmail.com',     'Ananya Iyer',       'India',    '2022-03-18', 29,  6500,  'Active'),
(  'BlazeKing',      'blazeking@outlook.com',      'Karan Kapoor',      'India',    '2022-05-22', 35,  8900,  'Active'),
(  'StormRider',     'stormrider@gmail.com',       'Divya Nair',        'India',    '2022-08-14', 48,  15300, 'Active'),
(  'PhantomStrike',  'phantomstrike@yahoo.com',    'Rahul Desai',       'India',    '2022-10-03', 33,  7400,  'Active'),
(  'ThunderBolt',    'thunderbolt@gmail.com',      'Sneha Patel',       'India',    '2022-12-11', 27,  5200,  'Active'),
( 'IronFist',       'ironfist@gmail.com',         'Arjun Reddy',       'India',    '2023-02-08', 50,  17600, 'Active'),
( 'WolfPack',       'wolfpack@gmail.com',         'James Carter',      'USA',      '2023-04-15', 44,  13100, 'Active'),
( 'VenomStrike',    'venomstrike@yahoo.com',      'Emily Watson',      'USA',      '2023-06-20', 39,  10500, 'Active'),
( 'TitanSlayer',    'titanslayer@gmail.com',      'Ahmed Al-Rashid',   'UAE',      '2023-08-05', 31,  7100,  'Active'),
( 'GhostRider',     'ghostrider@outlook.com',     'Sarah Johnson',     'UK',       '2023-09-12', 36,  9200,  'Active'),
( 'FireFox',        'firefox@gmail.com',          'Siddharth Joshi',   'India',    '2023-10-18', 42,  12800, 'Active'),
( 'NoobPlayer',     'noobplayer@gmail.com',       'Nisha Agarwal',     'India',    '2020-05-10',  3,  150,   'Inactive'),
( 'CyberNinja',     'cyberninja@yahoo.com',       'Riya Malhotra',     'India',    '2023-11-25', 26,  4800,  'Active'),
( 'VortexKing',     'vortexking@gmail.com',       'Suresh Babu',       'India',    '2024-01-08', 22,  3500,  'Active'),
( 'ApexPredator',   'apexpredator@hotmail.com',   'Kavitha Menon',     'India',    '2024-02-14', 19,  2400,  'Active'),
( 'SilverBullet',   'silverbullet@gmail.com',     'Pooja Gupta',       'India',    '2024-03-05', 15,  1800,  'Active'),
( 'HackerPro',      'hackerpro@gmail.com',        'John Smith',        'USA',      '2022-07-20', 40,  11000, 'Banned'),
( 'EliteSniper',    'elitesniper@yahoo.com',      'Michael Brown',     'USA',      '2023-05-10', 37,  9500,  'Active'),
( 'MysticWarrior',  'mysticwarrior@gmail.com',    'Lakshmi Rao',       'India',    '2023-12-02', 24,  4200,  'Active'),
( 'AlphaWolf',      'alphawolf@outlook.com',      'David Lee',         'Australia','2024-01-20', 18,  2200,  'Active'),
( 'InactiveUser',   'inactiveuser@gmail.com',     'Amit Trivedi',      'India',    '2020-02-15',  2,  50,    'Inactive');

INSERT INTO games VALUES
(  'Battleground Elite',     'Action',     '2020-05-15', 'Epic Studios',      4.5, 0.00,    5000000),
(  'Legends Arena',           'MOBA',       '2019-08-20', 'Riot Games',        4.7, 0.00,    8000000),
(  'War Strategy Pro',        'Strategy',   '2021-03-10', 'Paradox Interactive', 4.3, 799.00,  1200000),
(  'Fantasy Quest',           'RPG',        '2020-11-25', 'CD Projekt',        4.8, 1499.00, 3500000),
(  'Speed Racer X',           'Racing',     '2021-06-18', 'Electronic Arts',   4.2, 599.00,  2000000),
(  'Zombie Survival',         'Horror',     '2019-10-31', 'Capcom',            4.4, 899.00,  2800000),
(  'Cricket Champion',        'Sports',     '2022-04-01', 'Big Ant Studios',   4.0, 399.00,  1500000),
(  'Chess Grandmaster',       'Board Game', '2018-07-14', 'Chess.com',         4.6, 0.00,    4500000),
(  'Space Invaders HD',       'Arcade',     '2020-09-05', 'Atari',             3.9, 199.00,  800000),
('City Builder Deluxe',     'Simulation', '2021-01-20', 'Colossal Order',    4.5, 999.00,  1800000),
( 'Puzzle Master 2023',      'Puzzle',     '2023-02-14', 'King Games',        4.3, 0.00,    6000000),
( 'Ninja Warrior',           'Action',     '2022-08-10', 'Ubisoft',           4.4, 1299.00, 2200000),
( 'Galactic Wars',           'Sci-Fi',     '2020-12-01', 'Bungie',            4.6, 1999.00, 3000000),
( 'Farm Tycoon',             'Simulation', '2021-05-30', 'Zynga',             3.8, 0.00,    3200000),
( 'Hero Legends',            'RPG',        '2023-07-22', 'Square Enix',       4.7, 1799.00, 2500000);

INSERT INTO matches VALUES
(  1,  1,  '2024-01-05 14:30:00', 2450, 35, 'Win',  'Squad'),
(  1,  2,  '2024-01-08 18:00:00', 1820, 42, 'Win',  'Team'),
(  2,  1,  '2024-01-10 20:15:00', 1950, 38, 'Loss', 'Squad'),
(  3,  4,  '2024-01-12 19:00:00', 3800, 120,'Win',  'Solo'),
(  3,  2,  '2024-01-15 21:30:00', 2100, 45, 'Win',  'Team'),
(  4,  3,  '2024-01-18 16:00:00', 1500, 90, 'Draw', 'Solo'),
(  5,  6,  '2024-01-20 22:00:00', 980,  55, 'Loss', 'Duo'),
(  6,  1,  '2024-01-22 15:45:00', 2200, 40, 'Win',  'Squad'),
(  7,  4,  '2024-01-25 17:30:00', 4200, 110,'Win',  'Solo'),
( 8,  5,  '2024-01-28 19:00:00', 1650, 25, 'Loss', 'Solo'),
( 9,  2,  '2024-02-01 20:00:00', 1400, 38, 'Loss', 'Team'),
( 10, 1,  '2024-02-03 14:00:00', 2800, 42, 'Win',  'Squad'),
( 10, 4,  '2024-02-05 18:30:00', 3950, 115,'Win',  'Solo'),
( 11, 13, '2024-02-08 21:00:00', 3200, 75, 'Win',  'Solo'),
( 12, 2,  '2024-02-10 19:30:00', 2300, 48, 'Win',  'Team'),
( 13, 1,  '2024-02-12 16:00:00', 2050, 36, 'Win',  'Squad'),
( 14, 6,  '2024-02-15 22:30:00', 1100, 60, 'Loss', 'Duo'),
( 15, 3,  '2024-02-18 17:00:00', 1700, 85, 'Draw', 'Solo'),
( 1,  12, '2024-02-20 20:00:00', 2900, 50, 'Win',  'Solo'),
( 2,  4,  '2024-02-22 19:00:00', 3600, 105,'Win',  'Solo'),
( 3,  1,  '2024-02-25 15:30:00', 2650, 44, 'Win',  'Squad'),
( 5,  8,  '2024-02-28 18:00:00', 850,  30, 'Draw', 'Solo'),
( 7,  2,  '2024-03-01 21:00:00', 2400, 50, 'Win',  'Team'),
( 10, 13, '2024-03-03 20:00:00', 3500, 70, 'Win',  'Solo'),
( 11, 1,  '2024-03-05 16:30:00', 2150, 39, 'Win',  'Squad'),
(12, 4,  '2024-03-08 19:30:00', 3750, 108,'Win',  'Solo'),
( 15, 6,  '2024-03-10 22:00:00', 1250, 58, 'Loss', 'Duo'),
( 17, 2,  '2024-03-12 20:30:00', 1600, 40, 'Loss', 'Team'),
( 18, 1,  '2024-03-15 17:00:00', 1850, 35, 'Loss', 'Squad'),
( 19, 5,  '2024-03-18 19:00:00', 1450, 22, 'Loss', 'Solo'),
( 20, 11, '2024-03-20 18:00:00', 650,  20, 'Loss', 'Solo'),
( 22, 1,  '2024-03-22 15:00:00', 2550, 41, 'Win',  'Squad'),
( 23, 2,  '2024-03-24 20:00:00', 1750, 43, 'Loss', 'Team'),
( 1,  13, '2024-03-26 21:00:00', 3400, 72, 'Win',  'Solo'),
( 3,  12, '2024-03-28 19:00:00', 3100, 55, 'Win',  'Solo'),
( 6,  4,  '2024-03-30 18:00:00', 3850, 112,'Win',  'Solo'),
( 7,  1,  '2024-04-01 16:00:00', 2750, 43, 'Win',  'Squad'),
( 10, 2,  '2024-04-03 20:30:00', 2500, 47, 'Win',  'Team'),
( 11, 4,  '2024-04-05 19:30:00', 4000, 118,'Win',  'Solo'),
( 15, 1,  '2024-04-08 17:30:00', 2350, 38, 'Win',  'Squad');

INSERT INTO tournaments VALUES
(  'Battleground World Cup 2023',    1,  '2023-12-01', '2023-12-15', 500000.00, 10, 'Completed'),
(  'Legends Arena Championship',     2,  '2024-01-10', '2024-01-25', 750000.00,  3, 'Completed'),
(  'Fantasy Quest Masters',          4,  '2024-02-05', '2024-02-20', 1000000.00, 7, 'Completed'),
(  'Galactic Wars Invitational',     13, '2024-03-01', '2024-03-15', 800000.00, 11, 'Completed'),
(  'Speed Racer X Grand Prix',       5,  '2024-03-20', '2024-03-28', 300000.00,  1, 'Completed'),
(  'War Strategy Elite League',      3,  '2024-04-01', '2024-04-30', 400000.00, NULL, 'Ongoing'),
(  'Ninja Warrior Pro Series',       12, '2024-04-10', '2024-04-25', 600000.00, NULL, 'Ongoing'),
(  'Cricket Champion IPL',           7,  '2024-05-01', '2024-05-31', 350000.00, NULL, 'Upcoming'),
( 'Hero Legends World Finals',      15, '2024-06-01', '2024-06-15', 1200000.00, NULL, 'Upcoming'),
( 'Battleground Asia Cup',          1,  '2024-07-01', '2024-07-20', 450000.00, NULL, 'Upcoming');

INSERT INTO achievements VALUES
( 1,  1,  'First Blood',           'Get your first kill',                    '2024-01-05', 'Common'),
( 1,  1,  'Victory Royale',        'Win your first match',                   '2024-01-05', 'Rare'),
( 1,  2,  'Pentakill Master',      'Eliminate 5 enemies in one match',      '2024-01-08', 'Epic'),
( 3,  4,  'Dragon Slayer',         'Defeat the ancient dragon',             '2024-01-12', 'Legendary'),
( 3,  2,  'Team Player',           'Win 10 team matches',                    '2024-01-15', 'Rare'),
( 7,  4,  'Legendary Hero',        'Complete the main storyline',           '2024-01-25', 'Legendary'),
( 10, 1,  'Sharpshooter',          'Achieve 90% accuracy',                   '2024-02-03', 'Epic'),
( 10, 4,  'Treasure Hunter',       'Find all hidden treasures',             '2024-02-05', 'Rare'),
( 10, 13, 'Galactic Commander',    'Win 5 space battles',                    '2024-02-08', 'Epic'),
( 11, 13, 'Space Ace',             'Complete all missions',                  '2024-02-08', 'Legendary'),
( 12, 2,  'Support Hero',          'Assist teammates 100 times',            '2024-02-10', 'Rare'),
( 1,  12, 'Stealth Master',        'Complete 10 missions undetected',       '2024-02-20', 'Epic'),
( 2,  4,  'Quest Completionist',   'Finish all side quests',                '2024-02-22', 'Legendary'),
( 3,  1,  'Survival Expert',       'Survive for 30 minutes',                '2024-02-25', 'Rare'),
(6,  4,  'Master of Magic',       'Learn all spells',                      '2024-03-30', 'Epic'),
( 7,  1,  'Squad Leader',          'Lead your team to 20 victories',        '2024-04-01', 'Epic'),
( 11, 1,  'Demolition Expert',     'Destroy 50 vehicles',                   '2024-03-05', 'Rare'),
( 11, 4,  'Champion of the Realm', 'Defeat all bosses',                     '2024-04-05', 'Legendary'),
( 15, 6,  'Zombie Killer',         'Eliminate 1000 zombies',                '2024-03-10', 'Epic'),
( 1,  13, 'Star Pilot',            'Win 10 galactic races',                 '2024-03-26', 'Rare'),
( 3,  12, 'Shadow Assassin',       'Complete all assassination contracts',  '2024-03-28', 'Legendary'),
( 5,  8,  'Chess Grandmaster',     'Win 50 chess matches',                  '2024-02-28', 'Rare'),
( 7,  2,  'MVP Champion',          'Win MVP award 5 times',                 '2024-03-01', 'Epic'),
( 10, 2,  'Tactician',             'Execute perfect strategies 20 times',   '2024-04-03', 'Epic'),
( 12, 4,  'Artifact Collector',    'Collect all legendary artifacts',       '2024-03-08', 'Legendary'),
( 15, 1,  'Survivor',              'Win with last man standing',            '2024-04-08', 'Rare'),
( 6,  1,  'Winning Streak',        'Win 5 matches consecutively',           '2024-01-22', 'Epic'),
( 8,  5,  'Speed Demon',           'Complete race under 2 minutes',         '2024-01-28', 'Rare'),
( 13, 1,  'Grenade Master',        'Eliminate 10 enemies with grenades',   '2024-02-12', 'Rare'),
( 22, 1,  'Headshot King',         'Achieve 100 headshots',                 '2024-03-22', 'Epic');

INSERT INTO purchases VALUES
(  1,  1,  'Battle Pass Season 5',       499.00,  '2024-01-10 10:00:00', 'UPI'),
(  1,  4,  'Legendary Sword Pack',       1299.00, '2024-01-15 14:30:00', 'Card'),
(  3,  2,  'Champion Skin Bundle',       799.00,  '2024-01-20 18:00:00', 'UPI'),
(  3,  4,  'Dragon Mount DLC',           1999.00, '2024-02-01 11:00:00', 'Card'),
(  7,  4,  'Ultimate Weapon Pack',       2499.00, '2024-02-08 16:00:00', 'Card'),
(  10, 1,  'Elite Sniper Skin',          599.00,  '2024-02-15 19:00:00', 'UPI'),
(  10, 13, 'Spaceship Upgrade',          1499.00, '2024-02-20 20:30:00', 'Wallet'),
(  11, 1,  'Tactical Gear Set',          899.00,  '2024-02-25 15:00:00', 'Card'),
(  11, 13, 'Galactic Expansion Pack',    1799.00, '2024-03-01 17:00:00', 'Card'),
( 12, 2,  'Hero Collection',            999.00,  '2024-03-05 12:00:00', 'UPI'),
( 12, 4,  'Magic Spell Book',           1199.00, '2024-03-10 14:00:00', 'PayPal'),
( 15, 1,  'Legendary Outfit',           699.00,  '2024-03-12 18:30:00', 'UPI'),
( 15, 6,  'Survival Kit Pro',           499.00,  '2024-03-15 20:00:00', 'Card'),
( 1,  12, 'Ninja Costume Pack',         899.00,  '2024-03-18 16:00:00', 'UPI'),
( 2,  4,  'Artifact Bundle',            1599.00, '2024-03-20 19:00:00', 'Card'),
( 6,  4,  'Enchanted Armor Set',        1899.00, '2024-03-22 11:00:00', 'Card'),
( 7,  1,  'Elite Battle Pass',          799.00,  '2024-03-25 17:30:00', 'UPI'),
( 3,  12, 'Shadow Assassin Bundle',     1399.00, '2024-03-28 15:00:00', 'Wallet'),
( 10, 4,  'Legendary Mount Pack',       2199.00, '2024-04-01 13:00:00', 'Card'),
( 11, 4,  'Ultimate Power Boost',       999.00,  '2024-04-05 18:00:00', 'UPI'),
( 13, 1,  'Weapon Skin Collection',     599.00,  '2024-02-18 16:00:00', 'UPI'),
( 17, 2,  'Champion Emote Pack',        299.00,  '2024-03-14 19:00:00', 'Wallet'),
( 22, 1,  'Pro Player Bundle',          1499.00, '2024-03-26 14:00:00', 'Card'),
( 5,  6,  'Zombie Apocalypse DLC',      799.00,  '2024-02-05 21:00:00', 'UPI'),
( 14, 6,  'Horror Survival Pack',       699.00,  '2024-02-20 22:30:00', 'PayPal');

- Q11. Insert 3 players into the players table with usernames 'ProGamer123', 'NinjaKiller', and 'LegendSlayer'. Use realistic data for all columns.
INSERT INTO players (username, email, full_name, country, registration_date, level, coins, status) VALUES
('ProGamer123', 'progamer123@gmail.com', 'Rajesh Kumar', 'India', '2023-05-15', 1, 0, 'Active'),
('NinjaKiller', 'ninjak@yahoo.com', 'Arjun Singh', 'India', '2023-08-22', 1, 0, 'Active'),
('LegendSlayer', 'legendslayer@hotmail.com', 'Vikram Patel', 'India', '2023-11-10', 1, 0, 'Active');
 
-- Q12. Insert 2 games into the games table: one Action game and one Strategy game with different developers and ratings.
INSERT INTO games (game_name, genre, release_date, developer, rating, price, downloads) VALUES
('Blaze Warrior', 'Action', '2022-03-15', 'Thunder Studios', 4.5, 499.99, 50000),
('Empire Builder', 'Strategy', '2021-06-20', 'Logic Games Inc', 4.2, 299.99, 35000);
 
-- Q13. Insert 5 match records into the matches table for different players and games with varying scores, durations, and results.
INSERT INTO matches (player_id, game_id, match_date, score, duration_min, result, mode) VALUES
(1, 1, '2024-01-15 14:30:00', 2500, 45, 'Win', 'Solo'),
(2, 1, '2024-01-15 15:20:00', 1800, 38, 'Loss', 'Duo'),
(3, 2, '2024-01-16 10:15:00', 3200, 52, 'Win', 'Solo'),
(1, 2, '2024-01-16 16:45:00', 2100, 35, 'Draw', 'Squad'),
(2, 2, '2024-01-17 09:30:00', 1500, 28, 'Loss', 'Team');
 
-- Q14. Insert a tournament record for game_id = 1 with a prize pool of 100000, status 'Ongoing', and winner_id as NULL.
INSERT INTO tournaments VALUES
('Blaze Championship 2024', 1, '2024-01-10', '2024-02-28', 100000.00, NULL, 'Ongoing');
 
-- Q15. Update the level of player_id = 5 to 25 and increase their coins by 500.
UPDATE players 
SET level = 25, coins = coins + 500 
WHERE player_id = 5;
 
-- Q16. Update the status of all players who registered before '2023-01-01' and have level less than 5 to 'Inactive'.
UPDATE players 
SET status = 'Inactive' 
WHERE registration_date < '2023-01-01' AND level < 5;
 
-- Q17. Increase the price of all games in the 'RPG' genre by 10%.
UPDATE games 
SET price = price * 1.10 
WHERE genre = 'RPG';
 
-- Q18. Update the winner_id of tournament_id = 3 to player_id = 10 and change its status to 'Completed'.
UPDATE tournaments 
SET winner_id = 10, status = 'Completed' 
WHERE tournament_id = 3;
 
-- Q19. Delete all matches where result = 'Loss' and score < 100 (cleanup of very poor performance records).
DELETE FROM matches 
WHERE result = 'Loss' AND score < 100;
 
-- Q20. Delete all achievements earned more than 2 years ago (use DATEDIFF or similar functions based on current date).
DELETE FROM achievements 
WHERE DATEDIFF(CURDATE(), earned_date) > 730;

-- Q21. Select all columns from the players table.
SELECT * FROM players;
 
-- Q22. Retrieve only the username, email, and country of all players.
SELECT username, email, country FROM players;
 
-- Q23. Find all players whose country is 'India'.
SELECT * FROM players 
WHERE country = 'India';
 
-- Q24. List all games with a rating greater than or equal to 4.0.
SELECT * FROM games 
WHERE rating >= 4.0;
 
-- Q25. Display all matches where the result was 'Win'.
SELECT * FROM matches 
WHERE result = 'Win';
 
-- Q26. Find all players whose level is between 10 and 50 (inclusive).
SELECT * FROM players 
WHERE level BETWEEN 10 AND 50;
 
-- Q27. Retrieve all games where the price is greater than 500.
SELECT * FROM games 
WHERE price > 500;
 
-- Q28. List all tournaments with status 'Completed'.
SELECT * FROM tournaments
WHERE status = 'Completed';
 
-- Q29. Find all players whose username starts with 'Pro'.
SELECT * FROM players 
WHERE username LIKE 'Pro%';
 
-- Q30. Display all games where the genre is either 'Action' or 'Strategy'.
SELECT * FROM games
WHERE genre IN ('Action', 'Strategy');
 
-- Q31. Retrieve all purchases made using the payment method 'UPI' or 'Card'.
SELECT * FROM purchases 
WHERE payment_method IN ('UPI', 'Card');
 
-- Q32. Find all achievements with rarity 'Legendary'.
SELECT * FROM achievements
WHERE rarity = 'Legendary';
 
-- Q33. List all players whose email ends with '@gmail.com'.
SELECT * FROM players 
WHERE email LIKE '%@gmail.com';
 
-- Q34. Display DISTINCT countries from the players table.
SELECT DISTINCT country FROM players;
 
-- Q35. Find all matches where the mode is NOT 'Solo'. Use the NOT operator.
SELECT * FROM matches 
WHERE mode NOT IN ('Solo');

-- Q36. List all players ordered by their level in descending order.
SELECT * FROM players 
ORDER BY level DESC;
 
-- Q37. Display all games ordered by rating in descending order, and then by price in ascending order.
SELECT * FROM games 
ORDER BY rating DESC, price ASC;
 
-- Q38. Retrieve all matches ordered by score in descending order. Show only the top 10 records using LIMIT.
SELECT TOP 10 * FROM matches 
ORDER BY score DESC;
 
-- Q39. List all tournaments ordered by prize_pool in descending order.
SELECT * FROM tournaments 
ORDER BY prize_pool DESC;
 
-- Q40. Display all purchases ordered by purchase_date in descending order (most recent first).
SELECT * FROM purchases 
ORDER BY purchase_date DESC;

-- Q41. List all matches along with the player username and game name. Display username, game_name, score, result, and match_date. INNER JOIN: matches with players and games
SELECT p.username, g.game_name, m.score, m.result, m.match_date FROM matches m
INNER JOIN players p 
ON m.player_id = p.player_id
INNER JOIN games g 
ON m.game_id = g.game_id;
 
-- Q42. Display all achievements with the player username and game name. Show username, game_name, achievement_name, rarity, and earned_date. INNER JOIN: achievements with players and games
SELECT p.username, g.game_name, a.achievement_name, a.rarity, a.earned_date FROM achievements a
INNER JOIN players p 
ON a.player_id = p.player_id
INNER JOIN games g 
ON a.game_id = g.game_id;
 
-- Q43. List all purchases with player username, game name, item name, and amount. Show username, game_name, item_name, amount, and purchase_date. INNER JOIN: purchases with players and games
SELECT p.username, g.game_name, pu.item_name, pu.amount, pu.purchase_date FROM purchases pu
INNER JOIN players p 
ON pu.player_id = p.player_id
INNER JOIN games g 
ON pu.game_id = g.game_id;
 
-- Q44. Show all tournaments along with the game name and winner username. Display tournament_name, game_name, winner username, prize_pool, and status. INNER JOIN: tournaments with games and players (for winner)
SELECT t.tournament_name, g.game_name, p.username AS winner_username, t.prize_pool, t.status FROM tournaments t
INNER JOIN games g 
ON t.game_id = g.game_id
INNER JOIN players p 
ON t.winner_id = p.player_id
WHERE t.winner_id IS NOT NULL;
 
-- Q45. Find all matches where players achieved a score greater than 1000. Join matches, players, and games. Display username, game_name, score, and match_date. INNER JOIN: matches with players and games where score > 1000
SELECT p.username, g.game_name, m.score, m.match_date FROM matches m
INNER JOIN players p 
ON m.player_id = p.player_id
INNER JOIN games g 
ON m.game_id = g.game_id
WHERE m.score > 1000;

-- Q46. Find all players who have NEVER played any match. Use LEFT JOIN between players and matches. Display username and email. LEFT JOIN: players with matches to find players with NULL match_id
SELECT p.username, p.email FROM players p
LEFT JOIN matches m 
ON p.player_id = m.player_id
WHERE m.match_id IS NULL;
 
-- Q47. List all games along with the count of matches played for each game, including games with zero matches. Use LEFT JOIN and GROUP BY. LEFT JOIN: games with matches to include games with no matches
SELECT g.game_name, COUNT(m.match_id) AS match_count FROM games g
LEFT JOIN matches m 
ON g.game_id = m.game_id
GROUP BY g.game_id, g.game_name;
 
-- Q48. Find all players who have NOT earned any achievement. Use LEFT JOIN between players and achievements. Display username and country. LEFT JOIN: players with achievements to find players with NULL achievement_id
SELECT p.username, p.country FROM players p
LEFT JOIN achievements a 
ON p.player_id = a.player_id
WHERE a.achievement_id IS NULL;
 
-- Q49. Display all games along with the total purchase revenue for each game, including games with no purchases (show 0 for revenue). Use LEFT JOIN. LEFT JOIN: games with purchases to include games with no purchases
SELECT g.game_name, COALESCE(SUM(pu.amount), 0) AS total_revenue FROM games g
LEFT JOIN purchases pu 
ON g.game_id = pu.game_id
GROUP BY g.game_id, g.game_name;
 
-- Q50. List all tournaments along with the winner username. Include tournaments that do not have a winner yet (show NULL). Use LEFT JOIN. LEFT JOIN: tournaments with players to include tournaments without winners
SELECT t.tournament_name, t.prize_pool, t.status, p.username AS winner_username FROM tournaments t
LEFT JOIN players p 
ON t.winner_id = p.player_id;

-- Q51. Write a query joining players, matches, and games to display: player username, game name, score, result, duration_min, and match_date. INNER JOIN: players, matches, games
SELECT p.username, g.game_name, m.score, m.result, m.duration_min, m.match_date FROM matches m
INNER JOIN players p 
ON m.player_id = p.player_id
INNER JOIN games g 
ON m.game_id = g.game_id;
 
-- Q52. Generate a complete tournament report: tournament name, game name, winner username, winner country, prize pool, start date, and end date. Join tournaments, games, and players. INNER JOIN: tournaments, games, players (for winner details)
SELECT t.tournament_name, g.game_name, p.username AS winner_username, p.country AS winner_country, t.prize_pool, t.start_date, t.end_date FROM tournaments t
INNER JOIN games g 
ON t.game_id = g.game_id
INNER JOIN players p 
ON t.winner_id = p.player_id
WHERE t.winner_id IS NOT NULL;
 
-- Q53. Show a comprehensive purchase report: player username, player country, game name, item name, amount, payment method, and purchase date. Join all 3 tables. INNER JOIN: purchases, players, games
SELECT p.username, p.country, g.game_name, pu.item_name, pu.amount, pu.payment_method, pu.purchase_date FROM purchases pu
INNER JOIN players p 
ON pu.player_id = p.player_id
INNER JOIN games g 
ON pu.game_id = g.game_id;
 
-- Q54. Find all players from 'India' who have won matches in 'Action' games. Display username, game name, score, and match date. Join players, matches, and games. INNER JOIN: players, matches, games with filters for country and genre
SELECT p.username, g.game_name, m.score, m.match_date FROM matches m
INNER JOIN players p 
ON m.player_id = p.player_id
INNER JOIN games g 
ON m.game_id = g.game_id
WHERE p.country = 'India' AND g.genre = 'Action' AND m.result = 'Win';
 
-- Q55. List all achievements earned in games with a rating above 4.0. Display player username, game name, achievement name, rarity, and rating. Join players, achievements, and games. INNER JOIN: achievements, players, games with rating filter
SELECT p.username, g.game_name, a.achievement_name, a.rarity, g.rating FROM achievements a
INNER JOIN players p 
ON a.player_id = p.player_id
INNER JOIN games g 
ON a.game_id = g.game_id
WHERE g.rating > 4.0;

-- Q56. Find pairs of players who are from the same country. Use SELF JOIN on the players table. Display player1_username, player2_username, and country. SELF JOIN: players with players on country
SELECT p1.username AS player1_username, p2.username AS player2_username, p1.country FROM players p1
INNER JOIN players p2 
ON p1.country = p2.country AND p1.player_id < p2.player_id;
 
-- Q57. Find pairs of games that were released in the same year. Use SELF JOIN on the games table. Display game1_name, game2_name, and release year. SELF JOIN: games with games on release year
SELECT g1.game_name AS game1_name, g2.game_name AS game2_name, YEAR(g1.release_date) AS release_year FROM games g1
INNER JOIN games g2 
ON YEAR(g1.release_date) = YEAR(g2.release_date) AND g1.game_id < g2.game_id;
 
-- Q58. Write a FULL OUTER JOIN between players and matches to show all players (matched or not) and all matches (matched or not). FULL OUTER JOIN: players with matches (simulated using UNION in MySQL)
SELECT p.player_id, p.username, m.match_id, m.score FROM players p
LEFT JOIN matches m 
ON p.player_id = m.player_id
UNION
SELECT p.player_id, p.username, m.match_id, m.score FROM players p
RIGHT JOIN matches m 
ON p.player_id = m.player_id;
 
-- Q59. Write a CROSS JOIN between games and match modes (use a derived table with values: Solo, Duo, Squad, Team) to generate all possible game-mode combinations.  CROSS JOIN: games with derived table of modes
SELECT g.game_name, modes.mode FROM games g
CROSS JOIN 
(SELECT 'Solo' AS mode UNION SELECT 'Duo' UNION SELECT 'Squad' UNION SELECT 'Team') modes;
 
-- Q60. Perform a CROSS JOIN between players and games to list all possible player-game combinations (useful for recommendation systems). Limit the result to 20 rows. CROSS JOIN: players with games, limited to 20 rows
SELECT TOP 20 p.username, g.game_name FROM players p
CROSS JOIN games g;

-- Q61. Find the total number of registered players on the platform. Use COUNT.
SELECT COUNT(*) AS total_players FROM players;
 
-- Q62. Calculate the highest score, lowest score, and average score across all matches. Use MAX, MIN, and AVG in a single query with meaningful aliases.
SELECT MAX(score) AS highest_score, MIN(score) AS lowest_score, AVG(score) AS average_score FROM matches;
 
-- Q63. Find the total revenue generated from all purchases. Use SUM on the amount column.
SELECT SUM(amount) AS total_revenue FROM purchases;
 
-- Q64. Calculate the average prize pool across all completed tournaments. Use AVG with a WHERE clause.
SELECT AVG(prize_pool) AS average_prize_pool FROM tournaments 
WHERE status = 'Completed';
 
-- Q65. Count the total number of achievements earned per rarity level. Use COUNT with GROUP BY on the rarity column.
SELECT rarity, COUNT(*) AS achievement_count FROM achievements 
GROUP BY rarity;

-- Q66. Count the total number of matches played by each player. Display username and match_count. Order by match_count descending. Join players and matches. GROUP BY: matches grouped by player with INNER JOIN and ORDER BY
SELECT p.username, COUNT(m.match_id) AS match_count FROM matches m
INNER JOIN players p 
ON m.player_id = p.player_id
GROUP BY m.player_id, p.username
ORDER BY match_count DESC;
 
-- Q67. Find the total revenue generated from purchases for each game. Display game_name and total_revenue. Order by total_revenue descending. Join games and purchases. GROUP BY: purchases grouped by game with INNER JOIN and ORDER BY
SELECT g.game_name, SUM(pu.amount) AS total_revenue FROM purchases pu
INNER JOIN games g 
ON pu.game_id = g.game_id
GROUP BY pu.game_id, g.game_name
ORDER BY total_revenue DESC;
 
-- Q68. Group all matches by result (Win/Loss/Draw) and count how many matches ended with each result. Display result and match_count. GROUP BY: matches grouped by result
SELECT result, COUNT(*) AS match_count FROM matches
GROUP BY result;
 
-- Q69. Find players who have earned more than 3 achievements. Use GROUP BY and HAVING. Display username and achievement_count. Join players and achievements. GROUP BY with HAVING: achievements grouped by player having count > 3
SELECT p.username, COUNT(a.achievement_id) AS achievement_count FROM achievements a
INNER JOIN players p 
ON a.player_id = p.player_id
GROUP BY a.player_id, p.username
HAVING COUNT(a.achievement_id) > 3;
 
-- Q70. List games that have been played in more than 10 matches. Use GROUP BY and HAVING. Display game_name and total_matches. Order by total_matches descending. GROUP BY with HAVING: matches grouped by game having count > 10
SELECT g.game_name, COUNT(m.match_id) AS total_matches FROM matches m
INNER JOIN games g 
ON m.game_id = g.game_id
GROUP BY m.game_id, g.game_name
HAVING COUNT(m.match_id) > 10
ORDER BY total_matches DESC;