
<div class="group-team ct-perfect-fourth"></div>

<script type="text/javascript">

    new Chartist.Bar('.group-team', {
        labels: [
            'Niño hasta 4 años',
            'Niño de 5 a 12 años',
            'Adolescente Menor de 17 años',
            'Jovenes 1, menor de 34 años',
            'Jovenes 2, mayor de 35 años',
            'Matrimonio',
            'Mujer',
            'Hombre'
        ],
        series: ${data.valueGroups}
    }, {
        distributeSeries: true,
        height: 330,
        plugins: [
            Chartist.plugins.tooltip()
        ]
    });

</script>