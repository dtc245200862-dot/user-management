# [Thực hành] Quản lý User sử dụng JSP-Servlet-JDBC-MySQL

Ứng dụng web quản lý User kết nối cơ sở dữ liệu MySQL theo mô hình kiến trúc MVC (Model - View - Controller) sử dụng Servlet, JSP, JSTL, JDBC và MySQL Connector.

## Cấu trúc thư mục dự án
```
user-management/
├── pom.xml
├── README.md
├── .gitignore
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── codegym/
        │           ├── controller/
        │           │   └── UserServlet.java
        │           ├── dao/
        │           │   ├── IUserDAO.java
        │           │   └── UserDAO.java
        │           └── model/
        │               └── User.java
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml
            ├── index.jsp
            └── user/
                ├── create.jsp
                ├── delete.jsp
                ├── edit.jsp
                └── list.jsp
```

## Các chức năng
- Hiển thị danh sách User (`/users`)
- Thêm mới User (`/users?action=create`)
- Sửa thông tin User (`/users?action=edit&id=...`)
- Xóa User (`/users?action=delete&id=...`)
- Tìm kiếm User theo quốc gia (`/users?action=search&country=...`)
- Sắp xếp User theo tên (`/users?action=sort`)

## Cơ sở dữ liệu MySQL
```sql
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE users (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);

INSERT INTO users(name, email, country) VALUES('Minh','minh@codegym.vn','Viet Nam');
INSERT INTO users(name, email, country) VALUES('Kante','kante@che.uk','Kenia');
```

## Hướng dẫn build và triển khai
1. Biên dịch và đóng gói WAR bằng Maven:
   ```bash
   mvn clean package
   ```
2. Triển khai file `target/user-management.war` lên Apache Tomcat 10.1+.
3. Truy cập hệ thống:
   ```
   http://localhost:8080/user-management/users
   ```
