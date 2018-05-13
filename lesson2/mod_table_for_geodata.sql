USE `geodata`;

-- Modification _countries

ALTER TABLE `_countries`
DROP COLUMN `title_ua`,
DROP COLUMN `title_be`,
DROP COLUMN `title_en`,
DROP COLUMN `title_es`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_de`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_it`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_cz`;

ALTER TABLE `_countries` CHANGE `title_ru` `title` VARCHAR(150) NOT NULL;
CREATE INDEX `title_country` ON `_countries`(`title`);

ALTER TABLE `_countries` ADD PRIMARY KEY (`country_id`);
ALTER TABLE `_countries` MODIFY COLUMN `country_id` INT NOT NULL AUTO_INCREMENT;

-- Modification _regions

ALTER TABLE `_regions`
DROP COLUMN `title_ua`,
DROP COLUMN `title_be`,
DROP COLUMN `title_en`,
DROP COLUMN `title_es`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_de`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_it`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_cz`;

ALTER TABLE `_regions` CHANGE `title_ru` `title` VARCHAR(150) NOT NULL;
CREATE INDEX `title_region` ON `_regions`(`title`);

ALTER TABLE `_regions` ADD PRIMARY KEY (`region_id`);
ALTER TABLE `_regions` MODIFY COLUMN `region_id` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE `_regions` 
ADD CONSTRAINT `fk_country_id` 
FOREIGN KEY (`country_id`) REFERENCES `_countries`(`country_id`);

-- Modification _cities

ALTER TABLE `_cities` DROP COLUMN `title_ua`;
ALTER TABLE `_cities` DROP COLUMN `title_be`;
ALTER TABLE `_cities` DROP COLUMN `title_en`;
ALTER TABLE `_cities` DROP COLUMN `title_es`;
ALTER TABLE `_cities` DROP COLUMN `title_pt`;
ALTER TABLE `_cities` DROP COLUMN `title_de`;
ALTER TABLE `_cities` DROP COLUMN `title_fr`;
ALTER TABLE `_cities` DROP COLUMN `title_it`;
ALTER TABLE `_cities` DROP COLUMN `title_pl`;
ALTER TABLE `_cities` DROP COLUMN `title_ja`;
ALTER TABLE `_cities` DROP COLUMN `title_lt`;
ALTER TABLE `_cities` DROP COLUMN `title_lv`;
ALTER TABLE `_cities` DROP COLUMN `title_cz`;

ALTER TABLE `_cities` DROP COLUMN `area_ru`;
ALTER TABLE `_cities` DROP COLUMN `area_ua`;
ALTER TABLE `_cities` DROP COLUMN `area_be`;
ALTER TABLE `_cities` DROP COLUMN `area_en`;
ALTER TABLE `_cities` DROP COLUMN `area_es`;
ALTER TABLE `_cities` DROP COLUMN `area_pt`;
ALTER TABLE `_cities` DROP COLUMN `area_de`;
ALTER TABLE `_cities` DROP COLUMN `area_fr`;
ALTER TABLE `_cities` DROP COLUMN `area_it`;
ALTER TABLE `_cities` DROP COLUMN `area_pl`;
ALTER TABLE `_cities` DROP COLUMN `area_ja`;
ALTER TABLE `_cities` DROP COLUMN `area_lt`;
ALTER TABLE `_cities` DROP COLUMN `area_lv`;
ALTER TABLE `_cities` DROP COLUMN `area_cz`;

ALTER TABLE `_cities` DROP COLUMN `region_ru`;
ALTER TABLE `_cities` DROP COLUMN `region_ua`;
ALTER TABLE `_cities` DROP COLUMN `region_be`;
ALTER TABLE `_cities` DROP COLUMN `region_en`;
ALTER TABLE `_cities` DROP COLUMN `region_es`;
ALTER TABLE `_cities` DROP COLUMN `region_pt`;
ALTER TABLE `_cities` DROP COLUMN `region_de`;
ALTER TABLE `_cities` DROP COLUMN `region_fr`;
ALTER TABLE `_cities` DROP COLUMN `region_it`;
ALTER TABLE `_cities` DROP COLUMN `region_pl`;
ALTER TABLE `_cities` DROP COLUMN `region_ja`;
ALTER TABLE `_cities` DROP COLUMN `region_lt`;
ALTER TABLE `_cities` DROP COLUMN `region_lv`;
ALTER TABLE `_cities` DROP COLUMN `region_cz`;

ALTER TABLE `_cities` CHANGE `title_ru` `title` VARCHAR(150) NOT NULL;
CREATE INDEX `title_city` ON `_cities`(`title`);

ALTER TABLE `_cities` ADD PRIMARY KEY (`city_id`);
ALTER TABLE `_cities` MODIFY COLUMN `city_id` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE `_cities` 
ADD CONSTRAINT `fk_area_id` 
FOREIGN KEY (`country_id`) REFERENCES `_countries`(`country_id`);

ALTER TABLE `_cities` 
ADD CONSTRAINT `fk_region_id` 
FOREIGN KEY (`region_id`) REFERENCES `_regions`(`region_id`);