DROP TABLE IF EXISTS locations;
CREATE TABLE locations(id UUID PRIMARY KEY, name TEXT, capacity INTEGER);
INSERT INTO locations(id, name, capacity) 
VALUES ('090ae71b-920e-44c4-a4b8-42a79e9882ef','cotton bowl', 92100);

INSERT INTO locations(id, name, capacity) 
VALUES ('3ce02ae6-8487-4467-b31b-a036e82e3246','rose bowl', 90888);

INSERT INTO locations(id, name, capacity) 
VALUES ('163e9d35-376f-45db-82fc-bcbdbdc0907f','carrier dome', 49262);

INSERT INTO locations(id, name, capacity) 
VALUES ('e41b8a04-001a-49ba-93b6-08ef54997d74','harvard stadium', 30323);

INSERT INTO locations(id, name, capacity) 
VALUES ('e94745a4-dbd4-466e-97e9-ef6410572261','auther ash stadium', 23711);

SELECT * FROM locations;