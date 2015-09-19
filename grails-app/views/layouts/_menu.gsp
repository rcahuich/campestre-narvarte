<%--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--%>
<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
    <li><a href="${createLink(controller: "typeCost")}" class="teal-text light">Tipos De Costo</a></li>
    <li><a href="${createLink(controller: "event")}" class="teal-text light">Eventos</a></li>
    <li><a href="${createLink(controller: "person")}" class="teal-text light">Registros</a></li>
    <li><a href="${createLink(controller: "family")}" class="teal-text light">Familias</a></li>
    <li class="divider"></li>
    <li><a href="#!" class="teal-text light">Reportes</a></li>
</ul>
<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="${createLink(uri: "/")}" class="brand-logo teal-text light">Campestre Narvarte</a>

        <ul class="right hide-on-med-and-down">
            <li><a href="${createLink(uri: "/")}" class="teal-text light">Inicio</a></li>
            <!-- Dropdown Trigger -->
            <li>
                <a class="dropdown-button teal-text light" href="#!" data-activates="dropdown1">
                    Administración <i class="material-icons right">arrow_drop_down</i></a>
            </li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="${createLink(uri: "/")}" class="teal-text light">Inicio</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse teal-text light"><i class="material-icons">menu</i></a>
    </div>
</nav>