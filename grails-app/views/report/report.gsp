<%@ page import="com.narvarte.campestre.enums.LodgementEnum; com.narvarte.campestre.enums.TypePersonEnum; com.narvarte.campestre.enums.BaptismEnum; com.narvarte.campestre.enums.GroupEnum; com.narvarte.campestre.enums.TransportEnum" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Búsqueda Avanzada</title>

    <asset:stylesheet src="jquery.dataTables.css"/>
    <asset:stylesheet src="dataTables.tableTools.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/responsive/1.0.6/css/dataTables.responsive.css">
    <asset:javascript src="jquery.dataTables.js"/>
    <script type="text/javascript" src="//cdn.datatables.net/responsive/1.0.6/js/dataTables.responsive.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('select').material_select();

            $("#search").on("click", function (e) {
                e.preventDefault();
                $('#loader').show();
                $('#result').hide();

                $.ajax({
                    type: 'GET',
                    url: '${createLink(controller: 'report', action: 'searchData')}',
                    data: $('#reportForm').serialize(),
                    success: function (data) {
                        $('#result').html(data);
                        $('#result').show();
                        $('#loader').hide();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(textStatus);
                        $('#loader').hide();
                    }
                });

            });

        });
    </script>
</head>

<body>
<div class="container">
    <h4><i class="material-icons">search</i> Búsqueda Avanzada</h4>

    <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i
            class="material-icons left">assessment</i> Reporte General</a>

    <hr>

    <div class="card-panel">
        <form id="reportForm">

            <div class="row">
                <div class="input-field col s3">
                    <g:select id="transport"
                              name="transport"
                              from="${TransportEnum.values()}"
                              value=""
                              valueMessagePrefix="com.narvarte.campestre.enums.TransportEnum"
                              noSelection="['all': 'Todos']"/>
                    <label for="transport">Tipo de Transporte</label>
                </div>

                <div class="input-field col s3">
                    <g:select id="groupTeam"
                              name="groupTeam"
                              from="${GroupEnum.values()}"
                              value=""
                              valueMessagePrefix="com.narvarte.campestre.enums.GroupEnum"
                              noSelection="['all': 'Todos']"/>
                    <label for="transport">Grupo</label>
                </div>

                <div class="input-field col s3">
                    <g:select id="baptism"
                              name="baptism"
                              from="${BaptismEnum.values()}"
                              value=""
                              valueMessagePrefix="com.narvarte.campestre.enums.BaptismEnum"
                              noSelection="['all': 'Todos']"/>
                    <label for="baptism">Dato de Bautismo</label>
                </div>

                <div class="input-field col s3">
                    <g:select id="typePerson"
                              name="typePerson"
                              from="${TypePersonEnum.values()}"
                              value=""
                              valueMessagePrefix="com.narvarte.campestre.enums.TypePersonEnum"
                              noSelection="['all': 'Todos']"/>
                    <label for="typePerson">Tipo de Persona</label>
                </div>

            </div>

            <div class="row">
                <div class="input-field col s3">
                    <g:select id="lodgement"
                              name="lodgement"
                              from="${LodgementEnum.values()}"
                              value=""
                              valueMessagePrefix="com.narvarte.campestre.enums.LodgementEnum"
                              noSelection="['all': 'Todos']"/>
                    <label for="lodgement">Alojamiento</label>
                </div>

                <div class="input-field col s2">
                    <input type="checkbox" id="secured" name="secured"/>
                    <label for="secured">Asegurado</label>
                </div>

                <div class="input-field col s2">
                    <input type="checkbox" id="enrollment" name="enrollment"/>
                    <label for="enrollment">Inscrito</label>
                </div>

                <div class="input-field col s2">
                    <input type="checkbox" id="haveFamily" name="haveFamily"/>
                    <label for="haveFamily">Sin Familia</label>
                </div>

                <div class="input-field col s2">
                    <a id="search" href="#" class="waves-effect waves-light btn btn-sm">
                        <i class="material-icons left">search</i> Buscar</a>

                </div>

            </div>

        </form>
    </div>

    <div id="loader" class="card-panel col s12 m4 center" style="display: none;">
        <div class="preloader-wrapper medium active">
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

    <div id="result" class="card-panel" style="display: none;">

    </div>

</div>

</body>
</html>