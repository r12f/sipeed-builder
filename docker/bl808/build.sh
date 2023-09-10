#!/bin/sh

echo "Building BL808 D0 firmware:"
echo "  PROJECT_NAME=$PROJECT_NAME"
echo "  BL808_BUILD_JOBS=$BL808_BUILD_JOBS"
echo "  BL808_BUILD_KEEP_BUILDER=$BL808_BUILD_KEEP_BUILDER"
echo ""

BL_SDK_PATH=/data/sdk make CONFIG_CHIP_NAME=BL808 CPU_ID=D0 -j${BL808_BUILD_JOBS} PROJECT_NAME=$PROJECT_NAME
ERROR_CODE=$?

if [ $BL808_BUILD_KEEP_BUILDER -eq 1 ]; then
    sleep 30d
fi

cp /data/code/build_out/$PROJECT_NAME.bin /data/code/build_out/d0fw.bin
if [ $ERROR_CODE -eq 0 ]; then
    echo "Build BL808 D0 firmware success"
else
    echo "Build BL808 D0 firmware failed"
    exit $ERROR_CODE
fi