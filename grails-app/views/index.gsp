<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Campestre Narvarte 2015</title>

	</head>
	<body>

        <div class="section no-pad-bot" id="index-banner">
            <div class="container">
                <br><br>
                <h1 class="header center teal-text">Campestre Narvarte</h1>
                <div class="row center">
                    <h5 class="header col s12 light">Sistema de Registro</h5>
                </div>

                <br><br>

            </div>
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
                                <a href="#!" class="collection-item">Realizar Pago <i class="material-icons right">payment</i><i class="material-icons right">add</i></a>
                                <a href="#!" class="collection-item">Nueva Familia <i class="material-icons right">group</i><i class="material-icons right">add</i></a>
                                <a href="#!" class="collection-item">Persona a Familia <i class="material-icons right">group</i> <i class="material-icons right">arrow_forward</i> <i class="material-icons right">account_box</i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
                            <h5 class="center">User Experience Focused</h5>

                            <p class="light">By utilizing elements and principles of Material Design, we were able to create a framework that incorporates components and animations that provide more feedback to users. Additionally, a single underlying responsive system across all platforms allow for a more unified user experience.</p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
                            <h5 class="center">Easy to work with</h5>

                            <p class="light">We have provided detailed documentation as well as specific code examples to help new users get started. We are also always open to feedback and can answer any questions a user may have about Materialize.</p>
                            <ul>
                                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                                </g:each>
                            </ul>
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
