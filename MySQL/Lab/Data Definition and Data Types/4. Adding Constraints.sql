ALTER TABLE `gamebar`.`products` 
ADD INDEX `fk_category_id_idx` (`category_id` ASC) VISIBLE;
;
ALTER TABLE `gamebar`.`products` 
ADD CONSTRAINT `fk_category_id`
  FOREIGN KEY (`category_id`)
  REFERENCES `gamebar`.`categories` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;