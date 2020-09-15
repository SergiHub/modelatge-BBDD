-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_country` varchar(45) NOT NULL,
  `address_city` varchar(45) NOT NULL,
  `address_postal_code` mediumint(3) NOT NULL,
  `address_street` varchar(45) DEFAULT NULL,
  `address_number` varchar(10) DEFAULT NULL,
  `address_floor` varchar(5) DEFAULT NULL,
  `address_door` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Spain','Barcelona',8005,'C/Bilbao','10','3','1'),(2,'Portugal','Oporto',45673,'Praça do Mar','1','baixo',NULL),(3,'Spain','San Sebastián',76542,'Avenida del Pescador','231','4','5');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand-group`
--

DROP TABLE IF EXISTS `brand-group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand-group` (
  `brand-group_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand-group_name` varchar(45) NOT NULL,
  `suppliers_supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`brand-group_id`),
  KEY `fk_brand-group_suppliers1_idx` (`suppliers_supplier_id`),
  CONSTRAINT `fk_brand-group_suppliers1` FOREIGN KEY (`suppliers_supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand-group`
--

LOCK TABLES `brand-group` WRITE;
/*!40000 ALTER TABLE `brand-group` DISABLE KEYS */;
INSERT INTO `brand-group` VALUES (9,'Oakley',3),(10,'Carrera',4),(11,'Ray-Ban',5);
/*!40000 ALTER TABLE `brand-group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands` (
  `brands_id` int(11) NOT NULL AUTO_INCREMENT,
  `brands_name` varchar(45) NOT NULL,
  `brand-group_brand-group_id` int(11) NOT NULL,
  PRIMARY KEY (`brands_id`),
  KEY `fk_brands_brand-group1_idx` (`brand-group_brand-group_id`),
  CONSTRAINT `fk_brands_brand-group1` FOREIGN KEY (`brand-group_brand-group_id`) REFERENCES `brand-group` (`brand-group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (5,'Mountain Fit',9),(6,'Beach',9),(7,'Power',10),(8,'Super-Carbonic',11),(9,'Common-5',11);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(45) NOT NULL,
  `client_telephone` int(11) DEFAULT NULL,
  `cllient_email` varchar(45) DEFAULT NULL,
  `client_reg-date` date DEFAULT NULL,
  `client_recommended` varchar(45) DEFAULT NULL,
  `address_address_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_client_address1_idx` (`address_address_id`),
  CONSTRAINT `fk_client_address1` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (3,'Juanjo Ruiz',934567896,'juanorf@gmail.com','2020-03-10',NULL,1),(4,'Sergi Pagés',657890761,'sergipages@gmail.com','2020-05-22','Juanjo Ruiz',2),(5,'Maria Tarrés',934208900,'tarresmama@gmail.com','2020-06-11','Juanjo Ruiz',3);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_first-name` varchar(45) NOT NULL,
  `employee_last-name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Josefina','Valls'),(134,'Silvia','Petit'),(201,'Jaume','Gracía');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glasses` (
  `glasses_id` int(11) NOT NULL AUTO_INCREMENT,
  `glasses_left_lens_grad` tinyint(1) DEFAULT NULL,
  `glasses_right_lens_grad` tinyint(1) DEFAULT NULL,
  `glasses_frame_colour` varchar(10) DEFAULT NULL,
  `glasses_price` float NOT NULL,
  `brands_brands_id` int(11) NOT NULL,
  `glasses-frame_glasses-frame_id` int(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  KEY `fk_glasses_brands1_idx` (`brands_brands_id`),
  KEY `fk_glasses_glasses-frame1_idx` (`glasses-frame_glasses-frame_id`),
  CONSTRAINT `fk_glasses_brands1` FOREIGN KEY (`brands_brands_id`) REFERENCES `brands` (`brands_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_glasses-frame1` FOREIGN KEY (`glasses-frame_glasses-frame_id`) REFERENCES `glasses-frame` (`glasses-frame_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (5,2,2,'blue',200,5,1),(6,1,1,'black',125,6,2),(7,0,0,'yellow',90,7,1),(8,1,1,'red',230,8,3),(9,0,0,'orange',180,9,3);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses-frame`
--

DROP TABLE IF EXISTS `glasses-frame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glasses-frame` (
  `glasses-frame_id` int(11) NOT NULL AUTO_INCREMENT,
  `glasses-frame_type` enum('floating','pasta','metallic') NOT NULL,
  PRIMARY KEY (`glasses-frame_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses-frame`
--

LOCK TABLES `glasses-frame` WRITE;
/*!40000 ALTER TABLE `glasses-frame` DISABLE KEYS */;
INSERT INTO `glasses-frame` VALUES (1,'floating'),(2,'pasta'),(3,'metallic');
/*!40000 ALTER TABLE `glasses-frame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order-item`
--

DROP TABLE IF EXISTS `order-item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order-item` (
  `order-item_num` int(11) NOT NULL,
  `order-item_quantity` int(11) DEFAULT '1',
  `glasses_glasses_id` int(11) NOT NULL,
  `orders_header_orders-header_id` int(11) NOT NULL,
  `orders_header_order-date` date NOT NULL,
  PRIMARY KEY (`order-item_num`,`orders_header_orders-header_id`),
  KEY `fk_order-item_glasses1_idx` (`glasses_glasses_id`),
  KEY `fk_order-item_orders_header1_idx` (`orders_header_orders-header_id`,`orders_header_order-date`),
  CONSTRAINT `fk_order-item_glasses1` FOREIGN KEY (`glasses_glasses_id`) REFERENCES `glasses` (`glasses_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order-item_orders_header1` FOREIGN KEY (`orders_header_orders-header_id`, `orders_header_order-date`) REFERENCES `orders-header` (`orders-header_id`, `order-date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order-item`
--

LOCK TABLES `order-item` WRITE;
/*!40000 ALTER TABLE `order-item` DISABLE KEYS */;
INSERT INTO `order-item` VALUES (500,1,5,1,'2020-01-08'),(500,2,6,2,'2020-05-31'),(501,3,8,2,'2020-05-31'),(501,1,7,3,'2020-07-23'),(502,1,9,4,'2020-08-03'),(503,1,6,1,'2020-01-08'),(503,2,7,5,'2020-09-10');
/*!40000 ALTER TABLE `order-item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders-header`
--

DROP TABLE IF EXISTS `orders-header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders-header` (
  `orders-header_id` int(11) NOT NULL AUTO_INCREMENT,
  `order-date` date NOT NULL,
  `order_timestamp` timestamp(6) NULL DEFAULT NULL,
  `suppliers_supplier_id` int(11) NOT NULL,
  `employees_employee_id` int(11) NOT NULL,
  `client_client_id` int(11) NOT NULL,
  PRIMARY KEY (`orders-header_id`,`order-date`),
  KEY `fk_orders_header_suppliers1_idx` (`suppliers_supplier_id`),
  KEY `fk_orders_header_employees1_idx` (`employees_employee_id`),
  KEY `fk_orders_header_client1_idx` (`client_client_id`),
  CONSTRAINT `fk_orders_header_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_header_employees1` FOREIGN KEY (`employees_employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_header_suppliers1` FOREIGN KEY (`suppliers_supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders-header`
--

LOCK TABLES `orders-header` WRITE;
/*!40000 ALTER TABLE `orders-header` DISABLE KEYS */;
INSERT INTO `orders-header` VALUES (1,'2020-01-08','2020-01-08 09:13:45.000001',3,100,3),(2,'2020-05-31','2020-05-31 09:39:56.000023',4,201,3),(3,'2020-07-23','2020-07-23 07:58:32.000001',5,134,5),(4,'2020-08-03','2020-08-03 14:34:54.000001',3,201,4),(5,'2020-09-10','2020-09-10 16:23:12.000001',5,100,5);
/*!40000 ALTER TABLE `orders-header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(45) NOT NULL,
  `supplier_NIF` varchar(9) NOT NULL,
  `supplier_telephone` int(11) DEFAULT NULL,
  `supplier_fax` int(11) DEFAULT NULL,
  `address_address_id` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_NIF_UNIQUE` (`supplier_NIF`),
  KEY `fk_suppliers_address_idx` (`address_address_id`),
  CONSTRAINT `fk_suppliers_address` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (3,'Gafas Gómez','A08249865',932009648,NULL,1),(4,'Óptica Muir','B67456251',675342568,NULL,2),(5,'Lentes Pilar','A08456726',934567890,934567892,3);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-15 15:21:23
