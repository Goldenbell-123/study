<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">
      	var dataValue = [];
      	
      	$(document).ready(function(){
      		$("#getChart").on("click", function(){
      			$.ajax({
      				url : "ajax.do"
      				, type : "post"
      				, dataType : "json"
      				, success : function(list){
      					dataValue.push(['Age', 'Weight']);
      					$.each(list, function(idx,obj){
      						dataValue.push([obj.age, obj.weight]);
      					});
      			    	google.charts.load('current', {'packages':['corechart']});
      			      	google.charts.setOnLoadCallback(drawChart);
      				}
      			})
      		})
      	})//ready
    	
    


      
      function drawChart() {
        var data = google.visualization.arrayToDataTable(dataValue);

        var options = {
          title: 'Age vs. Weight comparison',
          hAxis: {title: 'Age', minValue: 0, maxValue: 15},
          vAxis: {title: 'Weight', minValue: 0, maxValue: 15},
          legend: 'none'
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('chart_div'));

        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<button id="getChart" >차트그리기</button>
	<div id="chart_div" style="width: 900px; height: 500px;"></div>
</body>
</html>