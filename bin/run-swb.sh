#!/bin/sh
set -xe
if [ ! -f DeepSpeech.py ]; then
    echo "Please make sure you run this from DeepSpeech's top level directory."
    exit 1
fi;

checkpoint_dir=$(python -c 'from xdg import BaseDirectory as xdg; print(xdg.save_data_path("deepspeech/swb"))')

python -u DeepSpeech.py \
  --importer LDC97S62 \
  --train_batch_size 48 \
  --dev_batch_size 32 \
  --test_batch_size 32 \
  --epoch 50 \
  --learning_rate 0.0001 \
  --validation_step 10 \
  --display_step 10 \
  --dropout_rate 0.30 \
  --checkpoint_dir "$checkpoint_dir" \
  "$@"
