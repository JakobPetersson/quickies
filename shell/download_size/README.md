# Curl download with simultaneous file size logging

```bash
download() {
  local URL="${1}"
  local FILE="${2}"

  # Log size in background
  while true; do sleep 5; echo `ls -lah "${FILE}" | awk '{print $5}'`; done &
  local STATUS_PID="$!"

  curl -sf -o "${FILE}" "${URL}"
  
  # Stop size logging in background
  disown "${STATUS_PID}"
  kill -s 9 "${STATUS_PID}" > /dev/null
}
```
