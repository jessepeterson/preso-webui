#!/bin/sh

echo 'Content-type: text/html'
echo

echo '<html><body>'
echo 'Hello world!'

echo '<form method="GET">'

echo '<input name="input" type="submit" value="makecatalogs">'

echo '<form method="GET">'

if [ "X$QUERY_STRING" == "Xinput=makecatalogs" ]; then
	echo '<hr>'
	echo '<pre>'
	/usr/local/munki/makecatalogs /Users/Shared/munki 2>&1
	echo '</pre>'
fi

echo '</body></html>'

