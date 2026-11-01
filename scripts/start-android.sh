
#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

echo "=== Starting NVCloud Android ==="

docker compose pull
docker compose up -d

echo
echo "Container status:"
docker compose ps

echo
echo "ADB endpoint: 127.0.0.1:5555"
echo "Android may need time to boot."
