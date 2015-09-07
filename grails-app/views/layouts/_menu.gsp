<%--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--%>
<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
    <li><a href="${createLink(controller: "typeCost")}">Tipos De Costo</a></li>
    <li><a href="#!">two</a></li>
    <li class="divider"></li>
    <li><a href="#!">three</a></li>
</ul>
<nav class="teal darken-3" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="${createLink(uri: "/")}" class="brand-logo">CN</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="${createLink(uri: "/")}">Inicio</a></li>
            <!-- Dropdown Trigger -->
            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Administración<i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="${createLink(uri: "/")}">Inicio</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>