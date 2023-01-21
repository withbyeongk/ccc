# CCC 

![image](https://user-images.githubusercontent.com/76987021/212936006-f712dda9-7ad5-47de-93c2-b396ade4e322.png)

<br>
Create Character<br>
Challenge Character<br>
Choose Character
<b>by. Hard Charac</b>
<br><br>
회원들이 각자 만든 캐릭터를 등록하고, 각자의 최고의 캐릭터에 투표합니다.<br>
최고의 캐릭터를 뽑아 굿즈를 만들어 판매하는 사이트입니다.
<hr>

- 개발 목표 : 캐릭터 대회 및 캐릭터 굿즈 쇼핑몰 개발

- 수행 기간 : 2022년 12월 5일 ~ 2023년 1월 12일 (약 6주)

- 개발 인원 : 6명

- 기여도 : 20%

- 팀 전체 구현 기능 :<br>

  + 로그인, 회원가입
  + 상품 등록, 상품 리스트 조회, 상품 리뷰 작성 및 상품 검색.
  + <b>관심 상품 등록 및 삭제.</b>
  + <b>장바구니 추가 및 삭제.</b>
  + 주문 내역 기간별 조회, 배송지 정보 조회.
  + <b>공지사항 다중 첨부파일 글 등록, 수정, 삭제. 페이지당 게시글 변경 및 페이징 처리.</b>
  + 자유게시판 다중 첨부파일 글 등록, 수정, 삭제. 댓글 등록, 수정, 삭제. 관리자 로그인 시 그룹 삭제.
  + <b>문의 게시판 글 등록, 수정, 삭제. 내 글보기. 관리자 로그인 시 그룹 삭제 및 답변 등록.</b>
  + <b>캐릭터 월드컵</b>
  + 캐릭터 게시판 글 등록, 수정, 삭제. 캐릭터 좋아요 표시. 게시글에 댓글 및 대댓글 등록, 수정, 삭제.
  + 내 캐릭터 조회, 등록, 수정, 삭제
  + 회원 그룹 차단. 회원 목록 EXCEL 문서로 출력.
  + 관리자 등록, 수정, 삭제
  + <b>배송지 조회, 등록, 수정, 삭제.</b>


- 개발 환경 :<br>

  + OS : Window 10
  + Development Tool : STS3, Visual Studio Code
  + DBMS : Oracle DB-SQLDeveloper
  + Server : Apache Tomcat v8.5
  + Framework : Spring Framework 5.3.24, Mybatis 3
  + Management and comprehension Tool : Maven 3.8.6
  + Language : Java 1.8, JavaScript5, HTML5, CSS3
  + Application Tool : JSP 3.2
  + Design Tool : BootStrap 4.3.1
  + Library : jQuery 3.4.1
  + Team Collaboration Tool : Github

- ER Diagram :<br>

![CCC_FINAL_ERD](https://user-images.githubusercontent.com/76987021/212940559-59cc73d0-5298-4176-b2a2-423ca08698ce.png)
<br>
<hr>
<br>

# 담당 기능 설명 :

- 공지사항 게시판 :

    + 글 조회, 등록, 수정, 삭제. <br>
    + 페이징 처리 및 페이지 당 표시 글 수 변경.<br>
    + 글 등록, 수정 시 다중 첨부파일 업로드 가능.<br>
    + 최대 첨부파일의 수를 변경하기 용이하도록 코드를 작성하였으며, 수정 시 선택적으로 첨부파일을 삭제 가능.

<div align="center">
  <img src="https://user-images.githubusercontent.com/76987021/212951417-32db8006-0e20-44c9-a139-cc6dc0ae9c6a.png">
  <img src="https://user-images.githubusercontent.com/76987021/212952252-fc1305b8-9675-4beb-a0bd-e98f915fe1a5.png">
  <img src="https://user-images.githubusercontent.com/76987021/212952261-73080445-38f1-4a4a-b144-a5c4bb41f083.png">
  <img src="https://user-images.githubusercontent.com/76987021/212952699-d9ee7cd4-3f12-4ee0-9fab-8efc4d69b116.png">
  <img src="https://user-images.githubusercontent.com/76987021/212952707-d9ad6312-9239-49fa-a640-ef9af4653b38.png">
</div>
  
- 문의 게시판 :

    + 글 조회, 등록, 수정, 삭제. <br>
    + 글 등록, 수정 시 다중 첨부파일 업로드 가능.<br>
    + 최대 첨부파일의 수를 변경하기 용이하도록 코드를 작성하였으며, 수정 시 선택적으로 첨부파일을 삭제 가능.<br>
    + 관리자로 로그인 시 체크한 항목의 글을 일괄 삭제 가능.<br>
    + 관리자로 로그인 시 답변이 달리지 않은 글에 답변 등록.<br>
    + 자신의 글이 아닐 경우 해당 글의 상세 조회를 할 수 없도록 처리.
    + '내 글보기' 버튼 클릭 시 자신의 글만 조회 가능.

<div align="center">
  <img src="https://user-images.githubusercontent.com/76987021/212953127-caa70087-8488-4ede-816c-3ae00469c55e.png">
  <img src="https://user-images.githubusercontent.com/76987021/212953153-a46faafa-76c0-42ea-9378-b3c5d73bae10.png">
  <img src="https://user-images.githubusercontent.com/76987021/212953175-b1da49de-a055-47c4-a072-1ab4b5a350a4.png">
  <img src="https://user-images.githubusercontent.com/76987021/212953195-ea4df8ca-f4e5-4d70-bc09-4f0c2fd03d83.png">
  <img src="https://user-images.githubusercontent.com/76987021/212953217-37cc1d78-40dd-4d26-bc4c-ec4b578cad73.png">
  <img src="https://user-images.githubusercontent.com/76987021/212953233-72b67147-c39a-40ce-b212-35fa668d0766.png">
</div>

- 장바구니 :

    + 굿즈 개별 구매, 삭제 및 수량변경
    + 체크한 굿즈 그룹 구매, 삭제
    + 전체 굿즈 구매, 삭제
    + 개별 굿즈 관심 상품 등록 및 삭제
    + 체크한 굿즈의 구매 금액 총합 표시
    + 굿즈의 구매 변경 시 합계 금액 표시

<div align="center">
  <img src="https://user-images.githubusercontent.com/76987021/212955744-36fb72da-8f6f-43f7-b6cf-f486ebc0f3f7.png">
  <img src="https://user-images.githubusercontent.com/76987021/212955757-58329e4c-5433-4596-ab7a-59d83581d09e.png">
</div>

- 구매 :
  
    + 페이지가 열렸을 때 해당 회원의 기본 배송지 정보가 출력.
    + 구매하려는 굿즈 조회 및 배송지 정보 입력
    + 배송지 추가, 수정, 삭제.
    + 배송지 조회 페이지에서 '선택'을 클릭하면 구매 페이지 정보 변경.
    + 배송지 추가 및 수정 시 KAKAO 우편번호 찾기 API 이용.
    + 배송지 추가 및 수정 시 기본 배송지로 체크할 경우 해당 회원의 기본 배송지로 설정.
 
<div align="center">
  <img src="https://user-images.githubusercontent.com/76987021/213858981-fb1cde61-e5ea-420a-bf3b-c15c21943997.png">
  <img src="https://user-images.githubusercontent.com/76987021/213859032-bbb990b1-bfeb-4382-99da-c00c8d539ffe.png">
  <img src="https://user-images.githubusercontent.com/76987021/213859103-0413f284-04e8-4580-884d-c004bf0366a9.png">
  <img src="https://user-images.githubusercontent.com/76987021/213859053-7cef1989-b616-4276-8df6-6a96764e9948.png">
</div>


- 캐릭터 월드컵 :
    
    + 몇 강으로 진행할 것인지 선택하면 캐릭터 월드컵 페이지로 이동하여 진행.
    + 좌우의 캐릭터 중 더 마음에 드는 캐릭터를 선택해서 가장 좋은 캐릭터를 뽑기.

<div align="center">
  <img src="https://user-images.githubusercontent.com/76987021/212957345-5b2b803e-dfa0-4bb5-8fd8-7e0dd568b34f.png">
  <img src="https://user-images.githubusercontent.com/76987021/212957467-2261c521-266a-4fe4-b22a-348c0e46363f.png">
  <img src="https://user-images.githubusercontent.com/76987021/212957478-d1c8cf21-e028-4a7c-b81b-69a520f6cbd2.png">
</div>

<br><hr>

# 읽어주셔서 감사합니다.


