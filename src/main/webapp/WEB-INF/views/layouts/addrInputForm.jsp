<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- 주문서 작성 시 배송정보 입력 form -->
<div class="checkout-input-area">
	<div class="checkout-input-title-area">
		<h3 class="checkout-input-title">배송정보</h3>
		<button type="button">
			<i class="ico ico-down"></i>
		</button>
	</div>
	
	<div class="checkout-input-box">
		<div class="prd-cart-all-select">
			<div class="checkbox chk-type3">
				<input type="checkbox" name="chk-same" id="chk-same" checked="checked">
				<label for="chk-same">고객정보와 동일</label>
			</div>
			<button id="addressBtn" type="button" class="btn-round2" data-toggle="modal" data-target="#addressModal">주소록</button>
		</div>
	
	<script>
		$("#chk-same").click(function() {
			$("#receiver").val("");
			$("#tel").val("");
			if ($(this).is(":checked")) {
				$("#receiver").val("${ miDto.name }");
				$("#tel").val("${ miDto.tel }");
			} // if
		});
	</script>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="receiver">받으시는분</label>
			</dt>
			<dd>
				<input type="text" id="receiver" name="orderName" placeholder="이름을 입력하세요" value="${ miDto.name }" maxlength="10">
			</dd>
		</dl>
	</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="phone">휴대폰번호</label>
			</dt>
			<dd>
				<input type="tel" id="tel" name="tel" maxlength="13" placeholder="휴대폰번호를 입력하세요" value="${ miDto.tel }">
			</dd>
		</dl>
	</div>
								
	<div class="form-input">
		<dl>
			<dt>
				<label for="zipcode">우편번호</label>
			</dt>
			<dd>
				<input id="zipcode" name="zipCode" placeholder="주소찾기 버튼을 눌러주세요" style="background: #fff" readonly>
				<button type="button" id="searchPostcode" class="btn-square btn-black">주소찾기</button>
			</dd>
		</dl>
	</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="addrRoad">주소</label>
			</dt>
			<dd>
				<input type="text" id="addrRoad" name="addrRoad" title="주소 입력" value="" style="background: #fff" readonly>
			</dd>
		</dl>
	</div>
								
	<!-- 다음 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$("#searchPostcode").on("click", function() {
			new daum.Postcode({
				oncomplete: function (data) {
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; 		 // 참고 항목 변수
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
					}
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
					$("#zipcode").val(data.zonecode);
					$("#addrRoad").val(data.roadAddress);
					$("#orderStreetAddress").val(data.jibunAddress);
				}
			}).open();
		});
	</script>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="addrDetail">상세주소</label>
			</dt>
			<dd>
				<input type="text" id="addrDetail" name="addrDetail" placeholder="상세주소 입력" value="" maxlength="100">
			</dd>
		</dl>
	</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="memo">배송메모</label>
			</dt>
			<dd>
				<input id="memo" name="orderMemo" title="배송메모를 입력하세요" placeholder="배송메모를 입력하세요" value="">
			</dd>
		</dl>
	</div>
	
		<div class="checkbox chk-type3" style="margin-top: 28px">
			<input type="checkbox" id="saveAddrChk" name="saveAddrChk">
			<label for="saveAddrChk">주소록에 저장</label>
		</div>
	</div>
</div>