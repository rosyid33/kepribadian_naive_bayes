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
/*Table structure for table `data_hasil_klasifikasi` */

DROP TABLE IF EXISTS `data_hasil_klasifikasi`;

CREATE TABLE `data_hasil_klasifikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_siswa` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `data_hasil_klasifikasi` */

insert  into `data_hasil_klasifikasi`(`id`,`id_siswa`,`jenis_kelamin`,`usia`,`sekolah`,`jawaban_a`,`jawaban_b`,`jawaban_c`,`jawaban_d`,`kelas_hasil`,`nilai_sanguin`,`nilai_koleris`,`nilai_melankolis`,`nilai_plegmatis`) values 
(1,1,'L',15,'Swasta',5,16,11,8,'Koleris',0.000000024963117963092,0.001938411237094,0.0000098277325228176,0.000000011191472403955);

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

/*Table structure for table `data_siswa` */

DROP TABLE IF EXISTS `data_siswa`;

CREATE TABLE `data_siswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_siswa` varchar(200) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `sekolah` varchar(200) DEFAULT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `data_siswa` */

insert  into `data_siswa`(`id`,`nama_siswa`,`jenis_kelamin`,`usia`,`sekolah`,`id_user`) values 
(1,'Coba Siswa','L',15,'Swasta',2);

/*Table structure for table `data_soal` */

DROP TABLE IF EXISTS `data_soal`;

CREATE TABLE `data_soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilihan_a` text,
  `pilihan_b` text,
  `pilihan_c` text,
  `pilihan_d` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `data_soal` */

insert  into `data_soal`(`id`,`pilihan_a`,`pilihan_b`,`pilihan_c`,`pilihan_d`) values 
(1,'Penuh kehidupan, sering menggunakan isyarat tangan, lengan, dan wajah secara hidup.(Animated)','Orang yang mau melakukan sesuatu hal yang baru dan berani bertekad untuk me-nguasainya.(Adventurous)','Suka menyelidiki bagian - bagian yang logis. (Analitical)','Mudah menyesuaikan diri dan senang dalam setiap situasi. (Adaptable)'),
(2,'Penuh kesenangan dan selera humor yang baik. (Playful)','Meyakinkan se-seorang dengan logika dan fakta, bukan dengan pesona / kekuasaan. (Persuasive)','Melakukan sesuatu sampai selesai sebelum memulai yang lain. (Persistent)','Tampak tidak ter-ganggu dan tenang serta menghindari setiap bentuk ke-kacauan. (Peaceful)'),
(3,'Orang yang memandang bersama orang lain sebagai kesempatan untuk bersikap manis dan menghibur, bukannya sebagai tantangan / kesempatan bisnis. (Sociable)','Orang yang yakin dengan caranya sendiri. (Strong-Willed)','Bersedia mengorban-kan dirinya untuk memenuhi kebutuhan orang lain.','Dengan mudah menerima pandang-an / keinginan orang lain tanpa perlu banyak meng-ungkapkan pendapat sendiri. (Submissive)'),
(4,'Bisa merebut hati orang lain melalui pesona kepribadian. (Convicing)','Mengubah setiap situasi, kejadian atau permainan sebagai sebuah kontes dan selalu bermain untuk menang. (Competitive)','Menghargai keperluan dan perasaan orang lain. (Considerate)','Mempunyai perasaan emosional tapi jarang memperlihatkannya. (Controlled)'),
(5,'Memperbaharui dan membantu membuat orang lain merasa senang. (Refreshing)','Bisa bertindak cepat dan efektif dalam semua situasi. (Resourceful)','Memperlakukan orang lain dengan segan sebagai penghormatan dan penghargaan. (Respectfull)','Menahan diri dalam menunjukkan emosi atau antusiasme. (Reserved)'),
(6,'Penuh gairah dalam kehidupan. (Spirited)','Orang mandiri yang bisa sepenuhnya mengandal-kan kemampuan dan sumber dayanya sendiri. (Self-Reliant)','Secara intensif memperhatikan orang lain maupun hal apapun yang terjadi di sekitar. (Sensitive)','Orang yang mudah menerima keadaan atau situasi apa saja. (Satisfied)'),
(7,'Dapat mendorong atau memaksa orang lain mengikuti dan bergabung melalui pesona kepribadian-nya. (Promoter)','Mengetahui segalanya akan beres bila kita yang memimpin. (Positive)','Memilih mempersiap-kan aturan yang terinci sebelumnya dalam menyelesaikan suatu proyek dan lebih menyukai keterlibatan dalam tahap-tahap perencanaan dan produk jadi, bukan dalam melaksanakan tugas. (Planner)','Tidak terpengaruh oleh penundaan. Tetap tenang dan toleran. (Patient)'),
(8,'Memilih agar semua kehidupan adalah kegiatan yang impulsif, tidak dipikirkan terlebih dahulu dan tidak terhambat oleh rencana.(Spontaneous)','Yakin, tidak ragu-ragu. (Sure)','Membuat dan meng-hayati hidup menurut rencana sehari-hari. Tidak menyukai bila rencananya terganggu.(Scheduled)','Pendiam, tidak mudah terseret dalam per-cakapan. (Shy)'),
(9,'Orang yang riang dan dapat meyakinkan diri sendiri & orang lain bahwa semuanya akan beres. (Optimistic)','Bicara terang-terangan dan terkadang tidak menahan diri. (Outspoken)','Orang yang mengatur segala-galanya secara sistematis dan metodis. (Orderly)','menerima apa saja, cepat melakukan sesuatu bahkan dengan cara orang lain.  (Obliging)'),
(10,'Punya rasa humor yang cemerlang dan bisa membuat cerita apa saja menjadi peristiwa yang menyenangkan. (Funny)','Pribadi yang mendominasi dan mampu menyebabkan orang lain ragu - ragu untuk melawannya. (Forceful)','Secara konsisten dapat diandalkan, teguh, setia, dan mengabdi, bahkan terkadang tanpa alasan. (Faithful)','Orang yang menang-gapi. Bukan orang yang punya inisiatif untuk memulai per-cakapan. (Friendly)'),
(11,'Orang yang me-nyenangkan sebagai teman. (Delightful)','Bersedia mengambil resiko tanpa kenal takut. (Daring)','Melakukan segala sesuatu secara ber-urutan dengan ingatan yang jernih akan segala hal yang terjadi. (Detailed)','Berurusan dengan orang lain secara penuh siasat, perasa, dan sabar. (Diplomatic)'),
(12,'Secara konsisten memiliki semangat yang tinggi dan suka membagkan ke-bahagiaan kepada orang lain. (Cheerful)','Percaya diri dan yakin akan kemampuan dan kesuksesannya sendiri. (Confifent)','Orang yang perhatiannya melibat-kan sesuatu yang berhubungan dengan intelektual dan artistik. (Cultured)','Tetap memiliki ke-seimbangan secara emosional, me-nanggapi sebagaimana yang diharapkan orang lain. (Consisten)'),
(13,'Mendorong orang lain untuk bekerja dan ter-libat serta membuat seluruhnya menyenangkan. (Inspiring)','Memenuhi diri sendiri, mandiri, penuh percaya diri dan nampak tidak begitu memerlukan bantuan. (Independent)','Memvisualisasikan hal-hal dalam bentuk yang sempurna dan perlu memenuhi standar itu sendiri. (Idealistic)','Tidak pernah me-ngatakan atau me-nyebabkan apapun yang tidak me-nyenangkan atau menimbulkan rasa keberatan. (Inoffensive)'),
(14,'Terang-terangan me-nyatakan emosi terutama rasa sayang dan tidak ragu menyentuh ketika berbicara dengan orang lain. (Demonstrative)','Orang yang mempunyai kemampuan membuat penilaian yang cepat dan tuntas. (Decisive)','Intensif dan introspektif tanpa rasa senang pada percakapan dan pengajaran yang pulasan. (Deep)','Memperlihatkan ke-pandaian bicara yang mengigit\'. Biasanya kalimat satu baris yang sifatnya sarkastik. (Dryhumor)'),
(15,'Menyukai pesta dan tidak bisa menunggu untuk bertemu setiap orang dalam ruangan, tidak pernah meng-anggap orang lain asing. (Mixes-easily)','Terdorong oleh keperluan untuk produktif, pemimpin yang dituruti orang lain. (Mover)','Punya apresiasi mendalam untuk musik, punya komitmen kepada musik sebagai bentuk seni, bukan hanya kesenangan pertunjukan. (Musical)','Secara konsisten mencari peranan merukunkan pertikaian supaya bisa meng-hindari konflik. (Mediator)'),
(16,'Terus-menerus ber-bicara, biasanya men-ceritakan kisah lucu yang dapat menghibur setiap orang di sekitar-nya, merasa perlu mengisi kesunyian agar orang lain merasa senang. (Talker)','Memegang teguh dengan keras kepala dan tidak mau melepaskan hingga tujuan tercapai. (Tenacious)','Orang yang tanggap dan mengingat setiap kesempatan istimewa, cepat memberi isyarat yang baik. (Thoightful)','Mudah menerima pemikiran dan cara orang lain tanpa perlu tidak menyetujuinya. (Tolerant)'),
(17,'Penuh kehidupan, kuat, dan penuh semangat. (Lively)','Pemberi pengarahan karena pembawaan yang terdorong untuk memimpin dan sering merasa sulit mem-percayai bahwa orang lain bisa melakukan pekerjaan dengan sama baiknya. (Leader)','Setia pada seseorang, gagasan, dan pekerja-an, terkadang dapat melampaui alasan. (Loyal)','Selalu bersedia men-dengarkan apa yang orang lain katakan. (Listener)'),
(18,'Tak ternilai harganya, dicintai, pusat perhatian. (Cute)','Memegang ke-pemimpinan dan meng-harapkan orang lain mengikuti. (Chief)','Mengatur kehidupan, tugas, dan pemecahan masalah dengan membuat daftar. (Chartmaker)','Mudah puas dengan apa yang dimiliki, jarang iri hati. (Contented)'),
(19,'Orang yang suka menghidupkan pesta sebagai diinginkan orang sebagai tamu pesta. (Populer)','Harus terus-menerus bekerja atau mencapai sesuatu, sering merasa sulit ber-istirahat. (Productive)','Menempatkan standar tinggi pada dirinya maupun orang lain. Menginginkan segala-galanya pada urutan semestinya.(Perfectionist)','Mudah bergaul, bersifat terbuka, mudah diajak bicara. (Pleasant)'),
(20,'Kepribadian yang hidup, berlebihan, penuh tenaga. (Bouncy)','Tidak kenal takut, berani, terus terang, tidak takut akan resiko. (Bold)','Secara konsisten ingin membawa diri di dalam batas-batas apa yang dirasakan semestinya. (Behafed)','Kepribadian yang stabil dan berada di tengah-tengah. (Balanced)'),
(21,'Memperlihatkan sedikit emosi / mimik. (Blank)','Menghindari perhatian akibat rasa malu. (Bashful)','Suka pamer, mem-perlihatkan apa yang gemerlap   dan kuat, terlalu bersuara. (Brassy)','Suka memerintah, mendominasi, kadang-kadang mengesalkan antar hubungan orang dewasa. (Bossy)'),
(22,'Kurang teraturan-nya mempengaruhi hampir semua bidang ke-hidupannya. (Undisipline)','Merasa sulit mengenali masalah dan perasaan orang lain. (Unsympathetic)','Sulit memaafkan dan melupakan sakit hati yang pernah dilakukan, biasa mendendam. (Unforgiving)','Cenderung tidak ber-gairah, sering merasa bahwa bagaimana-pun sesuatu tidak akan berhasil. (Unenthusiastic)'),
(23,'Suka menceritakan kembali suatu kisah tanpa menyadari bahwa cerita tersebut pernah diceritakan sebelumnya, selalu perlu sesuatu untuk dikatakan. (Repetitious)','Berjuang, melawan untuk menerima cara lain yang tidak sesuai dengan cara yang diinginkan. (Resistant)','Sering memendam rasa tidak senang akibat merasa tersinggung oleh sesuatu. (Resenful)','Tidak bersedia ikut terlibat terutama bila rumit. (Reticent)'),
(24,'Punya ingatan kurang kuat, biasa-nya berkaitan dengan kurang disiplin dan tidak mau repot-repot mencatat hal-hal yang tidak menyenangkan. (Forgetful)','Langsung, blak-blakan, tidak sungkan mengatakan apa yang dipikirkan. (Farank)','Bersikeras tentang persoalan sepele, minta perhatian besar pada persoalan yang tidak penting. (Fussy)','Sering merasa sangat khawatir, sedih, dan gelisah. (Fearful)'),
(25,'Lebih banyak bicara daripada mendengar-kan, bila sudah bicara sulit berhenti. (Interrupts)','Sulit bertahan untuk menghadapi kekesal-an. (Impatient)','Kurang percaya diri. (Insecure)','Sulit dalam membuat keputusan. (Indesecive)'),
(26,'Bisa bergairah sesaat dan sedih pada saat berikutnya. Bersedia membantu kemudian menghilang. Berjanji akan datang tapi kemudian lupa untuk muncul. (Unpredictable)','Merasa sulit mem-perlihatkan kasih sayang dengan terbuka. (Unaffectionate)','Tuntutannya akan kesempurnaan terlalu tinggi dan dapat membuat orang lain menjauhinya. (Unpopular)','Tidak tertarik pada perkumpulan atau kelompok. (Uninfolved)'),
(27,'Tidak punya cara yang konsisten untuk melakukan banyak hal. (Haphazard)','Bersikeras memaksa-kan caranya sendiri. (Headstrong)','Standar yang ditetapkan begitu tinggi sehingga orang lain sulit memuaskannya. (Hard to Please)','Lambat dalam bergerak dan sulit untuk ikut terlibat. (Hesitant)'),
(28,'Memperbolehkan orang lain, termasuk anak-anak untuk melakukan apa saja sesukanya untuk menghindari diri kita tidak disukai. (Permissive)','Punya harga diri tinggi dan menganggap diri selalu benar dan yang terbaik dalam pekerja-an. (Proud)','Dalam mengharapkan yang terbaik, biasanya melihat sisi buruk sesuatu terlebih dahulu. (Pessimistic)','Memiliki kepribadian yang biasa saja dan tidak suka mem-perlihatkan banyak emosi. (Plain)'),
(29,'Memiliki perangai seperti anak-anak yang mengutarakan diri dengan ngambek dan berbuat ber-lebihan tetapi kemudian melupakan-nya seketika. (Angered-Easily)','Mudah merasa ter-asing dari orang lain dikarenakan rasa tidak aman atau takut jangan-jangan orang lain tidak merasa senang bersamanya. (Alienated)','Mengobarkan per-debatan karena biasanya selalu benar dan terkadang tidak peduli bagaimana situasi saat itu. (Argumentative)','Bukan orang yang suka menetapkan tujuan dan tidak berharap menjadi orang yang seperti itu. (Aimless)'),
(30,'Memiliki perspektif yang sederhana dan kekanak-kanakan, kurang pengertian terhadap tingkat kehidupan yang lebih mendalam. (Naive)','Penuh keyakinan, semangat, dan keberanian (sering dalam pengertian negatif). (Nervy)','Sikapnya jarang positif dan sering hanya melihat sisi buruk dari setiap situasi. (Negative-Atitude)','Mudah bergaul, tidak peduli, dan masa bodoh. (Nonchalat)'),
(31,'Merasa senang mendapat pengharga-an dari orang lain. Sebagai penghibur menyukai tepuk tangan, tawa, dan penerimaan penonton. (Wants-Credit)','Menetapkan tujuan secara agresif serta harus terus produktif, merasa bersalah bila beristirahat, bukan ter-dorong oleh keinginan untuk sempurna melainkan imbalan. (Workaholic)','Suka menarik diri dan memerlukan banyak waktu untuk sendirian atau mengasingkan diri. (Withdrawn)','Secara konsisten merasa terganggu atau resah. (Worrier)'),
(32,'Suka berbicara dan sulit mendengarkan. (Talkative)','Kadang-kadang me-nyatakan diri dengan cara yang agak menyinggung perasaan dan kurang per-timbangan. (Tactless)','Terlalu introspektif dan mudah tersinggung kalau disalahpahami. (Too Sensitive)','Lebih suka mundur dari situasi sulit. (Timid)'),
(33,'Kurang memiliki ke-mampuan dalam membuat kehidupan menjadi teratur. (Disorganized)','Dengan paksa mengambil kontrol atas situasi atau orang lain, biasanya dengan mengatakan apa yang harus dilakukan. (Domineering)','Hampir sepanjang waktu merasa tertekan. (Depressed)','Mempunyai ciri khas selalu tidak tetap dan kurang keyakinan bahwa suatu hal akan berhasil. (Doubtful)'),
(34,'Tidak menentu, serba berlawanan dengan tindakan dan emosi yang tidak berdasar-kan logika. (Inconsistant)','Tampaknya tidak bisa menerima sikap, pandangan, dan cara orang lain. (Intolerant)','Pemikiran dan perhatian ditujukan ke dalam, hidup di dalam diri sendiri. (Introvert)','Merasa bahwa ke-banyakan hal tidak penting dalam suatu cara atau cara yang lain. (Indifferent)'),
(35,'Hidup dalam keadaan tidak teratur, tidak dapat menemukan banyak benda. (Messy)','Mempengaruhi dengan cerdik dan penuh tipu untuk kepentingan sendiri; dengan suatu cara dapat memaksakan kehendak. (Manipulative)','Bicara pelan kalau didesak, tidak mau repot-repot bicara dengan jelas. (Mumbles)','Tidak punya emosi yang tinggi, tetapi biasanya semangatnya merosot sekali, apalagi bila merasa tidak dihargai. (Moody)'),
(36,'Perlu menjadi pusat perhatian, ingin dilihat. (Show Off)','Bertekad memaksakan kehendaknya, tidak mudah dibujuk, keras kepala. (Stubborn)','Tidak mudah percaya, mempertanyakan motif di balik suatu perkataan. (Skeptical)','Tidak sering bertindak atau berpikir cepat, sangat mengganggu. (Slow)'),
(37,'Tawa dan suaranya dapat didengar di atas suara lainnya di di dalam ruangan. (Loud)','Tidak ragu-ragu mengatakan benar dan dapat memegang kendali. (Lord Over)','Memerlukan banyak waktu pribadi dan cenderung meng-hindari orang lain. (Loner)','Menilai pekerjaan dan kegiatan dengan ukuran berapa banyak tenaga yang dibutuhkan. (Lazy)'),
(38,'Tidak punya kekuatan untuk berkonsentrasi atau menaruh per-hatian pada sesuatu. (Scatterbrained)','Punya kemarahan yang menuntut berdasarkan ketidak-sabaran. Kemarahan yang dinyatakan saat orang lain tak bergerak cukup cepat atau tidak menyelesaikan apa yang diperintahkan. (Short-Tempered)','Cenderung mencurigai atau tidak mempercayai gagasan orang lain. (Suspicious)','Lambat untuk me-mulai, perlu dorongan yang kuat untuk termotivasi. (Sluggish)'),
(39,'Menyukai kegiatan baru terus-menerus karena tidak merasa senang melakukan hal yang sama sepanjang waktu. (Restless)','Bisa bertindak tergesa-gesa tanpa memikirkan dengan tuntas terlebih dahulu, biasanya karena ketidaksabaran. (Rash)','Secara sadar maupun tidak mendendam, menghukum orang yang melanggar, diam-diam menahan persahabatan /kasih sayang. (Revengeful)','Tidak bersedia untuk ikut terlibat dalam suatu hal. (Reluctant)'),
(40,'Rentang perhatian kekanak-kanakan dan pendek, butuh banyak perubahan dan variasi supaya tak merasa bosan. (Changeable)','Cerdik, orang yang selalu bisa menemu-kan cara untuk mencapai tujuan yang diinginkan. (Crafty)','Selalu mengevaluasi dan membuat penilaian, sering memikirkan dan menyatakan reaksi negatif. (Critical)','Sering mengendur kan pendiriannya, bahkan ketika merasa benar untuk menghindari terjadinya konflik. (Comrimissing)');

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
(1,'Aisyah Regina P','P',15,'Swasta',8,10,9,13,'Plegmatis','Plegmatis',0.000018244613285229,0.00059555995157502,0.0000035470532349736,0.0011587045849578),
(2,'Emilia Nur Rohmah','P',13,'Negeri',10,4,14,12,'Melankolis','Melankolis',0.000052538830317731,0.000000075713896319672,0.042882422632853,0.003922163179369),
(3,'Faris Saifullah','L',14,'Swasta',15,8,10,7,'Sanguin','Sanguin',0.13033848176309,0.00021928229762564,0.000046887107613799,0.0000035782464993252),
(4,'Rahmi Dwiki D.R','L',14,'Negeri',11,12,8,9,'Koleris','Koleris',0.021822663107099,0.058366611218614,0.0000047782717672805,0.00016654278086156),
(5,'Husna Dhiya \'ul Ilmi','P',13,'Swasta',20,8,8,4,'Sanguin','Sanguin',0.0029726552756786,0.0000003834186761643,0.0000000001545948879837,0.0000000000056588013135669);

/*Table structure for table `jawaban_kuisioner` */

DROP TABLE IF EXISTS `jawaban_kuisioner`;

CREATE TABLE `jawaban_kuisioner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_siswa` int(11) NOT NULL DEFAULT '0',
  `id_soal` int(11) NOT NULL DEFAULT '0',
  `jawaban` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `jawaban_kuisioner` */

insert  into `jawaban_kuisioner`(`id`,`id_user`,`id_siswa`,`id_soal`,`jawaban`) values 
(1,2,1,1,'B'),
(2,2,1,2,'C'),
(3,2,1,3,'C'),
(4,2,1,4,'C'),
(5,2,1,5,'C'),
(6,2,1,6,'C'),
(7,2,1,7,'B'),
(8,2,1,8,'B'),
(9,2,1,9,'B'),
(10,2,1,10,'B'),
(11,2,1,11,'B'),
(12,2,1,12,'C'),
(13,2,1,13,'A'),
(14,2,1,14,'A'),
(15,2,1,15,'A'),
(16,2,1,16,'D'),
(17,2,1,17,'D'),
(18,2,1,18,'D'),
(19,2,1,19,'A'),
(20,2,1,20,'B'),
(21,2,1,21,'A'),
(22,2,1,22,'C'),
(23,2,1,23,'C'),
(24,2,1,24,'C'),
(25,2,1,25,'D'),
(26,2,1,26,'C'),
(27,2,1,27,'C'),
(28,2,1,28,'B'),
(29,2,1,29,'B'),
(30,2,1,30,'D'),
(31,2,1,31,'B'),
(32,2,1,32,'B'),
(33,2,1,33,'B'),
(34,2,1,34,'B'),
(35,2,1,35,'D'),
(36,2,1,36,'B'),
(37,2,1,37,'D'),
(38,2,1,38,'B'),
(39,2,1,39,'B'),
(40,2,1,40,'D');

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
