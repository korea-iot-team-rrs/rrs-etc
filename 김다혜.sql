-- UserRepository

-- List<User> findAll();  // 전체 사용자 조회
-- Optional<User> findById(Long id);  // 특정 ID로 사용자 조회
-- Optional<User> findByPetprofile(PetProfile petProfile);  // 특정 반려동물 프로필에 맞는 사용자 조회
-- String findUserNickNameById(Long id);  // ID로 유저 닉네임 조회
-- String findUserAddressById(Long id);  // ID로 유저 주소 조회
-- String findUserAddressDetailById(Long id);  // ID로 유저 주소 상세 조회
-- String findUserPhoneById(Long id);  // ID로 유저 전화번호 조회
-- String findUserProfileUrlById(Long id);  // ID로 유저 프로필 URL 조회

SELECT r 
FROM Reservation r 
WHERE r.user.id = id;
-- 유저 아이디로 모든 예약 조회

SELECT p 
FROM PetProfile p  
WHERE r.user.id = id;
-- 유저 아이디로 반려동물 프로필 전체 조회

--------------------------------------------------

-- PetprofileRepository

-- List<PetProfile> findAll();  // 모든 반려동물 프로필 조회
-- Optional<PetProfile> findByPetProfileId(Long id);  // 반려동물 프로필 ID로 조회
-- String findNameByPetProfileId(Long id);  // 반려동물 프로필 ID로 반려견 이름 조회

--------------------------------------------------

-- ProviderRespository

-- List<Provider> findAll();  // 모든 제공자 조회
-- Optional<Provider> findById(Long id);  // 특정 제공자 조회
-- List<Provider> findByProviderProvisionYN(String provisionYN);  // 영업 중인 제공자 조회

-- 특정일(여러 날)에 예약이 가능한 댕시터 찾기
SELECT p FROM Providers p WHERE p.providerProvisionYN = '1' AND " +
       "(p.mon = '1' AND :startDate <= :endDate) AND " +
       "(p.tue = '1' AND :startDate <= :endDate) AND " +
       "(p.wed = '1' AND :startDate <= :endDate) AND " +
       "(p.thu = '1' AND :startDate <= :endDate) AND " +
       "(p.fri = '1' AND :startDate <= :endDate) AND " +
       "(p.sat = '1' AND :startDate <= :endDate) AND " +
       "(p.sun = '1' AND :startDate <= :endDate) AND " +
       "((p.sun = '1' AND p.mon = '1') OR (p.mon = '1'));

-- 특정 댕시터(제공자)의 서비스 제공 가능한 옵션 조회
SELECT p 
FROM Providers p 
WHERE FIND_IN_SET(p.option, p.providerProvisionOption) > 0 AND p.providerProvisionYN = '1';

--  특정 댕시터에 대한 모든 리뷰 조회
SELECT r 
FROM Reviews r 
WHERE r.provider.id = providerId;

-- 제공자 닉네임으로 평균 리뷰 조회
SELECT AVG(r.reviewScores) 
FROM Reviews r 
WHERE r.provider.id = :providerId;

--------------------------------------------
-- ReservationRepository

-- List<Reservation> findAll();  // 모든 예약 조회
-- Optional<Reservation> findById(Long id);  // 특정 예약 조회

-- 날짜 범위 내 예약 목록 조회
SELECT r 
FROM Reservations r 
WHERE r.reservationListCreateAt 
BETWEEN startTime AND endTime;

-- ReviewRepository

-- List<Review> findAll();  // 모든 리뷰 조회
-- providerId의 최신 리뷰 가져오기

-------------------------------------------

-- CustomerSupport

-- 유저 아이디로 고객센터 게시물 조회
SELECT cs 
FROM CustomerSupports cs 
WHERE cs.id = id;

--------------------------------------------

-- Todo
-- 날짜에 따른 todo 찾기
SELECT t 
FROM Todos t 
Where t.CreateAt = Date