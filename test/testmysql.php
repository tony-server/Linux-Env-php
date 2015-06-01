<?php
	/**
	* 测试php与mysql连接
	*/
	$link = mysql_connect("localhost","root","");
	if(!$link) echo "FAILD!连接错误，用户名密码不对";
	else echo "OK!可以连接";
?>