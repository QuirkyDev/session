<%@ page import="be.thomasmore.voorbeeld.starter.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="images/favicon.ico"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <title>Active item</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #f04c25;">
    <a class="navbar-brand" href="/">
        <img src="images/thomasmore_logo.png" width="90" height="auto" alt="" loading="lazy">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarThomasMore" aria-controls="navbarThomasMore" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarThomasMore">
        <ul class="navbar-nav">
            <li class="nav-item mr-1 ml-1 mt-3 font-weight-bold">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item mr-1 ml-1 mt-3">
                <a class="nav-link" href="/add-user">Add user</a>
            </li>
            <li class="nav-item active mr-1 ml-1 mt-3">
                <a class="nav-link" href="/overview">Overview</a>
            </li>
        </ul>
    </div>
    <a class="navbar-brand" href="https://github.com/QuirkyDev" target="_blank">
        <img src="images/github_logo.png" width="30" height="30" alt="" loading="lazy">
    </a>
</nav>

<div class="container-flex p-3">
    <%
        HttpSession sessionStudents = request.getSession();
        ArrayList<User> myUsers = (ArrayList<User>) sessionStudents.getAttribute("myUsers");
        if (myUsers == null) {
            out.print("<p>No users could be found</p>");
        } else {
            out.print(String.format("<p>We found %s user%s</p>", myUsers.size(), myUsers.size() > 1 ? "s" : ""));
            out.print("<table class=\"table\">");
            out.print(String.format("<th>%s</th><th>%s</th><th>%s</th>", User.FIRST_NAME, User.LAST_NAME, User.EMAIL));
            for (User user : myUsers) {
                out.print("<tr><td>" + user.getFirstName() + "</td><td>" + user.getLastName() + "</td><td>" + user.getEmail() + "</td></tr>");
            }
            out.print("</table>");
        }
    %>
</div>

<!--jQuery, Popper.js, and Bootstrap JS-->
<script src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html>

