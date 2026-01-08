<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 수정</title>

<style>
body { font-family: Arial, sans-serif; margin:0; }
.container { max-width: 900px; margin: 0 auto; padding: 20px; box-sizing:border-box; }

h2 { margin: 0 0 16px; }

.card {
  border: 1px solid #ddd;
  border-radius: 10px;
  padding: 16px;
  margin-bottom: 16px;
  background: #fff;
}

.grid {
  display: grid;
  grid-template-columns: 160px 1fr;
  gap: 10px 12px;
  align-items: center;
}

.label { font-weight: 700; color:#333; }
.value { color:#222; }

input[type="text"], input[type="number"], textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 8px;
  box-sizing: border-box;
}

textarea { min-height: 90px; resize: vertical; }

.readonly {
  background: #f6f6f6;
}

.actions {
  display: flex;
  gap: 10px;
  justify-content: flex-end;
}

.btn {
  background:#4da3ff;
  color:white;
  padding:10px 14px;
  text-decoration:none;
  border-radius:8px;
  border: none;
  cursor: pointer;
  display: inline-block;
}
.btn.gray { background:#666; }
.btn.red  { background:#e74c3c; }
</style>
</head>

<body>
<div class="container">

  <h2>거래 수정</h2>

  <form method="post" action="<c:url value='/deposit/edit'/>">
   
    <input type="hidden" name="num" value="${dto.num}" />

<input type="hidden" name="page" value="${page}" />
<input type="hidden" name="size" value="${size}" />
<input type="hidden" name="type" value="${type}" />
<input type="hidden" name="keyword" value="${keyword}" />

    <div class="card">
      <h3 style="margin:0 0 10px;">거래 정보 (읽기)</h3>
      <div class="grid">
        <div class="label">번호</div>
        <input class="readonly" type="text" value="${dto.num}" readonly />

        <div class="label">계좌</div>
        <input class="readonly" type="text" value="${dto.account}" readonly />

        <div class="label">이름</div>
        <input class="readonly" type="text" value="${dto.name}" readonly />

        <div class="label">거래일시</div>
        <input class="readonly" type="text"
               value="<fmt:formatDate value='${dto.depositdate}' pattern='yyyy-MM-dd HH:mm:ss'/>"
               readonly />

        <div class="label">구분</div>
        <input class="readonly" type="text" value="${dto.flag}" readonly />
      </div>
    </div>

    <div class="card">
      <h3 style="margin:0 0 10px;">수정 가능 항목</h3>
      <div class="grid">
        <div class="label">금액</div>
        <input type="number" name="money" value="${dto.money}" />

        <div class="label">잔고</div>
        <input type="number" name="balance" value="${dto.balance}" />

        <div class="label">메모</div>
        <textarea name="memo"><c:out value="${dto.memo}"/></textarea>
      </div>
    </div>

    <div class="actions">
    <a class="btn gray"
   href="<c:url value='/deposit/list'>
          <c:param name='page' value='${page}'/>
          <c:param name='size' value='${size}'/>
          <c:param name='type' value='${type}'/>
          <c:param name='keyword' value='${keyword}'/>
        </c:url>">목록으로</a>


      <button type="submit" class="btn">저장</button>
    </div>
  </form>

</div>
</body>
</html>
