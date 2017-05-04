/*
SQLyog Ultimate v12.4.0 (64 bit)
MySQL - 10.1.16-MariaDB : Database - kepribadian_naive_bayes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kepribadian_naive_bayes` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kepribadian_naive_bayes`;

/*Table structure for table `data_hasil_klasifikasi` */

DROP TABLE IF EXISTS `data_hasil_klasifikasi`;

CREATE TABLE `data_hasil_klasifikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `sekolah` varchar(100) DEFAULT NULL,
  `jawaban_a` int(11) DEFAULT NULL,
  `jawaban_b` int(11) DEFAULT NULL,
  `jawaban_c` int(11) DEFAULT NULL,
  `jawaban_d` int(11) DEFAULT NULL,
  `kelas_hasil` varchar(100) DEFAULT NULL,
  `nilai_sanguin` double DEFAULT NULL,
  `nilai_koleris` double DEFAULT NULL,
  `nilai_melankolis` double DEFAULT NULL,
  `nilai_plegmatis` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `data_hasil_klasifikasi` */

insert  into `data_hasil_klasifikasi`(`id`,`nama`,`jenis_kelamin`,`usia`,`sekolah`,`jawaban_a`,`jawaban_b`,`jawaban_c`,`jawaban_d`,`kelas_hasil`,`nilai_sanguin`,`nilai_koleris`,`nilai_melankolis`,`nilai_plegmatis`) values 
(1,'Aisyah Regina P','P',15,'Swasta',8,10,9,13,NULL,NULL,NULL,NULL,NULL),
(2,'Emilia Nur Rohmah','P',13,'Negeri',10,4,14,12,NULL,NULL,NULL,NULL,NULL),
(3,'Faris Saifullah','L',14,'Swasta',15,8,10,7,NULL,NULL,NULL,NULL,NULL),
(4,'Rahmi Dwiki D.R','L',14,'Negeri',11,12,8,9,NULL,NULL,NULL,NULL,NULL),
(5,'Husna Dhiya \'ul Ilmi','P',13,'Swasta',20,8,8,4,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `data_latih` */

DROP TABLE IF EXISTS `data_latih`;

CREATE TABLE `data_latih` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `sekolah` varchar(100) DEFAULT NULL,
  `jawaban_a` int(11) DEFAULT NULL,
  `jawaban_b` int(11) DEFAULT NULL,
  `jawaban_c` int(11) DEFAULT NULL,
  `jawaban_d` int(11) DEFAULT NULL,
  `kelas_asli` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `data_latih` */

insert  into `data_latih`(`id`,`nama`,`jenis_kelamin`,`usia`,`sekolah`,`jawaban_a`,`jawaban_b`,`jawaban_c`,`jawaban_d`,`kelas_asli`) values 
(1,'Wafda Mukrom Q.F','L',13,'Swasta',15,9,9,7,'Sanguin'),
(2,'Miqyas','L',14,'Swasta',13,6,9,12,'Sanguin'),
(3,'Rafif','L',14,'Swasta',13,7,12,8,'Sanguin'),
(4,'Qosholis Sabil Al-Usama','L',15,'Swasta',13,8,9,10,'Sanguin'),
(5,'Muhammad Shodiq','L',15,'Swasta',20,9,5,6,'Sanguin'),
(6,'M Riza A. K','L',13,'Swasta',16,6,7,11,'Sanguin'),
(7,'Syifa Arrosyid','L',14,'Negeri',18,7,8,7,'Sanguin'),
(8,'Muhammad Adam F.','L',13,'Negeri',14,8,8,10,'Sanguin'),
(9,'M sidiq Agus Susetiyo','L',13,'Negeri',12,11,8,9,'Sanguin'),
(10,'Ach.Fahrudin N','L',13,'Negeri',15,9,10,6,'Sanguin'),
(11,'Moch.Rico Zaenoni','L',14,'Negeri',15,12,6,7,'Sanguin'),
(12,'Amsal Amerthandani S.','L',14,'Negeri',14,5,8,13,'Sanguin'),
(13,'Amatullah Fathinah A.','P',13,'Swasta',12,7,11,10,'Sanguin'),
(14,'Syafina Mirzaky Firdaus','P',13,'Swasta',12,11,10,7,'Sanguin'),
(15,'Meilina Fitri Amalia','P',13,'Swasta',16,7,8,9,'Sanguin'),
(16,'Neysalmamufti','P',13,'Swasta',19,8,7,6,'Sanguin'),
(17,'Ilva Khafsha Z','P',13,'Swasta',16,15,3,6,'Sanguin'),
(18,'Sabrina Salsa Oktavia','P',14,'Swasta',14,11,6,9,'Sanguin'),
(19,'Fadia Azzahra','P',13,'Negeri',13,9,9,9,'Sanguin'),
(20,'Arinta Agustine','P',14,'Negeri',13,11,10,6,'Sanguin'),
(21,'Nurul Aliya','P',13,'Negeri',18,10,4,8,'Sanguin'),
(22,'Elsandra Nur Maidah','P',14,'Negeri',17,4,11,8,'Sanguin'),
(23,'Khodijah Febriyanti','P',13,'Negeri',12,8,11,9,'Sanguin'),
(24,'Fathihah Az- Zahrah F','P',13,'Negeri',18,4,8,10,'Sanguin'),
(25,'Ristyuanke Isnubroto','P',13,'Negeri',18,7,9,6,'Sanguin'),
(26,'Moch. Yoland Pradana','L',13,'Negeri',6,16,4,14,'Koleris'),
(27,'Rido Dimas Permadi','L',14,'Negeri',12,14,10,4,'Koleris'),
(28,'M. Daffa Amrullah','L',14,'Negeri',5,14,10,11,'Koleris'),
(29,'Agus Trisula','L',14,'Negeri',6,16,3,15,'Koleris'),
(30,'Septian Priana Anggara','L',13,'Negeri',10,13,5,12,'Koleris'),
(31,'M Ridho Alhamdal','L',14,'Negeri',10,17,6,7,'Koleris'),
(32,'Aydymas Dafansyah H','L',14,'Negeri',8,13,9,10,'Koleris'),
(33,'Andika Aji P','L',13,'Negeri',10,11,9,10,'Koleris'),
(34,'Akmal Thoriq M.','L',15,'Swasta',9,14,10,7,'Koleris'),
(35,'Qomaruddin Zaki','L',14,'Swasta',8,12,10,10,'Koleris'),
(36,'M. Najib Erdyansya','L',13,'Swasta',10,13,6,11,'Koleris'),
(37,'Afreza Al Islami P','L',13,'Swasta',10,12,8,10,'Koleris'),
(38,'Betelgeuse Wildan Firdaus K','L',14,'Swasta',12,14,9,5,'Koleris'),
(39,'Farhan Syah','L',13,'Swasta',8,13,8,11,'Koleris'),
(40,'Arni Nur Unaifah','P',13,'Negeri',14,18,5,3,'Koleris'),
(41,'Safira Putri Frandika','P',14,'Negeri',11,14,7,8,'Koleris'),
(42,'Kharisma Yogi Cahyaningtyas','P',13,'Negeri',7,15,10,8,'Koleris'),
(43,'Dina \'Indallah','P',13,'Swasta',5,17,10,8,'Koleris'),
(44,'Kamiylah Taher','P',14,'Swasta',12,14,8,6,'Koleris'),
(45,'M Yasmin','P',13,'Swasta',6,15,8,11,'Koleris'),
(46,'Khonita Maryam','P',13,'Swasta',12,15,6,7,'Koleris'),
(47,'Shofiatur Rahmah','P',15,'Swasta',5,20,10,5,'Koleris'),
(48,'Valestient Ashiila A.V','P',13,'Swasta',10,22,3,5,'Koleris'),
(49,'Alma\'s Abyan','P',14,'Swasta',14,16,4,6,'Koleris'),
(50,'Salma Ghaida Muchtar','P',14,'Swasta',11,16,5,8,'Koleris'),
(51,'Bagas Septian Pramudita','L',13,'Negeri',10,10,14,6,'Melankolis'),
(52,'M. Ramadhan','L',13,'Negeri',12,4,13,11,'Melankolis'),
(53,'Misbchul Muarif R','L',13,'Negeri',9,10,13,8,'Melankolis'),
(54,'Ramadhan Adi Reno','L',14,'Negeri',11,6,12,11,'Melankolis'),
(55,'Miftachul Arista M.','L',13,'Negeri',10,10,13,7,'Melankolis'),
(56,'M Naufal Adib H','L',13,'Negeri',6,11,14,9,'Melankolis'),
(57,'Mafaza Al-Aufa','L',13,'Swasta',5,7,15,13,'Melankolis'),
(58,'Hilmy Aziz M','L',14,'Swasta',10,12,13,5,'Melankolis'),
(59,'Muhammad Firdaus Satria Al-Fath','L',13,'Swasta',3,10,18,9,'Melankolis'),
(60,'Muhammad Fathin Attaqi','L',14,'Swasta',8,11,17,4,'Melankolis'),
(61,'Zamir Benyamin Baswedan','L',14,'Swasta',7,11,15,7,'Melankolis'),
(62,'M. Rauzan','L',13,'Swasta',8,5,17,10,'Melankolis'),
(63,'Galih Nayuwiba Dzulfikar','L',13,'Swasta',12,10,13,5,'Melankolis'),
(64,'Aprianty Puteri Audina','P',13,'Negeri',7,6,16,11,'Melankolis'),
(65,'Fasta Itfina','P',14,'Negeri',12,7,13,8,'Melankolis'),
(66,'Icha Mareta Nasution','P',13,'Negeri',7,8,16,9,'Melankolis'),
(67,'Nandy Lava B. Utomo','P',13,'Negeri',12,2,16,10,'Melankolis'),
(68,'Putri Sofiyana Nabillah','P',14,'Negeri',5,12,15,8,'Melankolis'),
(69,'Risma Dewi Septiawati','P',14,'Negeri',10,5,14,11,'Melankolis'),
(70,'Shofiyyah Rihhadatul Aisy','P',13,'Swasta',5,2,17,16,'Melankolis'),
(71,'Namira Aaiilah Salsabillah','P',13,'Swasta',8,4,15,13,'Melankolis'),
(72,'Hasna Rosyida','P',14,'Swasta',7,15,16,2,'Melankolis'),
(73,'Nabila Salsabila','P',13,'Swasta',7,6,15,12,'Melankolis'),
(74,'Khonita Dina Salsabila','P',14,'Swasta',9,3,14,14,'Melankolis'),
(75,'Dian Izza Nadiya','P',15,'Swasta',10,8,15,7,'Melankolis'),
(76,'M. Syarifuddin N. R','L',13,'Negeri',9,9,10,12,'Plegmatis'),
(77,'S. Agung Setiawan','L',13,'Negeri',8,6,11,15,'Plegmatis'),
(78,'M. Rifan N','L',14,'Negeri',9,5,6,20,'Plegmatis'),
(79,'Uhicky Anugrah P','L',13,'Negeri',11,6,8,15,'Plegmatis'),
(80,'Miracle Nathanael P','L',14,'Negeri',7,6,8,19,'Plegmatis'),
(81,'Dwi Agus Wijayanto','L',13,'Negeri',9,5,10,16,'Plegmatis'),
(82,'Francesco Frielo N','L',14,'Negeri',6,10,6,18,'Plegmatis'),
(83,'Fahri R','L',14,'Swasta',11,10,7,12,'Plegmatis'),
(84,'Zulham \'Ali Fikri','L',14,'Swasta',5,6,12,17,'Plegmatis'),
(85,'Daffa Musyaffa D','L',13,'Swasta',11,3,10,16,'Plegmatis'),
(86,'Adin Alfrrohmat','L',14,'Swasta',9,7,11,13,'Plegmatis'),
(87,'M. Amirul Mujahidin Al-Hakim','L',14,'Swasta',5,7,14,14,'Plegmatis'),
(88,'Abdullah Yusuf Faiz Ramadhan','L',13,'Swasta',8,6,11,15,'Plegmatis'),
(89,'Valen Zidana Erlita','P',13,'Negeri',12,3,3,22,'Plegmatis'),
(90,'Rizma Ayu Nugroho','P',13,'Negeri',4,7,7,22,'Plegmatis'),
(91,'Lilian Ambarwati','P',13,'Negeri',8,6,10,16,'Plegmatis'),
(92,'Jessy Amanda','P',13,'Negeri',7,11,8,14,'Plegmatis'),
(93,'Zillanatus Valindayu Aaliyah','P',13,'Negeri',4,11,11,14,'Plegmatis'),
(94,'Racgmalia Nur Fitri','P',14,'Negeri',9,6,7,18,'Plegmatis'),
(95,'Aisyah Fatikah Basyah','P',13,'Swasta',8,2,14,16,'Plegmatis'),
(96,'Annisa Salsabila','P',13,'Swasta',12,3,6,19,'Plegmatis'),
(97,'Annisa Nur Azizah','P',13,'Swasta',7,8,10,15,'Plegmatis'),
(98,'Adinda Nurjannah S','P',13,'Swasta',10,6,7,17,'Plegmatis'),
(99,'Novi Fidia Elizza','P',14,'Swasta',8,9,7,16,'Plegmatis'),
(100,'Rosy Fatati qonita','P',15,'Swasta',9,4,10,17,'Plegmatis');

/*Table structure for table `data_uji` */

DROP TABLE IF EXISTS `data_uji`;

CREATE TABLE `data_uji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `sekolah` varchar(100) DEFAULT NULL,
  `jawaban_a` int(11) DEFAULT NULL,
  `jawaban_b` int(11) DEFAULT NULL,
  `jawaban_c` int(11) DEFAULT NULL,
  `jawaban_d` int(11) DEFAULT NULL,
  `kelas_asli` varchar(100) DEFAULT NULL,
  `kelas_hasil` varchar(100) DEFAULT NULL,
  `nilai_sanguin` double DEFAULT NULL,
  `nilai_koleris` double DEFAULT NULL,
  `nilai_melankolis` double DEFAULT NULL,
  `nilai_plegmatis` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `data_uji` */

insert  into `data_uji`(`id`,`nama`,`jenis_kelamin`,`usia`,`sekolah`,`jawaban_a`,`jawaban_b`,`jawaban_c`,`jawaban_d`,`kelas_asli`,`kelas_hasil`,`nilai_sanguin`,`nilai_koleris`,`nilai_melankolis`,`nilai_plegmatis`) values 
(1,'Aisyah Regina P','P',15,'Swasta',8,10,9,13,'Plegmatis',NULL,NULL,NULL,NULL,NULL),
(2,'Emilia Nur Rohmah','P',13,'Negeri',10,4,14,12,'Melankolis',NULL,NULL,NULL,NULL,NULL),
(3,'Faris Saifullah','L',14,'Swasta',15,8,10,7,'Sanguin',NULL,NULL,NULL,NULL,NULL),
(4,'Rahmi Dwiki D.R','L',14,'Negeri',11,12,8,9,'Koleris',NULL,NULL,NULL,NULL,NULL),
(5,'Husna Dhiya \'ul Ilmi','P',13,'Swasta',20,8,8,4,'Sanguin',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text,
  `level` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id_user`,`nama`,`username`,`password`,`level`) values 
(1,'Admin','admin','21232f297a57a5a743894a0e4a801fc3','1'),
(2,'Siswa','siswa','bcd724d15cde8c47650fda962968f102','2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
