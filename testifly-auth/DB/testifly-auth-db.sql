-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.35 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for education-testifly
CREATE DATABASE IF NOT EXISTS `education-testifly` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `education-testifly`;

-- Dumping structure for table education-testifly.alertsandnotifications
CREATE TABLE IF NOT EXISTS `alertsandnotifications` (
  `autoId` int NOT NULL,
  `message` longtext NOT NULL,
  `messageType` varchar(20) NOT NULL,
  `producerId` varchar(50) DEFAULT NULL,
  `scheduledDate` varchar(50) DEFAULT NULL,
  `expiryDate` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`),
  KEY `FK_alertsandnotifications_producers` (`producerId`),
  CONSTRAINT `FK_alertsandnotifications_producers` FOREIGN KEY (`producerId`) REFERENCES `producers` (`producerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.alertsandnotifications: ~0 rows (approximately)

-- Dumping structure for table education-testifly.assessmemntexamexplanation
CREATE TABLE IF NOT EXISTS `assessmemntexamexplanation` (
  `explanationId` varchar(50) NOT NULL,
  `questionId` varchar(50) NOT NULL,
  `explanation` text NOT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(200) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(100) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL DEFAULT '0',
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`explanationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.assessmemntexamexplanation: ~0 rows (approximately)

-- Dumping structure for table education-testifly.assessment
CREATE TABLE IF NOT EXISTS `assessment` (
  `assessmentId` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `style` varchar(50) NOT NULL DEFAULT 'Aptitude',
  `repoMode` varchar(50) NOT NULL DEFAULT 'Dedicated',
  `assessmentDate` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `assessmentDateStatus` varchar(20) NOT NULL DEFAULT 'NA',
  `broadCast` bit(1) NOT NULL DEFAULT b'0',
  `masterProducerId` varchar(50) NOT NULL,
  `patternId` varchar(50) NOT NULL DEFAULT 'DEFAULT',
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`assessmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.assessment: ~0 rows (approximately)

-- Dumping structure for table education-testifly.assessmentexamanswer
CREATE TABLE IF NOT EXISTS `assessmentexamanswer` (
  `answerId` varchar(50) NOT NULL,
  `questionId` varchar(50) NOT NULL,
  `textAnswer` text NOT NULL,
  `patternMode` varchar(20) NOT NULL DEFAULT 'Option',
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(200) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(100) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL DEFAULT '0',
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`answerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.assessmentexamanswer: ~0 rows (approximately)

-- Dumping structure for table education-testifly.assessmentexamquestion
CREATE TABLE IF NOT EXISTS `assessmentexamquestion` (
  `questionId` varchar(50) NOT NULL,
  `assessmentId` varchar(50) NOT NULL,
  `textQuestion` text NOT NULL,
  `chapterId` varchar(50) NOT NULL,
  `correctAnswers` varchar(500) NOT NULL,
  `answerMode` varchar(50) NOT NULL DEFAULT 'Option',
  `markPerQuestion` decimal(3,1) NOT NULL DEFAULT '1.0',
  `negativeMarkPerQuestion` decimal(3,1) NOT NULL DEFAULT '1.0',
  `askedYears` varchar(100) DEFAULT NULL,
  `weightage` varchar(20) NOT NULL DEFAULT 'Default',
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(200) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(50) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(50) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL DEFAULT '0',
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.assessmentexamquestion: ~0 rows (approximately)

-- Dumping structure for table education-testifly.assessmentpattern
CREATE TABLE IF NOT EXISTS `assessmentpattern` (
  `patternId` varchar(50) NOT NULL,
  `producerId` varchar(50) NOT NULL,
  `patternName` varchar(100) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`patternId`),
  KEY `FK_assessmentpattern_producers` (`producerId`),
  CONSTRAINT `FK_assessmentpattern_producers` FOREIGN KEY (`producerId`) REFERENCES `producers` (`producerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.assessmentpattern: ~2 rows (approximately)
INSERT INTO `assessmentpattern` (`patternId`, `producerId`, `patternName`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('Advanced', 'PRD000001', 'Advanced', 'SuperAdmin', '2018-01-01 16:34:28', NULL, NULL, b'1'),
	('Default', 'PRD000001', 'Default', 'SuperAdmin', '2018-01-01 16:34:28', NULL, NULL, b'1');

-- Dumping structure for table education-testifly.assessmentpatterninfo
CREATE TABLE IF NOT EXISTS `assessmentpatterninfo` (
  `autoId` int NOT NULL,
  `patternId` varchar(50) NOT NULL,
  `weightage` varchar(50) NOT NULL,
  `percentage` int NOT NULL DEFAULT '100',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.assessmentpatterninfo: ~5 rows (approximately)
INSERT INTO `assessmentpatterninfo` (`autoId`, `patternId`, `weightage`, `percentage`, `status`) VALUES
	(1, 'Default', 'High', 50, b'1'),
	(2, 'Default', 'Medium', 30, b'1'),
	(3, 'Default', 'Low', 20, b'1'),
	(4, 'Advanced', 'High', 80, b'1'),
	(5, 'Advanced', 'Medium', 20, b'1');

-- Dumping structure for table education-testifly.authkeygen
CREATE TABLE IF NOT EXISTS `authkeygen` (
  `serialKey` varchar(50) NOT NULL,
  `employeeId` varchar(50) DEFAULT NULL,
  `schemeId` varchar(50) NOT NULL DEFAULT 'DEFAULT',
  `serialKeyStatus` varchar(50) DEFAULT NULL,
  `sellingPrice` double(10,2) NOT NULL DEFAULT '0.00',
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`serialKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.authkeygen: ~0 rows (approximately)

-- Dumping structure for table education-testifly.authkeygenconsumer
CREATE TABLE IF NOT EXISTS `authkeygenconsumer` (
  `employeeId` varchar(50) NOT NULL,
  `serialKey` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.authkeygenconsumer: ~0 rows (approximately)

-- Dumping structure for table education-testifly.autogeneratedid
CREATE TABLE IF NOT EXISTS `autogeneratedid` (
  `idKey` varchar(50) NOT NULL,
  `idFormat` varchar(50) DEFAULT NULL,
  `idValue` varchar(50) NOT NULL,
  `idDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.autogeneratedid: ~4 rows (approximately)
INSERT INTO `autogeneratedid` (`idKey`, `idFormat`, `idValue`, `idDescription`) VALUES
	('Employee', 'EMP', '035', 'EAEMP14001'),
	('Franchisee', 'EACP', '005', 'EACP14001'),
	('SerialNo', NULL, '4478', '14001'),
	('Student', 'EDU', '2222', 'EDU14001');

-- Dumping structure for table education-testifly.channel_messages
CREATE TABLE IF NOT EXISTS `channel_messages` (
  `messageId` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `messageName` varchar(50) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `media` varchar(20) NOT NULL,
  `producerId` varchar(50) NOT NULL,
  `scheduledDate` varchar(50) DEFAULT NULL,
  `expiryDate` varchar(50) DEFAULT NULL,
  `dataMapTemplateName` varchar(100) DEFAULT NULL,
  `nextDeliveryDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `textHTML` bit(1) DEFAULT b'1',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.channel_messages: ~0 rows (approximately)

-- Dumping structure for table education-testifly.consumercourses
CREATE TABLE IF NOT EXISTS `consumercourses` (
  `autoId` int NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `courseId` varchar(50) NOT NULL,
  `courseYear` varchar(50) NOT NULL,
  `schemeId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.consumercourses: ~0 rows (approximately)

-- Dumping structure for table education-testifly.consumerorganisation
CREATE TABLE IF NOT EXISTS `consumerorganisation` (
  `employeeId` varchar(50) NOT NULL,
  `organisationId` varchar(50) NOT NULL,
  KEY `FK_consumerorganisation_users` (`employeeId`),
  KEY `FK_consumerorganisation_organisation` (`organisationId`),
  CONSTRAINT `FK_consumerorganisation_organisation` FOREIGN KEY (`organisationId`) REFERENCES `organisation` (`organisationId`),
  CONSTRAINT `FK_consumerorganisation_users` FOREIGN KEY (`employeeId`) REFERENCES `users` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.consumerorganisation: ~0 rows (approximately)

-- Dumping structure for table education-testifly.countrys
CREATE TABLE IF NOT EXISTS `countrys` (
  `country` varchar(20) NOT NULL,
  `countryName` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  `displayOrder` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.countrys: ~474 rows (approximately)
INSERT INTO `countrys` (`country`, `countryName`, `status`, `displayOrder`) VALUES
	('Africa/Abidjan', 'Africa/Abidjan', b'0', 0),
	('Africa/Accra', 'Africa/Accra', b'0', 0),
	('Africa/Addis_Ababa', 'Africa/Addis_Ababa', b'0', 0),
	('Africa/Algiers', 'Africa/Algiers', b'0', 0),
	('Africa/Asmara', 'Africa/Asmara', b'0', 0),
	('Africa/Asmera', 'Africa/Asmera', b'0', 0),
	('Africa/Bamako', 'Africa/Bamako', b'0', 0),
	('Africa/Bangui', 'Africa/Bangui', b'0', 0),
	('Africa/Banjul', 'Africa/Banjul', b'0', 0),
	('Africa/Bissau', 'Africa/Bissau', b'0', 0),
	('Africa/Blantyre', 'Africa/Blantyre', b'0', 0),
	('Africa/Brazzaville', 'Africa/Brazzaville', b'0', 0),
	('Africa/Bujumbura', 'Africa/Bujumbura', b'0', 0),
	('Africa/Cairo', 'Africa/Cairo', b'0', 0),
	('Africa/Casablanca', 'Africa/Casablanca', b'0', 0),
	('Africa/Ceuta', 'Africa/Ceuta', b'0', 0),
	('Africa/Conakry', 'Africa/Conakry', b'0', 0),
	('Africa/Dakar', 'Africa/Dakar', b'0', 0),
	('Africa/Dar_es_Salaam', 'Africa/Dar_es_Salaam', b'0', 0),
	('Africa/Djibouti', 'Africa/Djibouti', b'0', 0),
	('Africa/Douala', 'Africa/Douala', b'0', 0),
	('Africa/El_Aaiun', 'Africa/El_Aaiun', b'0', 0),
	('Africa/Freetown', 'Africa/Freetown', b'0', 0),
	('Africa/Gaborone', 'Africa/Gaborone', b'0', 0),
	('Africa/Harare', 'Africa/Harare', b'0', 0),
	('Africa/Johannesburg', 'Africa/Johannesburg', b'0', 0),
	('Africa/Juba', 'Africa/Juba', b'0', 0),
	('Africa/Kampala', 'Africa/Kampala', b'0', 0),
	('Africa/Khartoum', 'Africa/Khartoum', b'0', 0),
	('Africa/Kigali', 'Africa/Kigali', b'0', 0),
	('Africa/Kinshasa', 'Africa/Kinshasa', b'0', 0),
	('Africa/Lagos', 'Africa/Lagos', b'0', 0),
	('Africa/Libreville', 'Africa/Libreville', b'0', 0),
	('Africa/Lome', 'Africa/Lome', b'0', 0),
	('Africa/Luanda', 'Africa/Luanda', b'0', 0),
	('Africa/Lubumbashi', 'Africa/Lubumbashi', b'0', 0),
	('Africa/Lusaka', 'Africa/Lusaka', b'0', 0),
	('Africa/Malabo', 'Africa/Malabo', b'0', 0),
	('Africa/Maputo', 'Africa/Maputo', b'0', 0),
	('Africa/Maseru', 'Africa/Maseru', b'0', 0),
	('Africa/Mbabane', 'Africa/Mbabane', b'0', 0),
	('Africa/Mogadishu', 'Africa/Mogadishu', b'0', 0),
	('Africa/Monrovia', 'Africa/Monrovia', b'0', 0),
	('Africa/Nairobi', 'Africa/Nairobi', b'0', 0),
	('Africa/Ndjamena', 'Africa/Ndjamena', b'0', 0),
	('Africa/Niamey', 'Africa/Niamey', b'0', 0),
	('Africa/Nouakchott', 'Africa/Nouakchott', b'0', 0),
	('Africa/Ouagadougou', 'Africa/Ouagadougou', b'0', 0),
	('Africa/Porto-Novo', 'Africa/Porto-Novo', b'0', 0),
	('Africa/Sao_Tome', 'Africa/Sao_Tome', b'0', 0),
	('Africa/Timbuktu', 'Africa/Timbuktu', b'0', 0),
	('Africa/Tripoli', 'Africa/Tripoli', b'0', 0),
	('Africa/Tunis', 'Africa/Tunis', b'0', 0),
	('Africa/Windhoek', 'Africa/Windhoek', b'0', 0),
	('America/Adak', 'America/Adak', b'0', 0),
	('America/Anchorage', 'America/Anchorage', b'0', 0),
	('America/Anguilla', 'America/Anguilla', b'0', 0),
	('America/Antigua', 'America/Antigua', b'0', 0),
	('America/Araguaina', 'America/Araguaina', b'0', 0),
	('America/Aruba', 'America/Aruba', b'0', 0),
	('America/Asuncion', 'America/Asuncion', b'0', 0),
	('America/Atikokan', 'America/Atikokan', b'0', 0),
	('America/Atka', 'America/Atka', b'0', 0),
	('America/Bahia', 'America/Bahia', b'0', 0),
	('America/Barbados', 'America/Barbados', b'0', 0),
	('America/Belem', 'America/Belem', b'0', 0),
	('America/Belize', 'America/Belize', b'0', 0),
	('America/Blanc-Sablon', 'America/Blanc-Sablon', b'0', 0),
	('America/Boa_Vista', 'America/Boa_Vista', b'0', 0),
	('America/Bogota', 'America/Bogota', b'0', 0),
	('America/Boise', 'America/Boise', b'0', 0),
	('America/Buenos_Aires', 'America/Buenos_Aires', b'0', 0),
	('America/Campo_Grande', 'America/Campo_Grande', b'0', 0),
	('America/Cancun', 'America/Cancun', b'0', 0),
	('America/Caracas', 'America/Caracas', b'0', 0),
	('America/Catamarca', 'America/Catamarca', b'0', 0),
	('America/Cayenne', 'America/Cayenne', b'0', 0),
	('America/Cayman', 'America/Cayman', b'0', 0),
	('America/Chicago', 'America/Chicago', b'0', 0),
	('America/Chihuahua', 'America/Chihuahua', b'0', 0),
	('America/Cordoba', 'America/Cordoba', b'0', 0),
	('America/Costa_Rica', 'America/Costa_Rica', b'0', 0),
	('America/Creston', 'America/Creston', b'0', 0),
	('America/Cuiaba', 'America/Cuiaba', b'0', 0),
	('America/Curacao', 'America/Curacao', b'0', 0),
	('America/Danmarkshavn', 'America/Danmarkshavn', b'0', 0),
	('America/Dawson', 'America/Dawson', b'0', 0),
	('America/Dawson_Creek', 'America/Dawson_Creek', b'0', 0),
	('America/Denver', 'America/Denver', b'0', 0),
	('America/Detroit', 'America/Detroit', b'0', 0),
	('America/Dominica', 'America/Dominica', b'0', 0),
	('America/Edmonton', 'America/Edmonton', b'0', 0),
	('America/Eirunepe', 'America/Eirunepe', b'0', 0),
	('America/El_Salvador', 'America/El_Salvador', b'0', 0),
	('America/Ensenada', 'America/Ensenada', b'0', 0),
	('America/Fortaleza', 'America/Fortaleza', b'0', 0),
	('America/Fort_Nelson', 'America/Fort_Nelson', b'0', 0),
	('America/Fort_Wayne', 'America/Fort_Wayne', b'0', 0),
	('America/Glace_Bay', 'America/Glace_Bay', b'0', 0),
	('America/Godthab', 'America/Godthab', b'0', 0),
	('America/Goose_Bay', 'America/Goose_Bay', b'0', 0),
	('America/Grand_Turk', 'America/Grand_Turk', b'0', 0),
	('America/Grenada', 'America/Grenada', b'0', 0),
	('America/Guadeloupe', 'America/Guadeloupe', b'0', 0),
	('America/Guatemala', 'America/Guatemala', b'0', 0),
	('America/Guayaquil', 'America/Guayaquil', b'0', 0),
	('America/Guyana', 'America/Guyana', b'0', 0),
	('America/Halifax', 'America/Halifax', b'0', 0),
	('America/Havana', 'America/Havana', b'0', 0),
	('America/Hermosillo', 'America/Hermosillo', b'0', 0),
	('America/Indiana/Knox', 'America/Indiana/Knox', b'0', 0),
	('America/Indianapolis', 'America/Indianapolis', b'0', 0),
	('America/Inuvik', 'America/Inuvik', b'0', 0),
	('America/Iqaluit', 'America/Iqaluit', b'0', 0),
	('America/Jamaica', 'America/Jamaica', b'0', 0),
	('America/Jujuy', 'America/Jujuy', b'0', 0),
	('America/Juneau', 'America/Juneau', b'0', 0),
	('America/Knox_IN', 'America/Knox_IN', b'0', 0),
	('America/Kralendijk', 'America/Kralendijk', b'0', 0),
	('America/La_Paz', 'America/La_Paz', b'0', 0),
	('America/Lima', 'America/Lima', b'0', 0),
	('America/Los_Angeles', 'America/Los_Angeles', b'0', 0),
	('America/Louisville', 'America/Louisville', b'0', 0),
	('America/Maceio', 'America/Maceio', b'0', 0),
	('America/Managua', 'America/Managua', b'0', 0),
	('America/Manaus', 'America/Manaus', b'0', 0),
	('America/Marigot', 'America/Marigot', b'0', 0),
	('America/Martinique', 'America/Martinique', b'0', 0),
	('America/Matamoros', 'America/Matamoros', b'0', 0),
	('America/Mazatlan', 'America/Mazatlan', b'0', 0),
	('America/Mendoza', 'America/Mendoza', b'0', 0),
	('America/Menominee', 'America/Menominee', b'0', 0),
	('America/Merida', 'America/Merida', b'0', 0),
	('America/Metlakatla', 'America/Metlakatla', b'0', 0),
	('America/Mexico_City', 'America/Mexico_City', b'0', 0),
	('America/Miquelon', 'America/Miquelon', b'0', 0),
	('America/Moncton', 'America/Moncton', b'0', 0),
	('America/Monterrey', 'America/Monterrey', b'0', 0),
	('America/Montevideo', 'America/Montevideo', b'0', 0),
	('America/Montreal', 'America/Montreal', b'0', 0),
	('America/Montserrat', 'America/Montserrat', b'0', 0),
	('America/Nassau', 'America/Nassau', b'0', 0),
	('America/New_York', 'America/New_York', b'0', 0),
	('America/Nipigon', 'America/Nipigon', b'0', 0),
	('America/Nome', 'America/Nome', b'0', 0),
	('America/Noronha', 'America/Noronha', b'0', 0),
	('America/Ojinaga', 'America/Ojinaga', b'0', 0),
	('America/Panama', 'America/Panama', b'0', 0),
	('America/Pangnirtung', 'America/Pangnirtung', b'0', 0),
	('America/Paramaribo', 'America/Paramaribo', b'0', 0),
	('America/Phoenix', 'America/Phoenix', b'0', 0),
	('America/Porto_Acre', 'America/Porto_Acre', b'0', 0),
	('America/Porto_Velho', 'America/Porto_Velho', b'0', 0),
	('America/Puerto_Rico', 'America/Puerto_Rico', b'0', 0),
	('America/Punta_Arenas', 'America/Punta_Arenas', b'0', 0),
	('America/Rainy_River', 'America/Rainy_River', b'0', 0),
	('America/Rankin_Inlet', 'America/Rankin_Inlet', b'0', 0),
	('America/Recife', 'America/Recife', b'0', 0),
	('America/Regina', 'America/Regina', b'0', 0),
	('America/Resolute', 'America/Resolute', b'0', 0),
	('America/Rio_Branco', 'America/Rio_Branco', b'0', 0),
	('America/Rosario', 'America/Rosario', b'0', 0),
	('America/Santarem', 'America/Santarem', b'0', 0),
	('America/Santa_Isabel', 'America/Santa_Isabel', b'0', 0),
	('America/Santiago', 'America/Santiago', b'0', 0),
	('America/Sao_Paulo', 'America/Sao_Paulo', b'0', 0),
	('America/Scoresbysund', 'America/Scoresbysund', b'0', 0),
	('America/Shiprock', 'America/Shiprock', b'0', 0),
	('America/Sitka', 'America/Sitka', b'0', 0),
	('America/St_Johns', 'America/St_Johns', b'0', 0),
	('America/St_Kitts', 'America/St_Kitts', b'0', 0),
	('America/St_Lucia', 'America/St_Lucia', b'0', 0),
	('America/St_Thomas', 'America/St_Thomas', b'0', 0),
	('America/St_Vincent', 'America/St_Vincent', b'0', 0),
	('America/Tegucigalpa', 'America/Tegucigalpa', b'0', 0),
	('America/Thule', 'America/Thule', b'0', 0),
	('America/Thunder_Bay', 'America/Thunder_Bay', b'0', 0),
	('America/Tijuana', 'America/Tijuana', b'0', 0),
	('America/Toronto', 'America/Toronto', b'0', 0),
	('America/Tortola', 'America/Tortola', b'0', 0),
	('America/Vancouver', 'America/Vancouver', b'0', 0),
	('America/Virgin', 'America/Virgin', b'0', 0),
	('America/Whitehorse', 'America/Whitehorse', b'0', 0),
	('America/Winnipeg', 'America/Winnipeg', b'0', 0),
	('America/Yakutat', 'America/Yakutat', b'0', 0),
	('America/Yellowknife', 'America/Yellowknife', b'0', 0),
	('Antarctica/Casey', 'Antarctica/Casey', b'0', 0),
	('Antarctica/Davis', 'Antarctica/Davis', b'0', 0),
	('Antarctica/Macquarie', 'Antarctica/Macquarie', b'0', 0),
	('Antarctica/Mawson', 'Antarctica/Mawson', b'0', 0),
	('Antarctica/McMurdo', 'Antarctica/McMurdo', b'0', 0),
	('Antarctica/Palmer', 'Antarctica/Palmer', b'0', 0),
	('Antarctica/Rothera', 'Antarctica/Rothera', b'0', 0),
	('Antarctica/Syowa', 'Antarctica/Syowa', b'0', 0),
	('Antarctica/Troll', 'Antarctica/Troll', b'0', 0),
	('Antarctica/Vostok', 'Antarctica/Vostok', b'0', 0),
	('Arctic/Longyearbyen', 'Arctic/Longyearbyen', b'0', 0),
	('Asia/Aden', 'Asia/Aden', b'0', 0),
	('Asia/Almaty', 'Asia/Almaty', b'0', 0),
	('Asia/Amman', 'Asia/Amman', b'0', 0),
	('Asia/Anadyr', 'Asia/Anadyr', b'0', 0),
	('Asia/Aqtau', 'Asia/Aqtau', b'0', 0),
	('Asia/Aqtobe', 'Asia/Aqtobe', b'0', 0),
	('Asia/Ashgabat', 'Asia/Ashgabat', b'0', 0),
	('Asia/Ashkhabad', 'Asia/Ashkhabad', b'0', 0),
	('Asia/Atyrau', 'Asia/Atyrau', b'0', 0),
	('Asia/Baghdad', 'Asia/Baghdad', b'0', 0),
	('Asia/Bahrain', 'Bahrain', b'0', 12),
	('Asia/Baku', 'Asia/Baku', b'0', 0),
	('Asia/Bangkok', 'Thailand', b'0', 15),
	('Asia/Barnaul', 'Asia/Barnaul', b'0', 0),
	('Asia/Beirut', 'Asia/Beirut', b'0', 0),
	('Asia/Bishkek', 'Asia/Bishkek', b'0', 0),
	('Asia/Brunei', 'Asia/Brunei', b'0', 0),
	('Asia/Calcutta', 'Asia/Calcutta', b'0', 0),
	('Asia/Chita', 'Asia/Chita', b'0', 0),
	('Asia/Choibalsan', 'Asia/Choibalsan', b'0', 0),
	('Asia/Chongqing', 'Asia/Chongqing', b'0', 0),
	('Asia/Chungking', 'Asia/Chungking', b'0', 0),
	('Asia/Colombo', 'Sri Lanka', b'0', 3),
	('Asia/Damascus', 'Asia/Damascus', b'0', 0),
	('Asia/Dhaka', 'Bangladesh', b'0', 17),
	('Asia/Dili', 'Asia/Dili', b'0', 0),
	('Asia/Dubai', 'Dubai', b'0', 13),
	('Asia/Dushanbe', 'Asia/Dushanbe', b'0', 0),
	('Asia/Famagusta', 'Asia/Famagusta', b'0', 0),
	('Asia/Gaza', 'Asia/Gaza', b'0', 0),
	('Asia/Harbin', 'Asia/Harbin', b'0', 0),
	('Asia/Hebron', 'Asia/Hebron', b'0', 0),
	('Asia/Hong_Kong', 'Asia/Hong_Kong', b'0', 0),
	('Asia/Hovd', 'Asia/Hovd', b'0', 0),
	('Asia/Ho_Chi_Minh', 'Asia/Ho_Chi_Minh', b'0', 0),
	('Asia/Irkutsk', 'Asia/Irkutsk', b'0', 0),
	('Asia/Istanbul', 'Asia/Istanbul', b'0', 0),
	('Asia/Jakarta', 'Indonesia', b'0', 4),
	('Asia/Jayapura', 'Asia/Jayapura', b'0', 0),
	('Asia/Jerusalem', 'Asia/Jerusalem', b'0', 0),
	('Asia/Kabul', 'Pakistan', b'0', 22),
	('Asia/Kamchatka', 'Asia/Kamchatka', b'0', 0),
	('Asia/Karachi', 'Asia/Karachi', b'0', 0),
	('Asia/Kashgar', 'Asia/Kashgar', b'0', 0),
	('Asia/Kathmandu', 'Nepal', b'0', 23),
	('Asia/Katmandu', 'Asia/Katmandu', b'0', 14),
	('Asia/Khandyga', 'Asia/Khandyga', b'0', 0),
	('Asia/Kolkata', 'India', b'1', 1),
	('Asia/Krasnoyarsk', 'Asia/Krasnoyarsk', b'0', 0),
	('Asia/Kuala_Lumpur', 'Malaysia', b'0', 5),
	('Asia/Kuching', 'Asia/Kuching', b'0', 0),
	('Asia/Kuwait', 'Kuwait', b'0', 19),
	('Asia/Macao', 'Asia/Macao', b'0', 0),
	('Asia/Macau', 'Asia/Macau', b'0', 0),
	('Asia/Magadan', 'Asia/Magadan', b'0', 0),
	('Asia/Makassar', 'Asia/Makassar', b'0', 0),
	('Asia/Manila', 'Phillippines', b'0', 20),
	('Asia/Muscat', 'Oman', b'0', 6),
	('Asia/Nicosia', 'Asia/Nicosia', b'0', 0),
	('Asia/Novokuznetsk', 'Asia/Novokuznetsk', b'0', 0),
	('Asia/Novosibirsk', 'Asia/Novosibirsk', b'0', 0),
	('Asia/Omsk', 'Asia/Omsk', b'0', 0),
	('Asia/Oral', 'Asia/Oral', b'0', 0),
	('Asia/Phnom_Penh', 'Asia/Phnom_Penh', b'0', 0),
	('Asia/Pontianak', 'Asia/Pontianak', b'0', 0),
	('Asia/Pyongyang', 'Asia/Pyongyang', b'0', 0),
	('Asia/Qatar', 'Qatar', b'0', 7),
	('Asia/Qyzylorda', 'Asia/Qyzylorda', b'0', 0),
	('Asia/Rangoon', 'Asia/Rangoon', b'0', 0),
	('Asia/Riyadh', 'Riyadh', b'0', 8),
	('Asia/Saigon', 'Asia/Saigon', b'0', 0),
	('Asia/Sakhalin', 'Asia/Sakhalin', b'0', 0),
	('Asia/Samarkand', 'Asia/Samarkand', b'0', 0),
	('Asia/Seoul', 'Asia/Seoul', b'0', 0),
	('Asia/Shanghai', 'Asia/Shanghai', b'0', 0),
	('Asia/Singapore', 'Singapore', b'0', 2),
	('Asia/Srednekolymsk', 'Asia/Srednekolymsk', b'0', 0),
	('Asia/Taipei', 'Asia/Taipei', b'0', 0),
	('Asia/Tashkent', 'Asia/Tashkent', b'0', 0),
	('Asia/Tbilisi', 'Asia/Tbilisi', b'0', 0),
	('Asia/Tehran', 'Asia/Tehran', b'0', 0),
	('Asia/Tel_Aviv', 'Asia/Tel_Aviv', b'0', 0),
	('Asia/Thimbu', 'Asia/Thimbu', b'0', 0),
	('Asia/Thimphu', 'Asia/Thimphu', b'0', 0),
	('Asia/Tokyo', 'Asia/Tokyo', b'0', 0),
	('Asia/Tomsk', 'Asia/Tomsk', b'0', 0),
	('Asia/Ujung_Pandang', 'Asia/Ujung_Pandang', b'0', 0),
	('Asia/Ulaanbaatar', 'Asia/Ulaanbaatar', b'0', 0),
	('Asia/Ulan_Bator', 'Asia/Ulan_Bator', b'0', 0),
	('Asia/Urumqi', 'Asia/Urumqi', b'0', 0),
	('Asia/Ust-Nera', 'Asia/Ust-Nera', b'0', 0),
	('Asia/Vientiane', 'Asia/Vientiane', b'0', 0),
	('Asia/Vladivostok', 'Asia/Vladivostok', b'0', 0),
	('Asia/Yakutsk', 'Asia/Yakutsk', b'0', 0),
	('Asia/Yangon', 'Asia/Yangon', b'0', 0),
	('Asia/Yekaterinburg', 'Asia/Yekaterinburg', b'0', 0),
	('Asia/Yerevan', 'Asia/Yerevan', b'0', 0),
	('Atlantic/Azores', 'Atlantic/Azores', b'0', 0),
	('Atlantic/Bermuda', 'Atlantic/Bermuda', b'0', 0),
	('Atlantic/Canary', 'Atlantic/Canary', b'0', 0),
	('Atlantic/Cape_Verde', 'Atlantic/Cape_Verde', b'0', 0),
	('Atlantic/Faeroe', 'Atlantic/Faeroe', b'0', 0),
	('Atlantic/Faroe', 'Atlantic/Faroe', b'0', 0),
	('Atlantic/Jan_Mayen', 'Atlantic/Jan_Mayen', b'0', 0),
	('Atlantic/Madeira', 'Atlantic/Madeira', b'0', 0),
	('Atlantic/Reykjavik', 'Atlantic/Reykjavik', b'0', 0),
	('Atlantic/Stanley', 'Atlantic/Stanley', b'0', 0),
	('Atlantic/St_Helena', 'Atlantic/St_Helena', b'0', 0),
	('Australia/ACT', 'Australia/ACT', b'0', 0),
	('Australia/Adelaide', 'Australia/Adelaide', b'0', 0),
	('Australia/Brisbane', 'Australia/Brisbane', b'0', 0),
	('Australia/Canberra', 'Australia/Canberra', b'0', 0),
	('Australia/Currie', 'Australia/Currie', b'0', 0),
	('Australia/Darwin', 'Australia/Darwin', b'0', 0),
	('Australia/Eucla', 'Australia/Eucla', b'0', 0),
	('Australia/Hobart', 'Australia/Hobart', b'0', 0),
	('Australia/LHI', 'Australia/LHI', b'0', 0),
	('Australia/Lindeman', 'Australia/Lindeman', b'0', 0),
	('Australia/Lord_Howe', 'Australia/Lord_Howe', b'0', 0),
	('Australia/Melbourne', 'Australia/Melbourne', b'0', 0),
	('Australia/North', 'Australia/North', b'0', 0),
	('Australia/NSW', 'Australia/NSW', b'0', 0),
	('Australia/Perth', 'Australia/Perth', b'0', 0),
	('Australia/Queensland', 'Australia/Queensland', b'0', 0),
	('Australia/South', 'Australia/South', b'0', 0),
	('Australia/Sydney', 'Australia/Sydney', b'0', 0),
	('Australia/Tasmania', 'Australia/Tasmania', b'0', 0),
	('Australia/Victoria', 'Australia/Victoria', b'0', 0),
	('Australia/West', 'Australia/West', b'0', 0),
	('Australia/Yancowinna', 'Australia/Yancowinna', b'0', 0),
	('Brazil/Acre', 'Brazil/Acre', b'0', 0),
	('Brazil/DeNoronha', 'Brazil/DeNoronha', b'0', 0),
	('Brazil/East', 'Brazil/East', b'0', 0),
	('Brazil/West', 'Brazil/West', b'0', 0),
	('Canada/Atlantic', 'Canada/Atlantic', b'0', 0),
	('Canada/Central', 'Canada/Central', b'0', 0),
	('Canada/Eastern', 'Canada/Eastern', b'0', 0),
	('Canada/Mountain', 'Canada/Mountain', b'0', 0),
	('Canada/Newfoundland', 'Canada/Newfoundland', b'0', 0),
	('Canada/Pacific', 'Canada/Pacific', b'0', 0),
	('Canada/Saskatchewan', 'Canada/Saskatchewan', b'0', 0),
	('Canada/Yukon', 'Canada/Yukon', b'0', 0),
	('Chile/Continental', 'Chile/Continental', b'0', 0),
	('Chile/EasterIsland', 'Chile/EasterIsland', b'0', 0),
	('Europe/Amsterdam', 'Europe/Amsterdam', b'0', 0),
	('Europe/Andorra', 'Europe/Andorra', b'0', 0),
	('Europe/Astrakhan', 'Europe/Astrakhan', b'0', 0),
	('Europe/Athens', 'Europe/Athens', b'0', 0),
	('Europe/Belfast', 'Europe/Belfast', b'0', 0),
	('Europe/Belgrade', 'Europe/Belgrade', b'0', 0),
	('Europe/Berlin', 'Europe/Berlin', b'0', 0),
	('Europe/Bratislava', 'Europe/Bratislava', b'0', 0),
	('Europe/Brussels', 'Europe/Brussels', b'0', 0),
	('Europe/Bucharest', 'Europe/Bucharest', b'0', 0),
	('Europe/Budapest', 'Europe/Budapest', b'0', 0),
	('Europe/Busingen', 'Europe/Busingen', b'0', 0),
	('Europe/Chisinau', 'Europe/Chisinau', b'0', 0),
	('Europe/Copenhagen', 'Europe/Copenhagen', b'0', 0),
	('Europe/Dublin', 'Europe/Dublin', b'0', 0),
	('Europe/Gibraltar', 'Europe/Gibraltar', b'0', 0),
	('Europe/Guernsey', 'Europe/Guernsey', b'0', 0),
	('Europe/Helsinki', 'Europe/Helsinki', b'0', 0),
	('Europe/Isle_of_Man', 'Europe/Isle_of_Man', b'0', 0),
	('Europe/Istanbul', 'Europe/Istanbul', b'0', 0),
	('Europe/Jersey', 'Europe/Jersey', b'0', 0),
	('Europe/Kaliningrad', 'Europe/Kaliningrad', b'0', 0),
	('Europe/Kiev', 'Europe/Kiev', b'0', 0),
	('Europe/Kirov', 'Europe/Kirov', b'0', 0),
	('Europe/Lisbon', 'Europe/Lisbon', b'0', 0),
	('Europe/Ljubljana', 'Europe/Ljubljana', b'0', 0),
	('Europe/London', 'United Kingdom', b'0', 9),
	('Europe/Luxembourg', 'Europe/Luxembourg', b'0', 0),
	('Europe/Madrid', 'Europe/Madrid', b'0', 0),
	('Europe/Malta', 'Europe/Malta', b'0', 0),
	('Europe/Mariehamn', 'Europe/Mariehamn', b'0', 0),
	('Europe/Minsk', 'Europe/Minsk', b'0', 0),
	('Europe/Monaco', 'Europe/Monaco', b'0', 0),
	('Europe/Moscow', 'Europe/Moscow', b'0', 0),
	('Europe/Nicosia', 'Europe/Nicosia', b'0', 0),
	('Europe/Oslo', 'Europe/Oslo', b'0', 0),
	('Europe/Paris', 'Europe/Paris', b'0', 0),
	('Europe/Podgorica', 'Europe/Podgorica', b'0', 0),
	('Europe/Prague', 'Europe/Prague', b'0', 0),
	('Europe/Riga', 'Europe/Riga', b'0', 0),
	('Europe/Rome', 'Europe/Rome', b'0', 0),
	('Europe/Samara', 'Europe/Samara', b'0', 0),
	('Europe/San_Marino', 'Europe/San_Marino', b'0', 0),
	('Europe/Sarajevo', 'Europe/Sarajevo', b'0', 0),
	('Europe/Saratov', 'Europe/Saratov', b'0', 0),
	('Europe/Simferopol', 'Europe/Simferopol', b'0', 0),
	('Europe/Skopje', 'Europe/Skopje', b'0', 0),
	('Europe/Sofia', 'Europe/Sofia', b'0', 0),
	('Europe/Stockholm', 'Europe/Stockholm', b'0', 0),
	('Europe/Tallinn', 'Europe/Tallinn', b'0', 0),
	('Europe/Tirane', 'Europe/Tirane', b'0', 0),
	('Europe/Tiraspol', 'Europe/Tiraspol', b'0', 0),
	('Europe/Ulyanovsk', 'Europe/Ulyanovsk', b'0', 0),
	('Europe/Uzhgorod', 'Europe/Uzhgorod', b'0', 0),
	('Europe/Vaduz', 'Europe/Vaduz', b'0', 0),
	('Europe/Vatican', 'Europe/Vatican', b'0', 0),
	('Europe/Vienna', 'Europe/Vienna', b'0', 0),
	('Europe/Vilnius', 'Europe/Vilnius', b'0', 0),
	('Europe/Volgograd', 'Europe/Volgograd', b'0', 0),
	('Europe/Warsaw', 'Europe/Warsaw', b'0', 0),
	('Europe/Zagreb', 'Europe/Zagreb', b'0', 0),
	('Europe/Zaporozhye', 'Europe/Zaporozhye', b'0', 0),
	('Europe/Zurich', 'Europe/Zurich', b'0', 0),
	('Indian/Antananarivo', 'Indian/Antananarivo', b'0', 0),
	('Indian/Chagos', 'Indian/Chagos', b'0', 0),
	('Indian/Christmas', 'Indian/Christmas', b'0', 0),
	('Indian/Cocos', 'Indian/Cocos', b'0', 0),
	('Indian/Comoro', 'Indian/Comoro', b'0', 0),
	('Indian/Kerguelen', 'Indian/Kerguelen', b'0', 0),
	('Indian/Mahe', 'Mahe', b'0', 10),
	('Indian/Maldives', 'Maldives', b'0', 11),
	('Indian/Mauritius', 'Mauritius', b'0', 21),
	('Indian/Mayotte', 'Indian/Mayotte', b'0', 0),
	('Indian/Reunion', 'Indian/Reunion', b'0', 0),
	('Mexico/BajaNorte', 'Mexico/BajaNorte', b'0', 0),
	('Mexico/BajaSur', 'Mexico/BajaSur', b'0', 0),
	('Mexico/General', 'Mexico/General', b'0', 0),
	('Pacific/Apia', 'Pacific/Apia', b'0', 0),
	('Pacific/Auckland', 'Pacific/Auckland', b'0', 0),
	('Pacific/Bougainville', 'Pacific/Bougainville', b'0', 0),
	('Pacific/Chatham', 'Pacific/Chatham', b'0', 0),
	('Pacific/Chuuk', 'Pacific/Chuuk', b'0', 0),
	('Pacific/Easter', 'Pacific/Easter', b'0', 0),
	('Pacific/Efate', 'Pacific/Efate', b'0', 0),
	('Pacific/Enderbury', 'Pacific/Enderbury', b'0', 0),
	('Pacific/Fakaofo', 'Pacific/Fakaofo', b'0', 0),
	('Pacific/Fiji', 'Pacific/Fiji', b'0', 0),
	('Pacific/Funafuti', 'Pacific/Funafuti', b'0', 0),
	('Pacific/Galapagos', 'Pacific/Galapagos', b'0', 0),
	('Pacific/Gambier', 'Pacific/Gambier', b'0', 0),
	('Pacific/Guadalcanal', 'Pacific/Guadalcanal', b'0', 0),
	('Pacific/Guam', 'Pacific/Guam', b'0', 0),
	('Pacific/Honolulu', 'Pacific/Honolulu', b'0', 0),
	('Pacific/Johnston', 'Pacific/Johnston', b'0', 0),
	('Pacific/Kiritimati', 'Pacific/Kiritimati', b'0', 0),
	('Pacific/Kosrae', 'Pacific/Kosrae', b'0', 0),
	('Pacific/Kwajalein', 'Pacific/Kwajalein', b'0', 0),
	('Pacific/Majuro', 'Pacific/Majuro', b'0', 0),
	('Pacific/Marquesas', 'Pacific/Marquesas', b'0', 0),
	('Pacific/Midway', 'Pacific/Midway', b'0', 0),
	('Pacific/Nauru', 'Pacific/Nauru', b'0', 0),
	('Pacific/Niue', 'Pacific/Niue', b'0', 0),
	('Pacific/Norfolk', 'Pacific/Norfolk', b'0', 0),
	('Pacific/Noumea', 'Pacific/Noumea', b'0', 0),
	('Pacific/Pago_Pago', 'Pacific/Pago_Pago', b'0', 0),
	('Pacific/Palau', 'Pacific/Palau', b'0', 0),
	('Pacific/Pitcairn', 'Pacific/Pitcairn', b'0', 0),
	('Pacific/Pohnpei', 'Pacific/Pohnpei', b'0', 0),
	('Pacific/Ponape', 'Pacific/Ponape', b'0', 0),
	('Pacific/Port_Moresby', 'Pacific/Port_Moresby', b'0', 0),
	('Pacific/Rarotonga', 'Pacific/Rarotonga', b'0', 0),
	('Pacific/Saipan', 'Pacific/Saipan', b'0', 0),
	('Pacific/Samoa', 'Pacific/Samoa', b'0', 0),
	('Pacific/Tahiti', 'Pacific/Tahiti', b'0', 0),
	('Pacific/Tarawa', 'Pacific/Tarawa', b'0', 0),
	('Pacific/Tongatapu', 'Pacific/Tongatapu', b'0', 0),
	('Pacific/Truk', 'Pacific/Truk', b'0', 0),
	('Pacific/Wake', 'Pacific/Wake', b'0', 0),
	('Pacific/Wallis', 'Pacific/Wallis', b'0', 0),
	('Pacific/Yap', 'Pacific/Yap', b'0', 0),
	('US/Alaska', 'US/Alaska', b'0', 0),
	('US/Aleutian', 'US/Aleutian', b'0', 0),
	('US/Arizona', 'US/Arizona', b'0', 0),
	('US/Central', 'US/Central', b'0', 0),
	('US/East-Indiana', 'US/East-Indiana', b'0', 0),
	('US/Eastern', 'US/Eastern', b'0', 0),
	('US/Hawaii', 'US/Hawaii', b'0', 0),
	('US/Indiana-Starke', 'US/Indiana-Starke', b'0', 0),
	('US/Michigan', 'US/Michigan', b'0', 0),
	('US/Mountain', 'US/Mountain', b'0', 0),
	('US/Pacific', 'US/Pacific', b'0', 0),
	('US/Pacific-New', 'US/Pacific-New', b'0', 0),
	('US/Samoa', 'US/Samoa', b'0', 0);

-- Dumping structure for table education-testifly.examanswer
CREATE TABLE IF NOT EXISTS `examanswer` (
  `answerId` varchar(50) NOT NULL,
  `questionId` varchar(50) NOT NULL,
  `textAnswer` text NOT NULL,
  `patternMode` varchar(20) NOT NULL DEFAULT 'Option',
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(200) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(100) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL DEFAULT '0',
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`answerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.examanswer: ~44 rows (approximately)
INSERT INTO `examanswer` (`answerId`, `questionId`, `textAnswer`, `patternMode`, `uploadFileDate`, `uploadFileFolderURL`, `uploadFileLastModifiedDate`, `uploadFileName`, `uploadFileNameForDisplay`, `uploadFileSize`, `uploadDocumentForType`, `createdDate`, `modifiedDate`, `createdBy`, `modifiedBy`, `status`) VALUES
	('1', '1', 'Panaji', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('10', '3', 'Chandigarh', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('11', '3', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('12', '3', 'Shillong', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('13', '4', 'Dehradun', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('14', '4', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('15', '4', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('16', '4', 'Chandigarh', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('17', '5', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('18', '5', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('19', '5', 'Chandigarh', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('2', '1', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('20', '5', 'Lakshadweep', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('21', '6', 'Bangalore', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('22', '6', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('23', '6', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('24', '6', 'Mysure', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('25', '7', 'Thiruvananthapuram', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('26', '7', 'Mysure', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('27', '7', 'Chennai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('28', '7', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('29', '8', 'Sikkim', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('3', '1', 'Chennai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('30', '8', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('31', '8', 'Chennai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('32', '8', 'Thiruvananthapuram', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('33', '9', 'Chennai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('34', '9', 'Thiruvananthapuram', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('35', '9', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('36', '9', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('37', '10', 'Panaji', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('38', '10', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('39', '10', 'Chennai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('4', '1', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('40', '10', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('41', '11', 'Kandha', 'Check', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('42', '11', 'Senthil', 'Check', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('43', '11', 'Velan', 'Check', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('44', '11', 'Sivan', 'Check', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('5', '2', 'Chennai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('6', '2', 'Chandigarh', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('7', '2', 'Mumbai', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('8', '2', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('9', '3', 'New Dilhi', 'Option', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1');

-- Dumping structure for table education-testifly.examconsumer
CREATE TABLE IF NOT EXISTS `examconsumer` (
  `consumerExamId` varchar(50) NOT NULL,
  `employeeId` varchar(50) DEFAULT NULL,
  `assessmentMode` varchar(50) NOT NULL DEFAULT 'Practise',
  `repoCollection` varchar(1000) NOT NULL,
  `assessmentStatus` varchar(50) NOT NULL DEFAULT 'Ready',
  `assignedDate` varchar(50) DEFAULT NULL,
  `noOfQuestions` int DEFAULT NULL,
  `assessmentData` json DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`consumerExamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.examconsumer: ~0 rows (approximately)

-- Dumping structure for table education-testifly.examexplanation
CREATE TABLE IF NOT EXISTS `examexplanation` (
  `explanationId` varchar(50) NOT NULL,
  `questionId` varchar(50) NOT NULL,
  `explanation` text NOT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(200) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(100) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL DEFAULT '0',
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`explanationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.examexplanation: ~0 rows (approximately)

-- Dumping structure for table education-testifly.examquestion
CREATE TABLE IF NOT EXISTS `examquestion` (
  `questionId` varchar(50) NOT NULL,
  `repoId` varchar(50) NOT NULL,
  `textQuestion` text NOT NULL,
  `chapterId` varchar(50) NOT NULL,
  `correctAnswers` varchar(50) NOT NULL DEFAULT '',
  `answerMode` varchar(50) NOT NULL DEFAULT 'Option',
  `markPerQuestion` decimal(3,1) NOT NULL DEFAULT '1.0',
  `negativeMarkPerQuestion` decimal(3,1) NOT NULL DEFAULT '1.0',
  `askedYears` varchar(100) DEFAULT NULL,
  `weightage` varchar(20) NOT NULL DEFAULT 'Default',
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(200) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(50) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(50) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL DEFAULT '0',
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.examquestion: ~11 rows (approximately)
INSERT INTO `examquestion` (`questionId`, `repoId`, `textQuestion`, `chapterId`, `correctAnswers`, `answerMode`, `markPerQuestion`, `negativeMarkPerQuestion`, `askedYears`, `weightage`, `uploadFileDate`, `uploadFileFolderURL`, `uploadFileNameForDisplay`, `uploadFileLastModifiedDate`, `uploadFileName`, `uploadFileSize`, `uploadDocumentForType`, `createdDate`, `modifiedDate`, `createdBy`, `modifiedBy`, `status`) VALUES
	('1', 'gk1', 'Which is the capital of Goa?', 'gk1', '1', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('10', 'gk4', 'what is capital of India', 'gk1', '40', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('11', 'gk4', 'Name of Murugan', 'gk1', '41,42,43', 'Check', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('2', 'gk1', 'Guess the capital city of the northern state of Punjab', 'gk1', '6', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('3', 'gk1', 'This city is the capital of the northeastern state of Meghalaya', 'gk1', '12', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('4', 'gk4', 'This is the capital city of the picturesque state of Uttarakhand', 'gk1', '13', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('5', 'gk4', 'This union territory has Kavaratti as its capital', 'gk1', '20', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('6', 'gk4', 'What is the capital of Karnataka?', 'gk1', '24', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('7', 'gk4', 'What is the capital of Kerala?', 'gk1', '25', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('8', 'gk4', 'Which of these states has Gangtok as its capital?', 'gk1', '29', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1'),
	('9', 'gk4', 'What is this capital of Tamilnadu?', 'gk1', '33', 'Option', 1.0, 1.0, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'1');

-- Dumping structure for table education-testifly.examquestionrepository
CREATE TABLE IF NOT EXISTS `examquestionrepository` (
  `repoId` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `style` varchar(50) NOT NULL DEFAULT 'Aptitude',
  `repoMode` varchar(50) NOT NULL DEFAULT 'Dedicated',
  `broadCast` bit(1) NOT NULL DEFAULT b'0',
  `producerId` varchar(50) NOT NULL,
  `patternId` varchar(50) NOT NULL DEFAULT 'DEFAULT',
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`repoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.examquestionrepository: ~2 rows (approximately)
INSERT INTO `examquestionrepository` (`repoId`, `name`, `description`, `style`, `repoMode`, `broadCast`, `producerId`, `patternId`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('gk1', 'gk', 'g knowledge', 'Aptitude', 'Dedicated', b'0', 'p1', 'DEFAULT', 'muthu', '0000-00-00 00:00:00', 'muthu', '0000-00-00 00:00:00', b'1'),
	('gk4', 'gk', 'g knowledge', 'GK', 'Dedicated', b'0', 'p1', 'DEFAULT', 'muthu', '0000-00-00 00:00:00', 'muthu', '0000-00-00 00:00:00', b'1');

-- Dumping structure for table education-testifly.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `maMenuId` varchar(10) NOT NULL,
  `parentId` varchar(10) DEFAULT NULL,
  `menuName` varchar(50) DEFAULT NULL,
  `cssClassIcon` varchar(100) DEFAULT NULL,
  `actionURL` varchar(200) DEFAULT NULL,
  `cssClass` varchar(100) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `haveSubMenu` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`maMenuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.menu: ~17 rows (approximately)
INSERT INTO `menu` (`maMenuId`, `parentId`, `menuName`, `cssClassIcon`, `actionURL`, `cssClass`, `level`, `haveSubMenu`) VALUES
	('M0001\r\n', 'M0001\r\n', 'Dashboard\r\n', 'icon-home\r\n', 'dc7161be3dbf2250c8954e560cc35060', 'title\r\n', 'A', b'0'),
	('M0002\r\n', 'M0002\r\n', 'Settings\r\n', 'icon-basket\r\n', 'javascript:;', 'title\r\n', 'B', b'1'),
	('M0003\r\n', 'M0002\r\n', 'Generate Key\r\n', 'icon-tag', 'javascript:loadContent(\'a9dc3f7729b51d26dc20af48c03dfee6\', \'\',\'false\');', 'title\r\n', 'BA', b'0'),
	('M0004', 'M0002\r\n', 'Messages\r\n', 'icon-handbag\r\n', 'javascript:loadContent(\'b849acc3458c9ba2d432bcc3aaba2708\', \'messages\',\'false\');', 'title\r\n', 'BB', b'0'),
	('M0005\r\n', 'M0005\r\n', 'Search\r\n', 'icon-pencil\r\n', 'javascript:;', 'title\r\n', 'C', b'1'),
	('M0007\r\n', 'M0005\r\n', 'Student Search\r\n', 'icon-bar-chart\r\n', 'javascript:loadContent(\'bcca2120ed2c00bcf732c74ca8026490/Consumer\', \'\',\'false\');', 'title\r\n', 'CA', b'0'),
	('M0007_1', 'M0005\r\n', 'Employee Search\r\n', 'icon-bar-chart\r\n', 'javascript:loadContent(\'bcca2120ed2c00bcf732c74ca8026490/Employee\', \'\',\'false\');', 'title\r\n', 'CB', b'0'),
	('M0008', 'M0005\r\n', 'Producer Search', 'icon-bar-chart\r\n', 'javascript:loadContent(\'bcca2120ed2c00bcf732c74ca8026490/Producer\', \'\',\'false\');', 'title\r\n', 'CC', b'0'),
	('M00081', 'M0005\r\n', 'Organisation Search', 'icon-bar-chart\r\n', 'javascript:loadContent(\'ba6443f8aa1c6e707ccb0cd4f03aa1e9\', \'\',\'false\');', 'title\r\n', 'CD', b'0'),
	('M00082', 'M0005\r\n', 'Assessment Question Search', 'fa fa-file-text', 'javascript:loadContent(\'d0f9600d5f8d0b22a87adf6d58b32059/Question\', \'\',\'false\');', 'title\r\n', 'CE', b'0'),
	('M00083', 'M0005\r\n', 'Question Search', 'fa fa-file-text', 'javascript:loadContent(\'bd73b98a32ed8d14650cb948dee7d408\', \'\',\'false\');', 'title\r\n', 'CG', b'0'),
	('M00084', 'M0005\r\n', 'Online Assessment Search', 'fa fa-file-text', 'javascript:loadContent(\'d0f9600d5f8d0b22a87adf6d58b32059/Online\', \'\',\'false\');', 'title\r\n', 'CF', b'0'),
	('M0009', 'M0009', 'Uploads', 'icon-bar-chart', 'javascript:;', 'title\r\n', 'D', b'1'),
	('M0010', 'M0009', 'E-Books', 'icon-tag', 'javascript:loadContent(\'e-books\',\'false\');', 'title\r\n', 'DA', b'0'),
	('M0011', 'M0009', 'E-BluePrints', 'icon-tag', 'javascript:loadContent(\'e-blueprint\',\'false\');', 'title\r\n', 'DB', b'0'),
	('M0012', 'M0009', 'E-KeyPoints', 'icon-tag', 'javascript:loadContent(\'e-keypoint\',\'false\');', 'title\r\n', 'DC', b'0'),
	('M0016', 'M0002\r\n', 'Information Alerts', 'icon-bar-chart\r\n', 'javascript:loadContent(\'information-alert\',\'false\');', 'title\r\n', 'BC', b'0');

-- Dumping structure for table education-testifly.menurole
CREATE TABLE IF NOT EXISTS `menurole` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `menuId` varchar(50) NOT NULL,
  `producerId` varchar(50) NOT NULL DEFAULT 'PRD000001',
  `roleId` varchar(50) NOT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.menurole: ~35 rows (approximately)
INSERT INTO `menurole` (`autoId`, `menuId`, `producerId`, `roleId`) VALUES
	(1, 'M0001\r\n', 'PRD000001', 'SuperAdminRole'),
	(2, 'M0002\r\n', 'PRD000001', 'SuperAdminRole'),
	(4, 'M0003\r\n', 'PRD000001', 'SuperAdminRole'),
	(5, 'M0004', 'PRD000001', 'SuperAdminRole'),
	(6, 'M0005\r\n', 'PRD000001', 'SuperAdminRole'),
	(8, 'M0007\r\n', 'PRD000001', 'SuperAdminRole'),
	(9, 'M0001\r\n', 'PRD000001', 'Consumer'),
	(10, 'M0002\r\n', 'PRD000001', 'Consumer'),
	(11, 'M0003\r\n', 'PRD000001', 'Consumer'),
	(12, 'M0004', 'PRD000001', 'Consumer'),
	(13, 'M0005\r\n', 'PRD000001', 'Consumer'),
	(15, 'M0007\r\n', 'PRD000001', 'Consumer'),
	(16, 'M0008', 'PRD000001', 'Consumer'),
	(17, 'M0009', 'PRD000001', 'Consumer'),
	(18, 'M0010', 'PRD000001', 'Consumer'),
	(19, 'M0011', 'PRD000001', 'Consumer'),
	(20, 'M0012', 'PRD000001', 'Consumer'),
	(21, 'M0016', 'PRD000001', 'Consumer'),
	(22, 'M0001\r\n', 'PRD000001', 'Employee'),
	(23, 'M0002\r\n', 'PRD000001', 'Employee'),
	(24, 'M0003\r\n', 'PRD000001', 'Employee'),
	(25, 'M0004', 'PRD000001', 'Employee'),
	(26, 'M0005\r\n', 'PRD000001', 'Employee'),
	(28, 'M0007\r\n', 'PRD000001', 'Employee'),
	(29, 'M0008', 'PRD000001', 'Employee'),
	(30, 'M0009', 'PRD000001', 'Employee'),
	(31, 'M0010', 'PRD000001', 'Employee'),
	(32, 'M0011', 'PRD000001', 'Employee'),
	(33, 'M0012', 'PRD000001', 'Employee'),
	(34, 'M0016', 'PRD000001', 'Employee'),
	(35, 'M00081', 'PRD000001', 'Employee'),
	(36, 'M0007_1', 'PRD000001', 'Employee'),
	(37, 'M00082', 'PRD000001', 'Employee'),
	(38, 'M00083', 'PRD000001', 'Employee'),
	(39, 'M00084', 'PRD000001', 'Employee');

-- Dumping structure for table education-testifly.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `messageId` varchar(50) NOT NULL,
  `messageName` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `messageType` varchar(50) DEFAULT 'SMS',
  `messageSubject` varchar(200) DEFAULT '',
  `deliveryDate` datetime DEFAULT NULL,
  `nextDeliveryDate` datetime DEFAULT NULL,
  `dataMapTemplateName` varchar(100) DEFAULT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.messages: ~20 rows (approximately)
INSERT INTO `messages` (`messageId`, `messageName`, `message`, `messageType`, `messageSubject`, `deliveryDate`, `nextDeliveryDate`, `dataMapTemplateName`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('MSG150207124354600', 'Testing', 'Dear  ${Users.usUserName}$  ( ${Users.usUserID}$)\r\nCandidates of AIPMT-2015 can avail corrections on particulars filled in the On-line Application form submitted \r\nfor the Test. For availing this facility, visit website www.aipmt.nic.in \r\nduring the period 4th to 18th Feb, 2015 or call EDUTEL ACADEMY-7401259090.\r\n', 'SMS', '', '2015-02-07 12:11:00', NULL, NULL, 'SuperAdmin', '2015-02-07 12:13:54', NULL, NULL, b'1'),
	('MSG150213093756622', 'CRASH COURSE', 'Dear ${Users.usUserName}$ (${Users.usUserID}$),Engineering & Medical entrance exams Coaching classes in near your locality for  \r\nJEE-MAIN,BITSAT,VIT,SRM,AMRITA,AIPMT,AIIMS,CMC,\r\nJIPMER,MANIPAL,ST.JOHNS,MGIMS to book your seats \r\ncall immediately @ 74012 59090 get FREE FULL YEAR SUPPORT PROGRAM & get CENTUM in your board exam. EDUTEL ACADEMY.\r\n ', 'SMS', '', '2015-02-13 21:06:00', NULL, NULL, 'SuperAdmin', '2015-02-13 21:07:56', NULL, NULL, b'1'),
	('MSG150629053623427', 'NDA', 'Dear ${Users.usUserName}$(${Users.usUserID}$), NDA (2015 - 2016) exam application form open date - June 20th 2015, Closing Date -17th July,\r\nDate of exam - 27th sep 2015. For more details visit your dashboard.Edutel Academy.     ', 'SMS', '', '2015-06-29 16:03:00', NULL, NULL, 'SuperAdmin', '2015-06-29 16:06:23', NULL, NULL, b'1'),
	('MSG150704042453086', 'FASHION', '\r\nDear  ${Users.usUserName}$ (${Users.usUserID}$), Information on Fashion Design has been published in your dashboard,Kindly visit your dashboard for more \r\ndetails.EDUTEL ACADEMY.  ', 'SMS', '', '2015-07-04 14:53:00', NULL, NULL, 'SuperAdmin', '2015-07-04 14:54:53', NULL, NULL, b'1'),
	('MSG150812121431995', 'AGRICULTURE', 'Dear ${Users.usUserName}$( ${Users.usUserID}$), Information on Agricultural research scientist has been published in your dashboard.\r\nKindly visit your dashboard for more details. EDUTEL ACADEMY.\r\n   ', 'SMS', '', '2015-08-12 10:43:00', NULL, NULL, 'SuperAdmin', '2015-08-12 10:44:31', NULL, NULL, b'1'),
	('MSG150812121550758', 'NUTRITIONIST', 'Dear ${Users.usUserName}$ (${Users.usUserID}$), Career related to nutritionist has been published in your dashboard. Kindly visit your dashboard for more \r\ndetails. EDUTEL ACADEMY.\r\n    ', 'SMS', '', '2015-08-12 10:45:00', NULL, NULL, 'SuperAdmin', '2015-08-12 10:45:50', NULL, NULL, b'1'),
	('MSG150812121802351', 'FORENSIC SCIENCE', 'Dear ${Users.usUserName}$ (${Users.usUserID}$), Career in forensic science has been published in your dashboard. Kindly visit your login for more \r\ndetails. EDUTEL ACADEMY.\r\n    ', 'SMS', '', '2015-08-12 10:46:00', NULL, NULL, 'SuperAdmin', '2015-08-12 10:48:02', NULL, NULL, b'1'),
	('MSG151018041333332', 'MANIPAL-2016', 'Dear ${Users.usUserName}$(${Users.usUserID}$), MANIPAL -(MU-OET-2016) Entrance Exam application form for B.TECH & MBBS is open now,closing date - 11.03.2016, EXAM DATES : 14th April to 15th May 2016,Application Cost -Rs.600/-, Entrance Fee - Rs.1400/-. kindly visit your dashboard for more details or  call @ 7401259090. EDUTEL ACADEMY.\r\n   ', 'SMS', '', '2015-10-18 14:41:00', NULL, NULL, 'SuperAdmin', '2015-10-18 14:43:33', NULL, NULL, b'1'),
	('MSG151117113721700', 'SRM - 2016', 'Dear ${Users.usUserName}$(${Users.usUserID}$),SRMJEEE-2015 Entrance Exam application form opened, closing date - 15.03.2016(Midnight),EXAM \r\nDATES - Online Mode : 19 to 25th Apr 2016, Form cost -Rs.1000/-. Please visit your dashboard for more Details.call @ 7401259090.EDUTEL ACADEMY.\r\n    ', 'SMS', '', '2015-11-18 11:06:00', NULL, NULL, 'SuperAdmin', '2015-11-18 11:07:21', NULL, NULL, b'1'),
	('MSG151117113859853', 'AMRITA - 2016', 'Dear ${Users.usUserName}$(${Users.usUserID}$), AMRITA Entrance Examination-Engineering 2016 has been opened, Last Date - 21st Mar 2016, Exam Date - 23 Apr 2016,Form Cost - Rs.1000/-. Please visit your dashboard for more Details.call @ 7401259090.EDUTEL ACADEMY.    ', 'SMS', '', '2015-11-18 11:07:00', NULL, NULL, 'SuperAdmin', '2015-11-18 11:08:59', NULL, NULL, b'1'),
	('MSG151126122109119', 'VIT-2016', 'Dear ${Users.usUserName}$(${Users.usUserID}$), VIT-2016 (ENGINEERING)  has been opened, Last Date - 29th  Feb 2016, Exam Date(online) - 6th to 17th Apr 2016,\r\nForm Cost - Rs.960/-. For details visit your dashboard. To apply  call @ 7401259090. EDUTEL ACADEMY.\r\n    ', 'SMS', '', '2015-11-26 11:50:00', NULL, NULL, 'SuperAdmin', '2015-11-26 11:51:09', NULL, NULL, b'1'),
	('MSG160603011658064', 'NEET II', '\r\nDear ${Users.usUserName}$(${Users.usUserID}$), As per the last news NEET is compulsory for all the private, Deemed & 15% Quota on all Govt. Medical colleges this year.From Next Year all Medical Admission is only through NEET ENTRANCE EXAM. EDUTEL ACADEMY.    ', 'SMS', '', '2016-06-03 11:45:00', NULL, NULL, 'SuperAdmin', '2016-06-03 11:46:58', NULL, NULL, b'1'),
	('UserIdPassword_Email', 'UserIdPassword_Email', '<html> <head> <body> <table cellpadding="25px;"  width="850px;"  > <tr>	<td><p ><input type="image" src="http://www.edutelacademy.com/images/png/edutellogo.png"></p><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial">Dear${Users.usUserName}$&nbsp;,</span></p><br><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial">Your account has been created successfully with Edutel Academy.</span></p><br><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial">Your USER ID is &nbsp;<b>${Users.usUserID}$</b></span></p><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial">Your PWD is&nbsp;&nbsp;<b>${Users.usUserPwd}$</b></span></p><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial">Help Desk - 7401259090</span></p><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial">Technical support -7299038080</span></p><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial">With Warm Regards,<br>Admin</span></p><p><span style="font-size:11pt;font-family:Trebuchet MS,Helvitica,Arial"><b>Edutel Academy</b><br>', 'Email', 'Welcome to EduTel Academy. User Login Credentials', '2015-01-01 00:00:00', NULL, NULL, 'SuperAdmin', '2015-01-01 00:00:00', 'SuperAdmin', '2015-01-01 00:00:00', b'1'),
	('UserIdPassword_SMS', 'UserIdPassword_SMS', 'Hi ${Users.usUserName}$, Thanks for registering with EDUTEL ACADEMY.Your User Id is ${Users.usUserId}$ and Password is ${Users.usUserPwd}$ . For more information contact our helpdesk 7401259090/email -admin@edutelacademy.com.', 'SMS', '', '2015-01-01 00:00:00', NULL, NULL, 'SuperAdmin', '2015-01-01 00:00:00', 'SuperAdmin', '2015-01-01 00:00:00', b'1'),
	('UserRegistrationReceipt_Email', 'UserRegistrationReceipt_Email', '<html><body> <table cellpadding="25px;"  width="850px;"  > <tr>	<td><p ><input type="image" src="http://www.edutelacademy.com/images/png/edutellogo.png"></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">Invoice(s) for this order in &nbsp;this email for any future reference.</span></p><br><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">PURCHASER NAME :</span></p><br><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.usUserName}$&nbsp;,</span></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;Address : &nbsp;&nbsp;&nbsp;${Users.usFatherName}$&nbsp;,</span></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.usAddress1}$&nbsp;,</span></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.usAddress2}$&nbsp;,</span></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.usLandMark}$&nbsp;,</span></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.usCity}$&nbsp;,&nbsp;&nbsp;&nbsp;${Users.usState}$&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;${Users.usPinCode}$&nbsp;&nbsp;&nbsp;.</span></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">CONTACT NO : &nbsp;&nbsp;&nbsp;${Users.usMobileNo}$&nbsp;&nbsp;&nbsp;.</span></p><br><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">PRODUCTS DELIVERED :</span></p><table rules="all" frame="box" width="850px;"><tr height="50px;" style="background-color:#ececec">	<td width="5%" align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;SNO&nbsp;</span> </td>	<td width="40%" align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">ITEM</span></td>	<td width="20%" align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">ORDER NO</span></td>	<td width="15%" align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">QUANTITY</span></td>	<td width="20%" align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">PRICE</span></td></tdead><tr height="90px;">	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">1</span></td>	<td align="left" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;Full year support Program ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œ Smart Learner </span></td>	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.serialKey.serialNo}$</span></td>	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">1</span></td>	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.serialKey.sellingAmount}$</span></td></tr><tr height="40px;">	<td align="center" valign="middle" colspan="3">&nbsp;</td>	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">TOTAL AMOUNT</span></td>	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.serialKey.sellingAmount}$</span></td></tr><tr height="70px;">	<td align="center" valign="middle" colspan="3">&nbsp;</td>	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">AMOUNT PAID</span></td>	<td align="center" valign="middle"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;&nbsp;&nbsp;${Users.serialKey.sellingAmount}$</span></td></tr></table><br><p ><span style="font-family:Trebuchet MS,Arial,sans-serif">Thankyou for registering with Edutel Academy.</span></p><p ><span style="font-family:Trebuchet MS,Arial,sans-serif">EdutelAcademy Team</span></p><p ><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">For any query or assistance, feel free to&nbsp;</span><a href="admin@edutelacademy.com" target="_blank"><span style="font-size:11pt;font-family:Trebuchet MS,Arial,sans-serif;">Contact Us</span></a>.</p><p ><span style="font-family:Trebuchet MS,Arial,sans-serif;font-size:11px;">DECLARATION</span></p><p ><span style="font-family:Trebuchet MS,Arial,sans-serif;font-size:11px;">We declare that this invoice shows actual price of the goods described inclusiveof taxes and that all particulars are true and correct.</span></p><p ><span style="font-family:Trebuchet MS,Arial,sans-serif;font-size:11px;">THIS ISA COMPUTER GENERATED INVOICE AND DOES NOT REQUIRE SIGNATURE</span></p><p ><span style="font-family:Trebuchet MS,Arial,sans-serif"><br></span></p></td></tr></table></body></html>', 'Email', 'EduTel Academy Invoice Order', '2015-01-01 00:00:00', NULL, NULL, 'SuperAdmin', '2015-01-01 00:00:00', 'SuperAdmin', '2015-01-01 00:00:00', b'1'),
	('UserRegistrationReceipt_SMS', 'UserRegistrationReceipt_SMS', 'Dear ${Users.usUserName}$(${Users.usUserId}$), your payment of Rs.${Users.serialKey.sellingAmount}$ has been received for Full Year support Program. you can contact our Relationship Manager - 044-4384 9090 for any technical/queries assistance.Edutel Academy.', 'SMS', '', '2015-01-01 00:00:00', NULL, NULL, 'SuperAdmin', '2015-01-01 00:00:00', 'SuperAdmin', '2015-01-01 00:00:00', b'1'),
	('UserRegistrationWelcome_Email', 'UserRegistrationWelcome_Email', '<html> <body>  <table cellpadding="25px;"  width="850px;"  > <tr>	<td><p><input type="image" src="http://www.edutelacademy.com/images/png/edutellogo.png"></p><br><p align="center" style="text-align:center"><span style="font-size:14pt;font-family:Trebuchet MS,Arial,sans-serif">Welcome To EduTel Academy Online sg_educational Program</span></p><br><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif;font-weight:bold;">Ref : EA/WL/${Users.serialKey.serialNo}$</span></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif;font-weight:bold;">Date : ${Users.usCreatedDate}$</span></p><br><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif;font-weight:bold;">Dear&nbsp; ${Users.usUserName}$,</span></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">We are extremely happy to welcome you to Edutel Academy.</span></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">You have been enrolled under the 12th Std Full year support program ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œ SMART LEARNER.</span></p><br><p><b><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">Enrollment Details :</span></b></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">Batch&nbsp; : <b>${Users.serialKey.serialBatch}$</b></span></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">Register No : <b>${Users.usUserID}$</b></span></p><br><p><b><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">Program includes academic and career support:</span></b></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">Kindly note the following : </span></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">You will be receiving 10 offline test series covering XII std syllabus. Answer each modules in a white sheet and mention your Reg no. in each page and send to your nearest center. Our teachers will evaluate and send it back to you.</span></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">You will receive all other service like information updates, MCQÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢s, e-book, key point, query box, library, academy test, toppers club,weekly planner,smart guide,10 years Model question paper with solutions, compulsory questions,Entrance Exam Cracker,through online only i.e.through your student corner.</span></p><p><span style="font-size:12pt;font-family:Trebuchet MS,Arial,sans-serif">PMT Analysis will be done only in the Month of January, you must be present during the test date, the test date cannot be altered. All Application form will be delivered at your door step only by your request [ONLY FORM COST MUST BE BARRED EXTRA].</span></p><p><b><span style="font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;</span></b></p><p><b><span style="font-family:Trebuchet MS,Arial,sans-serif;">DISCLOSURE</span></b><span style="font-family:Trebuchet MS,Arial,sans-serif;"> : &nbsp;DO-NOT-SHARE yourregister number with others, if shared it will identify your IP address and your user name will get deactivated automatically.</span></p><p><span style="font-size:10pt;font-family:Trebuchet MS,Arial,sans-serif;">&nbsp;</span></p><p><span style="font-size:10pt;font-family:Trebuchet MS,Arial,sans-serif;">This is computer generated letter, signature is not required.</span></p></div></td> </tr> </table> </body></html>', 'Email', 'Welcome To EduTel Academy', '2015-02-03 18:10:17', NULL, NULL, 'SuperAdmin', '2015-02-03 18:10:38', 'SuperAdmin', '2015-02-03 18:11:05', b'1'),
	('UserRegistration_Email_Admin', 'UserRegistration_Email_Admin', '<html><head><body><table cellpadding="25px;" width="850px;"><tr><td><p><input type="image" src="http://www.edutelacademy.com/images/png/edutellogo.png"></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Dear Admin,</span></p> <br><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">New User has been registered with Edutel Academy.</span></p> <br><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Registered User Id is &nbsp;<b style="color:#0000FF">${Users.usUserID}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Registered User Name is &nbsp;<b style="color:#0000FF">${Users.usUserName}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">User Mobile No is &nbsp;<b style="color:#0000FF">${Users.usMobileNo}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">School Name is &nbsp;<b style="color:#0000FF">${Users.school.scSchoolName}$,&nbsp;${Users.school.scCity}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Batch is &nbsp;<b style="color:#0000FF">${Users.usBatch}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Serial Key Promotional Code is &nbsp;<b style="color:#0000FF">${Users.serialKey.serialPromo}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Serial Key Sold Amount is &nbsp;<b style="color:#0000FF">${Users.serialKey.sellingAmount}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Serial Key Sold by &nbsp;<b style="color:#0000FF">${Users.serialKey.serialKeyUserMap.users.usUserName}$,&nbsp;${Users.serialKey.createdUser.usCity}$</b></span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Help Desk - 7401259090</span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">Technical support -7299038080</span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial">By,<br>Admin</span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Helvitica, Arial"><b style="color:#0000FF">Edutel Academy</b><br></td></tr></table><br><p><span style="font-family: Trebuchet MS, Arial, sans-serif">Thankyou for registering with Edutel Academy.</span></p><p><span style="font-family: Trebuchet MS, Arial, sans-serif">EdutelAcademy Team</span></p><p><span style="font-size: 11pt; font-family: Trebuchet MS, Arial, sans-serif;">For any query or assistance, feel free to&nbsp;</span><ahref="admin@edutelacademy.com" target="_blank"><span style="font-size: 11pt; font-family: Trebuchet MS, Arial, sans-serif;">Contact Us</span></a></p></td></tr></table></body></html>', 'Email', 'New User Registration in EduTel Academy Notification', '2015-01-01 00:00:00', NULL, NULL, 'SuperAdmin', '2015-01-01 00:00:00', 'SuperAdmin', '2015-01-01 00:00:00', b'1'),
	('User_Create_Admin', 'User_Create_Admin', '<html>\r\n\r\n<head>\r\n  <title>HatchBird - Confirm your account!</title>\r\n  <style>\r\n    \r\n      	body{\r\n      		background: #ffffff;\r\n      		margin: 0px;\r\n      		text-align: center;\r\n      		font-family: \'Avenir\', \'Open Sans\', Arial, sans-serif;\r\n      	}\r\n      	.head{\r\n      		background: #488dfb;\r\n      		color: #ffffff;\r\n      	}\r\n      \r\n      	.head h1{\r\n      		font-size: 50px;\r\n      		font-weight: normal;\r\n      		line-height: 100px;\r\n      		margin-top: 100px;\r\n      	}\r\n      \r\n      	.button{\r\n      		background: #39ce00;\r\n      		color: #ffffff;\r\n      		line-height: 50px;\r\n      		text-decoration: none;\r\n      		text-align: center;\r\n      		margin-top: 50px;\r\n      		margin-bottom: 50px;\r\n      	}\r\n      \r\n      	.button a{\r\n      		color: #ffffff;\r\n      		text-decoration: none;\r\n      	}\r\n      	a{ color: #fff; } \r\n      	p a{ color: #565656; } \r\n      	.black a{ color: #000; }\r\n  </style>\r\n  <link href=\'https://fonts.googleapis.com/css?family=Open+Sans\' rel=\'stylesheet\' type=\'text/css\'>\r\n</head>\r\n\r\n<body bgcolor="#ffffff">\r\n  <table bgcolor="#efefef" cellpadding="0" cellspacing="0" border-collapse="collapse" width="100%">\r\n    <tr>\r\n      <td align="center" style="padding: 30px;">\r\n        <table bgcolor="#efefef" cellpadding="0" cellspacing="0" border-collapse="collapse" width="700px">\r\n          <tr>\r\n\r\n            <td align="center">\r\n              <table bgcolor="#efefef" cellpadding="0" cellspacing="0" border-collapse="collapse" width="100%">\r\n                <tr>\r\n                  <td width="50%" style="text-transform: uppercase; color: #868686; font-weight: bold;">$todayDate</td>\r\n                  <td width="50%" style="text-align: right;">\r\n                    <!--<a href="#" style="color: #868686;">View in Browser</a>-->\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n              <img src="http://localhost:8090/edutel/academia/img/home2/logo-default.png" alt="HatchBird" border="0" height="50" style="margin-top: 50px; margin-bottom: 50px;" />\r\n              <table bgcolor="#488dfb" class="head" style="background: #488dfb;" cellpadding="0" cellspacing="0" border="0" border-collapse="collapse" width="100%">\r\n                <tr>\r\n                  <td style="text-align: center;" colspan="3">\r\n                    <h1>Welcome to HatchBird</h1>\r\n\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td colspan="3" style="padding: 0px 80px; font-size: 20px; text-align: center;">Hi $user.usUserName,<br Welcome to HatchBird,<br>please confirm your email address to get started.</td>\r\n                </tr>\r\n                <tr>\r\n                  <td width="30%">&nbsp;</td>\r\n                  <td style="text-align: center;" width="40%">\r\n                    <table cellpadding="0" cellspacing="0" border-collapse="collapse" class="button" width="100%">\r\n                      <tr>\r\n                        <td>\r\n                          <a href="#" style="font-size: 15px;">Confirm my email</a>\r\n                        </td>\r\n                      </tr>\r\n                    </table>\r\n                  </td>\r\n                  <td width="30%">&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n              </table>\r\n              <table cellpadding="0" cellspacing="0" border="0" border-collapse="collapse" width="100%">\r\n                <tr>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n              </table>\r\n              <table bgcolor="#ffffff" class="head" style="background: #ffffff;" cellpadding="0" cellspacing="0" border="0" border-collapse="collapse" width="100%">\r\n                <tr>\r\n                  <td style="text-align: center;" colspan="3">\r\n                    <h1 style="color: #000000">Questions?</h1>\r\n\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td colspan="3" style="padding: 0px 80px; font-size: 20px; text-align: center; color: #595f63;  font-size: 20px;">If you have any questions about HatchBird please donÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢t hesitate to get in touch.</td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="padding: 40px;" align="center">\r\n                    <a href="mailto:$producerAdminEmailId" style="color: #488dfb; text-decoration: none; margin-bottom: 40px; font-size: 20px;">$producerAdminEmailId</a>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n              </table>\r\n            </td>\r\n          </tr>\r\n        </table>\r\n      </td>\r\n      <td>&nbsp;</td>\r\n    </tr>\r\n    <tr>\r\n      <td>&nbsp;</td>\r\n    </tr>\r\n  </table>\r\n  <table width="100%" bgcolor="#ffffff" style="background: #ffffff;" cellpadding="0" cellspacing="0" border="0" border-collapse="collapse" width="100%">\r\n    <tr>\r\n      <td>&nbsp;</td>\r\n    </tr>\r\n    <tr>\r\n      <td align="center">\r\n        <table width="600">\r\n          <tr>\r\n            <td style="font-size: 14px;" class="black">This email was sent to xxxxxx@xxxxxxxxx.com</td>\r\n            <td style="text-align: right;">\r\n              <a href="#" style="color: #000; text-decoration: none; font-size: 14px;">Unsubscribe</a>\r\n            </td>\r\n          </tr>\r\n        </table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td>&nbsp;</td>\r\n    </tr>\r\n  </table>\r\n  \r\n</body>\r\n\r\n</html>', 'Email', 'New User Registeration  in EduTel Academy', '2017-09-24 12:00:12', NULL, NULL, 'SuperAdmin', '2017-09-24 12:00:49', 'SuperAdmin', '2017-09-24 12:00:32', b'1'),
	('User_Reset_Password', 'User_Reset_Password', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n  <head>\r\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\r\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\r\n    <title>Set up a new password for EduTel Academy</title>\r\n    <!-- \r\n    The style block is collapsed on page load to save you some scrolling.\r\n    Postmark automatically inlines all CSS properties for maximum email client \r\n    compatibility. You can just update styles here, and Postmark does the rest.\r\n    -->\r\n    <style type="text/css" rel="stylesheet" media="all">\r\n    /* Base ------------------------------ */\r\n    \r\n    *:not(br):not(tr):not(html) {\r\n      font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif;\r\n      box-sizing: border-box;\r\n    }\r\n    \r\n    body {\r\n      width: 100% !important;\r\n      height: 100%;\r\n      margin: 0;\r\n      line-height: 1.4;\r\n      background-color: #F2F4F6;\r\n      color: #74787E;\r\n      -webkit-text-size-adjust: none;\r\n    }\r\n    \r\n    p,\r\n    ul,\r\n    ol,\r\n    blockquote {\r\n      line-height: 1.4;\r\n      text-align: left;\r\n    }\r\n    \r\n    a {\r\n      color: #3869D4;\r\n    }\r\n    \r\n    a img {\r\n      border: none;\r\n    }\r\n    \r\n    td {\r\n      word-break: break-word;\r\n    }\r\n    /* Layout ------------------------------ */\r\n    \r\n    .email-wrapper {\r\n      width: 100%;\r\n      margin: 0;\r\n      padding: 0;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n      background-color: #F2F4F6;\r\n    }\r\n    \r\n    .email-content {\r\n      width: 100%;\r\n      margin: 0;\r\n      padding: 0;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n    }\r\n    /* Masthead ----------------------- */\r\n    \r\n    .email-masthead {\r\n      padding: 25px 0;\r\n      text-align: center;\r\n    }\r\n    \r\n    .email-masthead_logo {\r\n      width: 94px;\r\n    }\r\n    \r\n    .email-masthead_name {\r\n      font-size: 16px;\r\n      font-weight: bold;\r\n      color: #bbbfc3;\r\n      text-decoration: none;\r\n      text-shadow: 0 1px 0 white;\r\n    }\r\n    /* Body ------------------------------ */\r\n    \r\n    .email-body {\r\n      width: 100%;\r\n      margin: 0;\r\n      padding: 0;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n      border-top: 1px solid #EDEFF2;\r\n      border-bottom: 1px solid #EDEFF2;\r\n      background-color: #FFFFFF;\r\n    }\r\n    \r\n    .email-body_inner {\r\n      width: 570px;\r\n      margin: 0 auto;\r\n      padding: 0;\r\n      -premailer-width: 570px;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n      background-color: #FFFFFF;\r\n    }\r\n    \r\n    .email-footer {\r\n      width: 570px;\r\n      margin: 0 auto;\r\n      padding: 0;\r\n      -premailer-width: 570px;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n      text-align: center;\r\n    }\r\n    \r\n    .email-footer p {\r\n      color: #AEAEAE;\r\n    }\r\n    \r\n    .body-action {\r\n      width: 100%;\r\n      margin: 30px auto;\r\n      padding: 0;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n      text-align: center;\r\n    }\r\n    \r\n    .body-sub {\r\n      margin-top: 25px;\r\n      padding-top: 25px;\r\n      border-top: 1px solid #EDEFF2;\r\n    }\r\n    \r\n    .content-cell {\r\n      padding: 35px;\r\n    }\r\n    \r\n    .preheader {\r\n      display: none !important;\r\n      visibility: hidden;\r\n      mso-hide: all;\r\n      font-size: 1px;\r\n      line-height: 1px;\r\n      max-height: 0;\r\n      max-width: 0;\r\n      opacity: 0;\r\n      overflow: hidden;\r\n    }\r\n    /* Attribute list ------------------------------ */\r\n    \r\n    .attributes {\r\n      margin: 0 0 21px;\r\n    }\r\n    \r\n    .attributes_content {\r\n      background-color: #EDEFF2;\r\n      padding: 16px;\r\n    }\r\n    \r\n    .attributes_item {\r\n      padding: 0;\r\n    }\r\n    /* Related Items ------------------------------ */\r\n    \r\n    .related {\r\n      width: 100%;\r\n      margin: 0;\r\n      padding: 25px 0 0 0;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n    }\r\n    \r\n    .related_item {\r\n      padding: 10px 0;\r\n      color: #74787E;\r\n      font-size: 15px;\r\n      line-height: 18px;\r\n    }\r\n    \r\n    .related_item-title {\r\n      display: block;\r\n      margin: .5em 0 0;\r\n    }\r\n    \r\n    .related_item-thumb {\r\n      display: block;\r\n      padding-bottom: 10px;\r\n    }\r\n    \r\n    .related_heading {\r\n      border-top: 1px solid #EDEFF2;\r\n      text-align: center;\r\n      padding: 25px 0 10px;\r\n    }\r\n    /* Discount Code ------------------------------ */\r\n    \r\n    .discount {\r\n      width: 100%;\r\n      margin: 0;\r\n      padding: 24px;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n      background-color: #EDEFF2;\r\n      border: 2px dashed #9BA2AB;\r\n    }\r\n    \r\n    .discount_heading {\r\n      text-align: center;\r\n    }\r\n    \r\n    .discount_body {\r\n      text-align: center;\r\n      font-size: 15px;\r\n    }\r\n    /* Social Icons ------------------------------ */\r\n    \r\n    .social {\r\n      width: auto;\r\n    }\r\n    \r\n    .social td {\r\n      padding: 0;\r\n      width: auto;\r\n    }\r\n    \r\n    .social_icon {\r\n      height: 20px;\r\n      margin: 0 8px 10px 8px;\r\n      padding: 0;\r\n    }\r\n    /* Data table ------------------------------ */\r\n    \r\n    .purchase {\r\n      width: 100%;\r\n      margin: 0;\r\n      padding: 35px 0;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n    }\r\n    \r\n    .purchase_content {\r\n      width: 100%;\r\n      margin: 0;\r\n      padding: 25px 0 0 0;\r\n      -premailer-width: 100%;\r\n      -premailer-cellpadding: 0;\r\n      -premailer-cellspacing: 0;\r\n    }\r\n    \r\n    .purchase_item {\r\n      padding: 10px 0;\r\n      color: #74787E;\r\n      font-size: 15px;\r\n      line-height: 18px;\r\n    }\r\n    \r\n    .purchase_heading {\r\n      padding-bottom: 8px;\r\n      border-bottom: 1px solid #EDEFF2;\r\n    }\r\n    \r\n    .purchase_heading p {\r\n      margin: 0;\r\n      color: #9BA2AB;\r\n      font-size: 12px;\r\n    }\r\n    \r\n    .purchase_footer {\r\n      padding-top: 15px;\r\n      border-top: 1px solid #EDEFF2;\r\n    }\r\n    \r\n    .purchase_total {\r\n      margin: 0;\r\n      text-align: right;\r\n      font-weight: bold;\r\n      color: #2F3133;\r\n    }\r\n    \r\n    .purchase_total--label {\r\n      padding: 0 15px 0 0;\r\n    }\r\n    /* Utilities ------------------------------ */\r\n    \r\n    .align-right {\r\n      text-align: right;\r\n    }\r\n    \r\n    .align-left {\r\n      text-align: left;\r\n    }\r\n    \r\n    .align-center {\r\n      text-align: center;\r\n    }\r\n    /*Media Queries ------------------------------ */\r\n    \r\n    @media only screen and (max-width: 600px) {\r\n      .email-body_inner,\r\n      .email-footer {\r\n        width: 100% !important;\r\n      }\r\n    }\r\n    \r\n    @media only screen and (max-width: 500px) {\r\n      .button {\r\n        width: 100% !important;\r\n      }\r\n    }\r\n    /* Buttons ------------------------------ */\r\n    \r\n    .button {\r\n      background-color: #3869D4;\r\n      border-top: 10px solid #3869D4;\r\n      border-right: 18px solid #3869D4;\r\n      border-bottom: 10px solid #3869D4;\r\n      border-left: 18px solid #3869D4;\r\n      display: inline-block;\r\n      color: #FFF;\r\n      text-decoration: none;\r\n      border-radius: 3px;\r\n      box-shadow: 0 2px 3px rgba(0, 0, 0, 0.16);\r\n      -webkit-text-size-adjust: none;\r\n    }\r\n    \r\n    .button--green {\r\n      background-color: #22BC66;\r\n      border-top: 10px solid #22BC66;\r\n      border-right: 18px solid #22BC66;\r\n      border-bottom: 10px solid #22BC66;\r\n      border-left: 18px solid #22BC66;\r\n    }\r\n    \r\n    .button--red {\r\n      background-color: #FF6136;\r\n      border-top: 10px solid #FF6136;\r\n      border-right: 18px solid #FF6136;\r\n      border-bottom: 10px solid #FF6136;\r\n      border-left: 18px solid #FF6136;\r\n    }\r\n    /* Type ------------------------------ */\r\n    \r\n    h1 {\r\n      margin-top: 0;\r\n      color: #2F3133;\r\n      font-size: 19px;\r\n      font-weight: bold;\r\n      text-align: left;\r\n    }\r\n    \r\n    h2 {\r\n      margin-top: 0;\r\n      color: #2F3133;\r\n      font-size: 16px;\r\n      font-weight: bold;\r\n      text-align: left;\r\n    }\r\n    \r\n    h3 {\r\n      margin-top: 0;\r\n      color: #2F3133;\r\n      font-size: 14px;\r\n      font-weight: bold;\r\n      text-align: left;\r\n    }\r\n    \r\n    p {\r\n      margin-top: 0;\r\n      color: #74787E;\r\n      font-size: 16px;\r\n      line-height: 1.5em;\r\n      text-align: left;\r\n    }\r\n    \r\n    p.sub {\r\n      font-size: 12px;\r\n    }\r\n    \r\n    p.center {\r\n      text-align: center;\r\n    }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <span class="preheader">Use this link to reset your password. The link is only valid for 10 minutes.</span>\r\n    <table class="email-wrapper" width="100%" cellpadding="0" cellspacing="0">\r\n      <tr>\r\n        <td align="center">\r\n          <table class="email-content" width="100%" cellpadding="0" cellspacing="0">\r\n            <tr>\r\n              <td class="email-masthead">\r\n                <a href="https://example.com" class="email-masthead_name">EduTel Academy sg_educational Solutions </a>\r\n              </td>\r\n            </tr>\r\n            <!-- Email Body -->\r\n            <tr>\r\n              <td class="email-body" width="100%" cellpadding="0" cellspacing="0">\r\n                <table class="email-body_inner" align="center" width="570" cellpadding="0" cellspacing="0">\r\n                  <!-- Body content -->\r\n                  <tr>\r\n                    <td class="content-cell">\r\n                      <h1>Hi $user.usUserName,</h1>\r\n                      <p>You recently requested to reset your password for your EduTel Academy account. Use the button below to reset it. <strong>This password reset is only valid for the next 10 minutes.</strong></p>\r\n                      <!-- Action -->\r\n                      <table class="body-action" align="center" width="100%" cellpadding="0" cellspacing="0">\r\n                        <tr>\r\n                          <td align="center">\r\n                            <!-- Border based button\r\n                       https://litmus.com/blog/a-guide-to-bulletproof-buttons-in-email-design -->\r\n                            <table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n                              <tr>\r\n                                <td align="center">\r\n                                  <table border="0" cellspacing="0" cellpadding="0">\r\n                                    <tr>\r\n                                      <td>\r\n                                        <a href="$tokenURL" class="button button--green" target="_blank">Reset your password</a>\r\n                                      </td>\r\n                                    </tr>\r\n                                  </table>\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                      <p>For security, this request was received from a {{operating_system}} device using {{browser_name}}. If you did not request a password reset, please ignore this email or <a href="{{support_url}}">contact support</a> if you have questions.</p>\r\n                      <p>Thanks,\r\n                        <br>The EduTel Admin Team</p>\r\n                      <!-- Sub copy -->\r\n                      <table class="body-sub">\r\n                        <tr>\r\n                          <td>\r\n                            <p class="sub">If youÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢re having trouble with the button above, copy and paste the URL below into your web browser.</p>\r\n                            <p class="sub">$tokenURL</p>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </td>\r\n                  </tr>\r\n                </table>\r\n              </td>\r\n            </tr>\r\n            <tr>\r\n              <td>\r\n                <table class="email-footer" align="center" width="570" cellpadding="0" cellspacing="0">\r\n                  <tr>\r\n                    <td class="content-cell" align="center">\r\n                      <p class="sub align-center">&copy; 2017 EduTel Academy. All rights reserved.</p>\r\n                      <p class="sub align-center">\r\n                        EduTel Academy\r\n                        <br>1234 Street Rd.\r\n                        <br>Suite 1234\r\n                      </p>\r\n                    </td>\r\n                  </tr>\r\n                </table>\r\n              </td>\r\n            </tr>\r\n          </table>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>', 'Email', 'EduTel Password Reset', '2017-09-24 12:00:12', NULL, NULL, 'SuperAdmin', '2017-09-24 12:00:49', 'SuperAdmin', '2017-09-24 12:00:32', b'1');

-- Dumping structure for table education-testifly.messagesusermapping
CREATE TABLE IF NOT EXISTS `messagesusermapping` (
  `autoId` int NOT NULL,
  `messageId` varchar(50) NOT NULL,
  `messageStatus` varchar(50) NOT NULL,
  `deliveryDateTime` varchar(50) NOT NULL,
  `retryCount` int NOT NULL,
  `receiptant` blob NOT NULL,
  `dataObject` blob NOT NULL,
  `attachmentObject` blob NOT NULL,
  `selfDelete` bit(1) NOT NULL DEFAULT b'0',
  `createdBy` varchar(50) NOT NULL DEFAULT '0',
  `modifiedBy` varchar(50) NOT NULL DEFAULT '0',
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.messagesusermapping: ~0 rows (approximately)

-- Dumping structure for table education-testifly.organisation
CREATE TABLE IF NOT EXISTS `organisation` (
  `organisationId` varchar(50) NOT NULL,
  `organisationName` varchar(100) DEFAULT NULL,
  `organisationType` varchar(20) DEFAULT NULL,
  `producerId` varchar(50) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT 'IN',
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`organisationId`),
  KEY `FK_organisation_country` (`country`),
  KEY `FK_organisation_producers` (`producerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.organisation: ~5 rows (approximately)
INSERT INTO `organisation` (`organisationId`, `organisationName`, `organisationType`, `producerId`, `country`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('ORG000001', 'Rosily Higher Sec. School', 'School', 'PRD000001', 'IN', 'PRDADM0001', '2018-01-04 10:47:22', NULL, NULL, b'1'),
	('ORG000002', 'DAV Higher Sec. School', 'School', 'PRD000001', 'IN', 'PRDADM0001', '2018-01-04 10:47:22', NULL, NULL, b'1'),
	('ORG000003', 'Prince Higher Sec. School', 'School', 'PRD000001', 'IN', 'PRDADM0001', '2018-01-04 10:47:22', NULL, NULL, b'1'),
	('ORG000004', 'Sundaravalli Higher Sec. School', 'School', 'PRD000001', 'IN', 'PRDADM0001', '2018-01-04 10:47:22', NULL, NULL, b'1'),
	('ORG000005', 'Velammal Higher Sec. School', 'School', 'PRD000001', 'IN', 'PRDADM0001', '2018-01-04 10:47:22', NULL, NULL, b'1');

-- Dumping structure for table education-testifly.organisationaddress
CREATE TABLE IF NOT EXISTS `organisationaddress` (
  `addressId` varchar(50) NOT NULL,
  `organisationId` varchar(50) DEFAULT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `addressLine3` varchar(50) DEFAULT NULL,
  `addressType` varchar(50) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT 'No State',
  `country` varchar(50) DEFAULT 'IN',
  `pincode` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobileNo` bigint DEFAULT NULL,
  `alternateMobileNo` bigint DEFAULT NULL,
  `whatsAppMobileNo` bigint DEFAULT NULL,
  `primaryPhoneNo` bigint DEFAULT NULL,
  `phoneNo1` bigint DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `FK_organisationaddress_state` (`state`),
  KEY `FK_organisationaddress_country` (`country`),
  KEY `FK_organisationaddress_organisation` (`organisationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.organisationaddress: ~0 rows (approximately)

-- Dumping structure for table education-testifly.organisationattachments
CREATE TABLE IF NOT EXISTS `organisationattachments` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `organisationId` varchar(50) DEFAULT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(500) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(100) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL,
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.organisationattachments: ~0 rows (approximately)

-- Dumping structure for table education-testifly.portlets
CREATE TABLE IF NOT EXISTS `portlets` (
  `portletId` varchar(50) NOT NULL,
  `portletName` varchar(50) NOT NULL,
  `portletBeanName` varchar(50) NOT NULL,
  `portletTemplatePath` varchar(100) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.portlets: ~9 rows (approximately)
INSERT INTO `portlets` (`portletId`, `portletName`, `portletBeanName`, `portletTemplatePath`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('PRT000001', 'Login Logout Information', 'org.hbs.sg.portlet.executors.LoginLogoutPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000002', 'Activity Information', 'org.hbs.sg.portlet.executors.ActivityPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000003', 'Assessment Information', 'org.hbs.sg.portlet.executors.AssessmentPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000004', 'Calendar Information', 'org.hbs.sg.portlet.executors.CalendarPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000005', 'Discussion Information', 'org.hbs.sg.portlet.executors.DiscussionPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000006', 'Notifications Information', 'org.hbs.sg.portlet.executors.NotificationsPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000007', 'Practise Information', 'org.hbs.sg.portlet.executors.PractiseExamPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000008', 'Report Card Information', 'org.hbs.sg.portlet.executors.ReportCardPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1'),
	('PRT000009', 'Users Information', 'org.hbs.sg.portlet.executors.UsersPortlet', '../../jsp/content/portlets/login-pt.jsp', 'SuperAdmin', '2018-01-04 22:45:31', NULL, NULL, b'1');

-- Dumping structure for table education-testifly.portletsusersroles
CREATE TABLE IF NOT EXISTS `portletsusersroles` (
  `ptAutoId` int NOT NULL AUTO_INCREMENT,
  `portletId` varchar(50) NOT NULL,
  `autoId` int NOT NULL,
  `status` bit(1) DEFAULT b'1',
  `order` int NOT NULL,
  PRIMARY KEY (`ptAutoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.portletsusersroles: ~0 rows (approximately)

-- Dumping structure for table education-testifly.producers
CREATE TABLE IF NOT EXISTS `producers` (
  `producerId` varchar(50) NOT NULL,
  `producerName` varchar(50) DEFAULT NULL,
  `pwdExpiryDays` datetime DEFAULT NULL,
  `domainContext` varchar(100) DEFAULT NULL,
  `employeeId` varchar(50) DEFAULT NULL,
  `isPrimary` bit(1) NOT NULL DEFAULT b'0',
  `documentHandlerUploadBean` varchar(100) DEFAULT NULL,
  `documentHandlerDownloadBean` varchar(100) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`producerId`),
  KEY `FK_producers_users` (`employeeId`),
  CONSTRAINT `FK_producers_users` FOREIGN KEY (`employeeId`) REFERENCES `users` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.producers: ~8 rows (approximately)
INSERT INTO `producers` (`producerId`, `producerName`, `pwdExpiryDays`, `domainContext`, `employeeId`, `isPrimary`, `documentHandlerUploadBean`, `documentHandlerDownloadBean`, `createdBy`, `createdDate`, `modifiedDate`, `modifiedBy`, `status`) VALUES
	('PRD000000', 'Default', NULL, NULL, 'SuperAdmin', b'0', NULL, NULL, NULL, NULL, NULL, NULL, b'0'),
	('PRD000001', 'TestiFly Academy', '2017-08-02 07:33:06', '/edutel', 'PRDADM0001', b'0', 'org.hbs.document.fileserver.FileServerUpload', 'org.hbs.document.fileserver.FileServerDownload', 'SuperAdmin', '2017-08-02 07:33:07', '2017-08-02 07:33:08', NULL, b'1'),
	('PRD000002', 'SelfGuru ', '2017-08-02 07:33:06', '/sg', 'PRDADM0002', b'0', 'org.hbs.document.fileserver.FileServerUpload', 'org.hbs.document.fileserver.FileServerDownload', 'SuperAdmin', '2017-08-02 07:33:07', '2017-08-02 07:33:08', NULL, b'1'),
	('PRD000003', 'BookFace 1', '2017-08-02 07:33:06', '/bookface', 'PRDADM0003', b'0', 'org.hbs.document.fileserver.FileServerUpload', 'org.hbs.document.fileserver.FileServerDownload', 'SuperAdmin', '2017-08-02 07:33:07', '2017-08-02 07:33:08', NULL, b'1'),
	('PRD000004', 'BookFace 2', '2017-08-02 07:33:06', '/bookface', 'PRDADM0004', b'0', 'org.hbs.document.fileserver.FileServerUpload', 'org.hbs.document.fileserver.FileServerDownload', 'SuperAdmin', '2017-08-02 07:33:07', '2017-08-02 07:33:08', NULL, b'1'),
	('PRD000005', 'BookFace 3', '2017-08-02 07:33:06', '/bookface', 'PRDADM0005', b'0', 'org.hbs.document.fileserver.FileServerUpload', 'org.hbs.document.fileserver.FileServerDownload', 'SuperAdmin', '2017-08-02 07:33:07', '2017-08-02 07:33:08', NULL, b'1'),
	('PRD000006', 'BookFace 4', '2017-08-02 07:33:06', '/bookface', 'PRDADM0006', b'0', 'org.hbs.document.fileserver.FileServerUpload', 'org.hbs.document.fileserver.FileServerDownload', 'SuperAdmin', '2017-08-02 07:33:07', '2017-08-02 07:33:08', NULL, b'1'),
	('PRD000007', 'BookFace 5', '2017-08-02 07:33:06', '/bookface', 'PRDADM0007', b'0', 'org.hbs.document.fileserver.FileServerUpload', 'org.hbs.document.fileserver.FileServerDownload', 'SuperAdmin', '2017-08-02 07:33:07', '2017-08-02 07:33:08', NULL, b'1');

-- Dumping structure for table education-testifly.producersassessment
CREATE TABLE IF NOT EXISTS `producersassessment` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `assessmentId` varchar(50) DEFAULT NULL,
  `producerId` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`autoId`),
  KEY `FK__producers` (`producerId`),
  CONSTRAINT `FK__producers` FOREIGN KEY (`producerId`) REFERENCES `producers` (`producerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.producersassessment: ~0 rows (approximately)

-- Dumping structure for table education-testifly.producersattachments
CREATE TABLE IF NOT EXISTS `producersattachments` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `producerId` varchar(50) DEFAULT NULL,
  `documentStatus` varchar(50) DEFAULT NULL,
  `documentDesc` varchar(100) DEFAULT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(500) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(50) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL,
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.producersattachments: ~0 rows (approximately)

-- Dumping structure for table education-testifly.producerscollabrate
CREATE TABLE IF NOT EXISTS `producerscollabrate` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `producerId` varchar(50) NOT NULL,
  `collabraterId` varchar(50) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.producerscollabrate: ~0 rows (approximately)

-- Dumping structure for table education-testifly.producersproperty
CREATE TABLE IF NOT EXISTS `producersproperty` (
  `autoId` varchar(50) NOT NULL,
  `producerId` varchar(50) NOT NULL,
  `groupName` varchar(50) NOT NULL,
  `enumKey` varchar(50) NOT NULL,
  `property` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `media` varchar(50) NOT NULL,
  `mediaMode` varchar(50) NOT NULL,
  `mediaType` varchar(50) NOT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.producersproperty: ~4 rows (approximately)
INSERT INTO `producersproperty` (`autoId`, `producerId`, `groupName`, `enumKey`, `property`, `value`, `status`, `createdBy`, `modifiedBy`, `createdDate`, `modifiedDate`, `comments`, `media`, `mediaMode`, `mediaType`) VALUES
	('1', 'PRD000001', 'Configuration External', 'ConfigurationEmail', 'org.edr.core.beans.model.channel.ConfigurationEmail', '{"protocol":"imaps","socketFactory":"javax.net.ssl.SSLSocketFactory","enablessl":"true","hostAddress":"imap.gmail.com","userName":"eselfguru@gmail.com","password":"ojawauylchlhqzoo","port":"993","ttls":"true","fromId":"eselfguru@gmail.com","fromName":"data_process","source":"Gmail_IMAP","additionalProperties":{},"producerId":"PRD000001","baseFolderPath":"C:/Ananth/data_process_attachments","startDate":"_3_Days","readEvery":"_5_Minutes","reverseStart":false}', b'1', 'SuperAdmin', 'SuperAdmin', '2021-01-01 00:00:00', '2021-01-01 00:00:00', NULL, 'Email', 'External', 'Primary'),
	('2', 'PRD000001', 'ConfigurationEmail Internal', 'ConfigurationEmail', 'org.edr.core.beans.model.channel.ConfigurationEmail', '{\r\n   "socketFactory":"javax.net.ssl.SSLSocketFactory",\r\n   "hostAddress":"smtp.gmail.com",\r\n   "port":"587",\r\n   "userName":"anandb.hbs@gmail.com",\r\n   "fromId":"anandb.hbs@gmail.com",\r\n   "fromName":"Anand",\r\n   "password":"anoulgsbddydxjz",\r\n   "source":"Gmail_SMTP",\r\n   "additionalProperties":{\r\n      "mail.smtp.ssl.trust": "smtp.gmail.com",\r\n      "mail.smtp.auth":"true",\r\n      "mail.smtp.starttls.enable":"true"\r\n   }\r\n}', b'1', 'SuperAdmin', 'SuperAdmin', '2021-01-01 00:00:00', '2021-01-01 00:00:00', NULL, 'Email', 'Internal', 'Primary'),
	('3', 'PRD000001', 'Configuration Web Upload', 'ConfigurationWebUpload', 'org.edr.core.beans.model.channel.ConfigurationWebUpload', '{\r\n     "baseFolderPath":"C:/DataProcess/Upload/Excel"\r\n}', b'1', 'SuperAdmin', 'SuperAdmin', '2021-01-01 00:00:00', '2021-01-01 00:00:00', NULL, 'WebUpload', 'External', 'Primary'),
	('4', 'PRD000001', 'Web Upload User Attachments', 'UserAttachments', 'org.edr.core.beans.model.channel.ConfigurationWebUpload', '{\r\n    "baseFolderPath":"C:/DataProcess/Upload/UserAttachments"\r\n}', b'1', 'SuperAdmin', 'SuperAdmin', '2021-01-01 00:00:00', '2021-01-01 00:00:00', NULL, 'WebUpload', 'External', 'Primary');

-- Dumping structure for table education-testifly.producersproperty_
CREATE TABLE IF NOT EXISTS `producersproperty_` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `producerId` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `enumKey` varchar(50) NOT NULL,
  `property` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.producersproperty_: ~5 rows (approximately)
INSERT INTO `producersproperty_` (`autoId`, `producerId`, `group`, `enumKey`, `property`, `value`, `status`) VALUES
	(1, 'PRD000001', 'ResourceHandler', 'Profile', '0890b67e-cfb7-46c1-83d8-dbc46938a1ee', 'C:/EduTelDocs/Documents/Profile', b'1'),
	(2, 'PRD000001', 'ResourceHandler', 'Assessment', '8a075246-fb88-4026-9f25-0918574356fb', 'C:/EduTelDocs/Documents/Assessment', b'1'),
	(3, 'PRD000001', 'ResourceHandler', 'EBooks', '9f0aeb0d-2026-4949-b2c3-f840787cb5ca', 'C:/EduTelDocs/Documents/EBooks', b'1'),
	(4, 'PRD000001', 'ResourceHandler', 'EKeyPoints', '880bc7fd-1eaa-4093-97a3-3c0e21dbdafa', 'C:/EduTelDocs/Documents/EKeyPoints', b'1'),
	(5, 'PRD000001', 'ResourceHandler', 'Default', '897f2cc2-9ab5-4df4-91e5-0fde6a2c8f77', 'C:/EduTelDocs/Documents/Default', b'1');

-- Dumping structure for table education-testifly.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `roleId` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `isAdmin` bit(1) NOT NULL DEFAULT b'0',
  `displayOrder` int NOT NULL,
  `roleType` varchar(50) NOT NULL DEFAULT 'Role',
  `hierarchy` varchar(50) NOT NULL,
  `producerId` varchar(50) NOT NULL,
  `roleName` varchar(50) NOT NULL,
  `roleLongName` varchar(50) NOT NULL,
  `roleShortName` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.roles: ~4 rows (approximately)
INSERT INTO `roles` (`roleId`, `status`, `isAdmin`, `displayOrder`, `roleType`, `hierarchy`, `producerId`, `roleName`, `roleLongName`, `roleShortName`, `description`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
	('Admin', b'1', b'1', 1, 'Role', 'Y', 'PRD000001', 'Admin', 'Admin', 'Admin', 'Admin', 'SuperAdmin', '2024-06-22 19:28:39', 'SuperAdmin', '2024-06-22 19:28:40'),
	('Consumer', b'1', b'0', 1, 'Role', 'A', 'PRD000001', 'Consumer', 'Consumer', 'Consumer', 'Consumer', 'SuperAdmin', '2024-06-22 19:28:39', 'SuperAdmin', '2024-06-22 19:28:40'),
	('Employee', b'1', b'0', 1, 'Role', 'X', 'PRD000001', 'Employee', 'Employee', 'Employee', 'Employee', 'SuperAdmin', '2024-06-22 19:28:39', 'SuperAdmin', '2024-06-22 19:28:40'),
	('SuperAdminRole', b'1', b'1', 1, 'Role', 'Z', 'PRD000001', 'SuperAdminRole', 'SuperAdminRole', 'SuperAdminRole', 'SuperAdminRole', 'SuperAdmin', '2024-06-22 19:28:39', 'SuperAdmin', '2024-06-22 19:28:40');

-- Dumping structure for table education-testifly.scheme
CREATE TABLE IF NOT EXISTS `scheme` (
  `schemeId` varchar(50) NOT NULL,
  `schemeName` varchar(100) NOT NULL,
  `schemeCost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `schemeSell` decimal(10,2) NOT NULL DEFAULT '0.00',
  `producerId` varchar(50) NOT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`schemeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.scheme: ~6 rows (approximately)
INSERT INTO `scheme` (`schemeId`, `schemeName`, `schemeCost`, `schemeSell`, `producerId`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('DEFAULT', 'DEFAULT', 0.00, 0.00, 'PRD000001', 'PRDADM0001', '2018-01-05 19:28:03', NULL, '2018-01-05 19:28:31', b'0'),
	('PLN000001', 'Full Year Internship StateBoard', 999.00, 0.00, 'PRD000001', 'PRDADM0001', '2018-01-05 19:28:03', NULL, '2018-01-05 19:28:03', b'1'),
	('PLN000002', 'Full Year Internship CBSE', 999.00, 0.00, 'PRD000001', 'PRDADM0001', '2018-01-05 19:28:03', NULL, '2018-01-05 19:28:03', b'1'),
	('PLN000003', 'Two Year Internship StateBoard', 999.00, 0.00, 'PRD000001', 'PRDADM0001', '2018-01-05 19:28:03', NULL, '2018-01-05 19:28:03', b'1'),
	('PLN000004', 'Two Year Internship CBSE', 999.00, 0.00, 'PRD000001', 'PRDADM0001', '2018-01-05 19:28:03', NULL, '2018-01-05 19:28:03', b'1'),
	('TRIAL', 'Trial Version', 0.00, 0.00, 'PRD000001', 'PRDADM0001', '2018-01-05 19:28:03', NULL, '2018-01-05 19:28:03', b'1');

-- Dumping structure for table education-testifly.schemecoursegroup
CREATE TABLE IF NOT EXISTS `schemecoursegroup` (
  `courseGroupId` varchar(50) NOT NULL,
  `schemeId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.schemecoursegroup: ~0 rows (approximately)

-- Dumping structure for table education-testifly.state
CREATE TABLE IF NOT EXISTS `state` (
  `state` varchar(50) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.state: ~35 rows (approximately)
INSERT INTO `state` (`state`, `country`) VALUES
	('Andhra Pradesh', 'IN'),
	('Arunachal Pradesh', 'IN'),
	('Assam', 'IN'),
	('Bihar', 'IN'),
	('Chandigarh', 'IN'),
	('Chhattisgarh', 'IN'),
	('Dadra and Nagar Haveli', 'IN'),
	('Daman & Diu', 'IN'),
	('Delhi', 'IN'),
	('Goa', 'IN'),
	('Gujarat', 'IN'),
	('Haryana', 'IN'),
	('Himachal Pradesh', 'IN'),
	('Jammu & Kashmir', 'IN'),
	('Jharkhand', 'IN'),
	('Karnataka', 'IN'),
	('Kerala', 'IN'),
	('Lakshadweep', 'IN'),
	('Madhya Pradesh', 'IN'),
	('Maharashtra', 'IN'),
	('Manipur', 'IN'),
	('Meghalaya', 'IN'),
	('Mizoram', 'IN'),
	('Nagaland', 'IN'),
	('No State', 'IN'),
	('Odisha', 'IN'),
	('Punjab', 'IN'),
	('Rajasthan', 'IN'),
	('Sikkim', 'IN'),
	('Tamil Nadu', 'IN'),
	('Telangana', 'IN'),
	('Tripura', 'IN'),
	('Uttar Pradesh', 'IN'),
	('Uttarakhand', 'IN'),
	('West Bengal', 'IN');

-- Dumping structure for table education-testifly.useractivity
CREATE TABLE IF NOT EXISTS `useractivity` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `afterMsg` varchar(255) DEFAULT NULL,
  `beforeMsg` varchar(255) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.useractivity: ~0 rows (approximately)

-- Dumping structure for table education-testifly.users
CREATE TABLE IF NOT EXISTS `users` (
  `employeeId` varchar(50) NOT NULL,
  `producerId` varchar(50) DEFAULT NULL,
  `parentProducerId` varchar(50) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `folderToken` varchar(50) DEFAULT NULL,
  `userName` varchar(100) DEFAULT '0',
  `fatherName` varchar(100) DEFAULT NULL,
  `userPwd` varchar(100) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `userType` varchar(50) DEFAULT NULL,
  `userStatus` varchar(50) DEFAULT NULL,
  `token` varchar(500) DEFAULT NULL,
  `tokenExpiryDate` datetime DEFAULT NULL,
  `country` varchar(50) NOT NULL DEFAULT 'Asia/Kolkata',
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.users: ~11 rows (approximately)
INSERT INTO `users` (`employeeId`, `producerId`, `parentProducerId`, `userId`, `folderToken`, `userName`, `fatherName`, `userPwd`, `dob`, `sex`, `userType`, `userStatus`, `token`, `tokenExpiryDate`, `country`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('15002', 'PRD000001', 'PRD000001', '15002', '1aa2850a-6717-4664-9215-56a2bf52806e', 'muthu', NULL, '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, NULL, 'Consumer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2024-11-24 12:12:12', 'Asia/Kolkata', 'PRDADM0001', '2024-11-24 12:12:12', 'SuperAdmin', '2024-11-24 12:12:12', b'1'),
	('PRDADM0001', 'PRD000001', NULL, 'EduTel-Id', '013ea493-8fcc-4c68-b4b8-431a82a375bb', 'EduTel ', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', '6ecd993b-d84c-46a8-8c57-8d07feb14c47', '2017-09-23 22:00:21', 'Asia/Kolkata', 'SuperAdmin', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('PRDADM0002', 'PRD000002', NULL, 'SelfGuru-Id', 'dd04dfe0-2d1a-4f02-97c3-52274d9a3c0a', 'SelfGuru', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', '6ecd993b-d84c-46a8-8c57-8d07feb14c47', '2017-09-23 22:00:21', 'Asia/Kolkata', 'SuperAdmin', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('PRDADM0003', 'PRD000001', NULL, 'Logeswaran-Id', 'ca7621f6-a0e0-425a-a1ca-e0c171e6b282', 'Producer 1', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2017-12-16 20:57:29', 'Asia/Kolkata', 'PRDADM0003', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('PRDADM0004', 'PRD000001', NULL, 'Logeswaran-Id', 'ca7621f6-a0e0-425a-a1ca-e0c171e6b282', 'Producer 2', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2017-12-16 20:57:29', 'Asia/Kolkata', 'PRDADM0004', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('PRDADM0005', 'PRD000001', NULL, 'Logeswaran-Id', 'ca7621f6-a0e0-425a-a1ca-e0c171e6b282', 'Producer 3', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2017-12-16 20:57:29', 'Asia/Kolkata', 'PRDADM0005', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('PRDADM0006', 'PRD000001', NULL, 'Logeswaran-Id', 'ca7621f6-a0e0-425a-a1ca-e0c171e6b282', 'Producer 4', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2017-12-16 20:57:29', 'Asia/Kolkata', 'PRDADM0006', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('PRDADM0007', 'PRD000001', NULL, 'Logeswaran-Id', 'ca7621f6-a0e0-425a-a1ca-e0c171e6b282', 'Producer 5', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2017-12-16 20:57:29', 'Asia/Kolkata', 'PRDADM0007', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('SuperAdmin', 'PRD000000', NULL, 'SuperAdmin-Id', '89e0ba9b-0017-4cb0-b514-bd57eb89e080', 'SuperAdmin', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Producer', 'Activated', 'a21e8c20-fa37-4ce8-88d4-6494bb8b844f', '2017-12-03 11:50:59', 'Asia/Kolkata', 'SuperAdmin', '2018-01-30 23:47:50', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('USR1513438024799', 'PRD000001', 'PRD000001', 'Ananth-Id', '1aa2850a-6717-4664-9215-56a2bf52806e', 'Ananth', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Consumer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2017-12-16 20:57:29', 'Asia/Kolkata', 'PRDADM0001', '2017-12-16 20:57:33', 'SuperAdmin', '2018-01-30 23:47:50', b'1'),
	('USR1513438024800', 'PRD000001', 'PRD000001', 'HariHaran-Id', '1aa2850a-6717-4664-9215-56a2bf52806e', 'HariHaran', NULL, '$2a$10$7hnkWav9ZOLtz/Q2y.FLvuIyS3NFQ1J42jkV3SMbo9NRzi1P9m2fW', NULL, NULL, 'Consumer', 'Activated', '0239cba9-7c38-4e06-acf8-a62dc748fb30', '2017-12-16 20:57:29', 'Asia/Kolkata', 'PRDADM0001', '2017-12-16 20:57:33', 'SuperAdmin', '2018-01-30 23:47:50', b'1');

-- Dumping structure for table education-testifly.usersaddress
CREATE TABLE IF NOT EXISTS `usersaddress` (
  `addressId` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `addressLine3` varchar(50) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT 'No State',
  `country` varchar(50) DEFAULT 'IN',
  `pincode` int DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mobileNo` bigint NOT NULL,
  `alternateMobileNo` bigint DEFAULT NULL,
  `whatsAppMobileNo` bigint DEFAULT NULL,
  `primaryPhoneNo` bigint DEFAULT NULL,
  `addressType` varchar(50) NOT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.usersaddress: ~0 rows (approximately)

-- Dumping structure for table education-testifly.usersattachments
CREATE TABLE IF NOT EXISTS `usersattachments` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) DEFAULT NULL,
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `uploadFileFolderURL` varchar(500) DEFAULT NULL,
  `uploadResourceHandler` varchar(50) NOT NULL DEFAULT 'Default',
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.usersattachments: ~0 rows (approximately)

-- Dumping structure for table education-testifly.userslog
CREATE TABLE IF NOT EXISTS `userslog` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) NOT NULL DEFAULT '0',
  `userLoginTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userLogoutTime` datetime DEFAULT '0000-00-00 00:00:00',
  `ipaddress` varchar(50) NOT NULL DEFAULT '0',
  `fetchBlock` bit(1) DEFAULT b'0',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.userslog: ~0 rows (approximately)
INSERT INTO `userslog` (`autoId`, `employeeId`, `userLoginTime`, `userLogoutTime`, `ipaddress`, `fetchBlock`) VALUES
	(1, '15002', '2024-10-25 15:45:34', '0000-00-00 00:00:00', '0', b'1');

-- Dumping structure for table education-testifly.usersmedia
CREATE TABLE IF NOT EXISTS `usersmedia` (
  `mediaId` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `mediaType` varchar(20) NOT NULL,
  `emailId` varchar(50) NOT NULL,
  `mobileNo` varchar(20) NOT NULL,
  `alternateMobileNo` varchar(20) DEFAULT NULL,
  `communicationAddress` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`mediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.usersmedia: ~3 rows (approximately)
INSERT INTO `usersmedia` (`mediaId`, `employeeId`, `mediaType`, `emailId`, `mobileNo`, `alternateMobileNo`, `communicationAddress`) VALUES
	('MED1513438024799', 'USR1513438024799', 'Primary', 'ananth.malbal@gmail.com', '9677101112', NULL, NULL),
	('MED1513438024800', 'USR1513438024800', 'Primary', 'anandb.hbs@gmail.com', '6380807209', NULL, NULL),
	('MED1513438024801', '15002', 'Primary', 'muthu@stashook.com', '9884080613', NULL, NULL);

-- Dumping structure for table education-testifly.usersroles
CREATE TABLE IF NOT EXISTS `usersroles` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) NOT NULL,
  `roleId` varchar(50) NOT NULL,
  `userRoleType` varchar(50) DEFAULT 'Default',
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=21361 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly.usersroles: ~3 rows (approximately)
INSERT INTO `usersroles` (`autoId`, `employeeId`, `roleId`, `userRoleType`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	(1, 'SuperAdmin', 'SuperAdminRole', 'Role', 'SuperAdmin', '2024-06-22 22:25:09', 'SuperAdmin', '2024-06-22 22:25:10', b'1'),
	(2, 'USR1513438024799', 'Consumer', 'Role', 'SuperAdmin', '2024-06-22 22:25:09', 'SuperAdmin', '2024-06-22 22:25:10', b'1'),
	(3, 'USR1513438024800', 'Consumer', 'Role', 'SuperAdmin', '2024-06-22 22:25:09', 'SuperAdmin', '2024-06-22 22:25:10', b'1');

-- Dumping structure for table education-testifly._chapterattachments
CREATE TABLE IF NOT EXISTS `_chapterattachments` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `chapterId` varchar(50) DEFAULT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(500) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(100) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL DEFAULT '0',
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly._chapterattachments: ~0 rows (approximately)

-- Dumping structure for table education-testifly._chapters
CREATE TABLE IF NOT EXISTS `_chapters` (
  `chapterId` varchar(50) NOT NULL,
  `chapterName` varchar(100) DEFAULT NULL,
  `subjectId` varchar(50) DEFAULT NULL,
  `trialMode` bit(1) NOT NULL DEFAULT b'0',
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`chapterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly._chapters: ~0 rows (approximately)

-- Dumping structure for table education-testifly._courses
CREATE TABLE IF NOT EXISTS `_courses` (
  `courseId` varchar(50) NOT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `startMonth` int DEFAULT NULL,
  `endMonth` int DEFAULT NULL,
  `producerId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly._courses: ~5 rows (approximately)
INSERT INTO `_courses` (`courseId`, `batch`, `section`, `description`, `startMonth`, `endMonth`, `producerId`) VALUES
	('CG000001', 'STATE_BOARD', 'XI', 'XI State Board', 4, 3, 'PRD000001'),
	('CG000002', 'STATE_BOARD', 'XII', 'XII State Board', 3, 2, 'PRD000001'),
	('CG000003', 'CBSE', 'XI', 'XI CBSE', 4, 3, 'PRD000001'),
	('CG000004', 'CBSE', 'XII', 'XII CBSE', 3, 2, 'PRD000001'),
	('CG000005', 'SSC', 'SSC', 'Staff Selection Commision', 6, 12, 'PRD000001');

-- Dumping structure for table education-testifly._courses_subjects
CREATE TABLE IF NOT EXISTS `_courses_subjects` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `courseId` varchar(50) NOT NULL,
  `subjectId` varchar(50) NOT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly._courses_subjects: ~0 rows (approximately)

-- Dumping structure for table education-testifly._subjectattachments
CREATE TABLE IF NOT EXISTS `_subjectattachments` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(50) DEFAULT NULL,
  `attachmentDesc` varchar(100) DEFAULT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(500) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(100) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL,
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly._subjectattachments: ~0 rows (approximately)

-- Dumping structure for table education-testifly._subjects
CREATE TABLE IF NOT EXISTS `_subjects` (
  `subjectId` varchar(50) NOT NULL,
  `subjectName` varchar(100) NOT NULL,
  `producerId` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table education-testifly._subjects: ~12 rows (approximately)
INSERT INTO `_subjects` (`subjectId`, `subjectName`, `producerId`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('CS000001', 'Mathematics', 'PRD000001', 'SuperAdmin', '2017-12-22 17:49:57', NULL, NULL, b'1'),
	('CS000002', 'Mathematics', 'PRD000001', 'SuperAdmin', '2017-12-22 18:37:16', NULL, NULL, b'1'),
	('CS000003', 'Physics', 'PRD000001', 'SuperAdmin', '2017-12-28 22:05:41', NULL, NULL, b'1'),
	('CS000004', 'Physics', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000005', 'Chemistry', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000006', 'Chemistry', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000007', 'Biology Botany', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000008', 'Biology Botany', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000009', 'Biology Zoology', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000010', 'Biology Zoology', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000011', 'Computer Science', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1'),
	('CS000012', 'Computer Science', 'PRD000001', 'SuperAdmin', '2017-12-28 22:06:35', NULL, NULL, b'1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
