#!/bin/bash
# Back up the Sales shared folder into /data/backups
set -euo pipefail

DEST="/data/backups"
STAMP=$(date +%F_%H%M)

tar -czf "$DEST/sales-$STAMP.tar.gz" -C /data sales
find "$DEST" -name 'sales-*.tar.gz' -mtime +7 -delete
logger -t backup-sales "Backup created: $DEST/sales-$STAMP.tar.gz"
