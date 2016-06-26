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
            <a href="lista.jsp" class="btn btn-primary">Listado tarea</a><br><br><br>
            <%
                int id = Integer.parseInt(request.getParameter("editar"));
                Conex con = new Conex();

                con.setConsulta("select * from tarea where tarea_id='" + id + "'");
                con.setConsulta("select tarea.tarea_id,tarea.nombre,tarea.fecha,responsables.nombre as resp ,responsables.reponsable_id  from tarea,responsables where tarea.responsable_id=responsables.reponsable_id and tarea.estado='activo'and tarea.tarea_id='" + id + "'");


            %>
            <% while (con.getResultado().next()) {  %>

            <form   name="form1" method="post" action="Tareai">
                Id:<input type="text" readonly="true" value='<% out.println("" + con.getResultado().getString("tarea_id")); %>' name="id"><br><br>
                
                 <div class="form-group">
                    <label for="Servicio">Asignar Tarea</label>
                    <textarea name="nombre" id="nombre" class="form-control" rows="10" value=<% out.println("" + con.getResultado().getString("tarea_id")); %>><% out.println("" + con.getResultado().getString("nombre")); %></textarea>
                </div>
                <div class="form-group">
                    <label for="Servicio">Fecha</label>
                    <input type="date" id="fecha" name="fecha" value=<% out.println("" + con.getResultado().getString("fecha")); %>>

                </div>
                
                
                <div class="form-group">
                    <label for="responsables">Seleccionar Responsable</label>
                    <select name="responsables" id="responsables" class="form-control">


                        <option value=<% out.println("" + con.getResultado().getString("reponsable_id")); %>><% out.println("" + con.getResultado().getString("resp")); %></option>    
                        <%con.setConsulta("select * from responsables");
                         while (con.getResultado().next()) {%> 
                        <option value='<% out.println("" + con.getResultado().getString("reponsable_id")); %>'><% out.println("" + con.getResultado().getString("nombre")); %></option>    



                        <%}%>

                    </select>
                </div>
               
                <button type="submit" id="submit" class="btn btn-danger">Guardar Tarea</button>
            </form>
            <% }%> 
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    </body>
</html>
