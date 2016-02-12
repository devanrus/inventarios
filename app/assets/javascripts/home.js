$(document).ready(function() {
    $("#porcentaje").click(function() {
        $("#demanda_articulo").hide();
        $("#demanda_articulo_pie").show();
    });

    $("#total").click(function() {
        $("#demanda_articulo_pie").hide();
        $("#demanda_articulo").show();
    });
});
