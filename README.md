# Spring Boot-workExperience 

### 백오피스 관리페이지(가제) 
메인 페이지에서 (회원명, 회원 아이디, 회원 핸드폰 번호, 주문번호, 제품번호, 제품명, 사업자명, 사업자 핸드폰 번호, 사업자 주소, 회원 탈퇴여부) 값을 제공하며, (회원명, 주문번호, 사업자명, 제품명)으로 검색이 가능합니다. 
추가로 context menu를 활용하여 (회원정보상세, 사업자정보상세, 제품정보상세) 중 각각 옵션 별로 상세 정보 확인과 수정이 가능한 모달창을 제공합니다. 
#### 기간: 
07.22 ~ 08.02 (약 2주) 
#### 기술스택(버전): 
Java(17), Spring Boot(3), JSP, MyBatis3, jQuery(3.7.1), jqGrid(4.16), OrcleDB(11g), ojdbc(19.8), Docker, Colima 
- Java 8 버전을 사용하려고 했으나, Spring boot 3^ 버전부터 Java 17 버전까지만 지원하여 버전 업을 하였습니다. 
- Oracle에서 Mac OS를 정식으로 지원하고 있지 않아 Docker Container를 활용하였습니다. 
- [Oracle(11g) Container Image의 경우 x86환경에 적합하여 Colima를 통해 x86_64 가상 환경을 제공하였습니다.](https://github.com/gvenzl/oci-oracle-xe/issues/63) (Container의 경우 호스트의 커널을 공유하고 x86_64 아키텍처용으로 빌드된 이미지는 MacBook의 ARM 아키텍처 호스트에서 실행되지 않습니다.) 
- Colima 가상 머신은 독립된 커널을 사용하므로 호스트의 아키텍처와 관계없이 게스트 아키텍처를 지원할 수 있습니다. 
- Colima는 Docker Desktop을 대신해서 Docker 엔진을 실행해 주는 역할을 합니다.
- 기존 colima를 내리고 Virtual Machine인 VMware에 Windows OS로 올리고 서비스를 연결 시도중
  - ~listener 혹은 드라이버 문제로 지연중~
  - VMware 재 구성 후 가상환경인 윈도우 터미널에서`ipconfig`로 IP 체크 후 호스트인 맥북에서 ping test와 telnet 시도 후 성공적으로 연결 (초기에 VMware Network Adapter를 Bridged (Autodetect)로 설정) 
#### [ERD](https://www.erdcloud.com/d/nD2WNk2GJWYL3mLNH)
