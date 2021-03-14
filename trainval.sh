
## train
# CUDA_VISIBLE_DEVICES=1,2 python lib/core/trainer.py \
#    --cfg configs/kitti/3dssd/3dssd.yam

## evaluate on val dataset
# CUDA_VISIBLE_DEVICES=1 python lib/core/evaluator.py \
#    --cfg configs/kitti/3dssd/3dssd.yaml 
#    --restore_model_path /home/zhengkai/3DSSD/log/2021-02-27\ 17:33:44.597504/ 