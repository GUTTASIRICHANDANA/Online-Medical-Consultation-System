<%@ page import="com.entity.Doctor" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Dashboard</title>
    <style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <!-- Redirect to login page if doctor is not logged in -->
    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp" />
    </c:if>

    <%@ include file="navbar.jsp" %>

    <p class="text-center fs-3">Doctor Dashboard</p>

    <%
        // Fetch doctor object from session
        Doctor doctor = (Doctor) session.getAttribute("doctObj");
        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        int totalDoctors = dao.countDoctor();
        int totalAppointments = dao.countAppointmentByDocotrId(doctor.getId());
    %>

    <div class="container p-5">
        <div class="row">
            <!-- Doctor Count Section -->
            <div class="col-md-4 offset-md-2">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-md fa-3x"></i><br>
                        <p class="fs-4">
                            Doctors <br>
                            <%= totalDoctors %>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Appointment Count Section -->
            <div class="col-md-4">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                        <i class="far fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4">
                            Total Appointments <br>
                            <%= totalAppointments %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
