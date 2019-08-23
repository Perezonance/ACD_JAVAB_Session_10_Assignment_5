CREATE TABLE `employeemanagementdb`.`leaves` (
  `leave_type` VARCHAR(10) NOT NULL CHECK("Permanent" OR "Temporary"),
  `paid_leaves` INT NOT NULL,
  `earned_leaves` INT NULL,
  `sick_leaves` INT NULL,
  `vacations` INT NOT NULL,
  PRIMARY KEY (`leave_type`));

INSERT INTO `employeemanagementdb`.`leaves` VALUES ("Permanent", 40, 5, 10, 15);
INSERT INTO `employeemanagementdb`.`leaves`(leave_type, paid_leaves, vacations) VALUES ("Temporary", 40, 15);


  
  CREATE TABLE `employeemanagementdb`.`employee` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `emp_name` VARCHAR(45) NOT NULL,
  `emp_type` VARCHAR(10) NOT NULL CHECK("Temporary" OR "Permanent"),
  `emp_phone` VARCHAR(45) NOT NULL,
  `emp_email` VARCHAR(45) NOT NULL,
  `emp_base_sal` DECIMAL NOT NULL,
  `emp_pf` DECIMAL GENERATED ALWAYS AS (`emp_base_sal` * .12),
  `emp_da` DECIMAL GENERATED ALWAYS AS (`emp_base_sal` * .6),
  `emp_allowances` DECIMAL GENERATED ALWAYS AS (`emp_base_sal` * .5),
  PRIMARY KEY (`emp_id`),
  INDEX `fk_emp_type_idx` (`emp_type` ASC) VISIBLE,
  CONSTRAINT `fk_emp_type`
    FOREIGN KEY (`emp_type`)
    REFERENCES `employeemanagementdb`.`leaves` (`leave_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `employeemanagementdb`.`employee`(emp_name, emp_type, emp_phone, emp_email, emp_base_sal) VALUES ("Greg", "Permanent", "123-456-7890", "gregb45@yahoo.com", 45000);
INSERT INTO `employeemanagementdb`.`employee`(emp_name, emp_type, emp_phone, emp_email, emp_base_sal) VALUES ("Tom", "Temporary", "555-555-5656", "tommyboy2@aol.com", 25000);
INSERT INTO `employeemanagementdb`.`employee`(emp_name, emp_type, emp_phone, emp_email, emp_base_sal) VALUES ("Alex", "Permanent", "770-883-6921", "alex5@hotbox.com", 35000);
INSERT INTO `employeemanagementdb`.`employee`(emp_name, emp_type, emp_phone, emp_email, emp_base_sal) VALUES ("Tamia", "Permanent", "678-412-4848", "tamtam2121@gmail.com", 85000);
INSERT INTO `employeemanagementdb`.`employee`(emp_name, emp_type, emp_phone, emp_email, emp_base_sal) VALUES ("Luis", "Temporary", "770-921-2910", "Luis4563@ycomcast.com", 60000);

DROP TABLE `employeemanagementdb`.`employee`;
DROP TABLE `employeemanagementdb`.`leaves`;


    
