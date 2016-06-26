<%@page import="accesodato.Conex"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">

        <title>Starter Template for Bootstrap</title>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    </head>

    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Project name</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">

            <br><br><br>
            <table class="table table-condensed table-hover table-bordered">
                <thead>
                <th>ID</th>
                <th>TAREA</th>

                <th>FECHA</th>
                <th>RESPONSABLE</th>
                <th>EDITAR</th>
                <th>ELIMINAR</th>


                </thead>
                <tbody>
                    <%
                        Conex con = new Conex();


                        con.setConsulta("select tarea.tarea_id,tarea.nombre,tarea.fecha,responsables.nombre as resp  from tarea,responsables where tarea.responsable_id=responsables.reponsable_id and tarea.estado='activo'");

                        while (con.getResultado().next()) {
                            out.println("<tr>");
                            out.println("<td>" + con.getResultado().getString("tarea_id") + "</td>");
                            out.println("<td>" + con.getResultado().getString("nombre") + "</td>");
                            out.println("<td>" + con.getResultado().getString("fecha") + "</td>");
                            out.println("<td>" + con.getResultado().getString("resp") + "</td>");

                            out.println("<td>" + "<a href='Tareai?eliminar=" + con.getResultado().getString("tarea_id") + "' class='btn btn-danger'>Eliminar</a>" + "</td>");
                            out.println("<td>" + "<a href='editar.jsp?editar=" + con.getResultado().getString("tarea"
                                    + "_id") + "' class='btn btn-primary'>Editar</a>" + "</td>");

                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    </body>
</html>

