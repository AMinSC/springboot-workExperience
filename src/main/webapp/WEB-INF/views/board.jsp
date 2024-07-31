<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Table</title>
    
    <link rel="stylesheet" type="text/css" media="screen" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/css/ui.jqgrid.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/css/jquery.contextMenu.css">
    <script src="/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="/js/jquery.contextMenu.js" type="text/javascript"></script>
    
    
    <script>
        
		$(function(){
        	
        	// 연락처 하이픈
        	function formatPhoneNumber(phoneNumber) {
                if (!phoneNumber) return '';
                return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
            }
        	
            $("#list").jqGrid({
                url: '/api/data',  // 데이터를 가져올 서버 엔드포인트
                datatype: "json",  // 데이터 타입 설정
                cellEdit: true,
                colNames:['회원명', '회원아이디', '회원폰번호', '주문번호', '제품번호', '제품명', '사업자명', '사업자폰', '사업자주소', '삭제유무'],  // 컬럼명
                colModel:[        // 컬럼 모델 설정
                    {name:'userName', index:'userName', align:'center', width:100},
                    {name:'userId', index:'userId', align:'center', width:100},
                    {name:'userPhon', index:'userPhon', align:'center', width:100, formatter: function(cellValue) { return formatPhoneNumber(cellValue) }},
                    {name:'orderNo', index:'orderNo', align:'center', width:100},
                    {name:'prodNo', index:'prodNo', align:'center', width:100},
                    {name:'prodName', index:'prodName', align:'center', width:150},
                    {name:'companyName', index:'companyName', align:'center', width:100},
                    {name:'companyPhon', index:'companyPhon', align:'center', width:100, formatter: function(cellValue) { return formatPhoneNumber(cellValue)} },
                    {name:'companyAddr', index:'companyAddr', align:'center', width:150},
                    {name:'dormantUser', index:'dormantUser', align:'center', width:50, editable: true, edittype: 'select', formatter: 'select', editoptions: {value: {"Y": "Y", "N": "N"}}}
                ],
                loadtext: "로딩중..",
                height: 250,      // 그리드 높이
                caption: "데이터 목록",  // 그리드 타이틀
                jsonReader : {
                    repeatitems: false,
                    id: "0",
                    root: function(obj) { return obj; }
                },
                loadError: function(xhr, status, error) {
                    alert('Load Error: ' + error);
                },
                pager: "#pager",  // 페이지 네비게이션을 위한 설정
                rowNum: 10,  // 한 페이지에 보여질 행의 수
                rowList: [10, 20, 30],  // 페이지 네비게이션에 표시될 옵션
                sortname: 'userName',  // 초기 정렬 컬럼
                sortable: true,
                sortorder: "desc",  // 초기 정렬 방식
                viewrecords: true,  // 레코드 수를 보여줄지 여부
                gridview: true,  // 향상된 성능을 위한 설정
                autoencode: true,  // XSS 방지를 위한 설정
                editurl: 'http://localhost:8080/api/updateDormantUser'  // 데이터를 업데이트할 서버 엔드포인트
            });
            

            // 검색 버튼 클릭 이벤트
            $("#searchButton").click(function(){
                var userName = $("#userName").val().trim();
                var orderNo = $("#orderNo").val().trim();
                var companyName = $("#companyName").val().trim();
                var prodName = $("#prodName").val().trim();
                
                // 유효성 검사
                const regexKorean = /^[ㄱ-ㅎ|가-힣|]+$/;
    			const regexNonKorean = /^[a-z|A-Z|0-9|]+$/;

    			if (userName && !regexKorean.test(userName)) {
    				alert('회원명에는 한글만 입력할 수 있습니다.');
    				$("#userName").focus();
    				return false;
    			}
    			if (orderNo && !regexNonKorean.test(orderNo)) {
    				alert('주문번호에는 영문 및 숫자만 입력할 수 있습니다.');
    				$("#orderNo").focus();
    				return false;
    			}
    			if (companyName && !regexNonKorean.test(companyName)) {
    				alert('사업자명에는 영문 및 숫자만 입력할 수 있습니다.');
    				$("#companyName").focus();
    				return false;
    			}
    			if (prodName && !regexNonKorean.test(prodName)) {
    				alert('제품명에는 영문 및 숫자만 입력할 수 있습니다.');
    				$("#prodName").focus();
    				return false;
    			}

    			// 검색 조건이 하나라도 있으면 URL 생성, 없으면 alert
    			if (userName || orderNo || companyName || prodName) {
	                var url = 'http://localhost:8080/api/data?userName=' + userName + '&orderNo=' + orderNo + '&companyName=' + companyName + '&prodName=' + prodName;
	                $("#list").jqGrid('setGridParam', {url: url, datatype: 'json'}).trigger('reloadGrid');
    			} else {
    				alert('최소 하나의 검색 조건을 입력해주세요.');
    			}
            });
            
            
         	// Context Menu 설정
            $.contextMenu({
                selector: '#grid tr.jqgrow',
                callback: function(key, options) {
                    var rowId = $(this).attr("id");
                    var rowData = $("#grid").jqGrid('getRowData', rowId);
                    if (key === "view") {
                        alert("View Record\n" +
                            "ID: " + rowData.id + "\n" +
                            "Name: " + rowData.name + "\n" +
                            "Phone: " + rowData.phone);
                    } else if (key === "edit") {
                        alert("Edit Record\n" +
                            "ID: " + rowData.id + "\n" +
                            "Name: " + rowData.name + "\n" +
                            "Phone: " + rowData.phone);
                    } else if (key === "delete") {
                        alert("Delete Record\n" +
                            "ID: " + rowData.id + "\n" +
                            "Name: " + rowData.name + "\n" +
                            "Phone: " + rowData.phone);
                    }
                },
                items: {
                    "view": {name: "View", icon: "view"},
                    "edit": {name: "Edit", icon: "edit"},
                    "delete": {name: "Delete", icon: "delete"}
                }
            });
        });
        
    </script>
    
</head>
<body>
    <div>
        <label for="userName">회원명: </label>
        <input type="text" id="userName" name="userName">
        <label for="orderNo">주문번호: </label>
        <input type="text" id="orderNo" name="orderNo">
        <label for="companyName">사업자명: </label>
        <input type="text" id="companyName" name="companyName">
        <label for="prodName">제품명: </label>
        <input type="text" id="prodName" name="prodName">
        <button id="searchButton">검색</button>
    </div>
    
    <table id="list"></table>
    
    <!-- context menu -->
    <div id="pager"></div>
</body>
</html>
