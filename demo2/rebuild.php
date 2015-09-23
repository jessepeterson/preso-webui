<html><body>
Hello world!

<form method="GET">

<input name="input" type="submit" value="makecatalogs">

<form method="GET">

<?php

if ($_GET["input"] == "makecatalogs") {
?>
	<hr>
	<pre>
<?php
	system("/usr/local/munki/makecatalogs /Users/Shared/munki");
?>
	</pre>
<?php
}

?>

</body></html>
