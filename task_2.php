<?php
$mysqli = new mysqli("localhost", "root", "newpass", "test");
if ($mysqli->connect_errno) {
    echo "Не удалось подключиться к MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
$mysqli->query("SET NAMES 'utf8'");
$mysqli->query("SET CHARACTER SET 'utf8'");
$mysqli->query("SET SESSION collation_connection = 'utf8_general_ci'");
$result = $mysqli->query('SELECT * FROM gorod INNER JOIN oblast INNER JOIN strana');
if (!$result) {
    die('Неверный запрос: ' . mysql_error());
}
while ($row = $result->fetch_assoc()) {
    echo $row['nazvanie_gorod'];
	echo " ";
    echo $row['nazvanie_oblast'];
	echo " ";
    echo $row['nazvanie_strana'];
    echo ".";
	echo "</br>";
}

?>