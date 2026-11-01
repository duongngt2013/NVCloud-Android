
#!/usr/bin/env bash
set -u

echo "=== NVCloud Host Check ==="

if ! command -v docker >/dev/null 2>&1; then
    echo "[FAIL] Docker chưa được cài"
    exit 1
fi

echo "[OK] Docker: $(docker --version)"

if ! docker compose version >/dev/null 2>&1; then
    echo "[FAIL] Docker Compose chưa có"
    exit 1
fi

echo "[OK] Docker Compose"

for dev in binder hwbinder vndbinder; do
    if [ -e "/dev/$dev" ]; then
        echo "[OK] /dev/$dev"
    else
        echo "[MISSING] /dev/$dev"
    fi
done

if [ -r /proc/filesystems ] && grep -q binder /proc/filesystems; then
    echo "[OK] Binder filesystem"
else
    echo "[WARN] Chưa thấy binder filesystem"
fi

echo "=== Check complete ==="
