/**
 * 
 */

$(function(){
/* ---------------------joinAgreement.jsp 시작--------------------- */
	/* 전체 선택 체크시 하위 체크박스 체크하기 */
	$("input#chkAll").click(function(){
		let boolChk = $(this).prop("checked");
		
		$("input.agreeChk").prop("checked", boolChk);
	});
	
	
	// 역방향 전체 적용
	$("div.termArea input[type=checkbox]").click(function(){
		let chk0 = $(".joinAgree .termArea").eq(0).find("input").prop("checked");
		let chk1 = $(".joinAgree .termArea").eq(1).find("input").prop("checked");
		let chk2 = $(".joinAgree .termArea").eq(2).find("input").prop("checked");
		
		if(chk0 && chk1 && chk2) {
			$("input#chkAll").prop("checked", true);
		} else {
			$("input#chkAll").prop("checked", false);
		}
	});
	
	// 이용약관 폼 실행 시작
	$("form#joinFrm button").click(function(){
		let chkReq0 = $(".joinAgree .termArea").eq(0).find("input").prop("checked");
		let chkReq1 = $(".joinAgree .termArea").eq(1).find("input").prop("checked");
		
		if(chkReq0 && chkReq1) {
			$("form#joinFrm").submit();
		} else {
			alert("이용약관과 개입정부 수집 및 이용에 동의해주세요.");
		}
	});
/* ---------------------joinAgreement.jsp 끝--------------------- */
	
});