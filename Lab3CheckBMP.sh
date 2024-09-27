#!/bin/bash

check_bmp280() {

    local device_id

    device_id=$(i2cget -f -y 2 0x76 0xD0)

    device_id_dec=$((device_id))

    if [ "$device_id_dec" -eq 88 ]; then
        echo "BMP280 detecte a l'addresse 0x76 avec l'ID: $device_id"
        return 0
    else
        echo "BMP280 pas a l'addresse 0x76 (device ID: $device_id)"
        return 1
    fi
}

if check_bmp280; then
    echo "BMP280 est conneceter et fonctionnelle."
else
    echo "BMP280 pas detecter a l'adresse 0x76."
    exit 1
fi
