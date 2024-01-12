ALTER TABLE users 
DROP PRIMARY KEY,
ADD CONSTRAINT pd_id_username PRIMARY KEY (id, username);
