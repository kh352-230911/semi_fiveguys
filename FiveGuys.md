    
# FIVE GUYS

## 📍 강남구의 맛집을 검색 조회하여 식당 정보를 확인하고 예약할 수 있는 웹 애플리케이션

## 📍 식당 정보 조회(메뉴 정보, 위치 정보, 편의 시설, 리뷰), 리뷰 작성(사진 첨부, 댓글작성), 날짜 선택 시 영업시간 기준 1시간 마다 예약 시간 호출, 좋아요를 통한 찜 기능, 실시간 알림  

## 📍 남정네들
### 유정호 - 팀장
#### 주요개발 부분 
    * 더보기 페이징
    * 실시간 알림
    * 좋아요(찜)
#### 주요 기능
    * 검색에 따른 더보기 페이징 처리(비동기)
    * 좋아요 활성화/비활성화(비동기)
    * 예약 시 점주에게 실시간 알림 / 식당 등록 시 관리자에게 실시간 승인 알림
### 천무진 - 팀원
#### 주요개발 부분
    * 회원가입 및 로그인
    * 리뷰 및 리뷰 댓글
#### 주요 기능
    * 회원가입 아이디 중복조회(비동기)
    * 리뷰 등록 시 사진 첨부
### 오우진 - 팀원
#### 주요개발 부분
    * 마이페이지
    * 식당 상세페이지
#### 주요 기능
    * 유저 선호도에 따른 인덱스 페이지 변화
    * 식당, 마이페이지의 여러 테이블 데이터 조회
### 이재준 - 팀원
#### 주요개발 부분 
    * 관리자 메뉴
    * 점주 메뉴
    * 예약
    * Restaurant, Menu, Menu_picture 데이터 수집
#### 주요 기능
    * 가게 영업 시간 별 1시간 단위 예약 시간 호출
    
## 📍 기술 스택
<!-- 
정적아이콘 및 뱃지생성 사이트
https://simpleicons.org/?q=intellij
https://shields.io/badges/static-badge

simpleicons의 로고명, 컬러를 참조해서 shields.io문법에 따라 뱃지를 만든다.

shields.io 기본문법
https://img.shields.io/badge/<텍스트>-<배경색>?logo=<로고>&logoColor=<로그컬러> 
-->

###### Frontend
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white)
![Javascript](https://img.shields.io/badge/Javascript-F7DF1E?style=flat&logo=JavaScript&logoColor=white)
![jQuery](https://img.shields.io/badge/jQuery-white?style=flat&logo=jquery&logoColor=0769AD)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-white?style=flat&logo=tailwindcss&logoColor=0769AD)


###### Backend
![Servlet & JSP](https://img.shields.io/badge/Servlet_&_JSP-lightgray?style=flat&logo=data:image/png;base64,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)
![Oracle](https://img.shields.io/badge/Oracle-4479A1?style=flat&logo=oracle&logoColor=red)
![MyBatis](https://img.shields.io/badge/MyBatis-ffffff?style=flat&logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMzBweCIgaGVpZ2h0PSIzMHB4IiB2aWV3Qm94PSIwIDAgMzAgMzAiIHZlcnNpb249IjEuMSI+CjxkZWZzPgo8aW1hZ2UgaWQ9ImltYWdlOSIgd2lkdGg9IjMwIiBoZWlnaHQ9IjMwIiB4bGluazpocmVmPSJkYXRhOmltYWdlL3BuZztiYXNlNjQsaVZCT1J3MEtHZ29BQUFBTlNVaEVVZ0FBQUI0QUFBQWVDQVlBQUFBN01LNmlBQUFBQm1KTFIwUUEvd0QvQVArZ3ZhZVRBQUFFdTBsRVFWUklpZTJWVzRoVlZSakhmMnZ0Njlreng3azJuY1FiU3BNS0RVTkd6a09XRXRudG9ZZWVFaUtJQ3JRSG9TaXF4NFNJbm53cDU2R0xTUXFOcU1SZ0lLV0VraVExVFRrcWFVck5TYzh3ell6anpMbk0yWmUxVnc5enpuUThzODFCb2lmL3NQbSsvUzMyOTEvZmRjTnRKT0FENkQ0Q2cvK2xUelBKK0NGMGJZUFQxWGNKWTNmQVBZZmhlQUhPbFNGYmdzKzJ3cFZiSlpiMWhqNUk5Y0NwWG5pOGFuTmhZaENlRzRmK01seFlETTh1Z1QyM1Nnb2drb3dIb1M4REcvNkFQUWEwbXBBV0lCcGdaUWZjbTRWdlRFZy9CUTlYdjFtellrV1BiVmxQV29heFJrb1phSzEvSlFoMi8zRHAwcDhMSnU2RFZBbTJ6Y0RBVnZpMjltdy9mTndHR3pYNGo4RGFWY3VXcld1dzdWN1BkZGNaVWdvcEpZYVVHSWFCRUNJcWxzdDdwNVY2K2V6WnM4Rk5pV3RnQXczQVpOWHdNVHh6UCt6VG9IY3VXdlRlY0Z2YjZ3WFg5VVNWVUVwa25mU0Q0UHVDbEE4TkRBeUVDeVhPMkthWmRSem5uRzJhaDZWdDd4NGJHL3Z0Q1B6Y0FXdE5zQVFRQ3NHRVpYSE5zcGkwYmZLV0JVSVFDY0dNWmVFS3dVUVlmdjMreU1qbWhSSUwyelNuVTY3Ym1ISWNVbzZqYmRQTU5zZnhtWjBqSTAra2xaclhuTFg0YS9WcWRoc0duYmtjbS9ONS9VbFQwOUxlaVlrckFFWkNhdCt5RGFPOTBYRjhQNG9tcFJDYkxNdGFaWmttbG1rSzI3S2F5MEowbnZBODBlWDdOQ3VWU0dvdFc4YnlFeWY0Y21BQXU2Y0gvK0pGTVNQbG91OUtwWDZZUDA0QnNGM0JnVmpLUzNlMnRQaVo5dmJ1MXFZbTNaUk9rL1k4cEpTRVNqRW1KVzlrTXV4dmJxWXM1d2V1ZlovUlhJNlRKMDl5K3Z4NU9ydTdTY1h4ZzU3bkxVNktHT0J1cmZXNlNtY2FsbWsyT0pZbFBNZkJjMTFhMG1reXJhMDR0azJoWE9hTTYzSzBxWWtaMDZSTktkS1ZETVRGSWcxRFEyellzb1dWaGtGbmZ6K0RsbVVNU3BrUlFnd2sxYmdkdUdDYlprdktkZkZjbDFTRjFITWNValZTQXhleVdXS2w1anA0U1JUUk5UUERjdDhuRXdRNFdoTUxRZDZ5T09TNnYzeFZMTzRvRkFvSGtsYm1PUEJpcEZSZnBKUVJLWVZTaXFqdVVVcVJjbDJXZG5Ud2V5NEhXaU8wNXJKbE1lSTRpV04xclZoOHJUQTZlalNweGxVY2pMVitWU21sa2dpak9KN1QwNmtVY1J6UFBicEdyN1VwcFVJcm5UNWVKVWlxY1JXbkVDSXlwZHhrU0NsTXc1amJTTFg2WkQ3UHRVSUJJUVFJa1NpRkVQaGhPUGpUMEZCdjFYbmkzd25BTUl5WHBKUnZSMHBKUDRxd0UxSStWU3pPcHBsL0ZrS3RGRUJja1lIdjk5WDZUeUxPQUoraTlXTTZqa1VNaEVIQVZCd1RSaEZoSEJNcXhkWHBhYVpMSlF3aGtGSWl0SjZyczlDYXVDTFJHcTFVWG52ZXJoc1J0d0E3Z09lQnhyak9FVXBSS3BjcEI4RjFPMWxVWnJnK3d0cm95MEh3K2ZuaDRVSTljUmZ3RHZBbzRGVVB0TmF6alpLVVBpR3VpL0M2QzliSldLbHhsYysvV1o5V0V4Z0IxdFNTVmxFZjlWejY0dmlHdGF5enhhVWcyRDU4OWVwMHZXOEpqQUVQQUQvV0h3THpSaU91WENEV0dsMmpKOWxLNWZLdTRWeHVYNUxmNmpqNXdFZUFCYXduWWN6bXhvUGtEcTZORkNDTW9yN3M2T2dMU2FTMXhGVWNBdzRCSzRFVjFDK1ltcmxNbXRXS0hnUmgrRzV1ZlB5Vkc1RW1FY05zNnZkV0x1QXhPMTZOK2lZUm9uV2c0dmhZRklaUGowMU43ZjgzMGxvZk44TjZZS09VOGo0aHhGMVNpSlNVMHBKU2prdklZaGpIVzRyRkx5N0R6QUw5M2NiL2g3OEJPbXBvSDV3RHBDNEFBQUFBU1VWT1JLNUNZSUk9Ii8+CjwvZGVmcz4KPGcgaWQ9InN1cmZhY2UxIj4KPHVzZSB4bGluazpocmVmPSIjaW1hZ2U5Ii8+CjwvZz4KPC9zdmc+Cg==)
![Apache Tomcat](https://img.shields.io/badge/Apache_Tomcat-000000?logo=apachetomcat&logoColor=F8DC75)
![JUnit5](https://img.shields.io/badge/JUnit5-dc524a?logo=junit5&logoColor=25A162)
![Apache Maven](https://img.shields.io/badge/Apache_Maven-8a3578?logo=apachemaven&logoColor=C71A36)



###### Infra
<!-- 동적 아이콘 생성 사이트 https://techstack-generator.vercel.app/ -->

<div style="display:flex; align-items:flext-start;">
  <img src="https://techstack-generator.vercel.app/github-icon.svg" alt="icon" width="20" height="20" />
  <img src="https://img.shields.io/badge/Github_Actions-f7f7f7?logo=githubactions&logoColor=2088FF"/>
</div>
<div style="display:flex; align-items:flext-start;">
  <img src="https://img.shields.io/badge/Oracle_Cloud-ATP-4479A1?style=squre&logo=oracle&logoColor=red"/>
</div>

<div style="display:flex; align-items:flext-start;">
  <img src="https://techstack-generator.vercel.app/docker-icon.svg" alt="icon" width="20" height="20" />
  <img src="https://techstack-generator.vercel.app/aws-icon.svg" alt="icon" width="20" height="20" />
  <img src="https://img.shields.io/badge/Ubuntu-ffffff?logo=ubuntu&logoColor=E95420"/>
</div>

###### Tools
![Intellij IDEA](https://img.shields.io/badge/Intellij_IDEA-red?logo=intellijidea)
![VS Code](https://img.shields.io/badge/VS_Code-blue?logo=visualstudiocode)
![Source Tree](https://img.shields.io/badge/Source_Tree-ffffff?style=flat&logo=sourcetree&logoColor=0052CC)
![Discord](https://img.shields.io/badge/discord-5865F2?style=flat&logo=discord&logoColor=white) 
![Notion](https://img.shields.io/badge/notion-000000?style=flat&logo=notion&logoColor=white)
