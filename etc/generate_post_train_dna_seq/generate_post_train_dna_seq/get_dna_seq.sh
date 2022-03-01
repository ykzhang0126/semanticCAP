#!/bin/bash
export d=~/user/ykzhang/data_process
eval "$(conda shell.bash hook)"
conda activate tf2py37

python $d/generate_post_train_dna_seq/2_code_seq.py $d/data/post_train/SNEDE0000EMT_pos

max_len=257
batch_num=1024
rm -rf $d/data/post_train/input$max_len
mkdir -p $d/data/post_train/input$max_len

python $d/generate_post_train_dna_seq/3_split_seq.py $max_len $batch_num
python $d/generate_post_train_dna_seq/merge_input.py $max_len
