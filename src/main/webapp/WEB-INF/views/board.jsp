<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Table</title>
    
    <link rel="stylesheet" type="text/css" media="screen" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/css/ui.jqgrid.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/css/jquery.contextMenu.min.css">
    <script src="/js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/js/jquery.jqgrid.min.js" type="text/javascript"></script>
    <script src="/js/jquery.contextMenu.min.js" type="text/javascript"></script>
    
    
    <script>
        $(function(){
            // 연락처 하이픈
            function formatPhoneNumber(phoneNumber) {
                if (!phoneNumber) return '';
                return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
            }
            // 탈퇴여부 confirm Event
            function handleChangeDelYn(name, currentDelYn) {
                var confirmation = confirm(name + "의 상태값을 변경하시겠습니까?");
                if (confirmation) {
                    var newDelYn = (currentDelYn === 'Y') ? 'N' : 'Y';
                    $(".edit-mode").eq(7).val(newDelYn);
                }
            }

            // jqGrid 초기화
            $("#list").jqGrid({
                url: '/api/data', 
                datatype: "json", 
                cellEdit: true,
                colNames:['회원명', '회원아이디', '회원폰번호', '주문번호', '제품번호', '제품명', '사업자명', '사업자폰', '사업자주소', '삭제유무', '회원일련번호', '제품일련번호', '사업자일련번호'],  // 컬럼명
                colModel:[  
                    {name:'mbrNm', index:'mbrNm', align:'center', width:100},
                    {name:'mbrUserId', index:'mbrUserId', align:'center', width:100},
                    {name:'mbrPhone', index:'mbrPhone', align:'center', width:100, formatter: function(cellValue) { return formatPhoneNumber(cellValue) }},
                    {name:'bzppOrderNo', index:'bzppOrderNo', align:'center', width:100},
                    {name:'pdtNo', index:'pdtNo', align:'center', width:100},
                    {name:'pdtNm', index:'pdtNm', align:'center', width:150},
                    {name:'bzppNm', index:'bzppNm', align:'center', width:100},
                    {name:'bzppPhone', index:'bzppPhone', align:'center', width:100, formatter: function(cellValue) { return formatPhoneNumber(cellValue)} },
                    {name:'bzppAddr', index:'bzppAddr', align:'center', width:150},
                    {name:'delYn', index:'delYn', align:'center', width:50, editable: true, edittype: 'select', formatter: 'select', editoptions: {value: {"Y": "Y", "N": "N"}}},
                    {name:'mbrSqno', index:'mbrSqno', align:'center', width:150, hidden: true},
                    {name:'pdtSqno', index:'pdtSqno', align:'center', width:150, hidden: true},
                    {name:'bzppSqno', index:'bzppSqno', align:'center', width:150, hidden: true}
                ],
                loadtext: "로딩중..",
                height: 250,      		// 그리드 높이
                caption: "데이터 목록",  	// 그리드 타이틀
                jsonReader : {
                    repeatitems: false,
                    id: "0",
                    root: function(obj) { return obj; }
                },
                loadError: function(xhr, status, error) {
                    alert('Load Error: ' + error);
                },
                pager: "#pager",  					// 페이지 네비게이션을 위한 설정
                rowNum: 10,  						// 한 페이지에 보여질 행의 수
                rowList: [10, 20, 30],  			// 페이지 네비게이션에 표시될 옵션
                sortname: 'userName',  				// 초기 정렬 컬럼
                sortable: true,
                sortorder: "desc",  				// 초기 정렬 방식
                viewrecords: true,  				// 레코드 수를 보여줄지 여부
                gridview: true,  					// 향상된 성능을 위한 설정
                autoencode: true,  					// XSS 방지를 위한 설정
                editurl: '/api/updateDormantUser',  // 데이터를 업데이트할 서버 엔드포인트
                loadComplete: function() {
                    var ids = $("#list").jqGrid('getDataIDs');
                    gridData = {};
                    for (var i = 0; i < ids.length; i++) {
                        var rowData = $("#list").jqGrid('getRowData', ids[i]);
                        gridData[ids[i]] = rowData;
                    }
                }

            });

            // 검색 버튼 클릭 이벤트
            $("#searchButton").click(function(){
                var mbrNm = $("#mbrNm").val().trim();
                var bzppOrderNo = $("#bzppOrderNo").val().trim();
                var bzppNm = $("#bzppNm").val().trim();
                var pdtNm = $("#pdtNm").val().trim();
                
                // 유효성 검사
                const regexKorean = /^[ㄱ-ㅎ|가-힣|]+$/;
    			const regexNonKorean = /^[a-z|A-Z|0-9|]+$/;

    			if (mbrNm && !regexKorean.test(mbrNm)) {
    				alert('회원명에는 한글만 입력할 수 있습니다.');
    				$("#mbrNm").focus();
    				return false;
    			}
    			if (bzppOrderNo && !regexNonKorean.test(bzppOrderNo)) {
    				alert('주문번호에는 영문 및 숫자만 입력할 수 있습니다.');
    				$("#bzppOrderNo").focus();
    				return false;
    			}
    			if (bzppNm && !regexNonKorean.test(bzppNm)) {
    				alert('사업자명에는 영문 및 숫자만 입력할 수 있습니다.');
    				$("#bzppNm").focus();
    				return false;
    			}
    			if (pdtNm && !regexNonKorean.test(pdtNm)) {
    				alert('제품명에는 영문 및 숫자만 입력할 수 있습니다.');
    				$("#pdtNm").focus();
    				return false;
    			}

    			// 검색 조건이 하나라도 있으면 URL 생성, 없으면 alert
    			if (mbrNm || bzppOrderNo || bzppNm || pdtNm) {
	                var url = '/api/data?mbrNm=' + mbrNm + '&bzppOrderNo=' + bzppOrderNo + '&bzppNm=' + bzppNm + '&pdtNm=' + pdtNm;
	                $("#list").jqGrid('setGridParam', {url: url, datatype: 'json'}).trigger('reloadGrid');
    			} else {
    				alert('최소 하나의 검색 조건을 입력해주세요.');
    			}
            });

            // Context Menu 설정
            $.contextMenu({
                selector: '#list tr.jqgrow',
                callback: function(key, options) {
                    var rowId = $(this).attr("id");
                    var rowData = $("#list").jqGrid('getRowData', rowId);
                    if (key === "userDetail") {
                    	$.ajax({
                            url: '/api/userDetail',
                            method: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({ mbrSqno: rowData.mbrSqno }),
                            success: function(data) {
                    			$("#detail").html(
                                "<div>회원명: <span class='view-mode'>" + data.mbrNm + "</span><span class='edit-mode' style='display:none;'>" + data.mbrNm + "</span></div>" +
                                "<div>회원아이디: <span class='view-mode'>" + data.mbrUserId + "</span><span class='edit-mode' style='display:none;'>" + data.mbrUserId + "</span></div>" +
                                "<div>회원폰번호: <span class='view-mode'>" + formatPhoneNumber(data.mbrPhone) + "</span><input class='edit-mode' type='text' value='" + formatPhoneNumber(data.mbrPhone) + "' style='display:none;'></div>" +
                                "<div>주문번호: <span class='view-mode'>" + data.bzppOrderNo + "</span><span class='edit-mode' style='display:none;'>" + data.bzppOrderNo + "</span></div>" +
                                "<div>주소: <span class='view-mode'>" + data.mbrAddr + "</span><input class='edit-mode' type='text' value='" + data.mbrAddr + "' style='display:none;'></div>" +
                                "<div>회원번호: <span class='view-mode'>" + data.mbrNo + "</span><span class='edit-mode' style='display:none;'>" + data.mbrNo + "</span></div>" +
                                "<div>회원전화: <span class='view-mode'>" + formatPhoneNumber(data.mbrTel) + "</span><input class='edit-mode' type='text' value='" + formatPhoneNumber(data.mbrTel) + "' style='display:none;'></div>" +
                                "<div>탈퇴여부: <span class='view-mode'>" + data.delYn + "</span><select class='edit-mode' style='display:none;'><option value='Y'>Y</option><option value='N'>N</option></select><button class='edit-mode' style='display:none;' id='changeDelYn'>변경</button></div>"
                            );
                            
                            $("#detail").dialog({
                                title: "회원정보 상세 및 수정",
                                modal: true,
                                buttons: {
                                    "수정": function() {
                                        $(".view-mode").hide();
                                        $(".edit-mode").show();
                                    },
                                    "저장": function() {
                                        var updatedData = {
                                        		mbrNm: data.mbrNm,
                                        		mbrUserId: data.mbrUserId,
                                        		mbrPhone: $(".edit-mode").eq(2).val(),
                                        		bzppOrderNo: data.bzppOrderNo,
                                        		mbrAddr: $(".edit-mode").eq(4).val(),
                                        		mbrNo: data.mbrNo,
                                        		mbrTel: $(".edit-mode").eq(6).val(),
                                        		delYn: $(".edit-mode").eq(7).val()
                                        };
                                        console.log(updatedData);
                                        // Optionally, send updated data to the server
                                        $.ajax({
                                        	url: '/api/userUpdate',
                                            method: 'POST',
                                            contentType: 'application/json',
                                            data: JSON.stringify({
                                            	mbrPhone: $(".edit-mode").eq(2).val().replaceAll("-", ""),
                                                mbrAddr: $(".edit-mode").eq(4).val(),
                                                mbrTel: $(".edit-mode").eq(6).val().replaceAll("-", ""),
                                                delYn: $(".edit-mode").eq(7).val(),
                                                mbrSqno: data.mbrSqno
                                            }),
                                            success: function(response) {
                                                console.log(response);
                                            },
                                            error: function(error) {
                                                console.error("Error updating user:", error);
                                            }
										});
                                        
                                        $(this).dialog("close");
                                    },
                                    "취소": function() {
                                        $(this).dialog("close");
                                    }
                                }
                            });
                            
                         	// 변경 버튼 클릭 이벤트
                            $("#changeDelYn").click(function() {
                                var currentDelYn = $(".edit-mode").eq(7).val();
                                handleChangeDelYn(data.mbrNm, currentDelYn);
                            });
                            }
                            
                    	});
                    } else if (key === "companyDetail") {
                    	$.ajax({
                            url: '/api/companyDetail',
                            method: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({ bzppOrderNo: rowData.bzppOrderNo }),
                            success: function(data) {
                    			$("#detail").html(
                                "<div>사업자명: <span class='view-mode'>" + data.bzppNm + "</span><span class='edit-mode' style='display:none;'>" + data.bzppNm + "</span></div>" +
                                "<div>사업자ID: <span class='view-mode'>" + data.bzppUserId + "</span><span class='edit-mode' style='display:noen;'>" + data.bzppUserId + "</span></div>" +
                                "<div>사업자폰: <span class='view-mode'>" + formatPhoneNumber(data.bzppPhone) + "</span><input class='edit-mode' type='text' value='" + formatPhoneNumber(data.bzppPhone) + "' style='display:none;'></div>" +
                                "<div>주문번호: <span class='view-mode'>" + data.bzppOrderNo + "</span><span class='edit-mode' style='display:noen;'>" + data.bzppOrderNo + "</span></div>" +
                                "<div>주소: <span class='view-mode'>" + data.mbrAddr + "</span><input class='edit-mode' type='text' value='" + data.bzppAddr + "' style='display:none;'></div>" +
                                "<div>사업자번호: <span class='view-mode'>" + data.bzppNo + "</span><span class='edit-mode' style='display:none;'>" + data.bzppNo + "</span></div>" +
                                "<div>사업자전화: <span class='view-mode'>" + formatPhoneNumber(data.bzppTel) + "</span><input class='edit-mode' type='text' value='" + formatPhoneNumber(data.bzppTel) + "' style='display:none;'></div>" +
                                "<div>폐업여부: <span class='view-mode'>" + data.delYn + "</span><select class='edit-mode' style='display:none;'><option value='Y'>Y</option><option value='N'>N</option></select><button class='edit-mode' style='display:none;' id='changeDelYn'>변경</button></div>"
                            );
                            
                            $("#detail").dialog({
                                title: "사업자정보 상세 및 수정",
                                modal: true,
                                buttons: {
                                    "수정": function() {
                                        $(".view-mode").hide();
                                        $(".edit-mode").show();
                                    },
                                    "저장": function() {
                                        var updatedData = {
                                        		bzppNm: data.bzppNm,
                                        		bzppUserId: data.bzppUserId,
                                        		bzppPhone: $(".edit-mode").eq(2).val(),
                                        		bzppOrderNo: data.bzppOrderNo,
                                        		bzppAddr: $(".edit-mode").eq(4).val(),
                                        		bzppNo: data.bzppNo,
                                        		bzppTel: $(".edit-mode").eq(6).val(),
                                        		delYn: $(".edit-mode").eq(7).val()
                                        };
                                        console.log(updatedData);
                                        // Optionally, send updated data to the server
                                        $.ajax({
                                        	url: '/api/companyUpdate',
                                            method: 'POST',
                                            contentType: 'application/json'
										});
                                        
                                        $(this).dialog("close");
                                    },
                                    "취소": function() {
                                        $(this).dialog("close");
                                    }
                                }
                            });
                            
                         	// 변경 버튼 클릭 이벤트
                            $("#changeDelYn").click(function() {
                                var currentDelYn = $(".edit-mode").eq(7).val();
                                handleChangeDelYn(data.mbrNm, currentDelYn);
                            });
                            }
                            
                    	});
                    } else if (key === "productDetail") {
                    	$.ajax({
                            url: '/api/productDetail',
                            method: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({ pdtSqno: rowData.pdtSqno }),
                            success: function(data) {
                            	console.log(data)
                    			$("#detail").html(
                                "<div>제품명: <span class='view-mode'>" + data.pdtNm + "</span><span class='edit-mode' style='display:none'>" + data.pdtNm + "</span></div>" +
                                "<div>사업자ID: <span class='view-mode'>" + data.bzppUserId + "</span><span class='edit-mode' style='display:none;'>" + data.bzppUserId + "</span></div>" +
                                "<div>사업자폰: <span class='view-mode'>" + formatPhoneNumber(data.bzppPhone) + "</span><input class='edit-mode' type='text' value='" + formatPhoneNumber(data.bzppPhone) + "' style='display:none;'></div>" +
                                "<div>주문번호: <span class='view-mode'>" + data.bzppOrderNo + "</span><span class='edit-mode' style='display:noen;'>" + data.bzppOrderNo + "</span></div>" +
                                "<div>주소: <span class='view-mode'>" + data.bzppAddr + "</span><input class='edit-mode' type='text' value='" + data.bzppAddr + "' style='display:none;'></div>" +
                                "<div>사업자번호: <span class='view-mode'>" + data.bzppNo + "</span><span class='edit-mode' style='display:none;'>" + data.bzppNo + "</span></div>" +
                                "<div>사업자전화: <span class='view-mode'>" + formatPhoneNumber(data.bzppTel) + "</span><input class='edit-mode' type='text' value='" + formatPhoneNumber(data.bzppTel) + "' style='display:none;'></div>" +
                                "<div>제품삭제: <span class='view-mode'>" + data.delYn + "</span><select class='edit-mode' style='display:none;'><option value='Y'>Y</option><option value='N'>N</option></select><button class='edit-mode' style='display:none;' id='changeDelYn'>변경</button></div>"
                            );
                            
                            $("#detail").dialog({
                                title: "사업자정보 상세 및 수정",
                                modal: true,
                                buttons: {
                                    "수정": function() {
                                        $(".view-mode").hide();
                                        $(".edit-mode").show();
                                    },
                                    "저장": function() {
                                        var updatedData = {
                                        		pdtNm: data.pdtNm,
                                        		bzppUserId: data.bzppUserId,
                                        		bzppPhone: $(".edit-mode").eq(2).val(),
                                        		bzppOrderNo: data.bzppOrderNo,
                                        		bzppAddr: $(".edit-mode").eq(4).val(),
                                        		bzppNo: data.bzppNo,
                                        		bzppTel: $(".edit-mode").eq(6).val(),
                                        		delYn: $(".edit-mode").eq(7).val()
                                        };
                                        console.log(updatedData);
                                        // Optionally, send updated data to the server
                                        $.ajax({
                                        	url: '/api/productUpdate',
                                            method: 'POST',
                                            contentType: 'application/json',
										});
                                        
                                        $(this).dialog("close");
                                    },
                                    "취소": function() {
                                        $(this).dialog("close");
                                    }
                                }
                            });
                            
                         	// 변경 버튼 클릭 이벤트
                            $("#changeDelYn").click(function() {
                                var currentDelYn = $(".edit-mode").eq(7).val();
                                handleChangeDelYn(data.mbrNm, currentDelYn);
                            });
                            }
                            
                    	});
                    }
                },
                items: {
                    "userDetail": {name: "회원정보상세"},
                    "companyDetail": {name: "사업자정보상세"},
                    "productDetail": {name: "제품정보상세"}
                }
            });
        });
    </script>
    
</head>
<body>
    <div>
        <label for="mbrNm">회원명: </label>
        <input type="text" id="mbrNm" name="mbrNm">
        <label for="bzppOrderNo">주문번호: </label>
        <input type="text" id="bzppOrderNo" name="bzppOrderNo">
        <label for="bzppNm">사업자명: </label>
        <input type="text" id="bzppNm" name="bzppNm">
        <label for="pdtNm">제품명: </label>
        <input type="text" id="pdtNm" name="pdtNm">
        <button id="searchButton">검색</button>
    </div>
    
    <table id="list"></table>
    
    <!-- context menu -->
    <div id="pager"></div>
    
    <!-- Dialog Modal -->
    <div id="detail" title="Detail"></div>
</body>
</html>
