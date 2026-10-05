<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý User</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h2 { color: #1b2a7a; text-align: center; }
        .toolbar { width: 80%; margin: 20px auto; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px; }
        .search-box { display: flex; align-items: center; gap: 8px; }
        .search-box input[type="text"] { padding: 8px 12px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; min-width: 200px; }
        table { width: 80%; margin: 20px auto; border-collapse: collapse; background: white; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { padding: 8px 12px; text-decoration: none; border-radius: 4px; color: white; font-weight: bold; font-size: 14px; border: none; cursor: pointer; display: inline-block; }
        .btn-add { background-color: #27ae60; }
        .btn-search { background-color: #8e44ad; }
        .btn-sort { background-color: #e67e22; }
        .btn-reset { background-color: #7f8c8d; }
        .btn-edit { background-color: #2980b9; margin-right: 5px; }
        .btn-delete { background-color: #c0392b; }
        .empty-message { text-align: center; color: #7f8c8d; font-style: italic; padding: 20px; }
    </style>
</head>
<body>
    <h2>Danh Sách Người Dùng (Users)</h2>

    <div class="toolbar">
        <div>
            <a href="${pageContext.request.contextPath}/users?action=create" class="btn btn-add">+ Thêm mới User</a>
            <a href="${pageContext.request.contextPath}/users?action=sort" class="btn btn-sort">⇅ Sắp xếp theo Tên</a>
        </div>

        <form action="${pageContext.request.contextPath}/users" method="get" class="search-box">
            <input type="hidden" name="action" value="search" />
            <input type="text" name="country" value="<c:out value='${requestScope.searchCountry}' />" placeholder="Nhập quốc gia cần tìm..." />
            <button type="submit" class="btn btn-search">Tìm kiếm</button>
            <a href="${pageContext.request.contextPath}/users" class="btn btn-reset">Tất cả</a>
        </form>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>
                <a href="${pageContext.request.contextPath}/users?action=sort" style="color: white; text-decoration: none;" title="Nhấn để sắp xếp theo tên">
                    Tên User ⇅
                </a>
            </th>
            <th>Email</th>
            <th>Quốc gia</th>
            <th>Hành động</th>
        </tr>
        <c:choose>
            <c:when test="${empty requestScope.listUser}">
                <tr>
                    <td colspan="5" class="empty-message">Không có người dùng nào được tìm thấy.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="user" items="${requestScope.listUser}">
                    <tr>
                        <td><c:out value="${user.id}" /></td>
                        <td><c:out value="${user.name}" /></td>
                        <td><c:out value="${user.email}" /></td>
                        <td><c:out value="${user.country}" /></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}" class="btn btn-edit">Sửa</a>
                            <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}" class="btn btn-delete">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>
</body>
</html>
