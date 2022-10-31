PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE ItemTable (key TEXT UNIQUE ON CONFLICT REPLACE, value BLOB NOT NULL ON CONFLICT FAIL);
INSERT INTO ItemTable VALUES('color',X'${localstorage_color}');
INSERT INTO ItemTable VALUES('background',X'${localstorage_background}');
INSERT INTO ItemTable VALUES('settings',X'${localstorage_settings}');
COMMIT;
