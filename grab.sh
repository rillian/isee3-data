#!/bin/sh

# Download telemetry from the antenna server.
# Format is ascii hex packets over raw tcp.

TIMESTAMP=$(date -u +%Y.%j.%H.%M)
FILE=telemetry_${TIMESTAMP}
nc spench.net 12321 | tee telemetry_${TIMESTAMP}
sha1sum ${FILE} >> SHA1SUMS.txt
xz ${FILE}
