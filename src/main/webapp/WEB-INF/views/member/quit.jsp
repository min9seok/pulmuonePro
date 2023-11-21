<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<body>
<div class="wrapper">
	<div class="container relative">
	    <a class="member-close" href="/"></a>
	    <div class="account-wrapper">
	        <div class="account-logo-wrapper">
	            <a class="account-logo"></a>
	        </div>
	    </div>
	</div>

	<div class="container-wrapper member"> <!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
					<li><a href="/">홈</a></li>
					<li><a href="/mypage">MY녹즙</a></li>
					<li><a class="" href="/">개인정보</a></li>
					<li><a class="" href="/">개인정보관리</a></li>
					<li><a class="active" href="/">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		<form id="quitForm">
			<input type="hidden" id="interest" name="interest" value="">
			<div class="container aside-layout" style="padding-bottom:120px; ">
					<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>
					<div class="container">
						<div class="border-wrapper">
							<h2 class="container-title">
								회원탈퇴
							</h2>
						</div>
						<div class="box-partition nobox leave">
							<div class="part" style="padding-top:16px;">
								<div class="part-head">
									<h4>회원탈퇴 사유를 알려주세요.</h4>
								</div>
								<div class="box-partition">
									<div class="part" style="padding:20px 30px 30px;">
										<div class="vertical-radio-group" style=" width:640px; ">
											<label>
												<input type="radio" value="A" name="deregType" class="deregType">
												<div class="radio-display"></div>
												<p>구매의사가 없다.</p>
											</label>
											<label>
												<input type="radio" value="B" name="deregType" class="deregType">
												<div class="radio-display"></div>
												<p>이용한 상품 및 서비스에 불만족스럽다.</p>
											</label>
											<label>
												<input type="radio" value="C" name="deregType" class="deregType">
												<div class="radio-display"></div>
												<p>타 상품 및 서비스를 이용하고자 한다.</p>
											</label>
											<label>
												<input type="radio" value="D" name="deregType" class="deregType">
												<div class="radio-display"></div>
												<p>홈페이지 회원 혜택이 적다.</p>
											</label>
											<label>
												<input type="radio" value="E" name="deregType" class="deregType" id="deregTypeE">
												<div class="radio-display"></div>
												<p>기타 사유</p>
											</label>
											<div class="form-input none-dt" style="padding-left:39px; margin-top:2px; width: 679px;">
												<dl>
													<dt><label>기타 사유 입력</label></dt>
													<dd>
														<input id="deregReason" name="deregReason" type="text" placeholder="기타사유를 작성해주세요." disabled="">
													</dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
								<div class="button-set" style="margin-top:20px;">
									<button style="width:280px;" type="button" class="button-basic border" onclick="location.href='/mypage/personal/info.do'">
										취소
									</button>
									<button style="width:280px;" type="button" class="button-basic primary" id="quitBtn">
										회원탈퇴
									</button>
								</div>
							</div>
						</div>
					</div>

					</div>
					</form>
				</div>
	
</div> <!-- wrapper -->

<script type="text/javascript">
	$().ready(function() {

		$(".deregType").click(function (){
			if($(this).val() == 'E'){
				$("#deregReason").prop('disabled',false);
				$("#deregReason").css('background-color','#fff');
			} else {
				$("#deregReason").prop('disabled',true);
				$("#deregReason").css('background-color','#efefef4d');
			}
		})

		$("#quitBtn").click(function (){
			var deregType = $("input[name='deregType']:checked").val();
			if(deregType == undefined){
				alert("탈퇴사유를 선택해주세요.")
				return
			}
			if(deregType == 'E'){
				if($('#deregReason').val().trim() == ''){
					alert("탈퇴사유를 입력해주세요.")
					return;
				}
			}

			var ajaxStatus = false;
		    var params = null;
		    params = $("#quitForm").serialize();
			$.ajax({
				url:"/member/quit.ajax" , 
				dataType:"json",
				type:"POST",
				data: params,
				cache:false ,
				success: function ( data,  textStatus, jqXHR ){
					if( data.rowCount == "1" ) {
						ajaxStatus = true;
		 				alert( "회원탈퇴가 완료되었습니다.", ()=>{location.href='/'});

					} else {  
						console.log("비밀번호가 틀렸습니다.");
						alert( "시스템에러");
					}
				 
				},
				error:function (){
				 alert("에러~~~ ");
				}
			});
			
// 			post({
// 				"url": "/member/quit",
// 				"param": $("#quitForm").serialize()
// 			}, function(response) {
// 				alert("회원탈퇴가 완료되었습니다.",function (){
// 					location.href='/'
// 				})
// 			},function (responseFail){
// 				if(responseFail.RESULT_MSG.error == '' || responseFail.RESULT_MSG.error == undefined){
// 					alert("시스템에러");
// 				} else {
// 					alert(responseFail.RESULT_MSG.error);
// 				}
// 			});
		})

		// $("input[type=radio][name=deregType]").change(function() {
		// 	$("#deregReason").val("");
		// 	if ( $(this).val() == "G" ) {
		// 		$("#deregReason").prop("disabled", false);
		// 	}
		// 	else {
		// 		$("#deregReason").prop("disabled", true);
		// 	}
		// });
		//
		// $("#deregReason").keyup(function() {
		// 	var len = $(this).val().length;
		// 	if ( len > 100 ) {
		// 		return false;
		// 	}
		//
		// 	$("#len").text(len);
		// });
		//
		// $("#quitBtn").click(function() {
		// 	if ( !$("#agree").prop("checked") ) {
		// 		alert( "회원탈퇴 시 유의사항을 확인하고 탈퇴에 동의해주세요.");
		// 		return false;
		// 	}
		//
		// 	if ( $("input[type=radio][name=deregType]:checked").length == 0 ) {
		// 		alert( "회원탈퇴 사유를 선택해주세요.");
		// 		return false;
		// 	}
		//
		// 	if ( $("input[type=radio][name=deregType]:checked").val() == "F" ) {
		// 		$("#deregReason").val($.trim($("#deregReason").val()));
		// 		if ( $("#deregReason").val() == "" ) {
		// 			alert( "탈퇴사유를 입력해주세요.");
		// 			return false;
		// 		}
		// 	}
		//
		// 	post({
		// 		"url": "/member/quit",
		// 		"param": $("#quitForm").serialize()
		// 	}, function(response) {
		// 	});
		// });
	});
</script>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
		</div>
	</div>
</div>




</body>
</html>
