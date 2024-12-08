<%@ page import="com.entity.Appointment" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Patient Comment</title>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg {
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url("../img/hospital.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
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

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white">Patient Comment</p>
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-4">Patient Details</p>

                        <% 
                            // Fetch the appointment details based on ID
                            int id = Integer.parseInt(request.getParameter("id"));
                            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                            Appointment ap = dao.getAppointmentById(id);
                        %>
                        <form class="row" action="../updateStatus" method="post">
                            <div class="col-md-6">
                                <label for="patientName">Patient Name</label>
                                <input type="text" id="patientName" readonly value="<%= ap.getFullName() %>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label for="age">Age</label>
                                <input type="text" id="age" readonly value="<%= ap.getAge() %>" class="form-control">
                            </div>

                            <div class="col-md-6 mt-3">
                                <label for="mobNo">Mobile Number</label>
                                <input type="text" id="mobNo" readonly value="<%= ap.getPhNo() %>" class="form-control">
                            </div>

                            <div class="col-md-6 mt-3">
                                <label for="diseases">Diseases</label>
                                <input type="text" id="diseases" readonly value="<%= ap.getDiseases() %>" class="form-control">
                            </div>

                            <div class="col-md-12 mt-3">
                                <label for="comment">Comment</label>
                                <textarea id="comment" required name="comm" class="form-control" rows="3"></textarea>
                            </div>

                            <!-- Hidden fields -->
                            <input type="hidden" name="id" value="<%= ap.getId() %>">
                            <input type="hidden" name="did" value="<%= ap.getDoctorId() %>">

                            <button type="submit" class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
