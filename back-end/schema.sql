-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema meald
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema meald
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `meald` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `meald` ;

-- -----------------------------------------------------
-- Table `meald`.`liveurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`liveurs` (
  `livreur_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL,
  `phone` VARCHAR(20) NULL,
  `location` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `motdepasse` VARCHAR(45) NULL,
  `matricule` VARCHAR(55) NULL,
  `compte_bancaire` VARCHAR(50) NULL,
  PRIMARY KEY (`livreur_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meald`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`articles` (
  `article_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `prix` DECIMAL(10,2) NOT NULL,
  `description` VARCHAR(225) NULL,
  PRIMARY KEY (`article_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meald`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `motdepasse` VARCHAR(255) NULL,
  `telephone` VARCHAR(20) NULL,
  `addresse` VARCHAR(200) NULL,
  `mode_de_payement` VARCHAR(50) NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meald`.`restaurants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`restaurants` (
  `restaurant_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(50) NULL,
  `mot_de_passe` VARCHAR(45) NULL,
  PRIMARY KEY (`restaurant_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meald`.`commandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`commandes` (
  `commande_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `restaurant_id` INT NULL,
  `prix_total` DECIMAL(10,2) NULL,
  `delivery_status` VARCHAR(20) NULL,
  `date_commande` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `mode_payement` VARCHAR(45) NULL,
  `frais_livraison` VARCHAR(45) NULL,
  `livreur_id` INT NOT NULL,
  PRIMARY KEY (`commande_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `restaurant_id` (`restaurant_id` ASC) VISIBLE,
  INDEX `fk_commandes_liveurs1_idx` (`livreur_id` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `meald`.`clients` (`client_id`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `meald`.`restaurants` (`restaurant_id`),
  CONSTRAINT `fk_commandes_liveurs1`
    FOREIGN KEY (`livreur_id`)
    REFERENCES `meald`.`liveurs` (`livreur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meald`.`paiments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`paiments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `commande_id` INT NOT NULL,
  `methode_paiement` VARCHAR(20) NOT NULL,
  `montant` DECIMAL(10,2) NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `date_paiement` VARCHAR(45) NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `order_id` (`commande_id` ASC) VISIBLE,
  CONSTRAINT `payment_ibfk_1`
    FOREIGN KEY (`commande_id`)
    REFERENCES `meald`.`commandes` (`commande_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meald`.`ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`ratings` (
  `rating_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `commentaire` VARCHAR(50) NULL,
  PRIMARY KEY (`rating_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `restaurant_id` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `rating_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `meald`.`clients` (`client_id`),
  CONSTRAINT `rating_ibfk_2`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `meald`.`restaurants` (`restaurant_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meald`.`article_commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`article_commande` (
  `article_id` INT NOT NULL,
  `quanitÃ©` VARCHAR(45) NULL,
  `prix` VARCHAR(45) NULL,
  `article_id` INT NOT NULL,
  `commande_id` INT NOT NULL,
  PRIMARY KEY (`article_id`),
  INDEX `fk_article_commande_articles1_idx` (`article_id` ASC) VISIBLE,
  INDEX `fk_article_commande_commandes1_idx` (`commande_id` ASC) VISIBLE,
  CONSTRAINT `fk_article_commande_articles1`
    FOREIGN KEY (`article_id`)
    REFERENCES `meald`.`articles` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_commande_commandes1`
    FOREIGN KEY (`commande_id`)
    REFERENCES `meald`.`commandes` (`commande_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meald`.`depot_livreur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`depot_livreur` (
  `depot_livreur_id` INT NOT NULL,
  `date_depot` VARCHAR(45) NULL,
  `montant` VARCHAR(45) NULL,
  `liveurs_livreur_id` INT NOT NULL,
  PRIMARY KEY (`depot_livreur_id`),
  INDEX `fk_depot_livreur_liveurs1_idx` (`liveurs_livreur_id` ASC) VISIBLE,
  CONSTRAINT `fk_depot_livreur_liveurs1`
    FOREIGN KEY (`liveurs_livreur_id`)
    REFERENCES `meald`.`liveurs` (`livreur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meald`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meald`.`menu` (
  `restaurants_restaurant_id` INT NOT NULL,
  `articles_article_id` INT NOT NULL,
  PRIMARY KEY (`restaurants_restaurant_id`, `articles_article_id`),
  INDEX `fk_restaurants_has_articles_articles1_idx` (`articles_article_id` ASC) VISIBLE,
  INDEX `fk_restaurants_has_articles_restaurants1_idx` (`restaurants_restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurants_has_articles_restaurants1`
    FOREIGN KEY (`restaurants_restaurant_id`)
    REFERENCES `meald`.`restaurants` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurants_has_articles_articles1`
    FOREIGN KEY (`articles_article_id`)
    REFERENCES `meald`.`articles` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;