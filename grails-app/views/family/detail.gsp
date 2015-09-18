
<%@ page import="com.narvarte.campestre.Family" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>${family.name}</title>

        <style type="text/css">
        /*---------------------------------------- Profile Page ------------------------------------------*/

        #profile-page-header .card-image {
            height: 250px;
        }
        #profile-page-header .card-profile-image {
            width: 110px;
            position: absolute;
            top: 190px;
            z-index: 1;
            left: 40px;
            cursor: pointer;
            margin: 0;
        }
        #profile-page-header .card-content{
            margin-top: -40px;
        }
        #profile-page-header .card-content .card-title{
            margin-bottom: 0px;
        }

        /*profile-page-wall*/

        #profile-page-wall .profile-image-post{
            width: 60px;
            margin: 30px 10px;
        }
        #profile-page-wall .tab-profile .tab i{
            font-size: 16px;
        }
        #profile-page-wall .tab-content{
            padding: 10px;
        }
        #profile-page-wall .share-icons{
            margin-top: 10px;
        }
        #profile-page-wall .share-icons i{
            padding: 0px 5px;
        }


        #profile-page-wall-posts .profile-small{
            height: 250px;
            overflow: hidden;
        }
        #profile-page-wall-posts .profile-medium{
            height: 350px;
            overflow: hidden;
        }
        #profile-page-wall-posts .profile-large{
            height: 450px;
            overflow: hidden;
        }
        #profile-page-wall-posts .card-profile-title{
            font-size: 16px;
            padding: 20px;
            border-radius: 0 0 2px 2px;
        }
        #profile-page-wall-posts .card-action-share{
            padding: 16px;
        }

        /*----------------------------------------
            Shadow effect
        ------------------------------------------*/

        .shadow-demo {
            background-color: #26a69a;
            width: 100px;
            height: 100px;
            margin: 20px auto;
        }
        .collapsible-header {
            font-weight: 500;
        }

        .card .card-image img {
            top: -90px;
        }

        </style>

        <script type="text/javascript">
            jQuery(document).ready(function () {
                $('.modal-trigger').leanModal({
                            dismissible: false, // Modal can be dismissed by clicking outside of the modal
                            opacity: .5, // Opacity of modal background
                            in_duration: 300, // Transition in duration
                            out_duration: 200 // Transition out duration
                        }
                );
                $('select').material_select();

                $(document).on('change', '#addMember', function (e) {
                    var member = $("#addMember option:selected").val();
                    $('#member').val(member);
                });

                $(document).on('click', '#deleteEvent', function (e) {
                    e.preventDefault();

                    if($('#member').val() != ""){
                        $('#loader').show();
                        $(this).prop('disabled', true);
                        $(this).addClass("disabled");

                        $.ajax({
                            type: "GET",
                            data: {idMember: $('#member').val()},
                            url: '<g:createLink controller="family" action="addMember" id="${family.id}"/>',
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
                    }

                });

                $(document).on('click', '#deleteEventP', function (e) {
                    e.preventDefault();

                    if($('#realCost').val() != "" && $('#personPay').val() != ""){
                        $('#loaderP').show();
                        $(this).prop('disabled', true);
                        $(this).addClass("disabled");

                        $.ajax({
                            type: "GET",
                            data: {realCost: $('#realCost').val(), personPay: $('#personPay').val()},
                            url: '<g:createLink controller="family" action="addPayment" id="${family.id}"/>',
                            success: function (data) {
                                $('#deleteEventP').hide();
                                $('#btnCancelP').hide();
                                $('#textInfoP').hide();
                                $('#btnCloseP').show();
                                $('#textSuccesP').html(data.messague);
                                $('#loaderP').hide();
                                $('#alertSuccessP').show();
                            },
                            error: function (data) {
                                $('#textInfoP').hide();
                                $('#textErrorP').html(data.responseText);
                                $('#loaderP').hide();
                                $('#alertErrorP').show();
                            }
                        });
                    }

                });
            })

        </script>
	</head>
	<body>
        <div class="container">
            <div id="profile-page-header" class="card">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator" src="${assetPath(src: 'family_header.png')}" alt="user background">
                </div>
                <figure class="card-profile-image">
                    <img src="${assetPath(src: 'avatar2.png')}" alt="profile image" class="circle z-depth-2 responsive-img activator">
                </figure>
                <div class="card-content">
                    <div class="row">
                        <div class="col s3 offset-s2">
                            <h4 class="card-title grey-text text-darken-4">${family.name}</h4>
                            <p class="medium-small grey-text">Familia</p>
                        </div>
                        <div class="col s2 center-align">
                            <h4 class="card-title grey-text text-darken-4">${family?.header}</h4>
                            <p class="medium-small grey-text">Cabeza de Familia</p>
                        </div>
                        <div class="col s2 center-align">
                            <h4 class="card-title grey-text text-darken-4">$ <g:formatNumber number="${family.totalPayment()}" format="###,##0" locale="us"/></h4>
                            <p class="medium-small grey-text">Total a Pagar</p>
                        </div>
                        <div class="col s2 center-align">
                            <h4 class="card-title grey-text text-darken-4">$ <g:formatNumber number="${family.totalPayment() - family.totalPay()}" format="###,##0" locale="us"/></h4>
                            <p class="medium-small grey-text">Resta a Pagar</p>
                        </div>
                        <div class="col s1 right-align">
                            <a class="btn-floating activator waves-effect waves-light darken-2 right">
                                <i class="mdi-action-perm-identity"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-reveal" style="display: none; transform: translateY(0px);">
                    <p>
                        <span class="card-title grey-text text-darken-4">Familia ${family?.name}<i class="mdi-navigation-close right"></i></span>
                        <span><i class="mdi-action-perm-identity cyan-text text-darken-2"></i> ${family.header}</span>
                    </p>

                    <p>Total de pago realizado: $ <g:formatNumber number="${family.totalPay()}" format="###,##0" locale="us"/> resta $ <g:formatNumber number="${family.totalPayment() - family.totalPay()}" format="###,##0" locale="us"/></p>

                    <p>Historial de Pagos:</p>

                    <p>
                    <g:each in="${family.payments}" var="payment">
                        - Fecha de Pago:  <g:formatDate date="${payment.paymentDate}" format="dd/MM/yyyy HH:mm"/> con total de $ <g:formatNumber number="${payment.total}" format="###,##0" locale="us"/>, la persona que pago: ${payment.personPay}
                        <br>
                    </g:each>
                    </p>
                </div>
            </div>

            <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">arrow_back</i> Lista de Familias</a>
            <a class="waves-effect waves-light btn" href="#"><i class="material-icons left">edit</i> Editar Familia</a>
            <a class="waves-effect waves-light btn modal-trigger" href="#modalAddPayment"><i class="material-icons left">payment</i> Realizar Pago</a>
            <a class="waves-effect waves-light btn modal-trigger" href="#modalAddMember"><i class="material-icons left">account_box</i> Agregar Miembro</a>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="s10 offset-s1 col">
                <div class="row">
                    <g:each in="${family.personsList}" status="i" var="person">
                        <div class="col m4 animated fadeInUp"
                             style="-webkit-animation-duration:${i * 400}ms">
                            <div class="card lighten-1">
                                <div class="card-content center-align">
                                    <div class="card-title truncate black-text">${person.name}</div>
                                    <i class="teal-text large material-icons">account_circle</i>
                                    <p class="black-text text-darken-4">${person.age} años</p>
                                    <br>
                                </div>
                                <div class="card-action center-align truncate">
                                    <a href="${createLink(controller: "person", action: "detail", id: person.id)}" class="black-text text-darken-4">Ver Registro</a>
                                </div>
                            </div><!--/card-->
                        </div>

                    </g:each>

                </div>
            </div>

        </div>


    <!-- Modal Add Member -->
    <div id="modalAddMember" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h4>Agregar Miembro a la Familia</h4>

            <div id="textInfo">
                Seleccione un elemento de la siguiente lista para agregarlo a la Familia ${family?.name}.

                <div class="row">
                    <div class="input-field col s6">
                        <input type="hidden" name="member" id="member">
                        <g:select id="addMember" name="person"
                                  from="${personListForSelected}"
                                  optionKey="id"
                                  required=""
                                  value=""
                                  noSelection="['':'- Seleccione un Registro -']"
                                  class="many-to-one"/>
                        <label for="addMember">Seleccione un Miembro</label>
                    </div>

                </div>
            </div>

            <div id="alertSuccess" class="card-panel" style="display: none;">
                <div class="col s12 center">
                    <div class="card blue-grey darken-1 light">
                        <div class="card-content white-text">
                            <i class="large material-icons">done</i>
                            <p id="textSucces"></p>
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
            <a id="btnClose" class="waves-effect waves-green btn-flat" href="${createLink(action: "detail", id: family.id)}"
               style="display: none;">Cerrar</a>
            <a id="deleteEvent" href="#!" class="waves-effect waves-teal btn-flat">
                <i class="material-icons left">add</i> Agregar </a>
            <a id="btnCancel" href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
        </div>
    </div>

    <!-- Modal Add Member -->
    <div id="modalAddPayment" class="modal">
        <div class="modal-content">
            <h4>Realizar pago a la Familia</h4>

            <div id="textInfoP">
                Intruduzca el total de pago para agregarlo a la Familia ${family?.name}.

                <div class="row">
                    <div class="input-field col s6">
                        <input id="realCost" type="number" class="validate" name="realCost" value="" aria-required="true" required placeholder="" autofocus>
                        <label for="realCost">Total a Pagar</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="personPay" type="text" class="validate" name="personPay" value="" aria-required="true" required placeholder="">
                        <label for="personPay">Persona que Paga</label>
                    </div>

                </div>
            </div>

            <div id="alertSuccessP" class="card-panel" style="display: none;">
                <div class="col s12 center">
                    <div class="card blue-grey darken-1 light">
                        <div class="card-content white-text">
                            <i class="large material-icons">done</i>
                            <p id="textSuccesP"></p>
                        </div>
                    </div>
                </div>
            </div>

            <div id="alertErrorP" class="card-panel" style="display: none;">
                <span class="red-text text-darken-2"><i class="material-icons left">error</i>
                    <span id="textErrorP"></span></span>
            </div>

            <div id="loaderP" class="col s12 m4 center" style="display: none;">
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
            <a id="btnCloseP" class="waves-effect waves-green btn-flat" href="${createLink(action: "detail", id: family.id)}"
               style="display: none;">Cerrar</a>
            <a id="deleteEventP" href="#!" class="waves-effect waves-teal btn-flat">
                <i class="material-icons left">payment</i> Pagar </a>
            <a id="btnCancelP" href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
        </div>
    </div>

	</body>
</html>
