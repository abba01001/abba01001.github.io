@echo off

:: 检查当前所有本地分支
for /f "tokens=*" %%i in ('git branch --list') do (

    :: 切换到每个分支
    git checkout %%i

    :: 添加所有更改
    git add .

    :: 提交更改
    git commit -m "Automated commit"

    :: 推送更改到远程仓库
    git push origin %%i

)

:: 提示操作已完成
echo All branches have been pushed successfully!
pause
