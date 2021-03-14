import os
import sys
from tqdm import tqdm

ROOT = "./dataset/CARLA/object/"

def split_trainval(k=5):
    """
    k-folder split: train:val=4:1
    """
    train_list = []
    val_list = []
    with open(ROOT + "trainval.txt", 'r') as f:
        idx_list = [line for line in f.readlines()]
    print("Load {} image ids".format(len(idx_list)))

    for i, idx in enumerate(idx_list):
        if i % k == 0: val_list.append(idx)
        else: train_list.append(idx)

    print("[Train subset]: {} images".format(len(train_list)))
    print("[Val subset]: {} images".format(len(val_list)))

    with open(ROOT + "train.txt", 'w') as f:
        for i in tqdm(range(len(train_list))):
            f.write(train_list[i])

    with open(ROOT + "val.txt", 'w') as f:
        for i in tqdm(range(len(val_list))):
            f.write(val_list[i])
    
    print("[IO] train.txt saved to {}".format(ROOT+'train.txt'))
    print("[IO] val.txt saved to {}".format(ROOT+'val.txt'))

split_trainval()
