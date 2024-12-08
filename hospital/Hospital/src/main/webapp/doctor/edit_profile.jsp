<%@ page import="com.entity.Specalist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Profile</title>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <!-- Redirect to login if doctor is not logged in -->
    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp" />
    </c:if>

    <%@ include file="navbar.jsp" %>

    <div class="container p-4">
        <div class="row">
            <!-- Change Password Section -->
            <div class="col-md-4">
                <div class="card paint-card">
                    <p class="text-center fs-3">Change Password</p>

                    <!-- Success Message -->
                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success fs-3">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMsg}">
                        <p class="text-center text-danger fs-5">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>

                    <div class="card-body">
                        <form action="../doctChangePassword" method="post">
                            <div class="mb-3">
                                <label for="newPassword">Enter New Password</label>
                                <input type="password" name="newPassword" id="newPassword" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="oldPassword">Enter Old Password</label>
                                <input type="password" name="oldPassword" id="oldPassword" class="form-control" required>
                            </div>
                            <input type="hidden" value="${doctObj.id}" name="uid">
                            <button class="btn btn-success col-md-12">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Profile Section -->
            <div class="col-md-5 offset-md-2">
                <div class="card paint-card">
                    <p class="text-center fs-3">Edit Profile</p>

                    <!-- Success Message -->
                    <c:if test="${not empty succMsgd}">
                        <p class="text-center text-success fs-3">${succMsgd}</p>
                        <c:remove var="succMsgd" scope="session" />
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMsgd}">
                        <p class="text-center text-danger fs-5">${errorMsgd}</p>
                        <c:remove var="errorMsgd" scope="session" />
                    </c:if>

                    <div class="card-body">
                        <form action="../doctorUpdateProfile" method="post">
                            <div class="mb-3">
                                <label for="fullname">Full Name</label>
                                <input type="text" id="fullname" name="fullname" class="form-control" value="${doctObj.fullName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="dob">Date of Birth</label>
                                <input type="date" id="dob" name="dob" class="form-control" value="${doctObj.dob}" required>
                            </div>

                            <div class="mb-3">
                                <label for="qualification">Qualification</label>
                                <input type="text" id="qualification" name="qualification" class="form-control" value="${doctObj.qualification}" required>
                            </div>

                            <div class="mb-3">
                                <label for="specialist">Specialist</label>
                                <select id="specialist" name="spec" class="form-control" required>
                                    <option>${doctObj.specialist}</option>
                                    <%
                                        SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                        List<Specalist> list = dao.getAllSpecialist();
                                        for (Specalist s : list) {
                                    %>
                                    <option><%= s.getSpecialistName() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" class="form-control" value="${doctObj.email}" readonly required>
                            </div>

                            <div class="mb-3">
                                <label for="mobno">Mobile Number</label>
                                <input type="text" id="mobno" name="mobno" class="form-control" value="${doctObj.mobNo}" required>
                            </div>

                            <input type="hidden" name="id" value="${doctObj.id}">
                            <button type="submit" class="btn btn-primary col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
