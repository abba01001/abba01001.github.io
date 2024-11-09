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

    :: 检查当前分支是否有未提交的更改，若有则 stash 当前更改
    echo Checking for uncommitted changes in branch: %%b
    git diff --quiet
    if %errorlevel% neq 0 (
        echo Stashing changes in branch %%b...
        git stash save "Stashed changes before commit on %%b"
    ) else (
        echo No changes to stash in branch %%b.
    )

    :: 检查是否有待提交的更改
    echo Adding changes to branch: %%b
    git add .
    if %errorlevel% neq 0 (
        echo Failed to add changes to %%b. Skipping commit...
        continue
    )

    echo Committing changes to branch: %%b
    git commit -m "Auto commit for %%b"
    if %errorlevel% neq 0 (
        echo No changes to commit on %%b. Skipping push...
        continue
    )

    echo Pushing changes to remote: %%b
    git push origin %%b
    if %errorlevel% neq 0 (
        echo Failed to push changes to %%b. Skipping...
        continue
    )

    :: 恢复之前的 stash（如果有的话）
    echo Checking if there are stashed changes to apply...
    git stash list
    if %errorlevel% neq 0 (
        echo No stashed changes for %%b.
    ) else (
        echo Restoring stashed changes to %%b...
        git stash pop
    )

    echo Finished pushing changes to %%b
)

echo All branches processed successfully!
pause
