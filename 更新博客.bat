@echo off
setlocal enabledelayedexpansion

:: 打印正在执行的命令
echo Starting the process to commit and push all branches...

:: 定义分支列表
set branches=main develop

:: 遍历分支列表
for %%b in (%branches%) do (
    :: 切换到当前分支
    echo Switching to branch: %%b
    git checkout %%b
    if %errorlevel% neq 0 (
        echo Failed to switch to branch %%b. Skipping...
        continue
    )

    :: 检查当前分支是否有更改
    echo Checking for changes in branch: %%b
    git status --porcelain
    if %errorlevel% neq 0 (
        echo Error checking status for %%b. Exiting...
        pause
        exit /b %errorlevel%
    )

    :: 如果有更改，执行提交和推送
    echo Adding changes to branch: %%b
    git add .
    if %errorlevel% neq 0 (
        echo Failed to add changes to %%b. Exiting...
        pause
        exit /b %errorlevel%
    )

    echo Committing changes to branch: %%b
    git commit -m "Auto commit for all branches"
    if %errorlevel% neq 0 (
        echo Failed to commit changes to %%b. Exiting...
        pause
        exit /b %errorlevel%
    )

    echo Pushing changes to remote: %%b
    git push origin %%b
    if %errorlevel% neq 0 (
        echo Failed to push changes to %%b. Exiting...
        pause
        exit /b %errorlevel%
    )

    echo Finished pushing changes to %%b
)

echo All branches processed successfully!
pause
