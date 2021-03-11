#!/bin/bash

#SBATCH --gres=gpu:k40:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16GB
#SBATCH --time=00:30:00
#SBATCH --account=<account_id>
module load gcc/8.3.0
module load cuda/11

#Activate Conda environment from my miniconda
source /home1/asreeram/miniconda3/etc/profile.d/conda.sh
conda activate wav2vec


stage=1


if [ $stage -eq 1 ]; then

# Main python Commant to run the pretraining

python3 pretrain.py --fairseq_path /project/shrikann_35/anirudhs/Materials/self-supervised-speech-recognition/fairseq --audio_path /project/shrikann_35/anirudhs/Materials/self-supervised-speech-recognition/examples/unlabel_audio  --init_model /project/shrikann_35/anirudhs/Materials/self-supervised-speech-recognition/wav2vec_small.pt

fi
