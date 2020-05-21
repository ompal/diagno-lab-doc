use diagno_lab;

CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE `role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  KEY `FKf8yllw1ecvwqy3ehyxawqa1qp` (`permission_id`),
  KEY `FKa6jx8n8xkesmjmv6jqug6bg68` (`role_id`),
  CONSTRAINT `FKa6jx8n8xkesmjmv6jqug6bg68` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKf8yllw1ecvwqy3ehyxawqa1qp` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_expired` bit(1) DEFAULT NULL,
  `account_locked` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `credentials_expired` bit(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL, 
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `password_reset_token` (
  `id` bigint(20) NOT NULL,
  `expiry_date` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ima88norei0uw3te4lim0qsl` (`token`),
  KEY `FKt3xh3951985ln0y0v5m85c8is` (`user_id`),
  CONSTRAINT `FKt3xh3951985ln0y0v5m85c8is` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `oauth_client_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3my6lp6ttga6hhwtsutscqset` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `address_master` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `district` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `pin_code` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `address_UNIQUE` (`address` ASC),
  PRIMARY KEY (`id`));


CREATE TABLE `test_category_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(200) NOT NULL,
  `test_desc` varchar(300) NOT NULL,
  `category_type` int(11) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `test_amount` int(11) DEFAULT NULL,
  `discount_amount` int(11) DEFAULT NULL,
  `facility_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sjhdgfjsdhfgjsdgfjsdgfjsdgf_idx` (`facility_id`),
  CONSTRAINT `sjhdgfjsdhfgjsdgfjsdgfjsdgf` FOREIGN KEY (`facility_id`) REFERENCES `medical_facility_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



SELECT * FROM diagno_lab.test_category_master where parent_id=0 and facility_id=1;
SELECT * FROM diagno_lab.test_category_master where parent_id = 1 and category_type = 0 and facility_id=1;
SELECT * FROM diagno_lab.test_category_master where parent_id = 2 and category_type = 1 and facility_id=1;
SELECT * FROM diagno_lab.test_category_master where parent_id = 6 and category_type = 1 and facility_id=1;

CREATE TABLE `patient_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(10) NOT NULL,
  `aadhar_no` varchar(12) DEFAULT NULL,
  `address_id` bigint(20) NOT NULL,
  `facility_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sajkhfkjsdhkaldhfksdfkd_idx` (`address_id`),
  KEY `ajkshgksjdhsdjkghklfjghkdfjghkf_idx` (`facility_id`),
  CONSTRAINT `ajkshgksjdhsdjkghklfjghkdfjghkf` FOREIGN KEY (`facility_id`) REFERENCES `medical_facility_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sajkhfkjsdhkaldhfksdfkd` FOREIGN KEY (`address_id`) REFERENCES `address_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

               
               CREATE TABLE `patient_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) NOT NULL,
  `advised_date` date NOT NULL,
  `advised_by_doctor` varchar(50) DEFAULT NULL,
  `advised_facility` varchar(100) DEFAULT NULL,
  `advised_facility_address` bigint(20) DEFAULT NULL,
  `report_delivery_mode` varchar(45) DEFAULT NULL,
  `is_urgent` int(11) DEFAULT NULL,
  `reffered_by` varchar(45) DEFAULT NULL,
  `insurance_company_id` int(11) DEFAULT NULL,
  `clinical_history` varchar(500) DEFAULT NULL,
  `report_delivered_by` int(11) DEFAULT NULL,
  `facility_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ajkdghajkhgkjsdhfksdhfkdjsfkd_idx` (`facility_id`),
  KEY `jkahgkjsdhgsdkfhkdjhfksdjf_idx` (`advised_facility_address`),
  KEY `zxnmbvmxcbvmxcvbmxcvmxc_idx` (`patient_id`),
  CONSTRAINT `ajkdghajkhgkjsdhfksdhfkdjsfkd` FOREIGN KEY (`facility_id`) REFERENCES `medical_facility_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jkahgkjsdhgsdkfhkdjhfksdjf` FOREIGN KEY (`advised_facility_address`) REFERENCES `address_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `zxnmbvmxcbvmxcvbmxcvmxc` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






