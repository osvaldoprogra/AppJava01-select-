<!DOCTYPE html>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
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
            <a href="lista.jsp" class="btn btn-primary">Listado tarea</a>
            <form   name="form1" method="post" action="Tareai" id="form1">
                <div class="form-group">
                    <label for="Servicio">Seleccionar Servicio</label>
                    <select id="servicios" class="form-control"></select>
                </div>
                <div class="form-group">
                    <label for="unidades">Seleccionar Unidad</label>
                    <select  id="unidades" class="form-control">
                       
                    </select>
                </div>
                <div class="form-group">
                    <label for="responsables">Seleccionar Responsable</label>
                    <select name="responsables" id="responsables" class="form-control"></select>
                </div>
                <div class="form-group">
                    <label for="Servicio">Asignar Tarea</label>
                    <textarea name="nombre" id="nombre" class="form-control" rows="10"></textarea>
                </div>
                <div class="form-group">
                    <label for="Servicio">Fecha</label>
                    <input type="date" id="fecha" name="fecha">

                </div>
                <button type="submit" id="submit" class="btn btn-danger">Guardar Tarea</button>
                                <button type="reset" id="submit" class="btn btn-default">Limpiar</button>

            </form>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        
             <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

        <script>
            
            $(document).ready(function () {
                $('select').select2();
                $('#servicios').append('<option> Seleccionar Servicio</option>');
                $.get("http://localhost:8080/App/Tarea", function (data, status) {
                    $.each(data, function (i, item) {
                        $('#servicios').append('<option value=' + item.servicio_id + '>' + item.nombre + '</option>');
                    });
                });

               
                $("#servicios").change(function () {
                    $("#unidades").empty();
                    var servicio_id = $("#servicios").val();

                    $.get("http://localhost:8080/App/Tarea?servicio_id=" + servicio_id, function (data, status) {
                        $.each(data, function (i, item) {
                            $('#unidades').append('<option value=' + item.unidad_id + '>' + item.nombre + '</option>');
                        });
                    });
                });

               
                $("#unidades").change(function () {

                    var unidad_id = $("#unidades").val();

                    $.get("http://localhost:8080/App/Tarea?unidad_id=" + unidad_id, function (data, status) {
                        $.each(data, function (i, item) {
                            $('#responsables').append('<option value=' + item.responsable_id + '>' + item.nombre + '</option>');
                        });
                    });
                });







                var form = $('#form1');
                form.submit(function () {

                    $.ajax({
                        type: form.attr('method'),
                        url: form.attr('action'),
                        data: form.serialize(),
                        success: function (data) {
                            alert("Tarea Ingresada");
                        }
                    });

                    return false;
                });














            });
        </script> 
    </body>
</html>
