#!bash
#
# Usage: clicraft start
#
#    Starts the server.
#

if status; then
	err "$SERVER_NAME is already running"
	return 1
fi

if [[ ! -f "$SERVER_JAR" ]]; then
	action dl || return $?
fi

if [[ ! -w "$SERVER_DIR" ]]; then
	err "No write permissions in $SERVER_DIR"
	return 1
fi

msg "Starting $SERVER_NAME"

TIMEOUT=$START_TIMEOUT serverlog "$RE_START" multiplex_start >/dev/null

if ! status; then
	err "$SERVER_NAME failed to start"
	return 1
else
	return 0
fi

