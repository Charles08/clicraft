#!bash
#
# Usage: clicraft update
#
#    Updates the server jar file.
#

if [ -f "$SERVER_JAR" ]; then
	echo "Backing up server jar to $(basename $SERVER_JAR).ccback"
	mv "$SERVER_JAR" "$SERVER_JAR.ccback" || return $?
fi

echo "Downloading new $(basename $SERVER_JAR)"
$DOWNLOAD_COMMAND

status && action restart

