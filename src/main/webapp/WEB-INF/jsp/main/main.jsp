<%--
  Created by IntelliJ IDEA.
  User: johnn
  Date: 2023-06-24
  Time: 오전 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="today" class="java.util.Date" />
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="false"/>
<h1 class="mt-4">TEST 페이지</h1>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">1뎁스 > 2뎁스 > 3뎁스 메뉴1</li>
</ol>
<div class="row">
    <input type="button" onclick="customAjax()" value="커스텀AJAX"/>
    <input type="button" onclick="customKendoGrid()" value="KENDOGRID"/>
    <div id="mainGrid"></div>
</div>
<jsp:include page="/WEB-INF/jsp/template/footer.jsp" flush="false"/>
<script>
    function customAjax() {
        if(confirm("커스텀 AJAX를 실행하시겠습니까?")) {
            var data = {   /*컨트롤러로 보낼 파람값*/
                DATA1: "1",
                DATA2: "2",
            }
            var result = customKendo.fn_customAjax('/test/customAjax', data); /*ajax*/
            console.log('ajax의 결과 조회 : ', result.rs); /* 콘솔창 확인 */
        }
    }
    function customKendoGrid() {
        if(confirm("켄도그리드를 실행하시겠습니까?")) {
            var data = { /*컨트롤러로 보낼 파람값*/
                DATA1: "1",
                DATA2: "2",
            }
            var dataSource = customKendo.fn_gridDataSource3('/test/customKendoGrid', data); /*kendogrid의 datasource*/
            /*kendoGrid 부분*/
            var mainGrid = $("#mainGrid").kendoGrid({
                height: 489,
                dataSource: dataSource,
                scrollable: true,
                pageable: {
                    refresh: true,
                    pageSize : 10,
                    pageSizes: [10, 20, 50, "ALL"],
                    buttonCount: 5,
                    messages: {
                        display: "{0} - {1} of {2}",
                        itemsPerPage: "",
                        empty: "데이터가 없습니다.",
                    }
                },
                toolbar : [ /* toolbar 부분 */
                    {
                        name : 'excel',
                        text: '엑셀다운로드'
                    }
                ],
                excel : {
                    fileName : "excel.xlsx",
                    filterable : true
                },
                noRecords: {
                    template: "데이터가 존재하지 않습니다." /* 데이터가 없을때 */
                },
                columns: [
                    {
                        field : "EMP_SEQ", /* grid의 필드값 DB컬럼명 or as '별칭명' */
                        title : "사번", /* grid의 제목 */
                        width : 180 /* grid 컬럼의 넓이 */
                    }, {
                        field : "EMP_NAME",
                        title : "사원명",
                        width : 180
                    }, {
                        field : "LOGIN_ID",
                        title : "사원아이디",
                        width : 180
                    }, {
                        field : "EMAIL_ID",
                        title : "사원이메일",
                        width : 180
                    }, {
                        field : "DEPT_NAME",
                        title : "사원부서명",
                        width : 180
                    }]
            }).data("kendoGrid");
        }
    }
</script>
