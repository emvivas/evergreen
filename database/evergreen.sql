-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Schema evergreen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema evergreen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evergreen` DEFAULT CHARACTER SET utf8mb4 ;
USE `evergreen` ;

-- -----------------------------------------------------
-- Table `evergreen`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`User` (
  `identificator` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `email` VARCHAR(320) NOT NULL,
  `telephoneNumber` VARCHAR(15) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `firstLastname` VARCHAR(30) NOT NULL,
  `secondLastname` VARCHAR(30) NULL,
  `sex` CHAR(1) NOT NULL DEFAULT 'M',
  `birthday` DATE NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `country` SMALLINT UNSIGNED NOT NULL,
  `state` VARCHAR(30) NULL,
  `city` VARCHAR(30) NULL,
  `zip` VARCHAR(10) NULL,
  `location` VARCHAR(150) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  CONSTRAINT `pk_User` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_User_username` CHECK (LENGTH(`username`) >= 1 AND `username` REGEXP "[0-9a-zA-Z_]"),
  CONSTRAINT `chk_User_email` CHECK (LENGTH(`email`) >= 5 AND `email` REGEXP "^[a-zA-Z0-9][a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]*?[a-zA-Z0-9._-]?@[a-zA-Z0-9][a-zA-Z0-9._-]*?[a-zA-Z0-9]?\\.[a-zA-Z]{2,63}$"),
  CONSTRAINT `chk_User_telephoneNumber` CHECK (LENGTH(`telephoneNumber`) >= 12 AND `telephoneNumber` REGEXP "[0-9]{3}-[0-9]{3}-[0-9]{4}"),
  CONSTRAINT `chk_User_name` CHECK (LENGTH(`name`) >= 1),
  CONSTRAINT `chk_User_firstLastname` CHECK (LENGTH(`firstLastname`) >= 1),
  CONSTRAINT `chk_User_secondLastname` CHECK (`secondLastname` IS NULL OR LENGTH(`secondLastname`) >= 1),
  CONSTRAINT `chk_User_sex` CHECK (`sex` = 'M' OR `sex` = 'W'),
  CONSTRAINT `chk_User_password` CHECK (LENGTH(`password`) >= 10),
  CONSTRAINT `chk_User_country` CHECK (`country` >= 1),
  CONSTRAINT `chk_User_state` CHECK (`state` IS NULL OR LENGTH(`state`) >= 1),
  CONSTRAINT `chk_User_city` CHECK (`city` IS NULL OR LENGTH(`city`) >= 1),
  CONSTRAINT `chk_User_zip` CHECK (`zip` IS NULL OR LENGTH(`zip`) >= 1),
  CONSTRAINT `chk_User_location` CHECK (`location` IS NULL OR LENGTH(`location`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telephoneNumber_UNIQUE` (`telephoneNumber` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Plant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Plant` (
  `identificator` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `denomination` VARCHAR(30) NULL,
  `description` VARCHAR(150) NULL,
  `color` VARCHAR(15) NULL,
  `age` FLOAT NULL,
  `kingdom` VARCHAR(30) NULL,
  `phylum` VARCHAR(30) NULL,
  `class` VARCHAR(30) NULL,
  `orders` VARCHAR(30) NULL,
  `family` VARCHAR(30) NULL,
  `genus` VARCHAR(30) NULL,
  `species` VARCHAR(30) NULL,
  `country` SMALLINT UNSIGNED NULL,
  `exotic` BIT NULL DEFAULT 0,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  CONSTRAINT `pk_Plant` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Plant_denomination` CHECK (`denomination` IS NULL OR LENGTH(`denomination`) >= 1),
  CONSTRAINT `chk_Plant_description` CHECK (`description` IS NULL OR LENGTH(`description`) >= 1),
  CONSTRAINT `chk_Plant_color` CHECK (`color` IS NULL OR LENGTH(`color`) >= 6),
  CONSTRAINT `chk_Plant_age` CHECK (`age` IS NULL OR `age` > 0.0 ),
  CONSTRAINT `chk_Plant_kingdom` CHECK (`kingdom` IS NULL OR LENGTH(`kingdom`) >= 1),
  CONSTRAINT `chk_Plant_phylum` CHECK (`phylum` IS NULL OR LENGTH(`phylum`) >= 1),
  CONSTRAINT `chk_Plant_class` CHECK (`class` IS NULL OR LENGTH(`class`) >= 1),
  CONSTRAINT `chk_Plant_orders` CHECK (`orders` IS NULL OR LENGTH(`orders`) >= 1),
  CONSTRAINT `chk_Plant_family` CHECK (`family` IS NULL OR LENGTH(`family`) >= 1),
  CONSTRAINT `chk_Plant_genus` CHECK (`genus` IS NULL OR LENGTH(`genus`) >= 1),
  CONSTRAINT `chk_Plant_species` CHECK (`species` IS NULL OR LENGTH(`species`) >= 1),
  CONSTRAINT `chk_Plant_country` CHECK (`country` IS NULL OR `country` >= 1),
  CONSTRAINT `chk_Plant_exotic` CHECK (`exotic` IS NULL OR (`exotic` = 0 OR `exotic` = 1)),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`PotPlant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`PotPlant` (
  `identificator` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(30) NOT NULL,
  `denomination` VARCHAR(30) NOT NULL,
  `version` VARCHAR(10) NOT NULL,
  `description` VARCHAR(150) NULL,
  `properties` VARCHAR(150) NULL,
  `material` VARCHAR(30) NOT NULL,
  `color` VARCHAR(10) NOT NULL,
  `texture` VARCHAR(30) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  CONSTRAINT `pk_PotPlant` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_PotPlant_code` CHECK (LENGTH(`code`) >= 1),
  CONSTRAINT `chk_PotPlant_denomination` CHECK (LENGTH(`denomination`) >= 1),
  CONSTRAINT `chk_PotPlant_version` CHECK (LENGTH(`version`) >= 1),
  CONSTRAINT `chk_PotPlant_description` CHECK (`description` IS NULL OR LENGTH(`description`) >= 1),
  CONSTRAINT `chk_PotPlant_properties` CHECK (`properties` IS NULL OR LENGTH(`properties`) >= 1),
  CONSTRAINT `chk_PotPlant_material` CHECK (LENGTH(`material`) >= 1),
  CONSTRAINT `chk_PotPlant_color` CHECK (LENGTH(`color`) >= 6),
  CONSTRAINT `chk_PotPlant_texture` CHECK (`texture` IS NULL OR LENGTH(`texture`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Module` (
  `identificator` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(30) NOT NULL,
  `denomination` VARCHAR(30) NOT NULL,
  `brand` VARCHAR(30) NULL,
  `model` VARCHAR(30) NULL,
  `version` VARCHAR(10) NULL,
  `description` VARCHAR(150) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  CONSTRAINT `pk_Module` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Module_code` CHECK (LENGTH(`code`) >= 1),
  CONSTRAINT `chk_Module_denomination` CHECK (LENGTH(`denomination`) >= 1),
  CONSTRAINT `chk_Module_brand` CHECK (`brand` IS NULL OR LENGTH(`brand`) >= 1),
  CONSTRAINT `chk_Module_model` CHECK (`model` IS NULL OR LENGTH(`model`) >= 1),
  CONSTRAINT `chk_Module_version` CHECK (`version` IS NULL OR LENGTH(`version`) >= 1),
  CONSTRAINT `chk_Module_description` CHECK (`description` IS NULL OR LENGTH(`description`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Measurement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Measurement` (
  `identificator` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `variable` VARCHAR(30) NOT NULL,
  `units` VARCHAR(30) NOT NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  CONSTRAINT `pk_Measurement` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Measurement_variable` CHECK (LENGTH(`variable`) >= 1),
  CONSTRAINT `chk_Measurement_units` CHECK (LENGTH(`units`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  UNIQUE INDEX `variable_UNIQUE` (`variable` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`PotPlantUnit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`PotPlantUnit` (
  `identificator` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(30) NOT NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  `PotPlant_identificator` SMALLINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_PotPlantUnit` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_PotPlantUnit_code` CHECK (LENGTH(`code`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  INDEX `fk_PotPlantUnities_PotPlant1_idx` (`PotPlant_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_PotPlantUnities_PotPlant1`
    FOREIGN KEY (`PotPlant_identificator`)
    REFERENCES `evergreen`.`PotPlant` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Acquisition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Acquisition` (
  `identificator` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  `PotPlantUnit_identificator` BIGINT UNSIGNED NOT NULL,
  `User_identificator` INT UNSIGNED NOT NULL,
  INDEX `fk_Acquisition_User1_idx` (`User_identificator` ASC) VISIBLE,
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  UNIQUE INDEX `PotPlantUnit_identificator_UNIQUE` (`PotPlantUnit_identificator` ASC) VISIBLE,
  CONSTRAINT `pk_Acquisition` PRIMARY KEY (`identificator`),
  INDEX `fk_Acquisition_PotPlantUnit1_idx` (`PotPlantUnit_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_Acquisition_User1`
    FOREIGN KEY (`User_identificator`)
    REFERENCES `evergreen`.`User` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Acquisition_PotPlantUnit1`
    FOREIGN KEY (`PotPlantUnit_identificator`)
    REFERENCES `evergreen`.`PotPlantUnit` (`identificator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Implementation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Implementation` (
  `identificator` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `properties` VARCHAR(150) NULL,
  `PotPlant_identificator` SMALLINT UNSIGNED NOT NULL,
  `Module_identificator` TINYINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_Implementation` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Implementation_properties` CHECK (`properties` IS NULL OR LENGTH(`properties`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  INDEX `fk_Implementation_PotPlant1_idx` (`PotPlant_identificator` ASC) VISIBLE,
  INDEX `fk_Implementation_Module1_idx` (`Module_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_Implementation_PotPlant1`
    FOREIGN KEY (`PotPlant_identificator`)
    REFERENCES `evergreen`.`PotPlant` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Implementation_Module1`
    FOREIGN KEY (`Module_identificator`)
    REFERENCES `evergreen`.`Module` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Monitoring`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Monitoring` (
  `identificator` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `notes` VARCHAR(150) NULL,
  `status` BIT NOT NULL DEFAULT 1,
  `Implementation_identificator` INT UNSIGNED NOT NULL,
  `Measurement_identificator` TINYINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_Monitoring` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Monitoring_notes` CHECK (`notes` IS NULL OR LENGTH(`notes`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  INDEX `fk_Monitoring_Implementation1_idx` (`Implementation_identificator` ASC) VISIBLE,
  INDEX `fk_Monitoring_Measurement1_idx` (`Measurement_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_Monitoring_Implementation1`
    FOREIGN KEY (`Implementation_identificator`)
    REFERENCES `evergreen`.`Implementation` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Monitoring_Measurement1`
    FOREIGN KEY (`Measurement_identificator`)
    REFERENCES `evergreen`.`Measurement` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Graphic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Graphic` (
  `identificator` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `graph` TINYTEXT NOT NULL,
  `type` SMALLINT NOT NULL,
  `status` BIT NOT NULL DEFAULT 1,
  `Trasplantation_identificator` BIGINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_Graphic` PRIMARY KEY (`identificator`),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  INDEX `fk_Graphic_Trasplantation1_idx` (`Trasplantation_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_Graphic_Trasplantation1`
    FOREIGN KEY (`Trasplantation_identificator`)
    REFERENCES `evergreen`.`Trasplantation` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Trasplantation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Trasplantation` (
  `identificator` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL,
  `age` FLOAT NOT NULL DEFAULT 0.0,
  `notes` VARCHAR(150) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  `Acquisition_identificator` BIGINT UNSIGNED NOT NULL,
  `Plant_identificator` INT UNSIGNED NULL,
  CONSTRAINT `pk_Trasplantation` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Trasplantation_name` CHECK (`name` IS NULL OR `name` REGEXP "[0-9a-zA-Z_]"),
  CONSTRAINT `chk_Trasplantation_age` CHECK (`age` >= 0.0 ),
  CONSTRAINT `chk_Trasplantation_notes` CHECK (`notes` IS NULL OR LENGTH(`notes`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  -- INDEX `fk_Trasplantation_Acquisition1_idx` (`Acquisition_identificator` ASC) VISIBLE,
  INDEX `fk_Trasplantation_Plant1_idx` (`Plant_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_Trasplantation_Acquisition1`
    FOREIGN KEY (`Acquisition_identificator`)
    REFERENCES `evergreen`.`Acquisition` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Trasplantation_Plant1`
    FOREIGN KEY (`Plant_identificator`)
    REFERENCES `evergreen`.`Plant` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Observation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Observation` (
  `identificator` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` DOUBLE NULL,
  `ipv4` VARCHAR(30) NOT NULL,
  `notes` VARCHAR(150) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `Trasplantation_identificator` BIGINT UNSIGNED NOT NULL,
  `Monitoring_identificator` BIGINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_Observation` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Observation_notes` CHECK (`notes` IS NULL OR LENGTH(`notes`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  INDEX `fk_Observation_Monitoring1_idx` (`Monitoring_identificator` ASC) VISIBLE,
  INDEX `fk_Observation_Trasplantation1_idx` (`Trasplantation_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_Observation_Monitoring1`
    FOREIGN KEY (`Monitoring_identificator`)
    REFERENCES `evergreen`.`Monitoring` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Observation_Trasplantation1`
    FOREIGN KEY (`Trasplantation_identificator`)
    REFERENCES `evergreen`.`Trasplantation` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`Attention`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`Attention` (
  `identificator` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `initialValue` DOUBLE NULL,
  `finalValue` DOUBLE NULL,
  `notes` VARCHAR(150) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  `Plant_identificator` INT UNSIGNED NOT NULL,
  `Measurement_identificator` TINYINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_Attention` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_Attention_notes` CHECK (`notes` IS NULL OR LENGTH(`notes`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  INDEX `fk_Attention_Plant1_idx` (`Plant_identificator` ASC) VISIBLE,
  INDEX `fk_Attention_Measurement1_idx` (`Measurement_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_Attention_Plant1`
    FOREIGN KEY (`Plant_identificator`)
    REFERENCES `evergreen`.`Plant` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Attention_Measurement1`
    FOREIGN KEY (`Measurement_identificator`)
    REFERENCES `evergreen`.`Measurement` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`PotPlantProfile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`PotPlantProfile` (
  `identificator` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` DOUBLE NOT NULL,
  `notes` VARCHAR(150) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  `PotPlant_identificator` SMALLINT UNSIGNED NOT NULL,
  `Measurement_identificator` TINYINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_PotPlantProfile` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_PotPlantProfile_notes` CHECK (`notes` IS NULL OR LENGTH(`notes`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  INDEX `fk_PotPlantProfile_PotPlant1_idx` (`PotPlant_identificator` ASC) VISIBLE,
  INDEX `fk_PotPlantProfile_Measurement1_idx` (`Measurement_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_PotPlantProfile_PotPlant1`
    FOREIGN KEY (`PotPlant_identificator`)
    REFERENCES `evergreen`.`PotPlant` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PotPlantProfile_Measurement1`
    FOREIGN KEY (`Measurement_identificator`)
    REFERENCES `evergreen`.`Measurement` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evergreen`.`PlantProfile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evergreen`.`PlantProfile` (
  `identificator` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` DOUBLE NOT NULL,
  `notes` VARCHAR(150) NULL,
  `register` DATETIME NOT NULL DEFAULT NOW(),
  `updateRow` DATETIME NOT NULL DEFAULT NOW(),
  `status` BIT NOT NULL DEFAULT 1,
  `Plant_identificator` INT UNSIGNED NOT NULL,
  `Measurement_identificator` TINYINT UNSIGNED NOT NULL,
  CONSTRAINT `pk_PlantProfile` PRIMARY KEY (`identificator`),
  CONSTRAINT `chk_PlantProfile_notes` CHECK (`notes` IS NULL OR LENGTH(`notes`) >= 1),
  UNIQUE INDEX `identificator_UNIQUE` (`identificator` ASC) VISIBLE,
  INDEX `fk_PlantProfile_Plant1_idx` (`Plant_identificator` ASC) VISIBLE,
  INDEX `fk_PlantProfile_Measurement1_idx` (`Measurement_identificator` ASC) VISIBLE,
  CONSTRAINT `fk_PlantProfile_Plant1`
    FOREIGN KEY (`Plant_identificator`)
    REFERENCES `evergreen`.`Plant` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PlantProfile_Measurement1`
    FOREIGN KEY (`Measurement_identificator`)
    REFERENCES `evergreen`.`Measurement` (`identificator`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
