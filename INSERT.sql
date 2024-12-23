INSERT INTO Users (user_id, name, username, password, nickname, phone, address, address_detail, email, profile_image_url, roles, provider_introduction) VALUES
(NULL, '김다혜', 'qwer1234', 'userspass124@!', 's2j4567', '01033335523', 'Seoul, Apgujeong', '78-90-12', 'suzi44@example.com', 'suzi_profile.jpg', 'ROLE_USER', NULL),
(NULL, '이준희', 'june5678', 'secure123@', 'junny99', '01044446666', 'Seoul, Gangnam', '34-12-78', 'june5678@example.com', 'june_profile.jpg', 'ROLE_USER, ROLE_PROVIDER', NULL),
(NULL, '박소민', 'somin2024', 'mypwd789@', 'so_min95', '01055557777', 'Busan, Haeundae', '21-34-56', 'somin95@example.com', 'somin_profile.jpg', 'ROLE_USER, ROLE_PROVIDER', NULL),
(NULL, '최민수', 'minsoo123', 'pass12345@', 'choi99min', '01066668888', 'Incheon, Songdo', '56-78-90', 'minsoo99@example.com', 'minsoo_profile.jpg', 'ROLE_USER', NULL),
(NULL, '정하늘', 'skyblue456', 'blue999@', 'haneulsky', '01077779999', 'Daegu, Dalseo', '12-34-56', 'haneul456@example.com', 'haneul_profile.jpg', 'ROLE_USER, ROLE_PROVIDER', NULL);

-- [
--     {
--         "name": "김다혜",
--         "username": "qwer1234",
--         "password": "pass124@!",
--         "confirmPassword": "pass124@!",
--         "nickname": "s2j4567",
--         "phone": "01033335523",
--         "address": "Seoul, Apgujeong",
--         "addressDetail": "78-90-12",
--         "email": "suzi44@example.com",
--         "profileImageUrl": "suzi_profile.jpg"
--     },
--     {
--         "name": "이준희",
--         "username": "june5678",
--         "password": "secure123@",
--         "confirmPassword": "secure123@",
--         "nickname": "junny99",
--         "phone": "01044446666",
--         "address": "Seoul, Gangnam",
--         "addressDetail": "34-12-78",
--         "email": "june5678@example.com",
--         "profileImageUrl": "june_profile.jpg"
--     },
--     {
--         "name": "박소민",
--         "username": "somin2024",
--         "password": "mypwd789@",
--         "confirmPassword": "mypwd789@",
--         "nickname": "somin95",
--         "phone": "01055557777",
--         "address": "Busan, Haeundae",
--         "addressDetail": "21-34-56",
--         "email": "somin95@example.com",
--         "profileImageUrl": "somin_profile.jpg"
--     },
--     {
--         "name": "최민수",
--         "username": "minsoo123",
--         "password": "pass12345@",
--         "confirmPassword": "pass12345@",
--         "nickname": "choi99min",
--         "phone": "01066668888",
--         "address": "Incheon, Songdo",
--         "addressDetail": "56-78-90",
--         "email": "minsoo99@example.com",
--         "profileImageUrl": "minsoo_profile.jpg"
--     },
--     {
--         "name": "정하늘",
--         "username": "skyblue456",
--         "password": "blue999@",
--         "confirmPassword": "blue999@",
--         "nickname": "haneulsky",
--         "phone": "01077779999",
--         "address": "Daegu, Dalseo",
--         "addressDetail": "12-34-56",
--         "email": "haneul456@example.com",
--         "profileImageUrl": "haneul_profile.jpg"
--     }
-- ]