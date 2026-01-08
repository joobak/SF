<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 정보 목록</title>

<style>
body { font-family: Arial, sans-serif; margin:0; }
.layout { display:flex; min-height:100vh; }
.side {
  width:220px; border-right:1px solid #ddd; padding:20px;
  background:#fafafa; box-sizing:border-box;
}
.side a {
  display:block; padding:10px; margin-bottom:8px;
  border:1px solid #ccc; text-decoration:none;
  border-radius:6px; color:#333;
}
.side a.on { background:#4da3ff; color:white; border-color:#4da3ff; }
.main { flex:1; }
.header { display:flex; justify-content:space-between; align-items:center; }
.btn {
  background:#4da3ff; color:white; padding:6px 12px;
  text-decoration:none; border-radius:4px; border:0; cursor:pointer;
}
.sheet { width:100%; border-collapse:collapse; margin-top:10px; }
.sheet th { background:#f6d5c3; padding:10px; }
.sheet td { padding:10px; border-bottom:1px solid #ddd; }
.search { margin-top:20px; display:flex; justify-content:flex-end; gap:5px; }
.paging { margin-top:20px; text-align:center; }
.paging a {
  margin:0 3px; padding:5px 8px;
  border:1px solid #ccc; text-decoration:none;
}
.paging .on {
  background:#4da3ff; color:white; padding:5px 8px; display:inline-block;
}
.container {
  max-width:1100px; margin:0 auto; padding:20px; box-sizing:border-box;
}
.num-link { color:#1a73e8; text-decoration:none; }
.num-link:hover { text-decoration:underline; }
</style>
</head>

<body>
<div class="layout">

  <!-- 왼쪽 메뉴 -->
  <aside class="side">
    <h3>메뉴</h3>
    <a class="on" href="${pageContext.request.contextPath}/deposit/list">예금관리</a>
  </aside>

  <!-- 본문 -->
  <main class="main">
    <div class="container">

      <div class="header">
        <h2>거래 정보</h2>
        <a class="btn" href="${pageContext.request.contextPath}/deposit/register">등록</a>
      </div>

      <!-- 목록 -->
      <table class="sheet">
        <thead>
          <tr>
            <th>번호</th>
            <th>계좌</th>
            <th>이름</th>
            <th>거래일시</th>
            <th>구분</th>
            <th>금액</th>
            <th>잔액</th>
            <th>메모</th>
            <th>관리</th>
          </tr>
        </thead>

        <tbody>
        <c:forEach var="row" items="${list}">
          <tr>
            <td>
              <a class="num-link"
                 href="<c:url value='/deposit/read'>
                        <c:param name='num' value='${row.num}'/>
                        <c:param name='page' value='${paging.page}'/>
                        <c:param name='size' value='${paging.size}'/>
                        <c:param name='type' value='${paging.type}'/>
                        <c:param name='keyword' value='${paging.keyword}'/>
                      </c:url>">
                ${row.num}
              </a>
            </td>

            <td>${row.account}</td>
            <td>${row.name}</td>
            <td><fmt:formatDate value="${row.depositdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

            <!-- ✅ 구분 한글 변환 -->
            <td>
              <c:choose>
                <c:when test="${row.flag == 'DEPOSIT'}">입금</c:when>
                <c:when test="${row.flag == 'WITHDRAW'}">출금</c:when>
                <c:otherwise>${row.flag}</c:otherwise>
              </c:choose>
            </td>

            <td><fmt:formatNumber value="${row.money}" type="number"/></td>
            <td><fmt:formatNumber value="${row.balance}" type="number"/></td>
            <td>${row.memo}</td>

            <td>
              <a class="btn" style="background:#666;"
                 href="<c:url value='/deposit/edit'>
                        <c:param name='num' value='${row.num}'/>
                        <c:param name='page' value='${paging.page}'/>
                        <c:param name='size' value='${paging.size}'/>
                        <c:param name='type' value='${paging.type}'/>
                        <c:param name='keyword' value='${paging.keyword}'/>
                      </c:url>">수정</a>

              <a class="btn" style="background:#e74c3c;"
                 href="<c:url value='/deposit/delete'>
                        <c:param name='num' value='${row.num}'/>
                        <c:param name='page' value='${paging.page}'/>
                        <c:param name='size' value='${paging.size}'/>
                        <c:param name='type' value='${paging.type}'/>
                        <c:param name='keyword' value='${paging.keyword}'/>
                      </c:url>"
                 onclick="return confirm('삭제할까요?');">삭제</a>
            </td>
          </tr>
        </c:forEach>

        <c:if test="${empty list}">
          <tr>
            <td colspan="9" style="text-align:center;">데이터가 없습니다.</td>
          </tr>
        </c:if>
        </tbody>
      </table>

  <!-- 검색 -->
<form class="search" method="get" action="${pageContext.request.contextPath}/deposit/list">
  <input type="hidden" name="page" value="1"/>
  <input type="hidden" name="size" value="${paging.size}"/>

  <select name="type">
    <option value="" <c:if test="${empty paging.type}">selected</c:if>>--</option>
    <option value="A" <c:if test="${paging.type == 'A'}">selected</c:if>>계좌</option>
    <option value="N" <c:if test="${paging.type == 'N'}">selected</c:if>>이름</option>
    <option value="M" <c:if test="${paging.type == 'M'}">selected</c:if>>메모</option>
    <option value="F" <c:if test="${paging.type == 'F'}">selected</c:if>>구분</option>
  </select>

  <input type="text" name="keyword" value="${paging.keyword}" placeholder="검색어">
  <button type="submit" class="btn">검색</button>
</form>


      <div class="paging">
        <c:if test="${paging.prev}">
          <a href="<c:url value='/deposit/list'>
                    <c:param name='page' value='${paging.start-1}'/>
                    <c:param name='size' value='${paging.size}'/>
                    <c:param name='type' value='${paging.type}'/>
                    <c:param name='keyword' value='${paging.keyword}'/>
                  </c:url>">&laquo;</a>
        </c:if>

        <c:forEach var="p" begin="${paging.start}" end="${paging.end}">
          <c:choose>
            <c:when test="${p == paging.page}">
              <span class="on">${p}</span>
            </c:when>
            <c:otherwise>
              <a href="<c:url value='/deposit/list'>
                        <c:param name='page' value='${p}'/>
                        <c:param name='size' value='${paging.size}'/>
                        <c:param name='type' value='${paging.type}'/>
                        <c:param name='keyword' value='${paging.keyword}'/>
                      </c:url>">${p}</a>
            </c:otherwise>
          </c:choose>
        </c:forEach>

        <c:if test="${paging.next}">
          <a href="<c:url value='/deposit/list'>
                    <c:param name='page' value='${paging.end+1}'/>
                    <c:param name='size' value='${paging.size}'/>
                    <c:param name='type' value='${paging.type}'/>
                    <c:param name='keyword' value='${paging.keyword}'/>
                  </c:url>">&raquo;</a>
        </c:if>
      </div>

      <c:if test="${not empty msg}">
        <script>alert("${msg}");</script>
      </c:if>

    </div>
  </main>
</div>
</body>
</html>
