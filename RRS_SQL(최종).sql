use school_db;


CREATE TABLE `USER` (
    `USER_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `NAME` VARCHAR(50) NOT NULL,
    `ID` VARCHAR(30) NOT NULL,
    `PW` VARCHAR(30) NOT NULL,
    `NICK_NAME` VARCHAR(50) UNIQUE NULL,
    `BIRTH` CHAR(8) NULL,
    `PHONE` CHAR(11) NULL,
    `ADDR` VARCHAR(200) NULL,
    `ADDR_DETAIL` VARCHAR(200) NULL,
    `EMAIL` VARCHAR(200) NULL,
    `ANIMAL_REG_STATUS` CHAR(1) NULL,
    `PROFILE` VARCHAR(255) NULL,
    `GENDER` CHAR(1) NULL,
    `DEL_YN` CHAR(1) NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL
);

CREATE TABLE `PET_PROFILE` (
    `PET_PROFILE_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `NAME` VARCHAR(200) NULL,
    `GENDER` CHAR(1) NULL,
    `BIRTH` CHAR(6) NULL,
    `WEIGHT` SMALLINT NULL,
    `PROFILE` VARCHAR(255) NULL,
    `ADD_INFO` VARCHAR(255) NULL,
    `NEUTRALITY_YN` CHAR(1) NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `USER_DEL_LOG` (
    `USER_DEL_LOG_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `REG_DATE` DATETIME NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `INQUERY_AND_REPORT_CATE_CD` (
    `INQUERY_AND_REPORT_CATE_CD_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `TYPE` CHAR(1) NULL COMMENT '1: 문의사항, 2: 신고',
    `CATE_CD_NAME` VARCHAR(30) NULL
);

CREATE TABLE `INQUERY_AND_REPORT` (
    `INQUERY_AND_REPORT_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `INQUERY_AND_REPORT_CATE_CD_ID` int unsigned NOT NULL,
    `TITLE` VARCHAR(100) NULL,
    `CONTENT` VARCHAR(255) NULL,
    `REPORT_USER_ID` INT NULL COMMENT '문의사항일 때는 NULL값 들어감',
    `STATUS` CHAR(1) NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
    FOREIGN KEY (`INQUERY_AND_REPORT_CATE_CD_ID`) REFERENCES `INQUERY_AND_REPORT_CATE_CD` (`INQUERY_AND_REPORT_CATE_CD_ID`)
);


CREATE TABLE `PROVIDERS` (
    `PROVIDERS_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `NICK_NAME` VARCHAR(30) NOT NULL,
    `INTRODUCTION` VARCHAR(255) NOT NULL,
    `PROVISION_YN` CHAR(1) NOT NULL,
    `REVIEW` VARCHAR(255) NOT NULL,
    `MON` CHAR(1) NULL,
    `TUE` CHAR(1) NULL,
    `WED` CHAR(1) NULL,
    `THU` CHAR(1) NULL,
    `FRI` CHAR(1) NULL,
    `SAT` CHAR(1) NULL,
    `SUN` CHAR(1) NULL,
    `PROVISION_OPTION` VARCHAR(50) NULL COMMENT '산책, 목욕, 급여',
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);


CREATE TABLE `RESERVATION_LIST` (
    `RESERVATION_LIST_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `PROVIDERS_ID` int unsigned NOT NULL,
    `START_TIME` DATETIME NOT NULL,
    `END_TIME` DATETIME NOT NULL,
    `REG_DATETIME` DATETIME NOT NULL,
    `RESERVATION_STATUS` CHAR(1) NOT NULL COMMENT '0: 예약대기, 1: 예약수락(진행중), 2: 예약거절, 3: 예약취소, 4: 완료',
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
    FOREIGN KEY (`PROVIDERS_ID`) REFERENCES `PROVIDERS` (`PROVIDERS_ID`)
);

CREATE TABLE `REVIEW` (
    `REVIEW_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `PROVIDERS_ID` int unsigned NOT NULL,
    `USER_ID` int unsigned NOT NULL,
    `REVIEW_SCORE` SMALLINT NOT NULL,
    `REVIEW_CONTENT` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`PROVIDERS_ID`) REFERENCES `PROVIDERS` (`PROVIDERS_ID`),
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `HEALTH_RECORD` (
    `HEALTH_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `PET_PROFILE_ID` int unsigned NOT NULL,
    `WEIGHT` SMALLINT NULL,
    `AGE` SMALLINT NULL,
    `ABNORMAL_SYMPTOMS` VARCHAR(255) NULL,
    `MEDICAL_RECORD` VARCHAR(200) NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL,
    `ABNORMAL_SYMPTOMS_URL` VARCHAR(255) NULL,
    `MEMO` VARCHAR(200) NULL,
    FOREIGN KEY (`PET_PROFILE_ID`) REFERENCES `PET_PROFILE` (`PET_PROFILE_ID`)
);

CREATE TABLE `ACCOUNT_BOOK` (
    `ACCOUNT_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL,
    `MEMO` VARCHAR(200) NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `WALKING_RECORD` (
    `WALK_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `PET_PROFILE_ID` int unsigned NOT NULL,
    `DATE_CHOICE` DATETIME NULL,
    `DISTANCE` int unsigned NULL,
    `WALKING_TIME` TIME NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL,
    `MEMO` VARCHAR(200) NULL,
    `WALKING_RECORD_IMG_URL` VARCHAR(255) NULL,
    FOREIGN KEY (`PET_PROFILE_ID`) REFERENCES `PET_PROFILE` (`PET_PROFILE_ID`)
);

CREATE TABLE `TODO` (
    `TODO_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `PREPARATION_CONTENT` VARCHAR(255) NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `CERTIFICATION_NUMBER` (
    `CERTIFICATION_NUMBER_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `CERT_TYPE` CHAR(1) NULL COMMENT '0: 휴대폰 인증, 1: 이메일 인증',
    `EMAIL` VARCHAR(200) NULL,
    `PHONE` CHAR(11) NULL,
    `CART_NUM` CHAR(6) NULL COMMENT '무조건 6자리 ㅇㅋ',
    `SEND_TIME` DATETIME NULL,
    `USER_ID` int unsigned NULL COMMENT '회원정보가 없을 시에는 외래키를 가져올 수 없으므로 외래키로 잡지않았음',
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `COMMUNITY` (
    `COMMUNITY_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `USER_ID` int unsigned NOT NULL,
    `COMM_CATE_NAME` ENUM('INTRO', 'BOARD', 'ROUTE', 'PHOTO') NOT NULL COMMENT 'INTRO = 가입인사, BOARD = 자유게시판, ROUTE = 산책 경로, PHOTO = 강아지 사진',
    `LIKE_COUNT` int unsigned NULL,
    `REG_DATETIME` DATETIME NULL,
    `UPD_DATETIME` DATETIME NULL,
    `CONTENTS` VARCHAR(255) NULL,
    `THUMB_NAIL_IMG_URL` VARCHAR(255) NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `COMMUNITY_REPLY` (
    `COMMUNITY_REPLY_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `COMMUNITY_ID` int unsigned NOT NULL,
    `USER_ID` int unsigned NOT NULL,
    `PARENT_REPLY` CHAR(1) NULL COMMENT '0: 원댓글, 1: 대댓글',
    `CONTENTS` VARCHAR(255) NULL,
    `REG_DATETIME` DATETIME NULL,
    FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITY` (`COMMUNITY_ID`),
    FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);

CREATE TABLE `COMM_ATTACHMENT` (
    `COMM_ATTACHMENT_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `COMMUNITY_ID` int unsigned NOT NULL,
    `IMG_URL` VARCHAR(255) NULL,
    `REG_DATETIME` DATETIME NULL,
    FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITY` (`COMMUNITY_ID`)
);

CREATE TABLE `ATTACHMENT` (
    `ATTACHMENT_ID` int unsigned PRIMARY KEY AUTO_INCREMENT,
    `QUESTION_ID` int unsigned NOT NULL,
    `INQUERY_AND_REPORT_CATE_CD_ID` int unsigned NOT NULL,
    `URL` VARCHAR(255) NULL,
    `REG_DATETIME` DATETIME NULL,
    FOREIGN KEY (`QUESTION_ID`) REFERENCES `INQUERY_AND_REPORT` (`INQUERY_AND_REPORT_ID`),
    FOREIGN KEY (`INQUERY_AND_REPORT_CATE_CD_ID`) REFERENCES `INQUERY_AND_REPORT_CATE_CD` (`INQUERY_AND_REPORT_CATE_CD_ID`)
);

