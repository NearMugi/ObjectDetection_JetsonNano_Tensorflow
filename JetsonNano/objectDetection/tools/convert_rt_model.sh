#!/bin/sh
. ./setting.txt

# echo "modelPath   : ${MODEL_PATH}"
# echo "targetModel : ${MODEL}"

config="${MODEL_PATH}/ssd_mobilenet_v1_coco.config"
model="${MODEL_PATH}/${MODEL}"
output="${MODEL_PATH}/frozen_inference_graph_trt.pb"

echo "config      : ${config}"
echo "model       : ${model}"
echo "output      : ${output}"

# パスを通す
cd ../models/research
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

cd ../../tf_trt_models
cp ../tools/convert_rt_model.py .
python3 convert_rt_model.py -c="$config" -m="$model" -o="$output"
