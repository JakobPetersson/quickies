# Display command line arguments for process

```bash
pgrep "<program>" | xargs -I {} cat /proc/{}/cmdline
```
