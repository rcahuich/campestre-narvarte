<%@ page import="com.narvarte.campestre.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Editar Evento</title>

        <asset:javascript src="jquery.validate.js"/>
        <asset:javascript src="jquery.validate_es.js" />
        <script type="application/javascript">

            // Extension pour comptabilité avec materialize.css
            $.validator.setDefaults({
                errorClass: 'invalid',
                validClass: "valid",
                errorPlacement: function (error, element) {
                    $(element)
                            .closest("form")
                            .find("label[for='" + element.attr("id") + "']")
                            .attr('data-error', error.text());
                },
                submitHandler: function (form) {
                    console.log('form ok');
                }
            });

            $("#form").validate({
                rules: {
                    name: {
                        required: true
                    },
                    startDate: {
                        required: true
                    },
                    endtDate: {
                        required: true
                    }
                }
            });

            $(document).ready(function () {
                $('.datepicker').pickadate({
                    format: 'dd/mm/yyyy',
                    today: 'Hoy',
                    clear: 'Limpiar',
                    close: 'Cerrar',
                    labelMonthNext: 'Siguiente mes',
                    labelMonthPrev: 'Mes anterior',
                    labelMonthSelect: 'Seleccione mes',
                    labelYearSelect: 'Seleccione año',
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 5 // Creates a dropdown of 15 years to control year
                });
            })

            $(document).on('click', '#saveEvent', function (e) {
                e.preventDefault();
                if($("#form").valid()){
                    $('#formData').hide();
                    $('#alertSuccess').hide();
                    $('#alertError').hide();
                    $('#loader').show();

                    $.ajax({
                        type: "POST",
                        data: $('#form').serialize(),
                        url: '<g:createLink controller="event" action="updateEvent"/>',
                        success: function (data) {
                            $('#textSucces').html(data.messague);
                            $('#loader').hide();
                            $('#alertSuccess').show();
                            $('html').animate({scrollTop:0}, 'slow');
                            $('body').animate({scrollTop:0}, 'slow');
                        },
                        error: function (data) {
                            $('#textError').html(data.responseText);
                            $('#alertError').show();
                            $('#loader').hide();
                            $('#formData').addClass('animated fadeIn').show();
                            $('html').animate({scrollTop:0}, 'slow');
                            $('body').animate({scrollTop:0}, 'slow');
                        }
                    });
                }

            });

        </script>
	</head>
	<body>
    <div class="container">
        <h3 class="header light">Editar Evento: "${event.name}"</h3>

        <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">list</i> Lista de Eventos</a>
        <br><br>

        <div id="alertSuccess" class="card-panel" style="display: none;">
            <span class="blue-text text-darken-2"><i class="material-icons left">done</i>
                <span id="textSucces"></span></span>
        </div>

        <div id="alertError" class="card-panel" style="display: none;">
            <span class="red-text text-darken-2"><i class="material-icons left">error</i>
                <span id="textError"></span></span>
        </div>

        <div id="loader" class="col s12 m4 center" style="display: none;">
            <div class="preloader-wrapper small active">
                <div class="spinner-layer spinner-green-only">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div><div class="gap-patch">
                    <div class="circle"></div>
                </div><div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
                </div>
            </div>
        </div>

        <div id="formData" class="row">
            <form id="form" class="col s12">
                <div class="card-panel">
                    <g:hiddenField name="id" value="${event?.id}" />
                    <g:render template="form"/>
                </div>
                <div class="card-panel">
                    <a class="waves-effect waves-light btn" href="${createLink(action: "detail", id: event.id)}">Cancelar</a>
                    <a class="waves-effect waves-light btn" href="#" id="saveEvent"> Actualizar Evento</a>
                </div>
            </form>
        </div>

    </div>

	</body>
</html>
