@echo off
REM 切换到 main 分支
git checkout main

REM 检查是否有 stash，如果有则恢复
git stash list
IF %ERRORLEVEL% EQU 0 (
    echo Recovering from stash...
    git stash pop
) ELSE (
    echo No stash found.
)

REM 移动 public 文件夹下的所有文件到 public 同级目录下，并保持原有层级
echo Moving files from public folder to root...
for /R public %%f in (*) do (
    set "file=%%f"
    set "newDir=%%~dpf"
    set "newDir=!newDir:public=!"

    REM 创建新的目标目录（如果不存在）
    if not exist "!newDir!" mkdir "!newDir!"

    REM 移动文件
    move "%%f" "!newDir!%%~nxf"
)

REM 检查是否有未提交的改动
git diff --quiet
IF %ERRORLEVEL% EQU 1 (
    echo Changes detected. Committing...
    git add .
    git commit -m "Moved files from 'public' folder to root"
    REM 推送到远程 main 分支
    git push origin main
) ELSE (
    echo No changes to commit.
)

echo Done!
pause
