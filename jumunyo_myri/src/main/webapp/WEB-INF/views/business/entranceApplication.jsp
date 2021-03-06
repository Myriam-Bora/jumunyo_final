<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a0d6058ad1aeee56b87fdda98330c43&libraries=services"></script>
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
	background: #EAEAEA;
}
.entrance {
	width: 50%;
	margin: 100px 25%;
	height: auto;
}
.res-name1 {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black; 
}
.res-name_input {
	width: 200px;
	height: 30px; 
	font-size: 15px; 
	border-radius: 20px;
}
.res-category {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black; 
}
.select1 {
	width: 200px;
	height: 30px; 
	font-size: 15px; 
	border-radius: 20px;
}
.tel {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black;
}
.telinput {
	width: 200px; height: 30px; font-size: 15px; border-radius: 20px;
}
.number {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black;
}
.numinput {
	width: 200px; height: 30px; font-size: 15px; border-radius: 20px;
}
.representative {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black;
}
.repinput {
	width: 200px; height: 30px; font-size: 15px; border-radius: 20px;
}
.address {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px 0;
	border-bottom: 1px solid black;
}
.addressinput {
	width: 500px; height: 30px; font-size: 15px; border-radius: 20px;
}
.addressfindbtn {
	width: 150px; height: 30px; font-size: 20px; background: #ABF200; border: none; border-radius: 20px;
}
.consent {
	width: 50%;
	margin: 30px 25%;
	height: auto;
}
.submitbtn {
	width: 50%;
	margin: 30px 25%;
	height: auto;
}
.footer {
	border-top: 2px solid black;
	margin: 200px 0;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/CSS/entranceApplication.css">
</head>
<body>
<!-- 입점 신청페이지 입니다. -->
		<jsp:include page="../include/businessHeader.jsp" />
<form action="entrance_request">
	<div class="entrance">
		<h1 style="text-align: center;">주문요 입점신청</h1>
		<div class="res-name1">
			<a>매장이름 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="restaurant_name" class="res-name_input" value="" />
		</div>
		 <div class="res-category">
			<a>매장 업종 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="category_id" class="select1">
			<c:forEach var="clist" items="${clist }">
			<option value="${clist.category_id }">${clist.category_name }</option>
			</c:forEach>
			</select>

		</div>

		 <div class="tel">
			<a>매장 전화번호 : </a>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="restaurant_tell"  class="telinput" value="" />
		</div> 
		<div class="number">
			<a>사업자 번호 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<input type="text" name="restaurant_businessnumber" class="numinput" value="" />
			<br>
			<a>사업자등록증 사본등록 : </a>
			<div class="filebox">
						<input type="file"  value="" name="restaurant_businessnumber_img" id="" title="">
						<p class="file_name" id="p1" style="color: #F15F5F;"></p>
						<input type="hidden" name="file_name" id="filename" /> 
					</div>
		</div>
		<div class="representative">
			<a>대표자명 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="restaurant_owner" class="repinput" value="" />

		</div>

		<div class="address">
			<a>주소 : </a>
			&nbsp;&nbsp;
			<input type="text" name="restaurant_address" id="restaurant_address" class="addressinput" value="" /> &nbsp;&nbsp;
			<input type="button" id="find1" class="addressfindbtn" onmouseover="changecolor('find1');" onmouseout="changeback('find1');"
			onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	<div id="map" style="width:500px;height:400px;"></div>
	<script> /* 도로명 주소 api */
	
		    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		        mapOption = {
		            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		            level: 5 // 지도의 확대 레벨
		        };
		
		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
		
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("restaurant_address").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                        
		                        document.getElementById("latitude").value = result.y;
		                        document.getElementById("longitude").value = result.x;
		                        
		                    }
		                });
		            }
		        }).open();
		    }
		</script>
		</div>
		<div class="consent">
			<h2 style="text-align: center;">정보수집 및 이용동의</h2>
			<label>
			<input type="checkbox" value="이용약관 전체" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			광고 수신에 모두 동의합니다.</b>
			</label>
			<br />
			<label>
			<input type="checkbox" value="이용약관 전체" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>이용약관, 개인정보 수집 및 이용에 동의합니다.(필수)</b>
			</label>
			<br />
			<label>
			<input type="checkbox" value="이용약관 전체" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>위치정보 이용약관에 동의합니다.(필수)</b>
			</label>
			<br />
			<label>
			<input type="checkbox" value="이용약관 전체" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>광고성 메일 수신에 동의합니다.(선택)</b>
			</label>
			<br />
		</div>
		<div class="submitbtn">
			<input type="submit" value="확인" 
			style="width: 150px; height: 50px; border-radius: 10px; background: #00C6ED;"
			 />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소" 
			style="width: 150px; height: 50px; border-radius: 10px; background: #F15F5F;"
			/>
		</div>
		<input type="hidden" name="user_id" value="${sessionScope.userSession.user_id }" />
		<input type="hidden" name="latitude" value="" id="latitude" />
		<input type="hidden" name="longitude" value="" id="longitude"/>
	</div>
	
</form>
<div class="footer">
		<jsp:include page="../include/businessFooter.jsp"/>
		</div>
</body>
</html>