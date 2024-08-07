#!/bin/sh
### General options
### –- specify queue --
#BSUB -q gpuv100
### -- set the job Name --
#BSUB -J initial_run
### -- ask for number of cores (default: 1) --
#BSUB -n 4
### -- Select the resources: 1 gpu in exclusive process mode --
#BSUB -gpu "num=1:mode=exclusive_process"
### -- set walltime limit: hh:mm --  maximum 24 hours for GPU-queues right now
#BSUB -W 23:59
# request 5GB of system-memory
#BSUB -R "rusage[mem=40GB]"
### -- set the email address --


#BSUB -u jobs.nils@outlook.com
### -- send notification at start --
#BSUB -B
### -- send notification at completion--
#BSUB -N
### -- Specify the output and error file. %J is the job-id --
### -- -o and -e mean append, -oo and -eo mean overwrite --
#BSUB -o /zhome/20/8/175218/job_output/initial_run.out
#BSUB -e /zhome/20/8/175218/job_error/initial_run.err
# -- end of LSF options --


#####MODULES##### - they are all loaded in .bashrc for me
#module swap binutils/2.34
#module swap gcc/8.4.0

#module swap python3/3.8.2 
#module swap openblas/0.3.9 
#module swap cuda/11.8 
#module swap cudnn/v8.6.0.163-prod-cuda-11.X  
#module swap ffmpeg/4.2.2  
#module swap numpy/1.18.2-python-3.8.2-openblas-0.3.9 
#module swap pandas/1.0.3-python-3.8.2 
#module swap scipy/1.4.1-python-3.8.2
#module load matplotlib/3.2.1-python-3.8.2 

##################


####INPUTS#####
run_name="human_init_5_10^6"
store_dir="/work3/s220672/NLP_train/serious_train"
command_script_dir="/zhome/20/8/175218/NLP_train"
max_sequence_num=5000000
save_single_csv=False
extra_model_config="/zhome/20/8/175218/NLP_train/serious_train/model_config_esm_t6.json"
extra_train_config="/zhome/20/8/175218/NLP_train/serious_train/train_config.json"
model_type="esm"
mlm_probability=0.15
max_length=150 # max length of sequences - will be padded to this
###############


script_filename="/zhome/20/8/175218/SeqLP/src/seqlp/__main__.py"

/zhome/20/8/175218/SeqLP/.venv/bin/python3  $script_filename --command_script_dir $command_script_dir --run_name $run_name --store_dir $store_dir --max_sequence_num $max_sequence_num --save_single_csv $save_single_csv --extra_model_config $extra_model_config --extra_train_config $extra_train_config --model_type $model_type --mlm_probability $mlm_probability --max_length $max_length
