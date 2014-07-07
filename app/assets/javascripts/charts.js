(function () {
  google.load('visualization', '1', {'packages': ['corechart','geochart','table']});
  google.setOnLoadCallback(drawCharts);
  
  var charts = [];
  var chartOptions = {
    'GeoChart': {
      'colors': ['#b9d4ff','#0044b4']
    },
    'ColumnChart': {
      legend: { position: 'top', maxLines: 10 },
    	bar: {groupWidth: "95%"},
    	height: 700,
      isStacked: true
      
    },
    'PieChart': {}
  };

  function drawCharts() {
    $(document).ready(function () {
      $('[data-behaviour=chart]').each(function () {
        drawChart($(this));
      });
    });
  }
  
  function drawChart($chart) {
    var url = $chart.data('url');
    var type = $chart.data('type');
    var headers = $chart.data('headers');
    loading($chart);
    $.getJSON(url, function (data) {
      if (typeof(data.table[0]) !== 'undefined'){
        createVisualization(type, data, $chart.context)
      }
      done($chart);
    });
  }

  function createVisualization(type, data, element) {
    // configure
    var table = data.table;
    if (typeof(data.headers) !== 'undefined'){
      table.unshift(data.headers);
    }
    var dataTable = google.visualization.arrayToDataTable(table);
    var options = chartOptions[type];
    var chart = new google.visualization[type](element);
    // draw
    chart.draw(dataTable, options);
    // listen
    if (type == 'GeoChart'){ addGeoChartListener(chart); }
    // export
    charts.push({ 'chart': chart, 'data': data, 'options': options, 'element': element });
  }
  
  function addGeoChartListener(chart) {
    google.visualization.events.addListener(chart, 'regionClick', function(a,b,c){
      window.location='/?country=' + a.region
    });
  }
  
  function loading($chart) {
    $chart.addClass("loading");
  }
  
  function done($chart) {
    $chart.removeClass("loading");
  }
  
  function hashToArray(data) {
    var output = [];
    for (var key in data){
      var value = data[key];
      output.push([key, value]);
    }
    return output;
  }
  // export
  window.data_director = {};
  window.data_director.charts = charts;
})();
