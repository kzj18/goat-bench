#!/bin/bash
set -x
conda activate goat

ShellScriptFolder=$(cd $(dirname "$0"); pwd)
WorkspaceFolder=$(cd $ShellScriptFolder/../..; pwd)
echo $WorkspaceFolder

cd $WorkspaceFolder

python -um goat_bench.run \
    --run-type eval \
    --exp-config \
    config/experiments/ver_goat_monolithic.yaml \
    habitat_baselines.test_episode_count=1 \
    habitat_baselines.num_environments=1 \
    habitat_baselines.num_checkpoints=1 \
    habitat_baselines.trainer_name=goat_ppo \
    habitat_baselines.video_dir=$WorkspaceFolder/tb/goat/sense_act_nn_monolithic/val_seen/videos \
    habitat_baselines.tensorboard_dir=$WorkspaceFolder/tb/goat/sense_act_nn_monolithic/val_seen/ \
    habitat_baselines.eval_ckpt_path_dir=$WorkspaceFolder/data/goat-assets/checkpoints/sense_act_nn_monolithic/ \
    habitat.dataset.data_path=$WorkspaceFolder/data/datasets/goat_bench/hm3d/v1/val_seen/val_seen.json.gz \
    habitat_baselines.load_resume_state_config=False \
    habitat_baselines.eval.use_ckpt_config=False \
    habitat_baselines.eval.split=val_seen \
    habitat_baselines.eval.video_option=[\"disk\"] \
    habitat.task.lab_sensors.goat_goal_sensor.image_cache=$WorkspaceFolder/data/goat-assets/goal_cache/iin/val_seen_embeddings/ \
    habitat.task.lab_sensors.goat_goal_sensor.language_cache=$WorkspaceFolder/data/goat-assets/goal_cache/language_nav/val_seen_instruction_clip_embeddings.pkl