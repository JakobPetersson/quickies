# Source libraries safely

```bash
#!/usr/bin/env sh

# Only define functions once
[ -z "${LIBRARY_NAME_SH:-}" ] || return 0
LIBRARY_NAME_SH=Y

set -euo pipefail

# Source other libraries
. lib/other.sh

...
```
