<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 등록</title>

<style>
body { font-family: Arial, sans-serif; margin:0; }

.layout { display:flex; min-height:100vh; }

.side {
  width:220px;
  border-right:1px solid #ddd;
  padding:20px;
  background:#fafafa;
  box-sizing:border-box;
}
.side a {
  display:block;
  padding:10px;
  margin-bottom:8px;
  border:1px solid #ccc;
  text-decoration:none;
  border-radius:6px;
  color:#333;
}
.side a.on { background:#4da3ff; color:white; border-color:#4da3ff; }

.main { flex:1; }

.container { max-width: 1100px; margin: 0 auto; padding: 20px; box-sizing:border-box; }

.header { display:flex; justify-content:space-between; align-items:center; }
.btn { background:#4da3ff; color:white; padding:6px 12px; text-decoration:none; border-radius:4px; display:inline-block; border:0; cursor:pointer; }
.btn.gray { background:#666; }

.card {
  margin-top:10px;
  border:1px solid #ddd;
  border-radius:10px;
  padding:16px;
  background:#fff;
}

.form-grid {
  display:grid;
  grid-template-columns: 140px 1fr;
  gap:10px 12px;
  align-items:center;
}

.input, select {
  width:100%;
  padding:8px 10px;
  border:1px solid #ccc;
  border-radius:6px;
  box-sizing:border-box;
}

.actions { margin-top:16px; display:flex; gap:8px; justify-content:flex-end; }

.help { color:#666; font-size:12px; margin-top:8px; }
</style>
</head>

<body>
<div class="layout">

  <!-- 왼쪽 메뉴 -->
  <aside class="side">
    <h3 style="margin-top:0;">메뉴</h3>
    <a class="on" href="${pageContext.request.contextPath}/deposit/list">예금관리</a>
  </aside>

  <!-- 본문 -->
  <main class="main">
    <div class="container">

      <div class="header">
        <h2>거래 등록</h2>
        <a class="btn gray" href="${pageContext.request.contextPath}/deposit/list">목록</a>
      </div>

      <div class="card">
        <form action="${pageContext.request.contextPath}/deposit/register" method="post">
          <div class="form-grid">

            <label>계좌</label>
            <input class="input" name="account" placeholder="예: 110-200-0002" required>

            <label>이름</label>
            <input class="input" name="name" placeholder="예: 예금주_1" required>

            <label>구분</label>
            <select name="flag" class="input" required>
              <option value="">선택</option>
              <option value="입금">입금</option>
              <option value="출금">출금</option>
            </select>

            <label>금액</label>
            <input class="input" name="money" type="number" min="0" step="1" placeholder="예: 10000" required>

            <label>잔액</label>
            <input class="input" name="balance" type="number" min="0" step="1" placeholder="예: 500000" required>

            <label>메모</label>
            <input class="input" name="memo" placeholder="메모(선택)">

          </div>

          <div class="help">
            * 거래일시는 DB의 기본값(TIMESTAMP DEFAULT CURRENT_TIMESTAMP)으로 자동 저장됩니다.
          </div>

          <div class="actions">
            <button type="submit" class="btn">등록</button>
            <a class="btn gray" href="${pageContext.request.contextPath}/deposit/list">취소</a>
          </div>
        </form>
      </div>

    </div>
  </main>

</div>
</body>
</html>
