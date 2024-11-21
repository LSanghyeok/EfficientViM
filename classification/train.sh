#!/bin/bash
nGPUs=$1
BATCH_SIZE=$2
EPOCHS=$3
MODEL=$4
DATA_PATH=$5
OUTPUT=${6:-"output"}

python3 -m torch.distributed.launch --nproc_per_node=$nGPUs --master_addr="127.0.0.1" --master_port=29502 main.py --data-path $DATA_PATH --name $MODEL --batch-size $BATCH_SIZE --epochs $EPOCHS --output $OUTPUT

# bash train.sh 4 512 300 EfficientViM_M1 /hub_data1/joonmyung/data/imagenet /hub_data1/sanghyeok/CVPR25
# /hub_data1/joonmyung/data/imagenet
# /hub_data1/sanghyeok/CVPR25