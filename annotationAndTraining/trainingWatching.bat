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

REM call tensorboard 
tensorboard --logdir=./model/%modelFolder%/