<%@ page import="com.entity.Appointment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Doctor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>
    <%@ include file="../component/allcss.jsp" %>
    <style>
        .paint-card {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <!-- Redirect to login page if doctor is not logged in -->
    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp" />
    </c:if>

    <%@ include file="navbar.jsp" %>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Patient Details</p>

                        <!-- Display Error Message -->
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center">
                                ${errorMsg}
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <!-- Display Success Message -->
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-success text-center">
                                ${succMsg}
                            </div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <!-- Patient Details Table -->
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mobile No</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Retrieve doctor from session and handle appointment display -->
                                <c:if test="${not empty appointments}">
                                    <c:forEach var="ap" items="${appointments}">
                                        <tr>
                                            <td>${ap.fullName}</td>
                                            <td>${ap.gender}</td>
                                            <td>${ap.age}</td>
                                            <td>${ap.appoinDate}</td>
                                            <td>${ap.email}</td>
                                            <td>${ap.phNo}</td>
                                            <td>${ap.diseases}</td>
                                            <td>${ap.status}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${ap.status == 'Pending'}">
                                                        <a href="comment.jsp?id=${ap.id}" class="btn btn-success btn-sm">Comment</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-secondary btn-sm" disabled>Comment</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty appointments}">
                                    <tr>
                                        <td colspan="9" class="text-center">No appointments found.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
