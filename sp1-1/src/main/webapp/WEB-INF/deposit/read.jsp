<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>거래 상세</h2>

<table border="1" cellpadding="8">
  <tr><th>번호</th><td>${dto.num}</td></tr>
  <tr><th>계좌</th><td>${dto.account}</td></tr>
  <tr><th>이름</th><td>${dto.name}</td></tr>

  <tr><th>거래일시</th>
      <td><fmt:formatDate value="${dto.depositdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
  </tr>

  <tr><th>구분</th><td>${dto.flag}</td></tr>
  <tr><th>금액</th><td>${dto.money}</td></tr>
  <tr><th>잔액</th><td>${dto.balance}</td></tr>
  <tr><th>메모</th><td>${dto.memo}</td></tr>
</table>

<br/>

<a href="<c:url value='/deposit/list'>
          <c:param name='page' value='${paging.page}'/>
          <c:param name='size' value='${paging.size}'/>
          <c:param name='keyword' value='${paging.keyword}'/>
        </c:url>">목록으로</a>

