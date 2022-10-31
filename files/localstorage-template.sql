PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE ItemTable (key TEXT UNIQUE ON CONFLICT REPLACE, value BLOB NOT NULL ON CONFLICT FAIL);
INSERT INTO ItemTable VALUES('color','#249cea');
INSERT INTO ItemTable VALUES('background','img/background.b9890328.png');
INSERT INTO ItemTable VALUES('settings','${localstorage_settings}');
COMMIT;
