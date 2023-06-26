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
    <div id="mainGrid"></div>
</div>
<jsp:include page="/WEB-INF/jsp/template/footer.jsp" flush="false"/>
<script>
    $(function() {
       $('#mainGrid').kendoGrid({
           selectable: "multiple cell",
           allowCopy: true,
           columns: [
               { field: "productName" },
               { field: "category" }
           ],
           dataSource: [
               { productName: "Tea", category: "Beverages" },
               { productName: "Coffee", category: "Beverages" },
               { productName: "Ham", category: "Food" },
               { productName: "Bread", category: "Food" }
           ]
       });
    });
</script>
