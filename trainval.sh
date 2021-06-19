
## train(kitti)
CUDA_VISIBLE_DEVICES=1,2 python lib/core/trainer.py \
   --cfg configs/kitti/3dssd/3dssd.yaml

## evaluate on val dataset(kitti)
CUDA_VISIBLE_DEVICES=1 python lib/core/evaluator.py \
   --cfg configs/kitti/3dssd/3dssd.yaml 
   --restore_model_path /home/zhengkai/3DSSD/log/2021-02-27\ 17:33:44.597504/ 

## predict result and save it (carla)
CUDA_VISIBLE_DEVICES=1 python lib/core/data_preprocessor.py --cfg configs/kitti/3dssd/3dssd_carla.yaml --split training --img_list val
CUDA_VISIBLE_DEVICES=1 python lib/core/tester.py --cfg configs/kitti/3dssd/3dssd_carla.yaml --restore_model_path log/CARLA/v2