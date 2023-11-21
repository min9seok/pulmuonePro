<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>



<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
		            <li><a href="/">홈</a></li>
		            <li><a href="/mypage">MY녹즙</a></li>
		            <li><a class="" href="/mypage/personal/address">개인정보</a></li>
		            <li><a class="active" href="/mypage/personal/info">개인정보관리</a></li>
		        </ul>
			</div>
		</div>
		<div class="container aside-layout main" style="padding-bottom:100px; ">
			<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>
			<div class="container">
			<div class="border-wrapper">
				<h2 class="container-title">
					개인정보 변경
				</h2>
			</div>
			<div class="box-partition nobox" style="width:640px;">
				<form id="memberForm">
				<input type="hidden" id="myRecommendCode" value="${ invCode }">
				<div class="part" style="padding:10px 0 20px;">
					<div class="part-head">
						<h5>기본정보</h5>
						<button type="button" class="rounded-button black recommendCode">내 추천코드 복사</button>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label for="name">이름</label>
							</dt>
							<dd>
								<input type="text" id="name" name="name" value="${ name }" disabled="">
							</dd>
						</dl>
					</div>
					
						<div class="form-input">
							<dl>
								<dt>
									<label for="id">아이디</label>
								</dt>
								<dd>
									<input type="text" id="id" name="id" value="${ auth.getMemberId() }" disabled="">
								</dd>
							</dl>
						</div>
					
					<div class="form-input pwdShow">
						<dl>
							<dt>
								<label for="memberPwd">비밀번호</label>
							</dt>
							<dd>
								<input type="password" autocomplete="off" id="memberPwd" name="memberPwd" value="********" disabled="">
								<button type="button" class="btn-square btn-black" id="changePwdBtn">비밀번호변경</button>
							</dd>
						</dl>
					</div>
					<div class="form-input pwdHidden" style="display: none;">
						<div>
							<dl>
								<dt>
									<label for="newPassword">새 비밀번호</label>
								</dt>
								<dd>
									<input autocomplete="off" type="password" id="newPassword" name="newPassword" value="">
								</dd>
							</dl>
						</div>
						<div class="form-input" style="margin-top: 10px">
							<dl>
								<dt>
									<label for="memberPwdConfirm">새 비밀번호 확인</label>
								</dt>
								<dd>
									<input autocomplete="off" type="password" id="memberPwdConfirm" name="memberPwdConfirm" value="">
								</dd>
							</dl>
						</div>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label for="phonNum">휴대폰번호</label>
							</dt>
							<dd>
								<input type="text" id="phonNum" name="phonNum" value="${ tel }" disabled="">
							</dd>
						</dl>
					</div>
					<div class="form-input select">
						<dl>
							<dt>
								<label for="email">이메일</label>
							</dt>
							<dd>

								<input type="text" id="email" name="email" value="${ emailId }">
								<span style="margin: 0 5px;padding: 0">@</span>
								<input type="text" id="emailHost" name="emailHost" value="${ emailHost }" style="max-width: 169px">
								<div class="dropdown">
									<a class="btn dropdown-toggle email" href="#" role="button" data-toggle="dropdown" aria-expanded="false">직접입력</a>
									<div class="dropdown-menu">
										<a class="dropdown-item email" data-value="naver.com" href="javascript:void(0)">naver.com</a>
										<a class="dropdown-item email" data-value="daum.net" href="javascript:void(0)">daum.net</a>
										<a class="dropdown-item email" data-value="gmail.com" href="javascript:void(0)">gmail.com</a>
										<a class="dropdown-item email" data-value="nate.com" href="javascript:void(0)">nate.com</a>
										<a class="dropdown-item email" data-value="1" id=" firstEmailSelect" href="javascript:void(0)">직접 입력</a>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<div class="btn-area-right">
						<button class="rounded-button" type="button" onclick="location.href='/member/quit.do'">회원탈퇴</button>
					</div>
					<span id="errorMark" style="color: #ee1c25;padding-inline: 8px;font-size: 13px;display: none">!</span>
					<span id="emailError" class="message" style="color: #ee1c25;font-size: 13px;"></span>
				</div>
				<div class="part">
					<div class="part-head desc">
						<h5>고객님께 딱 맞는 추천을 위해 알려주세요!</h5>
						<p>
							최근 건강 관심사 어떻게 되시나요?<br>
							(최대 3개까지 선택 가능)
						</p>
					</div>
					<ul class="interest-wrapper">
						<li>
							<label class="interest1">
								<input type="checkbox" class="interest" id="interest1" value="1">
								<div class="item">
									<p>피부미용</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest2">
								<input type="checkbox" class="interest" id="interest2" value="2">
								<div class="item">
									<p>채소섭취</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest3">
								<input type="checkbox" class="interest" id="interest3" value="3" data-gtm-form-interact-field-id="0">
								<div class="item">
									<p>간식대용</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest4">
								<input type="checkbox" class="interest" id="interest4" value="4">
								<div class="item">
									<p>어린아이</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest5">
								<input type="checkbox" class="interest" id="interest5" value="5" data-gtm-form-interact-field-id="2">
								<div class="item">
									<p>속이편한</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest6">
								<input type="checkbox" class="interest" id="interest6" value="6" data-gtm-form-interact-field-id="1">
								<div class="item">
									<p>과일섭취</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest7">
								<input type="checkbox" class="interest" id="interest7" value="7">
								<div class="item">
									<p>비타민 섭취</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest8">
								<input type="checkbox" class="interest" id="interest8" value="8">
								<div class="item">
									<p>간편한 아침</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest9">
								<input type="checkbox" class="interest" id="interest9" value="9">
								<div class="item">
									<p>유산균</p>
								</div>
							</label>
						</li>
					</ul>

				</div>
				<div class="part">
					<div class="part-head">
						<h5>SNS연결 관리</h5>
					</div>
					<div class="sns-selector-group toggle-style">

						<div class="kakao item">
							<div class="ico">
								<i></i>
							</div>
							<p>카카오</p>
							<c:choose>
								<c:when test="${ kakaoToken != null }">
										<div class="sns-link active">
											<span>연결완료</span>
										</div>
								</c:when>
							</c:choose> 		
						</div>
						<div class="naver item">
							<div class="ico">
								<i></i>
							</div>
							<p>네이버</p>
							<c:choose>
								<c:when test="${ naverToken != null }">
										<div class="sns-link active">
											<span>연결완료</span>
										</div>
								</c:when>
							</c:choose> 	
						</div>
					</div>
				</div>
				<div class="part">
					<div class="flex flex-row">
						<label class="check-type" style="flex:1;">
							<input type="checkbox" id="marketingYn" name="marketingYn" value="Y">
							<span>
							마케팅 수신 동의 (선택)<br>
							<em>다양한 쿠폰, 프로모션 혜택 알림을 받으실 수 있습니다.</em>
						</span>
						</label>
						<button type="button" class="button-text" data-toggle="modal" data-target="#marketingPolicy">내용보기</button>
					</div>
					<div class="flex flex-row">
						<label class="check-type" style="flex:1;">
							<input type="checkbox" id="adYn" name="adYn" value="Y">
							<span>
							광고성 정보 수신 동의 (선택)<br>

						</span>
						</label>
						<button type="button" class="button-text" data-toggle="modal" data-target="#adverPolicy">내용보기</button>
					</div>
					<div class="button-set" style="margin-top:20px;">
						<button type="button" class="button-basic border" onclick="location.href='/mypage/personal/info.do'">
							취소
						</button>
						<button type="button" class="button-basic primary" id="saveBtn">
							저장
						</button>
					</div>
				</div>
			</div>
			</form>
		</div>
					
			</div> <!-- container aside-layout main -->

		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%>
 	</div> <!-- wrapper -->
 	
<script>
	$(function () {
	    $("div.item p").each(function(index) {
	        if ($(this).text() != 0) {
	            $("div.item:eq(" + index + ")").parent("li").addClass("active");
	        } // if
	    });
	})
</script>

<script>
$(function () {
	// 관심사 선택
	$('.interest[value=${ interestCode1 }]').attr("checked", "checked");
	$('.interest[value=${ interestCode2 }]').attr("checked", "checked");
	$('.interest[value=${ interestCode3 }]').attr("checked", "checked");
	if (${ adApproval } == 1) {
		$("#adYn").attr("checked", "checked");
	}
	if (${ marketingApproval } == 1) {
		$("#marketingYn").attr("checked", "checked");
	}
});

</script>

<script type="text/javascript">
	let host = "";
	$().ready(function() {

		$('.my-page-change-info-input.new-pwd-li').hide();

		$(".recommendCode").click(function (){
			$('#myRecommendCode').attr('type', 'text');
			// input에 담긴 데이터를 선택
			$('#myRecommendCode').select();
            const text = $('#myRecommendCode').val();
			//  clipboard에 데이터 복사
			var copy = document.execCommand('copy');
			// input box를 다시 hidden 처리
			$('#myRecommendCode').attr('type', 'hidden');
			alert(`복사완료 <br> 추천코드는 ${ invCode } 입니다.`)
		})

		$("#recommenderCodeBtn").click(function (){

			let recommenderCode = $("#recommenderCode").val();
			if(recommenderCode == undefined || recommenderCode.trim() == ''){
				return alert("추천인 코드를 입력해주세요.")
			}
			get({
				"url": "/mypage/personal/info/detail/" + $("#recommenderCode").val(),
				"param": {}
			}, function(response) {
				alert("등록되었습니다.")
				$("#recommenderCodeBtn").prop("disabled", true);
				$("#recommenderCode").prop("disabled", true);
			}, function (responseFail){
				alert(responseFail.RESULT_MSG)
			});
		})

		$(".pwdHidden").hide();

		// // 모바일 청구서 수신동의시
		// $("#adYn").click(function() {
		// 	if($("#market신ingYn").is(":checked")){
		//
	    //     }else{
	    //     	alert("마케팅 수신동의을 선택하세요");
	    //     	$('input[name="adYn"]').attr('checked', false);
	    //     }
		// });
		//
		// $("#marketingYn").click(function() {
		// 	if($("#marketingYn").is(":checked")){
		//
	    //     }else{
	    //     	$('input[name="adYn"]').attr('checked', false);
	    //     }
		// });

		// 비밀번호 변경 버튼 클릭
		$("#changePwdBtn").click(function() {
			trim("#memberPwd");
			var pwd = $("#memberPwd").val();
			if ( pwd == "" ) {
				alert( "비밀번호를 입력해주세요.");
			}
			$(".pwdHidden").show();
			$(".pwdShow").hide();
			$(".pwdHidden").find("input[type=text], input[type=password]").prop("disabled", false);
		});

		// 비밀번호 변경 취소 버튼 클릭
		$("#cancelChangePwdBtn").click(function() {
			$(".pwdHidden").find("input[type=text], input[type=password]").val("");
			$(".pwdHidden").find("input[type=text], input[type=password]").prop("readonly", true);
			$(".pwdHidden").find("input[type=text], input[type=password]").prop("disabled", true);
			hideError("memberPwdError");
			hideError("memberPwdConfirmError");
			$(".pwdHidden").hide();
			$(".pwdShow").show();
		});

		// 휴대폰 번호 변경 버튼 클릭
		$("#changePhoneNumberBtn").click(function() {
			windowOpen('popupChk', "AgAFQlExMDPEbSSDgn7NhVWQ1sHTqKHCBzIr86G0mv4DizVKOUUp3xVSB7k1FPc6Qd+huZEsefMYlVNXQEgq88UgDW4AvVRyRPbMcsR+xGxYnqSYbgqAiubBsUifcb/UMRIC/Pz+IIpflm2AZf/xT8MmYP965Bh7LhDOB3aQC74376i87P/moVuJJ0v8fmM/7OnV/M7WuWoc4odOgSeamaUMq0KST/qF4bp7gutqDZDLXbH8oQFTeOENQeiFqzTjmqXljS/D3tyux6AUQeowLL1u2EC7vAqBa+M2Zw+caaByk0hTeBM+5WrPiYjXmQ+bP+nv0rrxyoaCygGs3h93klMsiTen+2QMkbRTIy4Rn3uasoRH8gRrHhsMtxDd4MmKu/yPoYeFYdfKr08160mVJP3JtjbdSS5hCf2fPnKMmqPvy1ndbpxNq2i2JDTwFh1GerwktKZgyWF6lrv+uqAuQ1BSlod0JtKY0llB4Ao5vr7VwnJQPPp42WBvcIIieIio9N1zhRaU+pJW3N/bjNA7DlKtXtQ/0+6hdQ0xmXh5960VL4o0aX352cWWQQCDYlnKn2/dk1qSCmY=");
		});


		$("#memberPwd").keyup(function(e) {
			var pwd = $(this).val();
			var id = "show2891";

			if ( pwd == "" ) {
				showError("memberPwdError", message.member.regist.password.empty);
			}
			else if ( pwd.indexOf(" ") > -1 ) {
				showError("memberPwdError", message.member.regist.password.space);
			}
			else if ( !message.member.regist.password.isFormat(pwd) ) {
				showError("memberPwdError", message.member.regist.password.format);
			}
			else if ( message.member.regist.password.isConnect(pwd) ) {
				showError("memberPwdError", message.member.regist.password.connect);
			}
			else if ( pwd.indexOf(id) > -1 ) {
				showError("memberPwdError", message.member.regist.password.sameId);
			}
			else {
				hideError("memberPwdError");
			}
		});
		$("#memberPwd").blur(function() {
			$(this).keyup();
		});

		$("#memberPwdConfirm").keyup(function(e) {
			var pwdConfirm = $(this).val();
			var pwd = $("#memberPwd").val();

			if ( pwdConfirm == "" ) {
				showError("memberPwdConfirmError", message.member.regist.password.more);
			}
			else if ( pwdConfirm != pwd ) {
				showError("memberPwdConfirmError", message.member.regist.password.notMatch);
			}
			else {
				hideError("memberPwdConfirmError");
			}
		});
		$("#memberPwdConfirm").blur(function() {
			$(this).keyup();
		});

		$("#email, #emailHost").keyup(function(e) {

			var email = $("#email").val();
			var emailHost = $("#emailHost").val() || $("#emailHostList").val();
			var fullEmail = email + "@" + emailHost;
			if ( email == "" ) {
				$('#errorMark').css('display','inline-block');
				$('#emailError').css('display','inline-block');
				showError("emailError", message.member.regist.email.empty);
			}
			else if ( emailHost == "" ) {
				$('#errorMark').css('display','inline-block');
				$('#emailError').css('display','inline-block');
				showError("emailError", message.member.regist.email.empty);
			}
			else if ( !message.member.regist.email.isFormat(fullEmail) ) {
				$('#errorMark').css('display','inline-block');
				$('#emailError').css('display','inline-block');
				showError("emailError", message.member.regist.email.format);
			}
			else {
				$('#errorMark').css('display','none');
				$('#emailError').css('display','none')
				hideError("emailError", message.member.regist.email.format);
				// post({
				// 	url: "/member/duplicate/email"
				// 	, param: {
				// 		"idOrEmail": fullEmail,
				// 		"useMemberId": "Y"
				// 	}
				// }, function(response) {
				// 	if ( response.RESULT_MSG ) {
				// 		showError("emailError", message.member.regist.email.duplicate);
				// 	}
				// 	else {
				// 		$('#errorMark').css('display','none');
				// 		$('#emailError').css('display','none');
				// 		// hideError("emailError");
				// 		// showSuccess("emailError", message.member.regist.email.ok);
				// 	}
				// });
			}
		});

		$("#email, #emailHost").blur(function() {
			$(this).keyup();
		});

		$("#emailHostList").change(function() {
			$("#emailHost").val("");
			if ( $(this).val() == "1" ) {
				$("#emailHost").prop("disabled", false);
			}
			else if ( $(this).val() == "" ) {
				$("#emailHost").prop("disabled", true);
			}
			else {
				$("#emailHost").prop("disabled", false);
				$("#emailHost").prop("readonly", false);
				$("#emailHost").val($(this).val());
			}

			$("#email").keyup();
		});

		$("#emailHostList").change();
		$("#emailHost").val("naver.com");
		// $("#email").keyup();

		var interest = [];

		$(".interest").change(function() {
			if ( $(this).prop("checked") ) {

				if ( interest.length >= 3 ) {
					alert( message.member.regist.interest.max);
					$(this).prop("checked", false);
					$(this).next().css({
						"borderColor": "",
						"backgroundColor": ""
					});
					return false;
				}
				//rcRandomColor();
				interest.push($(this).val());
			}
			else {
				for ( var i in interest ) {
					if ( interest[i] == $(this).val() ) {
						interest.splice(i, 1);
					}
				}
			}

		});

		// 네이버 연동 클릭
		$("#snsNaver").change(function() {
			if ( $(this).prop("checked") ) {
				disablesSns("N", false, true);
				window.open("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=i7eb3o1oVsnPsxrI4jQ5&redirect_uri=https://greenjuice.pulmuone.com/sns/naver&state=932907786154283149778152319702194390199&state=%7B%7D", "popup_window", "width=500, height=300, scrollbars=yes");
			}
			else {
				$("#snsNaver").prop("checked", true);
				confirmDesign("", "네이버 연결을 해지하시겠습니까?", function() {
					get({
						"url": "/sns/naver/disconnect",
						"param": {}
					}, function(response) {
						disablesSns("N", false);
					});
				});
			}
		});

		// 카카오 연동 클릭
		$("#snsKakao").click(function() {
			if ( $(this).prop("checked") ) {
				disablesSns("K", false, true);
				window.open("https://kauth.kakao.com/oauth/authorize?client_id=4631f2522dc407a8035e73aaa5d1bd17&redirect_uri=https://greenjuice.pulmuone.com/sns/kko&response_type=code&scope=account_ci,phone_number,name,birthyear,birthday,gender,account_email&state=%7B%7D", "popup_window", "width=500, height=300, scrollbars=yes");
			}
			else {
				confirmDesign("", "카카오 연결을 해지하시겠습니까?", function() {
					get({
						"url": "/sns/kakao/disconnect",
						"param": {}
					}, function(response) {
						disablesSns("K", false);
					});
				});
			}

		});

		$("#saveBtn").click(function() {

			if ( $(".pwdHidden").css("display") != "none" ) {
				$("#memberPwd").keyup();
				$("#memberPwdConfirm").keyup();
			}

			$("#email").keyup();

			if ( hasError() ) {
				return false;
			}

			// if ( interest.length == 0 ) {
			// 	alert( message.member.regist.interest.empty);
			// 	return false;
			// }

			var interestValue = "";
			for ( var i in interest ) {
				interestValue += interest[i];

				if ( i < interest.length - 1 ) {
					interestValue += ",";
				}
			}

			$("#interest").val(interestValue);

			confirmDesign("", message.save["confirm-mod"], function() {
				post({
					url: "/mypage/personal/info/detail",
					param: $("#memberForm").serialize()
				}, function(response) {
					if(response.RESULT_CODE == "200"){
						alert("회원정보가 저장되었습니다.", () => location.reload());
					}
				}, function(failResponse) {
					for ( var key in failResponse.RESULT_MSG ) {
						if ( key == "showAlert" ) {
							alert(failResponse.RESULT_MSG[key]);
						}
						else {
							alert(failResponse.RESULT_MSG[key]);
						}
					}
					// if(failResponse.RESULT_MSG.memberPwdError != undefined){
					// 	alert("",failResponse.RESULT_MSG.memberPwdError);
					// } else if(failResponse.RESULT_MSG.memberPwdConfirmError != undefined){
					// 	alert("",failResponse.RESULT_MSG.memberPwdConfirmError);
					// } else if(failResponse.RESULT_MSG.emailError != undefined){
					// 	alert("",failResponse.RESULT_MSG.emailError);
					// }else if(failResponse.RESULT_MSG.showAlert != undefined){
					// 	alert("",failResponse.RESULT_MSG.showAlert);
					// }
				});
			});

		});


		
		
		
		
		
		
		
		
		

		// 이메일 선택 st
		$('.dropdown-item').click(function(){
			const value = $(this).data('value');
			const text = $(this).text();

			const cl = $(this).get(0).classList;
			if(cl.contains('email')){
				$('.dropdown-toggle.email').text(text);
				$('.dropdown-toggle.email').data('value',value);
				if(value != '1'){
					$('#emailHost').val(value);
					$('#emailHost').attr('readonly',true);
					// select dropdown 이메일 선택시 validation체크 start
					const selectedFullEmail = $('#email').val() + '@' + $('#emailHost').val();
					if ( selectedFullEmail == "" ) {
						$('#emailError').css('display','inline-block');
						$('#errorMark').css('display','inline-block');
						showError("emailError", message.member.regist.email.empty);
					}
					else if ( !message.member.regist.email.isFormat(selectedFullEmail) ) {
						$('#errorMark').css('display','inline-block');
						$('#emailError').css('display','inline-block');
						showError("emailError", message.member.regist.email.format);
					}
					// else {
					// 	post({
					// 		url: "/member/duplicate/email"
					// 		, param: {
					// 			"idOrEmail": selectedFullEmail,
					// 			"useMemberId": "Y"
					// 		}
					// 	}, function(response) {
					// 		if ( response.RESULT_MSG ) {
					// 			showError("emailError", message.member.regist.email.duplicate);
					// 		}
					// 		else {
					// 			$('#errorMark').css('display','none');
					// 			$('#emailError').css('display','none');
					// 			// hideError("emailError");
					// 			// showSuccess("emailError", message.member.regist.email.ok);
					// 		}
					// 	});
					// }
					// select dropdown 이메일 선택시 validation체크 end
					if(host == ''){
						let fullEmail = $("#email").val();
						let splitEmail = fullEmail.split("@");
						host = splitEmail[1];
						$("#email").val(splitEmail[0])

					}
				}else{
					$('#emailHost').val('');
					$('#emailHost').focus();
					$('#emailHost').attr('readonly',false);
				}
			}
		});
		// 이메일 선택 ed
	});

	function disablesSns(type, onOff, existsPrepareJob) {
		if ( type == "N" ) {
			$("#snsNaver").prop("checked", onOff);
			if ( onOff == true ) {
				alert( "네이버 계정이 연결되었습니다.");
			}
			else {
				if(!existsPrepareJob) {
					alert( "네이버 계정 연결이 해지되었습니다.");
				}
			}
		}
		else if ( type == "K" ) {
			$("#snsKakao").prop("checked", onOff);
			if ( onOff == true ) {
				alert( "카카오 계정이 연결되었습니다.");
			}
			else {
				if(!existsPrepareJob) {
					alert( "카카오 계정 연결이 해지되었습니다.");
				}
			}
		}
	}
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



<div class="modal fade" id="marketingPolicy" tabindex="-1" aria-labelledby="marketingPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="marketingPolicyLabel">마케팅 활용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width: 100%">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">

					신상품 홍보 및 맞춤형 광고, 광고성 정보
					(메시지전송)
				</td>
				<td>성명, 휴대전화번호, 생년월일, 성별, 주소</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 마케팅 활용 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="adverPolicy" tabindex="-1" aria-labelledby="adverPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adverPolicyLabel">광고성 정보 수신</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width:100%;">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">
					광고성 정보

					(메시지전송)
				</td>
				<td>휴대전화번호</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 광고성 정보 수신 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>


</body>
</html>
