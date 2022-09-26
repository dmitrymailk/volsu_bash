2. create select on bash
```bash
#!/bin/bash
if [ -z "$1" ]; then
	echo "Usage: $0 file"
	exit 1
fi
