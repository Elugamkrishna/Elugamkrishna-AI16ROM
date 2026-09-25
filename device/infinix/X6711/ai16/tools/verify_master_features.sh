#!/system/bin/sh

REG=/system/etc/ai16/AI16ROM_MASTER_FEATURES.conf
CAP=/system/etc/ai16/X6711_RUNTIME_CAPABILITIES.conf

echo "=================================================="
echo " AI16ROM X6711 — MASTER FEATURE VERIFIER"
echo "=================================================="

ERRORS=0

if [ ! -f "$REG" ]; then
    echo "ERROR: MASTER REGISTRY MISSING"
    ERRORS=$((ERRORS+1))
else
    echo "MASTER REGISTRY: OK"
fi

if [ ! -f "$CAP" ]; then
    echo "ERROR: X6711 CAPABILITY PROFILE MISSING"
    ERRORS=$((ERRORS+1))
else
    echo "CAPABILITY PROFILE: OK"
fi

if [ -f "$REG" ]; then

    TOTAL=$(grep -Ev '^[[:space:]]*#|^[[:space:]]*$|^\[' "$REG" |
        grep '|' | wc -l)

    DUP=$(grep -Ev '^[[:space:]]*#|^[[:space:]]*$|^\[' "$REG" |
        grep '|' | cut -d'|' -f1 | sort | uniq -d | wc -l)

    BAD=$(grep -Ev '^[[:space:]]*#|^[[:space:]]*$|^\[' "$REG" |
        grep '|' |
        awk -F'|' '
        $1=="" ||
        $2=="" ||
        $3=="" ||
        $4=="" ||
        $5=="" {print}
        ' | wc -l)

    echo "FEATURE COUNT : $TOTAL"
    echo "DUPLICATE IDS : $DUP"
    echo "BAD RECORDS   : $BAD"

    if [ "$DUP" -ne 0 ]; then
        echo "ERROR: duplicate feature IDs"
        ERRORS=$((ERRORS+1))
    fi

    if [ "$BAD" -ne 0 ]; then
        echo "ERROR: malformed registry records"
        ERRORS=$((ERRORS+1))
    fi

    echo
    echo "===== FORBIDDEN FAKE FEATURES ====="

    for F in 4K60 FAKE_NPU FAKE_NFC FAKE_AOD FAKE_EXTERNAL_DISPLAY; do
        if grep -q "^$F=" "$CAP"; then
            echo "$F: guarded"
        else
            echo "$F: WARNING"
        fi
    done
fi

echo
echo "===== X6711 BASIC RUNTIME ====="

if [ "$(getprop ro.product.device)" = "X6711" ] ||
   [ "$(getprop ro.product.product.device)" = "X6711" ]; then
    echo "DEVICE: X6711"
else
    echo "DEVICE: UNKNOWN"
fi

echo "SOC: $(getprop ro.board.platform)"
echo "ARCH: $(getprop ro.product.cpu.abi)"

echo
echo "===== RESULT ====="

if [ "$ERRORS" -eq 0 ]; then
    echo "MASTER FEATURE VERIFICATION: PASS"
    exit 0
else
    echo "MASTER FEATURE VERIFICATION: FAIL"
    exit 1
fi
