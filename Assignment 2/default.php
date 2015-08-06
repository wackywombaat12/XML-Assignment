<?php
	header("Cache-Control: no-cache");
	header("Expires: -1");
		session_start();
	if ($_SESSION["username"]){
		$user = $_SESSION["username"];
		}
?>
<! DOCTYPE>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
		<body>
		<div class="main">
			<h1>Home Page</h1>
			<p><a href="login.html">Login</a></p>
			<?php if ($_SESSION["username"]){
			echo '<p><a href="customer_management.html">Customer Management</a></p>';
			echo '<p><a href="bills.htm">Create Bills</a></p>';
			echo '<p><a href="logout.php">Logout</a></p>';
			}
			?>
		</div>
		</body>
</html>