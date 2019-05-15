# Curl HTTP keepalive

Send multiple requests in the same curl command.

```bash
printf 'url="https://google.com"\n%.0s' {1..20} \
| curl -K - --keepalive \
-H "Connection: keep-alive" \
-sw "\n$(date +%FT%T)    dns %{time_namelookup}    connect %{time_connect}   firstbyte %{time_starttransfer}   total %{time_total}   HTTP %{http_code}\n" \
| grep dns
```
