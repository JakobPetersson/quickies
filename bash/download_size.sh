#
# Curl download and log size of downloaded file.
#
download() {
  local URL="${1}"
  local FILE="${2}"

  # Log size in background
  while true; do sleep 5; _log `ls -lah "${FILE}" | awk '{print $5}'`; done &
  local STATUS_PID="$!"

  curl -sf -o "${FILE}" "${URL}"
  
  # Stop size logging in background
  disown "${STATUS_PID}"
  kill -s 9 "${STATUS_PID}" > /dev/null
}
