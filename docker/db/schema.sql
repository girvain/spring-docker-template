-- delete this and user your project data, for users we need the % for docker to work as it's a random ip

CREATE DATABASE IF NOT EXISTS dev;

CREATE USER IF NOT EXISTS 'dev_user'@'localhost' IDENTIFIED BY 'guru';

CREATE USER IF NOT EXISTS 'dev_user'@'%' IDENTIFIED BY 'guru';

-- Database grants
GRANT SELECT ON dev.* to 'dev_user'@'localhost';
GRANT INSERT ON dev.* to 'dev_user'@'localhost';
GRANT DELETE ON dev.* to 'dev_user'@'localhost';
GRANT UPDATE ON dev.* to 'dev_user'@'localhost';

-- GRANT SELECT ON sfg_prod.* to 'sfg_prod_user'@'localhost';
-- GRANT INSERT ON sfg_prod.* to 'sfg_prod_user'@'localhost';
-- GRANT DELETE ON sfg_prod.* to 'sfg_prod_user'@'localhost';
-- GRANT UPDATE ON sfg_prod.* to 'sfg_prod_user'@'localhost';

GRANT SELECT ON dev.* to 'dev_user'@'%';
GRANT INSERT ON dev.* to 'dev_user'@'%';
GRANT DELETE ON dev.* to 'dev_user'@'%';
GRANT UPDATE ON dev.* to 'dev_user'@'%';

-- GRANT SELECT ON sfg_prod.* to 'sfg_prod_user'@'%';
-- GRANT INSERT ON sfg_prod.* to 'sfg_prod_user'@'%';
-- GRANT DELETE ON sfg_prod.* to 'sfg_prod_user'@'%';
-- GRANT UPDATE ON sfg_prod.* to 'sfg_prod_user'@'%';

-- This will cause errors if any of the tables already exist, ideally only run this once and not on every startup.
create table category (id bigint not null auto_increment, description varchar(255), primary key (id)) engine=InnoDB;
create table ingredient (id bigint not null auto_increment, amount decimal(19,2), description varchar(255), recipe_id bigint, uom_id bigint, primary key (id)) engine=InnoDB;
create table notes (id bigint not null auto_increment, recipe_notes longtext, recipe_id bigint, primary key (id)) engine=InnoDB;
create table recipe (id bigint not null auto_increment, cook_time integer, description varchar(255), difficulty varchar(255), directions longtext, image longblob, prep_time integer, servings integer, source varchar(255), url varchar(255), notes_id bigint, primary key (id)) engine=InnoDB;
create table recipe_category (recipe_id bigint not null, category_id bigint not null, primary key (recipe_id, category_id)) engine=InnoDB;
create table unit_of_measure (id bigint not null auto_increment, description varchar(255), primary key (id)) engine=InnoDB;
alter table ingredient add constraint FKj0s4ywmqqqw4h5iommigh5yja foreign key (recipe_id) references recipe (id);
alter table ingredient add constraint FK6iv5l89qmitedn5m2a71kta2t foreign key (uom_id) references unit_of_measure (id);
alter table notes add constraint FKdbfsiv21ocsbt63sd6fg0t3c8 foreign key (recipe_id) references recipe (id);
alter table recipe add constraint FK37al6kcbdasgfnut9xokktie9 foreign key (notes_id) references notes (id);
alter table recipe_category add constraint FKqsi87i8d4qqdehlv2eiwvpwb foreign key (category_id) references category (id);
alter table recipe_category add constraint FKcqlqnvfyarhieewfeayk3v25v foreign key (recipe_id) references recipe (id);
