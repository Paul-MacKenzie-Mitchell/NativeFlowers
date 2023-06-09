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
    plant_height int not null,
    coldest_usda_zone int not null,
    warmest_usda_zone int not null,
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

CREATE TABLE bloom_time (
	bloom_time_id int primary key auto_increment,
    month_name Varchar(9)
);
/*Bridge table for bloom month and plant tables (many-to-many relationship)*/

CREATE TABLE bloom_time_plant (
	bloom_time_plant_id int primary key auto_increment,
    bloom_time_id int not null,
    plant_id int not null,
    constraint fk_bloom_time_plant_bloom_id
		foreign key (bloom_time_id)
        references bloom_time(bloom_time_id),
	constraint fk_bloom_time_plant_plant_id
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

CREATE TABLE sun_exposure (
	sun_exposure_id int primary key auto_increment,
    sun_type Varchar(50)
);

CREATE TABLE plant_sun_exposure (
	plant_sun_exposure_id int primary key auto_increment,
    sun_exposure_id int not null,
    plant_id int not null,
    constraint fk_plant_sun_exposure_plant_id
		foreign key (plant_id)
        references plant(plant_id),
	constraint fk_plant_sun_exposure_sun_exposure_id
		foreign key (sun_exposure_id)
        references sun_exposure(sun_exposure_id)
);

CREATE TABLE soil_moisture (
	soil_moisture_id int primary key auto_increment,
    soil_moisture_type Varchar(50)
);

CREATE TABLE plant_soil_moisture (
	plant_soil_moisture_id int primary key auto_increment,
    plant_id int not null,
    soil_moisture_id int not null,
    constraint fk_plant_soil_moisture_plant_id
		foreign key (plant_id)
        references plant(plant_id),
	constraint fk_plant_soil_moisture_soil_moisture_id
		foreign key (soil_moisture_id)
        references soil_moisture(soil_moisture_id)
);

CREATE TABLE plant_life_cycle (
	plant_life_cycle_id int primary key auto_increment,
    plant_life_cycle_type Varchar(20)
);

CREATE TABLE plant_plant_life_cycle (
	plant_plant_life_cycle_id int primary key auto_increment,
    plant_id int not null,
    plant_life_cycle_id int not null,
    constraint fk_plant_plant_life_cycle_plant_id
		foreign key (plant_id)
        references plant(plant_id),
	constraint fk_plant_plant_life_cycle_plant_life_cycle_id
		foreign key (plant_life_cycle_id)
        references plant_life_cycle(plant_life_cycle_id)
);