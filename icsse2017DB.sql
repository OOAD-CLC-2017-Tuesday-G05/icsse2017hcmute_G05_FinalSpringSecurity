/*
SQLyog Enterprise - MySQL GUI v6.15
MySQL - 5.5.5-10.1.21-MariaDB : Database - icsse2017
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `icsse2017`;

USE `icsse2017`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`) values (2,'ROLE_SUBADMIN'),(3,'ROLE_ADMIN'),(4,'ROLE_MEMBER');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`password`) values (9,'admin@gmail.com','$2a$10$rkx4py76Q7MjdABmR3X43.LkW2tfr.r31ALmpVuBpPZmMvqcWQQcC'),(14,'member@gmail.com','$2a$10$H7FdPRZ/PimTv77l52pEf./evx7YzH4dNx0vYMkLTW.Mz8qVMlQ7.');

/*Table structure for table `user_document` */

DROP TABLE IF EXISTS `user_document`;

CREATE TABLE `user_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `content` longblob NOT NULL,
  `datetime` datetime NOT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `user_document` */

insert  into `user_document`(`id`,`category`,`description`,`type`,`content`,`datetime`,`status`) values (1,'home','test','text/html','<table style=\"text-align: justify;\">\r\n    <tbody>\r\n        <tr>\r\n            <td style=\"border: 1px solid #c00000; background-color: #dbe5f1;\">\r\n            <div style=\"text-align: center;\"><br />\r\n            <strong><span style=\"color: #0070c0;\">WELCOME TO ICSSE 2017</span></strong></div>\r\n            <span style=\"text-align: justify;\"><br />\r\n            &nbsp; <span style=\"font-size: 16px;\">&nbsp;Systems Science and Engineering has emerged as a research field that covers a wide spectrum of modern technology. A system can be considered as a collection of entities and their interrelationships gathered together to form a whole greater than the sum of the entities. It also involves people, organizations, cultures, activities and interrelationships among them. While systems composed of autonomous subsystems are not new, increased data density, connectivity and ubiquitous computational resources have increased their interdependence and interaction complexity. This has in turn made the already difficult job of planning, developing and deploying complex systems even more difficult.<br />\r\n            </span></span><span style=\"font-size: 16px;\"><span style=\"font-size: 16px;\"><span style=\"text-align: justify; font-size: 16px;\"><br />\r\n            &nbsp; &nbsp;Technology advancement not only provides opportunities for improving system capabilities but also introduces development risks that must be weighed and managed. Thus, it is our goal to bring together scholars from all areas to have a forum to discuss, demonstrate and exchange research ideas in the scope of system science and engineering.</span><br style=\"text-align: justify;\" />\r\n            <br style=\"text-align: justify;\" />\r\n            <span style=\"text-align: justify; font-size: 16px;\">&nbsp; &nbsp;The International Conference on Systems Science and Engineering 2017 (ICSSE 2017) is an international conference that will take place in Ho Chi Minh City during July 21-23, 2017. This event will provide a great opportunity for scientists, engineers, and practitioners from all over the world to present the latest system design concepts, research results, developments and applications, as well as to facilitate interactions between scholars and practitioners. ICSSE 2017 will feature plenary speeches in emerging technology topics given by world renowned scholars. The proceedings of ICSSE 2017 will be published by the IEEE with EI indexing. In addition, selected high-quality papers will be published by special issues of SCI-indexed journals.</span>&nbsp;</span><br />\r\n            </span>\r\n            <br />\r\n            <strong>ICSSE <strong style=\"text-align: justify;\">PUBLISHED&nbsp;</strong>PROCEEDINGS</strong><br />\r\n            <br />\r\n            ICSSE 2010: <a href=\"http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5540658\" target=\"_blank\">http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5540658</a><br />\r\n            ICSSE 2012: <a href=\"http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6246741\" target=\"_blank\">http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6246741</a><br />\r\n            ICSSE 2014: <a href=\"http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6879759\" target=\"_blank\">http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6879759</a><br />\r\n            ICSSE 2016: <a href=\"http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7548195\" target=\"_blank\">http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7548195</a><br />\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n','0000-00-00 00:00:00','show'),(2,'icsse','test','type/html','<p>&nbsp;</p><div style=\"\\&quot;text-align:center\\&quot;\"><strong><strong><s>March 7, 2017</s><br /><s><strong>Extended untill March 26, 2017</strong></s></strong></strong></div><div style=\"\\&quot;text-align:center\\&quot;\">2-Pages &nbsp;Extended Abstract&nbsp;Submission</div><div style=\"\\&quot;text-align:center\\&quot;\">&nbsp;</div><div style=\"\\&quot;text-align:center\\&quot;\"><strong><s>March 30, 2017</s><br />April 15, 2017</strong></div><div style=\"\\&quot;color:#002060\">Notification of Acceptance</div><div style=\"\\&quot;text-align:center\\&quot;\">&nbsp;</div><div style=\"\\&quot;text-align:center\\&quot;\"><strong>May 10, 2017</strong></div><div style=\"\\&quot;text-align:center\\&quot;\">2-6 Pages Final Papers Submission</div>','2017-06-04 01:54:56','show'),(14,'important_deadlines','test','text/html','<p style=\\\"text-align:justify\\\">&nbsp;</p><div style=\\\"text-align:center\\\"><strong><strong><span style=\\\"font-size:16px\\\"><s>March 7, 2017</s><br /><strong><span style=\\\"color:#c00000\\\">Extended untill March 26, 2017</span></strong></span></strong></strong></div><div style=\\\"text-align:center\\\"><span style=\\\"color:#002060; font-size:16px\\\"><span style=\\\"font-size:16px\\\">2-Pages &nbsp;Extended Abstract&nbsp;</span><span style=\\\"font-size:16px\\\">Submission</span></span></div><div style=\\\"text-align:center\\\">&nbsp;</div><div style=\\\"text-align:center\\\"><span style=\\\"font-size:16px\\\"><strong><s>March 30, 2017</s><br /><span style=\\\"color:#c00000\\\">April 15, 2017</span></strong></span></div><div style=\\\"color:#002060; text-align:center\\\"><span style=\\\"font-size:16px\\\"><span style=\\\"font-size:16px\\\">Notification of Acceptance</span></span></div><div style=\\\"text-align:center\\\">&nbsp;</div><div style=\\\"text-align:center\\\"><span style=\\\"color:#002060; font-size:16px\\\"><strong>May 10, 2017</strong></span></div><div style=\\\"text-align:center\\\"><span style=\\\"color:#002060; font-size:16px\\\"><span style=\\\"font-size:16px\\\">2-6 Pages Final Papers Submission</span></span></div>','0000-00-00 00:00:00','show'),(15,'special_session','test','text/html','<p><br /><span style=\\\"font-family:&quot;times new roman&quot;,serif; font-size:10.5pt\\\"><strong><strong><a href=\\\"https://easychair.org/conferences/?conf=icsse2017specialsess\\\" target=\\\"_blank\\\">SPECIAL SESSION SUBMISSION LINK</a>&nbsp;</strong></strong></span></p><p>&nbsp;</p><p>&nbsp;</p><div style=\\\"text-align:center\\\"><span style=\\\"font-family:&quot;times new roman&quot;,serif; font-size:10.5pt\\\"><span style=\\\"font-size:14px\\\"><strong><span style=\\\"color:#002060\\\"><strong><strong>SPECIAL SESSION&nbsp;</strong></strong>01</span></strong></span></span></div><p>&nbsp;</p><p>&nbsp;</p><div style=\\\"text-align:center\\\"><span style=\\\"font-family:&quot;times new roman&quot;,serif; font-size:10.5pt\\\"><span style=\\\"font-size:14px\\\"><strong><strong><span style=\\\"background-color:#ffff00; color:#002060\\\">INTELLIGENT HEALTHCARE SYSTEMS</span></strong></strong></span></span></div><div style=\\\"color:#002060; font-weight:bold; text-align:center\\\"><span style=\\\"font-family:&quot;times new roman&quot;,serif; font-size:10.5pt\\\"><span style=\\\"font-size:10.5pt\\\"><a href=\\\"/Resources/Docs/SubDomain/icsse2017/SS_cfp_Huang.pdf\\\">CALL FOR PAPERS</a></span></span></div><p>&nbsp;</p><div style=\\\"text-align:center\\\"><span style=\\\"font-family:&quot;times new roman&quot;,serif; font-size:10.5pt\\\"><strong><span style=\\\"font-size:20px\\\"><strong><span style=\\\"background-color:#ffff00; color:#002060; font-size:14px\\\"><strong><span style=\\\"color:#002060\\\"><strong><strong>SPECIAL SESSION&nbsp;</strong></strong></span></strong>02<br />FUZZY SYSTEMS &amp; ITS APPLICATIONS</span></strong></span></strong></span></div><p>&nbsp;</p><div style=\\\"text-align:center\\\"><span style=\\\"font-family:&quot;times new roman&quot;,serif; font-size:10.5pt\\\"><strong><strong><a href=\\\"/Resources/Docs/SubDomain/icsse2017/SS02 - call4pp.pdf\\\" style=\\\"margin: 0px; padding: 0px; text-decoration: none;\\\">CALL FOR PAPER</a></strong></strong></span></div><p>&nbsp;</p>','0000-00-00 00:00:00','show'),(16,'key_links','test','text/html','<p>&nbsp;</p><p><span style=\\\"color:#002060\\\"><span style=\\\"font-size:14px\\\"><a href=\\\"https://easychair.org/conferences/?conf=icsse2017\\\" target=\\\"_blank\\\"><strong>EASYCHAIR SUBMISSION SITE</strong></a></span><br /><br /><span style=\\\"font-size:14px\\\"><a href=\\\"/Resources/Docs/SubDomain/icsse2017/ieeeconf_letter.doc\\\"><strong>PAPER FORMAT TEMPLATE DOWNLOAD</strong></a>&nbsp;</span></span><br /><span style=\\\"font-size:14px\\\"><strong><a href=\\\"/Resources/Docs/SubDomain/icsse2017/Instruction easychair_ICSSE2017.docx\\\"><strong>EASYCHAIR&nbsp;</strong>SUBMISSION INSTRUCTION</a><br /><br /><a href=\\\"/Resources/Docs/SubDomain/icsse2017/Reviewer instruction.pdf\\\">INSTRUCTION FOR REVIEWER</a></strong></span></p><p>&nbsp;</p>','0000-00-00 00:00:00','show'),(41,'hcmute','aa','type/html','','2017-06-04 00:39:55','show'),(44,'submission','aaaaaaaaaaaaaaaaaa','type/html','<p>aaaaaaaaaaa</p>','2017-06-04 00:47:04','show'),(45,'call_for_papers','zzzzzzzzzzzz','type/html','<p>zzzzzzzzzzzzzzzzz</p>','2017-06-04 00:47:27','show'),(46,'news','','type/html','<p>a &aacute; &agrave; &#7843; &atilde; &#7841; &#259; &#7855; &#7857; &#7859; &#7861; &#7863; &acirc; &#7845; &#7847; &#7859; &#7861; &#7853; b c d &#273; e &eacute; &egrave; &#7867; &#7869; &#7865; &ecirc; &#7871; &#7873; &#7875; &#7877; &#7879; g h i &iacute; &igrave; &#7881; &#297; &#7883; k l m n o &oacute; &ograve; &#7887; &otilde; &#7885; &ocirc; &#7889; &#7891; &#7893; &#7895; &#7897; &#417; &#7899; &#7901; &#7903; &#7905; &#7907; p q r s t u &uacute; &ugrave; &#7911; &#361; &#7909; &#432; &#7913; &#7915; &#7917; &#7919; &#7921; v x y</p>\r\n','2017-06-04 01:19:44','hide'),(47,'news','','type/html','<p>a &aacute; &agrave; &#7843; &atilde; &#7841; &#259; &#7855; &#7857; &#7859; &#7861; &#7863; &acirc; &#7845; &#7847; &#7859; &#7861; &#7853; b c d &#273; e &eacute; &egrave; &#7867; &#7869; &#7865; &ecirc; &#7871; &#7873; &#7875; &#7877; &#7879; g h i &iacute; &igrave; &#7881; &#297; &#7883; k l m n o &oacute; &ograve; &#7887; &otilde; &#7885; &ocirc; &#7889; &#7891; &#7893; &#7895; &#7897; &#417; &#7899; &#7901; &#7903; &#7905; &#7907; p q r s t u &uacute; &ugrave; &#7911; &#361; &#7909; &#432; &#7913; &#7915; &#7917; &#7919; &#7921; v x y</p>\r\n','2017-06-04 01:20:26','hide'),(48,'news','aaaaaaaaaa','type/html','<p>a &aacute; &agrave; &#7843; &atilde; &#7841; &#259; &#7855; &#7857; &#7859; &#7861; &#7863; &acirc; &#7845; &#7847; &#7859; &#7861; &#7853; b c d &#273; e &eacute; &egrave; &#7867; &#7869; &#7865; &ecirc; &#7871; &#7873; &#7875; &#7877; &#7879; g h i &iacute; &igrave; &#7881; &#297; &#7883; k l m n o &oacute; &ograve; &#7887; &otilde; &#7885; &ocirc; &#7889; &#7891; &#7893; &#7895; &#7897; &#417; &#7899; &#7901; &#7903; &#7905; &#7907; p q r s t u &uacute; &ugrave; &#7911; &#361; &#7909; &#432; &#7913; &#7915; &#7917; &#7919; &#7921; v x y</p>\r\n','2017-06-04 01:35:16','hide'),(50,'news','thu nghiem 3','type/html','<p>a &aacute; &agrave; &#7843; &atilde; &#7841; &#259; &#7855; &#7857; &#7859; &#7861; &#7863; &acirc; &#7845; &#7847; &#7859; &#7861; &#7853; b c d &#273; e &eacute; &egrave; &#7867; &#7869; &#7865; &ecirc; &#7871; &#7873; &#7875; &#7877; &#7879; g h i &iacute; &igrave; &#7881; &#297; &#7883; k l m n o &oacute; &ograve; &#7887; &otilde; &#7885; &ocirc; &#7889; &#7891; &#7893; &#7895; &#7897; &#417; &#7899; &#7901; &#7903; &#7905; &#7907; p q r s t u &uacute; &ugrave; &#7911; &#361; &#7909; &#432; &#7913; &#7915; &#7917; &#7919; &#7921; v x y</p>\r\n','2017-06-05 10:13:53','hide'),(51,'news','thu nghiem 4','type/html','<p>a &aacute; &agrave; &#7843; &atilde; &#7841; &#259; &#7855; &#7857; &#7859; &#7861; &#7863; &acirc; &#7845; &#7847; &#7859; &#7861; &#7853; b c d &#273; e &eacute; &egrave; &#7867; &#7869; &#7865; &ecirc; &#7871; &#7873; &#7875; &#7877; &#7879; g h i &iacute; &igrave; &#7881; &#297; &#7883; k l m n o &oacute; &ograve; &#7887; &otilde; &#7885; &ocirc; &#7889; &#7891; &#7893; &#7895; &#7897; &#417; &#7899; &#7901; &#7903; &#7905; &#7907; p q r s t u &uacute; &ugrave; &#7911; &#361; &#7909; &#432; &#7913; &#7915; &#7917; &#7919; &#7921; v x y</p>\r\n','2017-06-05 10:14:17','hide');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_user_role2` (`role_id`),
  CONSTRAINT `FK_user_role1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_role2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`) values (9,2),(9,3),(9,4),(14,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
