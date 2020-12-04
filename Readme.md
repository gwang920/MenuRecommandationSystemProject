## 2020-12-04
### 수정사항

![image](https://user-images.githubusercontent.com/49560745/101140234-0aba4900-3656-11eb-83b9-2d65f5004731.png)



1) score 테이블 place_name,place_address 유니크 키 설정  
=> 매번 모든 별점을 가져와 계산하는 것은 큰 부하를 발생한다고 판단되어  
테이블에는 매번 갱신된(평균별점값) 값을 넣어주는 것으로 변경
  
2) 평점 계산해서 넣어주기(score/cnt)  
=> score 테이블 insert,select,selectall,update 기능 구현 완료  
  
3) 게시판 테이블 => 페이지 이동없이 ajax로 요청! (미완료)

* 문제해결
1) ajax 동기처리 => async : false
2) [object Object] 객체 접근 => 배열에 먼저 접근하고, 프로퍼티에 접근하기 ex)obj[0].score
3) mapper에 두개이상의 파라미터 넘기기 => @Param  
reference - https://foryamu.tistory.com/entry/MyBatis-parameterType-HashMap-%EA%B4%80%EB%A0%A8-%EC%98%88%EC%8B%9C%EB%8B%A4%EC%A4%91%ED%8C%8C%EB%9D%BC%EB%AF%B8%ED%84%B0  

## 2020-12-03
### 수정사항

![image](https://user-images.githubusercontent.com/49560745/101027837-e90c8380-35bb-11eb-825c-e1ccea195161.png)

1) 별점 테이블 구축
2) 식당 클릭 이벤트 content 추가( 별점, naver링크)

* 오류
mybatis mapper 설정에서
두개의 파일에 같은 경로가 지정되어있어, 프로젝트가 무한로딩되었다.(톰캣 start시)
<mapper namespace="com.mapper.scoreMapper">

* 참고
=> jsp 파일을 js로 모듈화할 때, 공유하는 변수를 어떤 방식으로 지정해야할까?
=> dom 트리 파싱 => script태그는 body 태그 최하단에 둘수록 좋다.

## 2020-12-02
### 수정사항

![image](https://user-images.githubusercontent.com/49560745/100887421-4d660f00-34f8-11eb-8c57-31412d69cc95.png)

1) 지도 위 식당 리스트 업
2) 리스트 식당 클릭 이벤트
=> 해당 식당 정보를 가져와 Parsing
=> 해당 식당 위치로 이동
=> 해당 식당의 정보 오버레이 기능(기능 자체만 구현, 해당 식당 데이터 적용 X)



* 참고
동적으로 생성 된 DOM에 접근하기
=> $(document).ready(function(){
			          $(document).on("click","#placesList > .item",function(event){}

