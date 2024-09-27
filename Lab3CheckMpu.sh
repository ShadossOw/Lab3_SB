#!/bin/bash

check_mpu9250() {

    local device_id

    device_id=$(i2cget -f -y 2 0x68 0x75)

    device_id_dec=$((device_id))

    if [ "$device_id_dec" -eq 113 ]; then
        echo "MPU-9250 detecte a l'adresse 0x68 avec l'ID: $device_id"
        return 0
    else
        echo "MPU-9250 pas trouve a l'adresse 0x68 (device ID: $device_id)"
        return 1
    fi
}

if check_mpu9250; then
    echo "MPU-9250 est connecter et fonctionnelle."
else
    echo "MPU-9250 pas a l'adresse 0x68."
    exit 1
fi
