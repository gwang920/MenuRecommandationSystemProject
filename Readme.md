2020-12-03
수정사항

![image](https://user-images.githubusercontent.com/49560745/101027837-e90c8380-35bb-11eb-825c-e1ccea195161.png)

1) 별점 테이블 구축
2) 식당 클릭 이벤트 content 추가( 별점, naver링크)

* 오류
mybatis mapper 설정에서
두개의 파일에 같은 경로가 지정되어있어, 프로젝트가 무한로딩되었다.(톰캣 start시)
<mapper namespace="com.mapper.scoreMapper">

* 참고
- jsp 파일을 js로 모듈화할 때, 공유하는 변수를 어떤 방식으로 지정해야할까?
- dom 트리 파싱 => script태그는 body 태그 최하단에 둘수록 좋다.

2020-12-02
수정사항

![image](https://user-images.githubusercontent.com/49560745/100887421-4d660f00-34f8-11eb-8c57-31412d69cc95.png)

1) 지도 위 식당 리스트 업
2) 리스트 식당 클릭 이벤트
- 해당 식당 정보를 가져와 Parsing
- 해당 식당 위치로 이동
- 해당 식당의 정보 오버레이 기능(기능 자체만 구현, 해당 식당 데이터 적용 X)



* 참고
동적으로 생성 된 DOM에 접근하기
=> $(document).ready(function(){
			          $(document).on("click","#placesList > .item",function(event){}

