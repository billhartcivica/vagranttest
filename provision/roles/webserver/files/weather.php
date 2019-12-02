<?php
$jsonfile = file_get_contents("http://api.openweathermap.org/data/2.5/weather?q=London,UK&units=metric&appid=fd23186c2323b2ab8f7530d3ee7a9191");
$jsondata = json_decode($jsonfile);
$temp = $jsondata->main->temp;
$pressure = $jsondata->main->pressure;
$mintemp = $jsondata->main->temp_min;
$maxtemp = $jsondata->main->temp_max;
$wind = $jsondata->wind->speed;
$humidity = $jsondata->main->humidity;
$desc = $jsondata->weather[0]->description;
$maind = $jsondata->weather[0]->main;
echo "<b>Current London Weather...</b><br>";
echo "Temp: $temp<br>";
echo "Pressure: $pressure<br>";
echo "Wind: $wind<br>";
echo "Maximum Temperature: $maxtemp<br>";
echo "Minimum Temperature: $mintemp<br>";
echo "Humidity: $humidity<br>";
echo "Description: $desc<br>";
?>

