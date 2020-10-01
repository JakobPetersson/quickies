# Display command line arguments for process

```bash
#!/usr/bin/env sh

set -eu

set_config_variables() {
  local FILE="${1}"

  # Variables to replace
  local SUBSTITUTE='\$USER_AGENT \$BACKEND_SCHEME \$BACKEND_HOST \$BACKEND_PORT'

  # Verify that variables are set
  echo "${USER_AGENT}" > /dev/null
  echo "${BACKEND_SCHEME}" > /dev/null
  echo "${BACKEND_HOST}" > /dev/null
  echo "${BACKEND_PORT}" > /dev/null

  envsubst "${SUBSTITUTE}" < "${FILE}" > "${FILE}.tmp" && mv "${FILE}.tmp" "${FILE}";
}

# Variables to replace in config files

# Set configuration variables from environment variables in all *.nginx files
for CONF_FILE in $(find /etc/nginx/ -regex '.*\.nginx'); do
 set_config_variables "$CONF_FILE"
done

exec nginx -c /etc/nginx/nginx.nginx -g 'daemon off;'
```
