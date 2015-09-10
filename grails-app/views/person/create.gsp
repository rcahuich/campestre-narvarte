<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Nuevo Registro</title>

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
                    birthday: {
                        required: true
                    },
                    baptism: {
                        required: true
                    },
                    typePerson: {
                        required: true
                    },
                    typeCost: {
                        required: true
                    },
                    realCost: {
                        required: true,
                        number: true
                    },
                    fictitiousCost: {
                        required: true,
                        number: true
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
                    selectYears: 150 // Creates a dropdown of 15 years to control year
                });

                $('select').material_select();
            })

            $(document).on('click', '#savePerson', function (e) {
                e.preventDefault();
                if($("#form").valid()){
                    $('#formData').hide();
                    $('#alertSuccess').hide();
                    $('#alertError').hide();
                    $('#loader').show();

                    $.ajax({
                        type: "POST",
                        data: $('#form').serialize(),
                        url: '<g:createLink controller="person" action="savePerson"/>',
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

            $(document).on('change', '#typeCost', function (e) {
                var idCost = $("#typeCost option:selected").text().split('$')[1].trim();
                $('#realCost').val(idCost);
            });

        </script>

    </head>
	<body>
        <div class="container">
            <h3 class="header light">Nuevo Registro</h3>

            <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">list</i> Lista de Registros</a>
            <br><br>

            <div id="alertSuccess" class="row" style="display: none">
                <div class="col s12 center">
                    <div class="card blue-grey darken-1 light">
                        <div class="card-content white-text">
                            <i class="large material-icons">done</i>
                            <p id="textSucces"></p>
                        </div>
                        <div class="card-action">
                            <a href="${createLink(action: "create")}">Nuevo Registro</a>
                            <a href="#">Agregar a Familia</a>
                            <a href="${createLink(uri: "/")}">Inicio</a>
                        </div>
                    </div>
                </div>
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
                        <g:render template="form"/>
                    </div>
                    <div class="card-panel">
                        <a class="waves-effect waves-light btn" href="#" id="savePerson"> Crear Registro</a>
                    </div>
                </form>
            </div>


        </div>

	</body>
</html>
