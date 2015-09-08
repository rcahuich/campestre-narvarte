<%@ page import="com.narvarte.campestre.Event" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Detalle de Evento</title>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            $('.modal-trigger').leanModal({
                        dismissible: false, // Modal can be dismissed by clicking outside of the modal
                        opacity: .5, // Opacity of modal background
                        in_duration: 300, // Transition in duration
                        out_duration: 200 // Transition out duration
                    }
            );

            $(document).on('click', '#deleteEvent', function (e) {
                e.preventDefault();
                $('#loader').show();
                $(this).prop('disabled', true);
                $(this).addClass("disabled");

                $.ajax({
                    type: "DELETE",
                    data: {name: "${event.name}"},
                    url: '<g:createLink controller="event" action="delete" id="${event.id}"/>',
                    success: function (data) {
                        $('#deleteEvent').hide();
                        $('#btnCancel').hide();
                        $('#textInfo').hide();
                        $('#btnClose').show();
                        $('#textSucces').html(data.messague);
                        $('#loader').hide();
                        $('#alertSuccess').show();
                    },
                    error: function (data) {
                        $('#textInfo').hide();
                        $('#textError').html(data.responseText);
                        $('#loader').hide();
                        $('#alertError').show();
                    }
                });
            });
        })

    </script>

</head>

<body>
<div class="container">
    <h3 class="header light">Detalles de "${event.name}"</h3>
    <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i
            class="material-icons left">arrow_back</i> Lista de Eventos</a>

    <br>
    <g:if test="${flash.message}">
        <div class="card-panel">
            <span class="blue-text text-darken-2"><i class="material-icons left">done</i>${flash.message}</span>
        </div>
    </g:if>

    <div class="card-panel">
        <span id="name-label" class="property-label">Nombre:</span>
        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${event}" field="name"/></span>
        <br>
        <span id="startDate-label" class="property-label">Fecha Inicio:</span>
        <span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${event?.startDate}"
                                                                                     format="dd/MM/yyyy"/></span>
        <br>
        <span id="endtDate-label" class="property-label">Fecha Fin:</span>
        <span class="property-value" aria-labelledby="endtDate-label"><g:formatDate date="${event?.endtDate}"
                                                                                    format="dd/MM/yyyy"/></span>
        <br>
        <span id="status-label" class="property-label">Estatus:</span>
        <span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${event?.status}"/></span>
        <br>

    </div>


    <div class="card-panel">
        <a class="waves-effect waves-light btn" href="${createLink(action: "edit", id: event.id)}">Editar Evento</a>
        <a class="waves-effect waves-light btn modal-trigger red darken-1" href="#modal1"><i
                class="material-icons left">delete</i> Eliminar</a>
    </div>

</div>

<!-- Modal Structure -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <h4>Eliminar Evento</h4>

        <p id="textInfo">
            Al eliminar el evento tambien se borraran todos los datos ligados a el, como lo son las Familias, Pagos y Personas Registradas.<br>
            ¿Esta seguro?
        </p>

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
                <div class="spinner-layer spinner-red-only">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>

                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>

                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-footer">
        <a id="btnClose" class="waves-effect waves-green btn-flat" href="${createLink(action: "index")}"
           style="display: none;">Cerrar</a>
        <a id="deleteEvent" href="#!" class="waves-effect waves-red btn-flat"><i
                class="material-icons left">delete</i>Eliminar</a>
        <a id="btnCancel" href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
    </div>
</div>

</body>
</html>
