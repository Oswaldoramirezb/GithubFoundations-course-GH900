addresses-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: monkeys_tower
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_addresses_has_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,3,'Avenida 20 de Noviembre 605','Nava','Sonora','87803','Mexico'),(2,4,'Privada Josefa Ortiz de Domínguez 59','Juárez','Baja California','34978','Mexico'),(3,5,'Avenida 16 de Septiembre 30','Ocampo','Puebla','22619','Mexico'),(4,6,'Callejón Revolución 4','Guadalupe','Veracruz','94843','Mexico'),(5,7,'Retorno Morelos 9','Salvatierra','Puebla','95982','Mexico'),(6,8,'Calle Miguel Hidalgo 92','Santiago de Querétaro','Querétaro','76000','Mexico'),(7,9,'Avenida 20 de Noviembre 83','San Nicolás de los Garza','Quintana Roo','40540','Mexico'),(8,10,'Privada Benito Juárez 5','Abasolo','Chiapas','80685','Mexico'),(9,11,'Calle 5 de Mayo 86','Guadalupe','Morelos','38930','Mexico'),(10,12,'Calle Ignacio Allende 7','Guadalupe','Jalisco','66289','Mexico'),(11,13,'Avenida del Trabajo 67','Tonalá','Veracruz','28525','Mexico'),(12,14,'Calle Venustiano Carranza 2','San Pedro Garza García','Hidalgo','67977','Mexico'),(13,15,'Privada del Trabajo 8','Monterrey','Coahuila','75988','Mexico'),(14,16,'Retorno Lázaro Cárdenas 1','Apodaca','Guerrero','30784','Mexico'),(15,17,'Avenida Benito Juárez 50','Ciudad de México','Ciudad de México','06500','Mexico'),(16,18,'Callejón Lázaro Cárdenas 72','Ramos Arizpe','Yucatán','29999','Mexico'),(17,19,'Avenida del Trabajo 47','San Nicolás de los Garza','Jalisco','67290','Mexico'),(18,20,'Retorno Francisco I. Madero 624','San Pedro Garza García','Puebla','56543','Mexico'),(19,21,'Avenida 20 de Noviembre 6','Guadalajara','Jalisco','44100','Mexico'),(20,22,'Privada 16 de Septiembre 8','Juárez','Colima','70287','Mexico');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Technology','Gadgets, computadoras, y accesorios electrónicos para la vida moderna.'),(2,'Home & Garden','Artículos para decorar y mejorar tu casa, así como herramientas de jardinería.'),(3,'Apparel','Ropa, calzado y accesorios para hombres, mujeres y niños.'),(4,'Sports & Outdoors','Equipamiento, ropa y accesorios para todo tipo de deportes y actividades al aire libre.'),(5,'Toys & Games','Juguetes para todas las edades, juegos de mesa y entretenimiento familiar.'),(6,'Health & Beauty','Productos para el cuidado personal, cosméticos, vitaminas y suplementos.'),(7,'Books','Best-sellers, novelas, libros de texto y publicaciones de todos los géneros.'),(8,'Automotive','Refacciones, accesorios, herramientas y productos para el mantenimiento de vehículos.'),(9,'Pet Supplies','Alimento, juguetes, y todo tipo de accesorios para el cuidado de tus mascotas.'),(10,'Grocery','Productos de despensa, bebidas, y alimentos no perecederos.');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,9,2,450.00),(1,15,1,399.00),(1,36,1,799.00),(1,38,2,180.00),(2,2,1,18500.00),(2,30,1,350.00),(2,31,1,280.00),(3,7,1,1899.90),(3,21,1,380.00),(3,26,1,499.00),(3,40,2,220.00),(4,12,1,1350.00),(4,22,1,295.00),(4,39,5,45.00),(5,1,1,24999.50),(5,16,1,2500.00),(5,28,1,290.00),(5,35,1,150.00),(5,39,10,45.00),(6,6,1,1450.00),(6,30,1,350.00),(6,35,1,150.00),(6,39,2,45.00),(7,3,1,1299.00),(7,5,1,999.00),(7,15,1,399.00),(7,29,1,650.00),(8,14,2,480.00),(8,20,1,950.00),(8,24,1,250.00),(8,39,1,45.00),(8,40,1,220.00),(9,4,1,2150.75),(9,13,1,599.00),(9,22,1,295.00),(10,16,1,2500.00),(10,18,2,720.00),(10,33,1,980.00),(10,34,1,250.00),(11,10,1,899.00),(11,13,1,599.00),(11,22,2,295.00),(11,33,1,980.00),(11,40,1,220.00),(12,8,1,750.00),(12,17,1,850.00),(12,23,1,899.00),(12,31,1,280.00),(12,37,2,380.00),(13,4,1,2150.75),(13,14,1,480.00),(13,24,2,250.00),(13,28,1,290.00),(13,39,5,45.00),(14,20,1,950.00),(14,21,2,380.00),(14,29,1,650.00),(14,34,2,250.00),(14,38,2,180.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Pending','Orden recibida, en espera de confirmación de pago.'),(2,'Paid','El pago ha sido recibido exitosamente.'),(3,'Shipped','El pedido ha sido enviado al cliente.'),(4,'Delivered','El pedido ha sido entregado al cliente.'),(5,'Cancelled','La orden ha sido cancelada.');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `shipping_address_id` bigint NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status_id` bigint NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `shipping_address_id` (`shipping_address_id`),
  KEY `orders_has_status_idx` (`order_status_id`),
  CONSTRAINT `fk_orders_has_addresses` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `fk_orders_has_status` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `fk_orders_has_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,1,2458.00,1,'2025-05-20 16:15:30'),(2,4,2,19130.00,1,'2025-05-22 17:30:05'),(3,5,3,3144.90,2,'2025-05-25 15:05:10'),(4,6,4,1870.00,2,'2025-05-28 20:00:00'),(5,7,5,27349.50,3,'2025-06-03 00:20:45'),(6,8,6,2034.00,3,'2025-06-05 17:55:00'),(7,9,7,3099.00,4,'2025-06-10 16:30:15'),(8,10,8,2014.00,4,'2025-06-12 22:40:20'),(9,11,9,2929.00,5,'2025-06-15 18:00:00'),(10,12,10,5130.00,5,'2025-06-17 15:10:00'),(11,3,1,3288.00,2,'2025-06-18 07:10:00'),(12,4,2,3539.00,2,'2025-06-18 07:15:00'),(13,3,1,3645.75,3,'2025-06-18 07:20:00'),(14,4,2,3220.00,3,'2025-06-18 07:25:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `sku` varchar(100) NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `fk_products_has_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop Gamer XYZ','Laptop de alto rendimiento con tarjeta gráfica dedicada, 16GB RAM y SSD de 1TB. Ideal para juegos y trabajo pesado.',24999.50,45,'TEC-LAPG-A1B2C3D4',1,'2024-03-15 16:30:00','2025-05-20 17:00:00'),(2,'Smartphone Pro Max','El último smartphone con pantalla OLED de 6.7 pulgadas, sistema de triple cámara y conectividad 5G. Batería de larga duración.',18500.00,150,'TEC-SPMP-E5F6G7H8',1,'2024-04-01 15:00:00','2025-06-10 20:20:00'),(3,'Wireless TWS Earbuds','Audífonos inalámbricos con cancelación de ruido activa, hasta 24 horas de batería con el estuche de carga y resistencia al agua IPX4.',1299.00,180,'TEC-WIRE-I9J0K1L2',1,'2024-02-20 20:00:00','2025-04-26 00:10:00'),(4,'Fit-Track Smartwatch','Reloj inteligente con monitor de ritmo cardíaco, GPS integrado, seguimiento de sueño y más de 20 modos de deporte.',2150.75,95,'TEC-FTSW-M3N4O5P6',1,'2024-05-10 17:45:00','2025-06-01 15:00:00'),(5,'Juego de Sábanas de Algodón','Set de sábanas tamaño Queen de 400 hilos, 100% algodón egipcio. Incluye sábana plana, de cajón y dos fundas.',999.00,88,'HOM-SABN-Q7R8S9T0',2,'2024-01-25 22:20:00','2025-03-30 23:00:00'),(6,'Taladro Inalámbrico 20V','Potente taladro inalámbrico con batería de litio de 20V, incluye 2 velocidades y un set de 30 puntas.',1450.00,55,'HOM-TALD-U1V2W3X4',2,'2024-06-11 14:15:00','2025-02-15 16:45:00'),(7,'Set de Cuchillos de Chef','Juego de 5 cuchillos de acero inoxidable de alto carbono con bloque de madera. Incluye cuchillo de chef, santoku, para pan, y más.',1899.90,70,'HOM-CUCH-Y5Z6A7B8',2,'2024-07-02 18:00:00','2025-01-22 19:00:00'),(8,'Manguera de Jardín Retráctil','Manguera de 15 metros que se expande con la presión del agua y se contrae para un fácil almacenamiento. Incluye pistola de 7 modos.',750.00,110,'HOM-MANG-C9D0E1F2',2,'2024-04-18 23:50:00','2025-05-14 17:30:00'),(9,'Playera de Algodón Pima','Playera de cuello redondo para hombre, fabricada con el más suave algodón Pima peruano. Corte clásico.',450.00,250,'APP-PLAY-G3H4I5J6',3,'2024-08-01 16:00:00','2025-06-12 17:00:00'),(10,'Jeans Slim Fit para Hombre','Pantalones de mezclilla estilo Slim Fit, cómodos y duraderos. Disponibles en varios lavados.',899.00,120,'APP-JEAN-K7L8M9N0',3,'2024-08-01 16:05:00','2025-06-12 17:05:00'),(11,'Vestido de Verano Floral','Vestido corto de verano con estampado floral, tela ligera y fresca, ideal para climas cálidos. Tirantes ajustables.',699.50,90,'APP-VEST-O1P2Q3R4',3,'2024-09-10 19:30:00','2025-04-05 22:00:00'),(12,'Chamarra Impermeable','Chamarra ligera y transpirable, 100% impermeable con costuras selladas. Perfecta para senderismo o la ciudad.',1350.00,75,'APP-CHAM-S5T6U7V8',3,'2024-10-05 17:20:00','2025-03-19 01:00:00'),(13,'Balón de Fútbol Profesional','Balón de fútbol tamaño 5, con certificación de calidad profesional. Diseño de 32 paneles para un vuelo preciso.',599.00,180,'SPO-BALN-W9X0Y1Z2',4,'2024-01-15 15:30:00','2025-06-15 16:00:00'),(14,'Tapete de Yoga Antideslizante','Tapete de yoga ecológico, hecho de TPE, con superficie texturizada para un agarre superior. Incluye correa de transporte.',480.00,220,'SPO-TAPE-A3B4C5D6',4,'2024-02-01 21:00:00','2025-05-01 21:30:00'),(15,'Botella de Agua de Acero Inoxidable','Botella de 1 litro de doble pared, mantiene las bebidas frías por 24 horas o calientes por 12 horas. Libre de BPA.',399.00,300,'SPO-BOTE-E7F8G9H0',4,'2024-03-23 00:00:00','2025-04-23 00:30:00'),(16,'Mancuernas Ajustables 20kg','Set de mancuernas ajustables, permite cambiar el peso de 2kg a 20kg fácilmente. Ahorra espacio.',2500.00,60,'SPO-MANC-I1J2K3L4',4,'2024-11-20 20:10:00','2025-06-05 18:00:00'),(17,'Set de Construcción 500 pzs','Bloques de construcción compatibles con las marcas líderes. Fomenta la creatividad y habilidades motoras. Para edades de 4 a 99.',850.00,110,'TOY-BLOK-M5N6O7P8',5,'2024-10-10 16:10:00','2025-05-10 16:10:00'),(18,'Juego de Mesa \'Aventura Espacial\'','Juego de estrategia para 2-4 jugadores. Explora la galaxia, coloniza planetas y compite por ser el mejor explorador.',720.00,85,'TOY-JUEG-Q9R0S1T2',5,'2024-11-02 01:00:00','2025-06-03 01:30:00'),(19,'Muñeca Articulada \'Princesa\'','Muñeca de 30 cm con 12 puntos de articulación, vestido de gala y accesorios. Coleccionable.',550.00,130,'TOY-MUNE-U3V4W5X6',5,'2024-12-01 17:00:00','2025-06-01 17:00:00'),(20,'Coche a Control Remoto 4x4','Vehículo todo terreno a escala 1:16, con tracción en las 4 ruedas y suspensión independiente. Alcanza 20 km/h.',950.00,70,'TOY-COCH-Y7Z8A9B0',5,'2024-09-05 22:45:00','2025-02-05 23:00:00'),(21,'Crema Hidratante Facial','Crema con ácido hialurónico y vitamina E. Hidratación profunda por 24 horas para todo tipo de piel. No comedogénica.',380.00,180,'BEA-CREM-C1D2E3F4',6,'2024-07-15 15:00:00','2025-06-14 15:30:00'),(22,'Protector Solar SPF 50+','Protector solar de amplio espectro, resistente al agua. Fórmula ligera de rápida absorción, sin sensación grasosa.',295.00,250,'BEA-PROT-G5H6I7J8',6,'2024-03-01 14:00:00','2025-04-01 14:30:00'),(23,'Set de Maquillaje Esencial','Kit de inicio con base, corrector, rímel y labial. Tonos neutros para un look natural. Hipoalergénico.',899.00,95,'BEA-MAKE-K9L0M1N2',6,'2024-11-15 18:00:00','2025-05-15 18:30:00'),(24,'Shampoo de Biotina y Colágeno','Shampoo voluminizador para cabello fino. Fortalece y da cuerpo desde la raíz. Libre de sulfatos y parabenos.',250.00,200,'BEA-SHAM-O3P4Q5R6',6,'2024-06-01 17:00:00','2025-06-01 17:30:00'),(25,'Novela de Misterio \'El Último Secreto\'','Un thriller psicológico lleno de giros inesperados que te mantendrá al borde del asiento. Edición de pasta blanda.',320.00,150,'BOO-MIST-S7T8U9V0',7,'2025-01-10 16:00:00','2025-06-10 16:00:00'),(26,'Libro de Cocina \'Sabores del Mundo\'','Una colección de 100 recetas auténticas de más de 20 países. Fotografías a color e instrucciones paso a paso.',499.00,100,'BOO-COCI-W1X2Y3Z4',7,'2024-12-10 20:00:00','2025-05-10 20:30:00'),(27,'Biografía \'Vidas que Inspiran\'','Recopilación de las historias de vida de 10 líderes que cambiaron el mundo. Una fuente de motivación y aprendizaje.',350.00,120,'BOO-BIOG-A5B6C7D8',7,'2025-02-20 22:00:00','2025-06-01 22:30:00'),(28,'Guía de Finanzas Personales','Aprende a administrar tu dinero, invertir y planificar tu futuro financiero. Un libro práctico para principiantes.',290.00,200,'BOO-FINA-E9F0G1H2',7,'2024-08-25 17:30:00','2025-04-25 18:00:00'),(29,'Kit de Limpieza para Auto Premium','Set de 8 piezas que incluye cera, shampoo, limpiador de interiores, abrillantador de llantas y microfibras.',650.00,90,'AUT-KITL-I3J4K5L6',8,'2024-07-20 19:00:00','2025-01-20 19:30:00'),(30,'Cargador de Celular para Auto USB-C','Cargador rápido de 30W con dos puertos (USB-C y USB-A). Compatible con todos los dispositivos modernos.',350.00,250,'AUT-CARG-M7N8O9P0',8,'2024-05-30 21:00:00','2025-06-11 21:30:00'),(31,'Funda para Volante de Piel','Funda de piel sintética de alta calidad, mejora el agarre y protege el volante. Diseño universal para volantes de 37-39 cm.',280.00,180,'AUT-FUND-Q1R2S3T4',8,'2024-09-18 16:45:00','2025-03-18 17:15:00'),(32,'Juego de Tapetes para Todo Clima','Set de 4 tapetes de hule de alta resistencia, diseñados para atrapar lodo, agua y suciedad. Recortables para un ajuste perfecto.',890.00,100,'AUT-TAPE-U5V6W7X8',8,'2024-10-28 23:00:00','2025-05-28 23:30:00'),(33,'Alimento para Perro Adulto 15kg','Croquetas para perro de raza mediana, con pollo como primer ingrediente. Enriquecido con vitaminas y minerales.',980.00,80,'PET-ALIM-Y9Z0A1B2',9,'2025-03-01 15:00:00','2025-06-17 15:00:00'),(34,'Arena para Gato Aglutinante','Arena para gato ultra aglutinante con control de olores. Fórmula 99% libre de polvo para un hogar más limpio.',250.00,150,'PET-AREN-C3D4E5F6',9,'2025-02-10 17:20:00','2025-06-08 17:50:00'),(35,'Juguete Mordedor para Cachorro','Juguete de hule natural resistente, diseñado para cachorros en etapa de dentición. Ayuda a limpiar los dientes.',150.00,220,'PET-JUGU-G7H8I9J0',9,'2024-06-15 20:00:00','2025-01-15 20:30:00'),(36,'Cama para Mascota Mediana','Cama ortopédica con espuma de memoria, ideal para el descanso de tu mascota. Funda lavable y base antideslizante.',799.00,95,'PET-CAMA-K1L2M3N4',9,'2024-12-20 22:00:00','2025-06-10 22:30:00'),(37,'Café Orgánico de Chiapas 1kg','Café de grano entero, tueste medio, cultivado bajo sombra en las altas montañas de Chiapas. Notas de chocolate y nuez.',380.00,130,'GRO-CAFE-O5P6Q7R8',10,'2025-04-01 13:00:00','2025-06-16 13:30:00'),(38,'Aceite de Oliva Extra Virgen 500ml','Aceite de oliva español, prensado en frío. Ideal para aderezar ensaladas o para cocinar a baja temperatura.',180.00,200,'GRO-ACEI-S9T0U1V2',10,'2025-01-20 14:30:00','2025-05-20 15:00:00'),(39,'Pasta de Trigo Integral 500g','Pasta tipo spaghetti hecha con 100% sémola de trigo integral. Alta en fibra.',45.00,400,'GRO-PAST-W3X4Y5Z6',10,'2025-03-11 00:00:00','2025-06-06 00:30:00'),(40,'Miel de Abeja Pura 1L','Miel de abeja 100% pura y sin filtrar. Cosechada de forma artesanal. Rica en antioxidantes y propiedades naturales.',220.00,110,'GRO-MIEL-A7B8C9D0',10,'2024-11-28 16:00:00','2025-05-28 16:30:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Acceso total al sistema y a la configuración.'),(2,'Customer','Usuario que puede realizar compras y ver el historial de sus pedidos.'),(3,'Warehouse Manager','Gestiona el inventario de productos, empaqueta y realiza los envíos.'),(4,'Support Agent','Agente que atiende consultas de clientes y gestiona devoluciones.'),(5,'Marketing Manager','Crea y administra descuentos, promociones y campañas de marketing.');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Robert','Hansen','robert.hansen0@outlook.com','password123','3750879951','2025-05-19 02:01:21','2025-06-03 18:47:04'),(2,'Laura','Johnson','laura.johnson1@outlook.com','password123','8816828552','2024-04-12 18:12:35','2025-02-12 11:27:07'),(3,'Jessica','Smith','jessica.smith2@gmail.com','password123','7169632833','2024-04-05 00:31:39','2024-05-23 10:39:51'),(4,'James','Lopez','james.lopez3@example.com','password123','4868469950','2024-01-24 22:51:57','2024-11-21 05:26:07'),(5,'Kevin','Williams','kevin.williams4@outlook.com','password123','4638382875','2024-02-10 09:00:26','2025-04-19 02:53:48'),(6,'Nicole','Wilson','nicole.wilson5@outlook.com','password123','3624835697','2025-07-28 23:58:34','2025-07-29 08:44:03'),(7,'Charles','Moore','charles.moore6@gmail.com','password123','7942724497','2024-12-09 08:20:13','2025-03-25 04:42:01'),(8,'Robert','Mccoy','robert.mccoy7@example.com','password123','0366158021','2024-10-03 05:18:04','2025-07-06 11:43:08'),(9,'Scott','Reid','scott.reid8@example.com','password123','3504868941','2024-09-03 03:55:58','2025-07-23 13:44:09'),(10,'Andrew','Smith','andrew.smith9@gmail.com','password123','2268482433','2024-10-22 03:03:00','2024-11-23 08:27:01'),(11,'Matthew','Davis','matthew.davis10@outlook.com','password123','9694663321','2025-01-14 17:39:58','2025-04-11 11:25:21'),(12,'Michael','Johnson','michael.johnson11@example.com','password123','0192532451','2025-01-20 09:06:58','2025-03-13 00:02:45'),(13,'Teresa','Jones','teresa.jones12@outlook.com','password123','9938720844','2024-03-16 08:04:13','2024-05-18 16:29:16'),(14,'David','Davis','david.davis13@gmail.com','password123','7238779183','2025-06-25 15:28:44','2025-07-21 02:41:43'),(15,'Michael','Johnson','michael.johnson14@gmail.com','password123','5857211105','2024-08-16 06:30:19','2025-05-24 22:50:56'),(16,'Jesus','Thompson','jesus.thompson15@outlook.com','password123','5282548813','2024-07-08 01:35:05','2025-06-23 06:31:07'),(17,'Mary','White','mary.white16@example.com','password123','7456722833','2024-11-21 00:24:41','2025-03-24 22:15:33'),(18,'Cynthia','Taylor','cynthia.taylor17@outlook.com','password123','5934526847','2024-06-21 06:03:00','2024-11-22 09:02:40'),(19,'Angela','Lewis','angela.lewis18@example.com','password123','5122176251','2024-11-20 01:57:48','2025-01-14 19:58:39'),(20,'Lisa','Johnson','lisa.johnson19@outlook.com','password123','2312678082','2025-01-10 03:56:52','2025-04-19 15:27:07'),(21,'Michael','Johnson','michael.johnson20@gmail.com','password123','9046427357','2025-07-28 18:21:40','2025-07-30 14:31:39'),(22,'John','Perez','john.perez21@example.com','password123','3746654064','2024-01-15 00:29:10','2024-04-20 20:00:26'),(23,'Charles','Mendoza','charles.mendoza22@example.com','password123','1063266181','2024-09-17 12:17:34','2024-10-09 23:31:21'),(24,'Mark','Brown','mark.brown23@outlook.com','password123','1205316335','2024-07-26 18:47:04','2024-09-03 03:28:16'),(25,'James','Thomas','james.thomas24@gmail.com','password123','6712395521','2024-01-12 17:32:04','2024-12-14 20:40:24'),(26,'Mary','Wilson','mary.wilson25@outlook.com','password123','2416805844','2024-01-21 05:25:34','2024-08-25 15:39:13'),(27,'Lisa','Johnson','lisa.johnson26@example.com','password123','3362153218','2024-08-05 19:00:19','2025-05-24 16:48:38'),(28,'Thomas','Smith','thomas.smith27@example.com','password123','4122176378','2024-12-25 14:35:46','2025-02-12 21:42:07'),(29,'Amanda','Robinson','amanda.robinson28@example.com','password123','7699763753','2024-04-29 13:11:03','2024-12-07 06:23:44'),(30,'Michael','Johnson','michael.johnson29@outlook.com','password123','4053676775','2024-09-17 07:21:40','2024-10-18 07:21:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_roles`
--

DROP TABLE IF EXISTS `users_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_users_has_roles_roles1_idx` (`role_id`),
  KEY `fk_users_has_roles_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_roles_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_users_has_roles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_roles`
--

LOCK TABLES `users_has_roles` WRITE;
/*!40000 ALTER TABLE `users_has_roles` DISABLE KEYS */;
INSERT INTO `users_has_roles` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(25,3),(26,3),(27,4),(28,4),(29,5),(30,5);
/*!40000 ALTER TABLE `users_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-18  3:14:27
