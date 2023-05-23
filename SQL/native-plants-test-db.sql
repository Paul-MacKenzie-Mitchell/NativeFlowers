DROP DATABASE IF Exists native_plants;
CREATE DATABASE native_plants;
USE native_plants;


/* one color to many flowers - one to many table*/
CREATE TABLE bloom_color (
	bloom_color_id int not null primary key auto_increment,
    color Varchar(20) not null
);

CREATE TABLE plant (
	plant_id int not null primary key auto_increment,
    common_name Varchar(100) not null unique,
    latin_name Varchar(100) not null unique,
    plant_description Varchar(1000) not null,
    plant_about Varchar(15000) null,
    plant_spacing decimal(2,2) not null,
    coldest_usda_zone int not null,
    warmest_usda_zone int not null,
    life_cycle Varchar(20) not null,
    bloom_color_id int not null,
     constraint fk_plant_bloom_color_id
        foreign key (bloom_color_id)
        references bloom_color(bloom_color_id)
);

CREATE TABLE germination (
	germination_id int not null primary key auto_increment,
    germination_name Varchar(30) not null,
    germination_code Varchar(1) not null,
    germination_days int null
);

/*Bridge table for germination and plant tables (many-to-many relationship)*/

CREATE TABLE plant_germination (
	plant_germination_id int primary key auto_increment,
    germination_id int not null,
    plant_id int not null,
    constraint fk_plant_germination_germination_id
		foreign key (germination_id)
        references germination(germination_id),
	constraint fk_plant_germination_plant_id
		foreign key (plant_id)
        references plant(plant_id)
);

CREATE TABLE bloom_month (
	bloom_month_id int primary key auto_increment,
    month_name Varchar(9)
);
/*Bridge table for bloom month and plant tables (many-to-many relationship)*/

CREATE TABLE bloom_month_plant (
	bloom_month_plant_id int primary key auto_increment,
    bloom_month_id int not null,
    plant_id int not null,
    constraint fk_bloom_month_plant_bloom_id
		foreign key (bloom_month_id)
        references bloom_month(bloom_month_id),
	constraint fk_bloom_month_plant_plant_id
		foreign key (plant_id)
        references plant(plant_id)
);

CREATE TABLE image (
	image_id int primary key auto_increment,
    image_url Varchar(2048),
    image_description Varchar(1000)
);

/*Bridge table for bloom month and plant tables (many-to-many relationship)*/

CREATE TABLE plant_image (
	plant_image_id int primary key auto_increment,
    plant_id int not null, 
    image_id int not null,
    constraint fk_plant_image_plant_id
		foreign key (plant_id)
        references plant(plant_id),
	constraint fk_plant_image_image_id
		foreign key (image_id)
        references image(image_id)
);

CREATE TABLE insect (
	insect_id int primary key auto_increment,
    common_name Varchar(50) not null unique, 
    latin_name Varchar(50) not null unique,
    insect_description Varchar(1000) not null,
    insect_about Varchar(15000) null
);

CREATE TABLE insect_plant (
	insect_plant_id int primary key auto_increment,
    plant_id int not null,
    insect_id int not null,
    constraint fk_insect_plant_insect_id
		foreign key (insect_id)
        references insect(insect_id),
	constraint fk_insect_plant_plant_id
		foreign key (plant_id)
        references plant(plant_id)
);

CREATE TABLE insect_image (
	insect_image_id int primary key auto_increment,
    insect_id int not null,
    image_id int not null,
    constraint fk_insect_image_insect_id
		foreign key (insect_id)
        references insect(insect_id),
	constraint fk_insect_image_image_id
		foreign key (image_id)
        references image(image_id)
);

delimiter //
create procedure set_known_good_state()
begin

	delete from insect_image;
    alter table insect_image auto_increment = 1;
    delete from insect_plant;
    alter table insect_plant auto_increment = 1;
	delete from insect;
    alter table insect auto_increment = 1;
    delete from plant_image;
    alter table plant_image auto_increment = 1;
    delete from image;
    alter table image auto_increment = 1;
    delete from bloom_month_plant;
    alter table bloom_month_plant auto_increment = 1;
    delete from bloom_month;
    alter table bloom_month auto_increment = 1;
    delete from plant_germination;
    alter table plant_germination auto_increment = 1;
    delete from germination;
    alter table germination auto_increment = 1;
    delete from plant;
    alter table plant auto_increment = 1;
    delete from bloom_color;
    alter table bloom_color auto_increment = 1;
    
    INSERT INTO bloom_color (bloom_color_id, color) VALUE
		(1, 'white'),
        (2, 'pink'),
        (3, 'yellow');
        
	INSERT INTO plant (plant_id, common_name, latin_name, plant_description, plant_about, plant_spacing, 
		coldest_usda_zone, warmest_usda_zone, life_cycle, bloom_color_id) VALUE
		(1, 'Prairie Milkweed', 'Asclepias sullivantii', 'Easily grown from seed and bearing a very fragrant flower, 
        Prairie Milkweed makes a nice addition to any sunny medium to medium-moist garden.', 'about text', 1.5, 3, 7, 'Perenial', 2),
        (2, 'Wild Hyacinth', 'Camassia scilloides', 'Hyacinth, also called Atlantic Camas, is the only eastern species of its 
        genus, which is in the Lily family and characterized by squat bulbs, similar to those of small tulips in size and shape.', 
        'about text', 0.75, 'Perenial', 4, 8, 1),
        (3, 'Black-Eyed Susan', 'Rudbeckia hirta', ' Black-eyed Susan is an opportunist that thrives easily in disturbed areas.  
        It has naturalized through most of the continent. A biennial, it blooms and completes its life cycle in its second year but will re-seed.', 
        'about text', 1, 'Biennial', 3);
        
	END
        
        