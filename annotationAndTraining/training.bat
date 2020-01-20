@echo off

REM set selectFolder
for /f "tokens=1,2" %%i in (setting.txt) do (
  set targetFolder=%%i
  set modelFolder=%%j
)

echo Target Folder : %targetFolder%
echo Model Folder  : %modelFolder%

REM move to targetFolder
cd ./%targetFolder%

REM activate anaconda env
call conda activate objectDetection

REM call model_main.py
python.exe ../../models/research/object_detection/model_main.py ^
--pipeline_config_path="./ssd_mobilenet_v1_coco.config" ^
--model_dir="./model/%modelFolder%" --num_train_steps=10000 --alsologtostderr 

pause