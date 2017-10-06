<%--
  Created by IntelliJ IDEA.
  User: thuvarakan
  Date: 9/8/17
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="stylehome.css">
    <style>
        body {
            background-image: url("https://i.imgur.com/Nbi7bYI.jpg");
        }
    </style>
</head>
<body>
<form name="form-login" method="post">
    <input type="submit" name="Logout" value="Logout">
</form>
<button onclick="chkJS()">Check JS </button>

<script>
    function chkJS() {
        alert(document.cookie);
    }
</script>


<h1> Welcome</h1>

<div>
    <%


        Cookie cookie = null;
        Cookie[] cookies = null;

        // Get an array of Cookies associated with the this domain
        cookies = request.getCookies();

        if(request.getParameter("Logout") != null){
            if(cookies !=null)
            {
                session.invalidate();
                for(Cookie cookie1 : cookies)
                {
                    if (cookie1.getName().equals("ssc"))
                    {
                        cookie1.setMaxAge(0);
                        cookie1.setValue(null);
                        cookie1.setPath("/");
                        response.addCookie(cookie1);
                    }


                }
            }
            response.sendRedirect("index.jsp");

        }

        if( cookies != null ) {

            out.println("<h2> Cookies Details </h2>");

            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                boolean check= false;
                if(cookie.getName().equals("ssc"))
                {
                    check = true;
                    out.print("<table>"+
                            "<tr>"+
                            "<td>"+"Name : \t" + "</td>"+ "<td>"+ cookie.getName( ) + "</td>" +
                            "</tr>"+
                            "<tr>"+
                            "<td>"+"Value : \t" + "</td>"+ "<td>"+ cookie.getValue( ) + "</td>" +
                            "</tr>"+
                            "<tr>"+
                            "<td>"+"Max Age : \t" + "</td>"+ "<td>"+ cookie.getMaxAge( ) + "</td>" +
                            "</tr>"+
                            "<tr>"+
                            "<td>"+"Path : \t" + "</td>"+ "<td>"+ cookie.getPath( ) + "</td>" +
                            "</tr>"+
                            "</table>"

                    );

                }

            }

        }
        else
        {
            out.println("<h2>Cookie couldn't create </h2>");
        }
    %>
</div>

</body>
</html>
