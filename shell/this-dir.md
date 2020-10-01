# Get the directory of current script

```bash
#!/usr/bin/env sh

set -euo pipefail

THIS_DIR=$(cd "$(dirname "$0")"; pwd -P)

...
```
