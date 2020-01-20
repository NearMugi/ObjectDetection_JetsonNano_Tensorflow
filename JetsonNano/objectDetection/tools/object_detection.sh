#!/bin/sh
. ./setting.txt

label="${MODEL_PATH}/label.txt"
model="${MODEL_PATH}/frozen_inference_graph_trt.pb"

echo "label       : ${label}"
echo "model       : ${model}"

python3 object_detection.py -l="$label" -m="$model" -d="jetson_nano_raspi_cam"
