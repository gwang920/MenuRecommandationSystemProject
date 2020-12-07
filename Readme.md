## 2012-12-07
### 수정사항

* 오류
org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: Error instantiating class com.vo.Expression with invalid types () or values (). Cause: java.lang.NoSuchMethodException: com.vo.Expression.<init>()  
기본생성자가 없을 때 발생하는 오류
	

## 2020-12-06
### 수정사항

![image](https://user-images.githubusercontent.com/49560745/101281044-44cf4a80-3810-11eb-830a-4b073777031c.png)

1) 리뷰 글 목록 (scrol 기능으로 구현)
2) 코드 모듈화

## 2020-12-05
### 수정사항

![image](https://user-images.githubusercontent.com/49560745/101243135-834a0400-3741-11eb-9eb0-1bfd0d7dd092.png)
![image](https://user-images.githubusercontent.com/49560745/101243147-9361e380-3741-11eb-8244-9c8f8f1cfe82.png)


1) 리뷰 기능 구현  
- review 테이블 구현  
- insert, select 구현   
( 미완성 : 리뷰 데이터 페이지 당 개수 제한 + 번호 넘기기 기능으로 구현하기 )
2) UI 변경


- reference   
mybatis sql 관련 -https://sinna94.tistory.com/entry/MyBatis-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%A5%BC-%EC%82%BD%EC%9E%85%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95%EB%93%A4?category=696828

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
- reference - https://foryamu.tistory.com/entry/MyBatis-parameterType-HashMap-%EA%B4%80%EB%A0%A8-%EC%98%88%EC%8B%9C%EB%8B%A4%EC%A4%91%ED%8C%8C%EB%9D%BC%EB%AF%B8%ED%84%B0  

## 2020-12-03
### 수정사항

![image](https://user-images.githubusercontent.com/49560745/101140619-8ae0ae80-3656-11eb-9b08-6418a33adb72.png)




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

