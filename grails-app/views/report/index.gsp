<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Reporte General</title>
    <asset:stylesheet src="chartist.min.css"/>

</head>
<body>

    <div class="container">
        <h4><i class="material-icons">assessment</i> Reporte General</h4>

        <a class="waves-effect waves-light btn" href="${createLink(action: "report")}"><i
                class="material-icons left">search</i> Búsqueda Avanzada</a>

        <hr>


        <div class="row card">
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content blue-grey white-text">
                        <p class="card-stats-title"><i class="mdi-social-group-add"></i> Total de Familias</p>
                        <h4 class="card-stats-number">${totalFamily}</h4>

                    </div>

                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content blue-grey white-text">
                        <p class="card-stats-title"><i class="mdi-editor-attach-money"></i>Total de Pagos</p>
                        <h4 class="card-stats-number">$ <g:formatNumber number="${totalPayment}" format="###,##0" locale="us"/></h4>

                    </div>

                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content blue-grey white-text">
                        <p class="card-stats-title"><i class="mdi-action-trending-up"></i> Total de Registros</p>
                        <h4 class="card-stats-number">${totalRegister}</h4>

                    </div>

                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card">
                    <div class="card-content blue-grey white-text">
                        <p class="card-stats-title"><i class="mdi-editor-insert-drive-file"></i> Total de Inscritos</p>
                        <h4 class="card-stats-number">${totalEnrollment}</h4>

                    </div>

                </div>
            </div>
        </div>

        <div class="card-panel" style="height: 350px;">
            <div id="loader-groups" class="col s12 m4 center" style="display: none;">
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

            <div id="totalGroupsTeam">
                <div id="resultTotalGroupsTeam"></div>
            </div>
        </div>

    </div>

    <asset:javascript src="chartist.js"/>
    <asset:javascript src="chartist-plugin-tooltip.min.js"/>

<script type="text/javascript">

    function totalGroupsTeam(id) {
        $('#loader-groups').show();
        $.ajax({
            type: 'GET',
            url: '${createLink(controller: 'report', action: 'totalGroupsTeam')}',
            success: function (data) {
                $('#resultTotalGroupsTeam').html(data);
                $('#loader-groups').hide();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(textStatus);
                $('#loader-groups').hide();
            }
        });
    }

    $(document).ready(function () {
        totalGroupsTeam("#totalGroupsTeam");

    });

</script>
</body>
</html>