<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Campestre Narvarte 2015</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <style type="text/css">
        nav ul a,
        nav .brand-logo {
            color: #444;
        }

        p {
            line-height: 2rem;
        }

        .button-collapse {
            color: #26a69a;
        }

        .parallax-container {
            min-height: 380px;
            line-height: 0;
            height: auto;
            color: rgba(255,255,255,.9);
        }
        .parallax-container .section {
            width: 100%;
        }

        @media only screen and (max-width : 992px) {
            .parallax-container .section {
                position: absolute;
                top: 40%;
            }
            #index-banner .section {
                top: 10%;
            }
        }

        @media only screen and (max-width : 600px) {
            #index-banner .section {
                top: 0;
            }
        }

        .icon-block {
            padding: 0 15px;
        }
        .icon-block .material-icons {
            font-size: inherit;
        }

        footer.page-footer {
            margin: 0;
        }
        </style>
	</head>
	<body>

    <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br><br>
                <h1 class="header center teal-text text-lighten-2 light" >Campestre Narvarte</h1>
                <div class="row center">
                    <h5 class="header col s12 light">Sistema de Registro</h5>
                </div>
                <br><br>

            </div>
        </div>
        <div class="parallax"><img src="${assetPath(src: 'background3.jpg')}" alt="Unsplashed background img 1" style="display: inherit;"></div>
    </div>

        <div class="container">
            <div class="section">

                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">menu</i></h2>
                            <h5 class="center">Menu</h5>

                            <div class="collection with-header">
                                <a href="${createLink(controller: "person", action: "create")}" class="collection-item">Agregar Persona <i class="material-icons right">account_box</i><i class="material-icons right">add</i></a>
                                <a href="${createLink(controller: "family", action: "index")}" class="collection-item">Realizar Pago <i class="material-icons right">payment</i><i class="material-icons right">add</i></a>
                                <a href="${createLink(controller: "family", action: "create")}" class="collection-item">Nueva Familia <i class="material-icons right">group</i><i class="material-icons right">add</i></a>
                                <a href="${createLink(controller: "family", action: "index")}" class="collection-item">Persona a Familia <i class="material-icons right">group</i> <i class="material-icons right">arrow_forward</i> <i class="material-icons right">account_box</i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
                            <h5 class="center"> </h5>

                            <p class="light"> </p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
                            <h5 class="center"> </h5>

                            <p class="light"> </p>

                        </div>
                    </div>
                </div>

            </div>
            <br><br>

            <div class="section">

            </div>
        </div>

	</body>
</html>
