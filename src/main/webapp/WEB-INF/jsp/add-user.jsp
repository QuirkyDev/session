<%@ page import="be.thomasmore.voorbeeld.starter.model.User" %>
<%@ page import="be.thomasmore.voorbeeld.starter.model.UserError" %>
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
            <li class="nav-item active mr-1 ml-1 mt-3">
                <a class="nav-link" href="/add-user">Add user</a>
            </li>
            <li class="nav-item mr-1 ml-1 mt-3">
                <a class="nav-link" href="/overview">Overview</a>
            </li>
        </ul>
    </div>
    <a class="navbar-brand" href="https://github.com/QuirkyDev" target="_blank">
        <img src="images/github_logo.png" width="30" height="30" alt="" loading="lazy">
    </a>
</nav>

<%
    User user = (User) request.getAttribute(User.NAME);
    UserError userError = (UserError) request.getAttribute(UserError.NAME);
%>

<div class="container-flex p-3">
    <form class="needs-validation" action="/process-user" method="get" novalidate>
        <div class="form-group">
            <label for="<%=User.FIRST_NAME%>"><%=User.FIRST_NAME%></label>
            <input
                    type="text"
                    class="form-control<%out.print(userError.firstName != null ? " is-invalid" : "");%>"
                    id="<%=User.FIRST_NAME%>"
                    name="<%=User.FIRST_NAME%>"
                    value="<%=user.getFirstName() == null ? "" : user.getFirstName()%>"
                    required>
            <%out.print(userError.firstName != null ? "<div class=\"invalid-feedback\">" + userError.firstName + "</div>" : "");%>
        </div>
        <div class="form-group">
            <label for="<%=User.LAST_NAME%>"><%=User.LAST_NAME%></label>
            <input
                    type="text"
                    class="form-control<%out.print(userError.lastName != null ? " is-invalid" : "");%>"
                    id="<%=User.LAST_NAME%>"
                    name="<%=User.LAST_NAME%>"
                    value="<%=user.getLastName() == null ? "" : user.getLastName()%>"
                    required>
            <%out.print(userError.lastName != null ? "<div class=\"invalid-feedback\">" + userError.lastName + "</div>" : "");%>
        </div>
        <div class="form-group">
            <label for="<%=User.EMAIL%>"><%=User.EMAIL%></label>
            <input
                    type="email"
                    class="form-control<%out.print(userError.email != null ? " is-invalid" : "");%>"
                    id="<%=User.EMAIL%>"
                    name="<%=User.EMAIL%>"
                    value="<%=user.getEmail() == null ? "" : user.getEmail()%>"
                    required>
            <%out.print(userError.email != null ? "<div class=\"invalid-feedback\">" + userError.email + "</div>" : "");%>
        </div>
        <input type="submit" class="btn btn-orange" value="Submit user">
    </form>
</div>

<!--jQuery, Popper.js, and Bootstrap JS-->
<script src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html>
