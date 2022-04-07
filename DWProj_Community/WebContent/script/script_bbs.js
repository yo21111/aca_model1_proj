/**
 * 
 */
$(function() {
	//-----------------freebbs 시작------------------

	//현재 페이지 표시하기
	if ($("input#hideInput").val() == $("a#pageNo" + $("input#hideInput").val()).text()) {
		$("a#pageNo" + $("input#hideInput").val()).css("color", "#f80");
	}

	// 글쓰기 버튼 클릭
	$("button#writeBtn").click(function() {
		let pageNo = $("input#hideInput").val();
		location.href = "/BBS/board.jsp?write=y&pageNo=" + pageNo;
	});

	// 검색 버튼 클릭 - input#searchWord가 "" 면 return
	$("button#searchBtn").click(function() {
		if ($("input#searchInput").val() == "") {
			alert("검색어를 입력해주세요.");
			return;
		}

		$("form#bbsFrm").submit();
	});


	//-----------------freebbs 시작------------------

	//-----------------board 시작------------------

	// title input 클릭할 때 
	if ($("td#page_write_date input").attr("type") == "hidden") {
		$("input#titleInput").attr("placeholder", "제목을 입력해주세요.");
		$("input#titleInput").css("border", "1px solid #ccc");
		$("input#titleInput").click(function() {
			$("input#titleInput").css("border", "1px solid #777");
		});
	}


	//목록 버튼 클릭
	$("button#listBtn").click(function() {
		let pageNo = $("input#hideInput").val();
		location.href = "/BBS/freeBBS.jsp?pageNo=" + pageNo;
	});

	//등록 버튼 클릭
	$("button#insertBtn").click(function() {

		if ($("input#titleInput").val() == "") {
			alert("제목을 입력해주세요.");
			return;
		}

		if (!confirm("글을 등록 하시겠습니까?")) return;
		$("form#boardFrm").attr("action", "/BBS/boardProc.jsp?work=insertPage");
		$("form#boardFrm").submit();
	});

	//삭제 버튼 클릭
	$("button#deleteBtn").click(function() {
		if (!confirm("정말로 삭제하시겠습니까??")) return;
		let bno = $("td#page_bno input").val();
		location.href = "/BBS/boardProc.jsp?work=deletePage&bno=" + bno;
	});

	// 수정버튼 클릭
	$("button#updateBtn").click(function() {
		if (!confirm("글을 수정 하시겠습니까?")) return;
		let bno = $("td#page_bno input").val();
		let pageNo = $("input#hideInput").val();
		location.href = "/BBS/board.jsp?bno=" + bno + "&pageNo=" + pageNo + "&pageSize=10&write=y&update=y";
	});

	// 완료버튼 클릭
	$("button#updateFinBtn").click(function() {

		if ($("input#titleInput").val() == "") {
			alert("제목을 입력해주세요.");
			return;
		}

		if (!confirm("글을 재등록 하시겠습니까?")) return;
		let bno = $("td#page_bno input").val();
		let pageNo = $("input#hideInput").val();
		$("form#boardFrm").attr("action", "/BBS/boardProc.jsp?bno=" + bno + "&pageNo=" + pageNo + "&work=updatePage");
		$("form#boardFrm").submit();
	});
	//-----------------board 끝--------------------	
});