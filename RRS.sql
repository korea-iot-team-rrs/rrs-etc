CREATE DATABASE IF NOT EXISTS RRS_DB;
USE RRS_DB;

CREATE TABLE `USERS` (
	`USER_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '유저ID 기본키',
	`NAME` VARCHAR(50) NOT NULL COMMENT '유저 이름',
	`USERNAME` VARCHAR(50) UNIQUE NOT NULL COMMENT '유저 로그인 아이디(중복안됨)',
	`PASSWORD` VARCHAR(255) NOT NULL COMMENT '유저 로그인 비밀번호',
	`NICKNAME` VARCHAR(50) UNIQUE NOT NULL COMMENT '유저 닉네임(중복안됨)',
	`PHONE` VARCHAR(20) UNIQUE NOT NULL COMMENT '휴대폰 번호(중복안됨)',
	`ADDRESS` VARCHAR(255) NOT NULL COMMENT '주소',
	`ADDRESS_DETAIL` VARCHAR(255) NOT NULL COMMENT '주소 상세',
	`EMAIL` VARCHAR(255) UNIQUE NOT NULL COMMENT '유저 이메일 (중복안됨)',
	`PROFILE_IMAGE_URL` VARCHAR(255) NOT NULL DEFAULT 'example.jpg' COMMENT '프로필 사진 주소',
    `ROLES` VARCHAR(255) NOT NULL COMMENT 'ROLE_USER, ROLE_PROVIDER',
    `JOIN_PATH` VARCHAR(5) NOT NULL COMMENT '가입 경로 (HOME, KAKAO, NAVER)',
    `SNS_ID` VARCHAR(255) DEFAULT NULL COMMENT 'OAUTH2 사용자 아이디',
    `PROVIDER_INTRODUCTION` TEXT
);

CREATE TABLE `PETS` (
	`PET_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '반려동물ID 기본키',
	`USER_ID` BIGINT NOT NULL COMMENT '유저ID 기본키',
	`PET_NAME` VARCHAR(200) NOT NULL COMMENT '반려동물 이름',
	`PET_GENDER` CHAR(1) NOT NULL COMMENT '반려동물 성별 0: 수컷, 1: 암컷',
	`PET_BIRTH_DATE` VARCHAR(7) NOT NULL COMMENT '반려동물 생일',
	`PET_WEIGHT` SMALLINT NOT NULL COMMENT '반려동물 체중',
	`PET_IMAGE_URL` VARCHAR(255) NOT NULL DEFAULT 'pet_example.jpg' COMMENT '반려동물 프로필 사진 주소',
	`PET_ADD_INFO` VARCHAR(255) COMMENT '추가 정보',
	`PET_NEUTRALITY_YN` CHAR(1) NOT NULL COMMENT '중성화 여부 0: 중성화 X, 1: 중성화 O',
	FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`)
);

CREATE TABLE `CUSTOMER_SUPPORTS` (
	`CUSTOMER_SUPPORT_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '고객센터 ID 기본키',
	`USER_ID` BIGINT NOT NULL COMMENT '유저ID 기본키',
	`CUSTOMER_SUPPORT_TITLE` VARCHAR(100) NOT NULL COMMENT '제목',
	`CUSTOMER_SUPPORT_CONTENT` TEXT NOT NULL COMMENT '내용',
	`CUSTOMER_SUPPORT_STATUS` CHAR(1) DEFAULT 0 NOT NULL COMMENT '처리상태 0: 미처리, 1: 처리완료',
	`CUSTOMER_SUPPORT_CREATE_AT` DATETIME NOT NULL COMMENT '생성 시간',
	`CUSTOMER_SUPPORT_CATEGORY` CHAR(1) NOT NULL COMMENT '0: 신고 / 1:문의',
	FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`)
);

CREATE TABLE `CUSTOMER_SUPPORT_ATTACHMENTS` (
	`CUSTOMER_SUPPORT_ATTACHMENT_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '고객센터 첨부파일ID 기본키',
    `CUSTOMER_SUPPORT_ID` BIGINT NOT NULL COMMENT '고객센터 ID 기본키',
    `CUSTOMER_SUPPORT_ATTACHMENT_FILE` VARCHAR(255) COMMENT '파일 주소',
    FOREIGN KEY (`CUSTOMER_SUPPORT_ID`) REFERENCES `CUSTOMER_SUPPORTS` (`CUSTOMER_SUPPORT_ID`)
);

CREATE TABLE `AVAILABLE_DATE_OF_WEEK` (
	`AVAILABLE_DATE_OF_WEEK_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '댕시터 근무일',
    `PROVIDER_ID` BIGINT NOT NULL COMMENT 'USER_ID /  ROLE_PROVIDER',
    `AVAILABLE_DATE` DATE NOT NULL COMMENT '댕시터가 가능한 날짜',
    FOREIGN KEY (`PROVIDER_ID`) REFERENCES `USERS` (`USER_ID`)
);

CREATE TABLE `RESERVATIONS` (
	`RESERVATION_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '예약목록ID 기본키',
	`USER_ID` BIGINT NOT NULL COMMENT '유저ID 기본키',
	`PROVIDER_ID` BIGINT NOT NULL COMMENT 'USER_ID /  ROLE_PROVIDER',
	`RESERVATION_START_DATE` DATE NOT NULL COMMENT '이용 시작일',
	`RESERVATION_END_DATE` DATE NOT NULL COMMENT '이용 종료일',
	`RESERVATION_STATUS` ENUM ('PENDING', 'IN_PROGRESS' , 'REJECTED', 'CANCELLED', 'COMPLETED') DEFAULT 'PENDING' ,
    `RESERVATION_MEMO` TEXT COMMENT '예약 전달 메모',
	FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`),
	FOREIGN KEY (`PROVIDER_ID`) REFERENCES `USERS` (`USER_ID`)
);

CREATE TABLE `REVIEWS` (
	`REVIEW_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '리뷰ID 기본키',
	`USER_ID` BIGINT NOT NULL COMMENT '유저ID 기본키',
    `RESERVATION_ID` BIGINT NOT NULL COMMENT '예약목록ID 기본키',
	`REVIEW_SCORE` SMALLINT NOT NULL COMMENT '별점',
	`REVIEW_CONTENT` TEXT NOT NULL COMMENT '리뷰 내용',
	`REVIEW_CREATE_AT` DATETIME NOT NULL COMMENT '리뷰 생성일',
	FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`),
	FOREIGN KEY (`RESERVATION_ID`) REFERENCES `RESERVATIONS` (`RESERVATION_ID`)
);

CREATE TABLE `HEALTH_RECORDS` (
	`HEALTH_RECORD_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '건강기록ID 기본키',
	`PET_ID` BIGINT NOT NULL COMMENT '반려동물ID 기본키',
	`HEALTH_RECORD_WEIGHT` SMALLINT NOT NULL COMMENT '펫 체중',
	`HEALTH_RECORD_PET_AGE` SMALLINT NOT NULL COMMENT '펫 나이',
	`HEALTH_RECORD_ABNORMAL_SYMPTOMS` VARCHAR(255) NOT NULL COMMENT '이상 증상',
	`HEALTH_RECORD_CREATE_AT` DATETIME NOT NULL COMMENT '생성 시간',
	`HEALTH_RECORD_MEMO` TEXT COMMENT '메모',
	FOREIGN KEY (`PET_ID`) REFERENCES `PETS` (`PET_ID`)
);

CREATE TABLE `HEALTH_RECORD_ATTACHMENTS` (
	`HEALTH_RECORD_ATTACHMENT_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '건강기록 첨부파일ID 기본키',
    `HEALTH_RECORD_ID` BIGINT NOT NULL COMMENT '건강기록ID 기본키',
    `HEALTH_RECORD_ATTACHMENT_FILE` VARCHAR(255) COMMENT '건강기록 URL',
    FOREIGN KEY (`HEALTH_RECORD_ID`) REFERENCES `HEALTH_RECORDS` (`HEALTH_RECORD_ID`)
);

CREATE TABLE `WALKING_RECORDS` (
	`WALKING_RECORD_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '산책기록ID 기본키',
	`PET_ID` BIGINT NOT NULL COMMENT '반려동물ID 기본키',
	`WALKING_RECORD_WEATHER_STATE` ENUM ('SUNNY', 'CLOUDY', 'RAINY', 'SNOWY') DEFAULT 'SUNNY' NOT NULL COMMENT '날씨 상태',
	`WALKING_RECORD_DISTANCE` INT UNSIGNED NOT NULL COMMENT '산책 거리',
	`WALKING_RECORD_WALKING_TIME` INT UNSIGNED NOT NULL COMMENT '산책 시간',
	`WALKING_RECORD_CREATE_AT` DATETIME NOT NULL COMMENT '생성 시간',
	`WALKING_RECORD_MEMO` TEXT COMMENT '메모',
	FOREIGN KEY (`PET_ID`) REFERENCES `PETS` (`PET_ID`)
);

CREATE TABLE `WALKING_RECORD_ATTACHMENTS` (
	`WALKING_RECORD_ATTACHMENT_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '산책기록 첨부파일ID 기본키',
    `WALKING_RECORD_ID` BIGINT NOT NULL COMMENT '산책기록ID 기본키',
    `WALKING_RECORD_ATTACHMENT_FILE` VARCHAR(255) COMMENT '산책기록 이미지 URL',
    FOREIGN KEY (`WALKING_RECORD_ID`) REFERENCES `WALKING_RECORDS` (`WALKING_RECORD_ID`)
);

CREATE TABLE `TODOS` (
	`TODO_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '오늘할일ID 기본키',
	`USER_ID` BIGINT NOT NULL COMMENT '유저ID 기본키',
	`TODO_PREPARATION_CONTENT` VARCHAR(255) NOT NULL COMMENT '작성 내용',
	`TODO_CREATE_AT` DATETIME NOT NULL COMMENT '생성 시간',
    `TODO_STATUS`  CHAR(1) NOT NULL COMMENT '0: 미완료. 1:완료',
	FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`)
);

CREATE TABLE `COMMUNITIES` (
	`COMMUNITY_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '커뮤니티ID 기본키',
	`USER_ID` BIGINT NOT NULL COMMENT '유저ID 기본키',
	`COMMUNITY_TITLE` VARCHAR(255) NOT NULL COMMENT '커뮤니티 제목',
	`COMMUNITY_LIKE_COUNT` INT NOT NULL DEFAULT 0 COMMENT '좋아요 수',
	`COMMUNITY_CREATE_AT` DATETIME NOT NULL COMMENT '생성 시간',
	`COMMUNITY_UPDATE_AT` DATETIME NULL COMMENT '수정 시간',
	`COMMUNITY_CONTENTS` TEXT NOT NULL COMMENT '내용',
	`COMMUNITY_THUMBNAIL_FILE` VARCHAR(255) NOT NULL DEFAULT 'community_example.jpg' COMMENT '썸네일 URL',
	FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`) ON DELETE CASCADE
);

CREATE TABLE `COMMUNITY_ATTACHMENTS` (
	`COMMUNITY_ATTACHMENT_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '커뮤니티 첨부파일ID 기본키',
	`COMMUNITY_ID` BIGINT NOT NULL COMMENT '커뮤니티ID 기본키',
	`COMMUNITY_ATTACHMENT_FILE` VARCHAR(255) COMMENT '첨부 파일',
	FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`COMMUNITY_ID`)
);

CREATE TABLE `COMMUNITY_COMMENTS` (
	`COMMUNITY_COMMENTS_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '커뮤니티 댓글ID 기본키',
	`COMMUNITY_ID` BIGINT NOT NULL COMMENT '커뮤니티ID 기본키',
	`COMMUNITY_COMMENTS_CONTENTS` VARCHAR(255) NOT NULL COMMENT '댓글 내용',
	FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`COMMUNITY_ID`)
);

CREATE TABLE `ANNOUNCEMENTS` (
	`ANNOUNCEMENT_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '공지사항ID기본키',
	`ANNOUNCEMENT_TITLE` VARCHAR(255) NOT NULL COMMENT '공지사항제목',
	`ANNOUNCEMENT_CONTENT` TEXT NOT NULL COMMENT '공지사항내용',
	`ANNOUNCEMENT_CREATE_AT` DATETIME NOT NULL COMMENT '생성시간'
);

CREATE TABLE `EVENTS` (
	`EVENT_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '이벤트ID기본키',
	`EVENT_TITLE` VARCHAR(255) NOT NULL COMMENT '이벤트제목',
	`EVENT_CONTENT` TEXT NOT NULL COMMENT '이벤트내용',
	`EVENT_CREATE_AT` DATETIME NOT NULL COMMENT '생성시간'
);

CREATE TABLE `USAGE_GUIDES` (
	`GUIDE_ID` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '사용방법ID기본키',
	`GUIDE_TITLE` VARCHAR(255) NOT NULL COMMENT '사용방법제목',
	`GUIDE_CONTENT` TEXT NOT NULL COMMENT '사용방법내용',
	`GUIDE_CREATE_AT` DATETIME NOT NULL COMMENT '생성시간'
);

CREATE TABLE `COMMUNITY_LIKES` (
    `LIKE_ID` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `COMMUNITY_ID` BIGINT NOT NULL,
    `USER_ID` BIGINT NOT NULL,                  
    `USER_LIKED` BOOLEAN NOT NULL,              
    CONSTRAINT `UNIQUE_LIKE` UNIQUE (`COMMUNITY_ID`, `USER_ID`),
    CONSTRAINT `FK_COMMUNITY` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`COMMUNITY_ID`) ON DELETE CASCADE,
    CONSTRAINT `FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`) ON DELETE CASCADE
);