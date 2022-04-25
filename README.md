# Servlet/Jsp Web 미니 쇼핑몰 프로젝트
___
## 프로젝트 개요
 
## 프로젝트 구조
모든 페이지 구성은 MVC 패턴으로 제작했습니다. Servlet은 전부 Controller로써만 사용되고 화면 구현이 수월한 JSP로 View를 구성했습니다. Oracle DataBase의 테이블을 바탕으로 DTO클래스 작성, DAO와 Service 객체로 Model Class 구성하고 MyBatis로 DB에 접근하였습니다.
## DB 모델 및 구조

## 기능 및 세부 내용
 - 회원가입(Ajax로 아이디 중복과 비밀번호 확인 시 일치 여부 체크)
 - 아이디 찾기(Java Mail API 사용하여 가입 정보의 메일로 발송)
 - 마이페이지(회원정보 수정)
 - 회원가입, 회원정보수정 시에 Daum 우편번호 서비스 API 사용
 - 상품 카테고리(분류별로 상품들의 이미지가 뜨도록)
 - 장바구니(상품 수량 변경, 장바구니 상품 삭제, 복수의 상품 선택하여 제어)
 - 상품 이미지 보이기, 장바구니에서 상품 옵션 변경 등 DB Query로 CRUD 제어
 - Servlet 내의 Filter API 사용하여 모든 HTTP 요청과 응답 사이에 부가적인 작업 처리 가능하도록



## 기술 스택 및 환경
FrontEnd - HTML5, CSS3, Javascript(+jQuery, Ajax)
BackEnd - Java(v1.8), Servlet&JSP, Oracle DataBase, MyBatis



