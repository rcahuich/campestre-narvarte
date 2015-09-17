
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
                            <h4 class="card-title grey-text text-darken-4">${family?.personsList?.size()}</h4>
                            <p class="medium-small grey-text">Total de Miembros</p>
                        </div>
                        <div class="col s2 center-align">
                            <h4 class="card-title grey-text text-darken-4">$ 0</h4>
                            <p class="medium-small grey-text">Total de Pago</p>
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

                    <p>Total de pago realizado: $ 0.00 resta $ 0.00</p>
                    <%--
                    <p><i class="mdi-action-perm-phone-msg cyan-text text-darken-2"></i> +1 (612) 222 8989</p>
                    <p><i class="mdi-communication-email cyan-text text-darken-2"></i> mail@domain.com</p>
                    <p><i class="mdi-social-cake cyan-text text-darken-2"></i> 18th June 1990</p>
                    <p><i class="mdi-device-airplanemode-on cyan-text text-darken-2"></i> BAR - AUS</p>--%>
                </div>
            </div>

            <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">arrow_back</i> Lista de Familias</a>
            <a class="waves-effect waves-light btn" href="#"><i class="material-icons left">edit</i> Editar Familia</a>
            <a class="waves-effect waves-light btn" href="#"><i class="material-icons left">payment</i> Realizar Pago</a>
            <a class="waves-effect waves-light btn modal-trigger" href="#modalAddMember"><i class="material-icons left">account_box</i> Agregar Miembro</a>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="s10 offset-s1 col">
                <div class="row">
                    <g:each in="${family.personsList}" status="i" var="person">
                        <div class="col m4 animated fadeInUp"
                             style="-webkit-animation-duration:${i * 300}ms">
                            <div class="card lighten-1">
                                <div class="card-content center-align">
                                    <div class="card-title truncate black-text">${person.name}</div>
                                    <i class="teal-text large material-icons">account_circle</i>
                                    <p class="black-text text-darken-4">This is some description or profile text here..</p>
                                    <br>
                                    <div class="row">
                                        <div class="col m2 hide-on-small-only">&nbsp;</div>
                                        <div class="col m2 s6 center-align"><a href="#"><i class="teal-text small mdi-action-face-unlock"></i></a></div>
                                        <div class="col m2 s6 center-align"><a href="#"><i class="teal-text small mdi-action-highlight-remove"></i></a></div>
                                        <div class="col m2 s6 center-align"><a href="#"><i class="teal-text small mdi-action-alarm-on"></i></a></div>
                                        <div class="col m2 s6 center-align"><a href="#"><i class="teal-text small mdi-action-account-balance"></i></a></div>
                                        <div class="col m2 .hide-on-small-only">&nbsp;</div>
                                    </div>
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
    <div id="modalAddMember" class="modal">
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
                                  value="${family?.personsList*.id}"
                                  class="many-to-one"/>
                        <label for="addMember">Seleccione un Miembro</label>
                    </div>

                </div>
            </div>

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
            <a id="btnClose" class="waves-effect waves-green btn-flat" href="${createLink(action: "detail", id: family.id)}"
               style="display: none;">Cerrar</a>
            <a id="deleteEvent" href="#!" class="waves-effect waves-teal btn-flat">
                <i class="material-icons left">add</i> Agregar </a>
            <a id="btnCancel" href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
        </div>
    </div>


	</body>
</html>
