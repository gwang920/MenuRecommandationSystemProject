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
