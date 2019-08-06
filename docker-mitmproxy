# Reverse proxy docker app

```bash
docker run --rm -it \
  -p 9090:8080 \
  -p 9091:8081 \
  mitmproxy/mitmproxy \
  mitmweb --mode reverse:http://localhost:8080 --web-iface 0.0.0.0
```

* Proxied app on localhost:8080
* Proxy on localhost:9090
* mitmweb on localhost:9091
