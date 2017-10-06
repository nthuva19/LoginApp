<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>



    <link rel="stylesheet" href="css/style.css">
    <meta charset="utf-8">
    <title>Login</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700">


</head>
<body>

<div id="login">
    <form name="form-login" method="post" action="">
        <span class="fontawesome-user"></span>
        <input type="text" id="user" name="Username" placeholder="Username">

        <span class="fontawesome-lock"></span>
        <input type="password" id="pass" name="Password" placeholder="Password">
        <td>
            <tr> Select One </tr>
            <tr>
                <select name="des">
                    <option value="Secure Flag">Secure Flag</option>
                    <option value="HTTP only Flag">HTTP only Flag</option>
                    <option value="None">None</option>
                    <option value="Both">Both</option>

                </select>
            </tr>
        </td>
        <div class="btn"><input type="submit" name="submit" value="Login" />
    </form>

</div>
</body>

</html>

<%
    Cookie cookie=null;

    Cookie[] cookies1=null;

    cookies1 = request.getCookies();
    if(cookies1 !=null)    {

        for(int i=0;i<cookies1.length;i++)
        {
            cookie=cookies1[i];

            if(cookie.getName( ).equals("ssc"))
            {
                response.sendRedirect("home.jsp");
            }

        }
    }
%>

<%

     Cookie cookiel=null;
    Cookie[] cookies=null;
    cookies=request.getCookies();
    String scheme=request.getScheme();




    if(request.getParameter("submit") != null) {


        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        String select = request.getParameter("des");
        if ("admin".equals(username)&& "pass".equals(password)) {

            if (request.getParameter("submit") != null)
            {


                if (select.equals("Secure Flag")) {

                    response.setHeader("Refresh", "0");
                    Cookie uname = new Cookie("ssc", "U2Fy9d7d08913bbe9785460349");
                    uname.setSecure(true);
                    uname.setMaxAge(3000);
                    uname.setDomain("localhost");
                    uname.setPath("/");
                    response.addCookie(uname);
                    response.sendRedirect("home.jsp");
                }

                else if (select.equals("Both"))
                {
                    //response.setHeader("Refresh", "0");
                    Cookie uname = new Cookie("ssc", "U2Fy9d7d08913bbe9785460349");
                    uname.setSecure(true);
                    uname.setHttpOnly(true);
                    uname.setMaxAge(3000);
                    uname.setDomain("localhost");
                    uname.setPath("/");
                    response.addCookie(uname);
                    response.sendRedirect("home.jsp");

                } else if (select.equals("HTTP only Flag")) {

                    Cookie uname = new Cookie("ssc", "U2Fy9d7d08913bbe9785460349");
                    uname.setSecure(false);
                    uname.setHttpOnly(true);
                    uname.setMaxAge(3000);
                    uname.setDomain("localhost");
                    uname.setPath("/");
                    response.addCookie(uname);
                    response.sendRedirect("home.jsp");

                }

                else if (select.equals("None")) {
                    response.setHeader("Refresh", "0");
                    Cookie uname = new Cookie("ssc", "U2Fy9d7d08913bbe9785460349");
                    uname.setSecure(false);
                    uname.setHttpOnly(false);
                    uname.setMaxAge(3000);
                    uname.setDomain("localhost");
                    uname.setPath("/");
                    response.addCookie(uname);
                    response.sendRedirect("home.jsp");
                }


            }
        }
        else {
            //out.println("Wrong Details");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username or password incorrect');");
            out.println("location='index.jsp';");
            out.println("</script>");
        }

    }

// get the session, add argument `true` to create a session if one is not yet created.
    //HttpSession session = request.getSession(true);
/*
    session.setAttribute("Username", request.getParameter("Username"));
    session.setAttribute("Password", request.getParameter("Password"));

// to get the username and password
    String Username = (String) session.getAttribute("Username");
    String Password = (String) session.getAttribute("Password");*/

%>



