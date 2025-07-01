@echo off 
:: 设置脚本所在目录为当前工作目录
cd /d %~dp0

:: 输出当前路径
echo Current directory: %cd%

:: 在新窗口中执行 hexo clean 命令并关闭窗口
start cmd /c "hexo clean"
:: 等待 1 秒钟，确保第一个命令有时间执行
timeout /t 1

:: 在新窗口中执行 hexo generate 命令并关闭窗口
start cmd /c "hexo g"
:: 等待 2 秒钟，确保第二个命令有时间执行
timeout /t 2

:: 在当前窗口切换到 main 分支（避免中断）
echo Switching to main branch...
git checkout main
:: 等待 5 秒钟，确保切换分支命令有时间执行
timeout /t 3

:: 检查 public 文件夹是否存在
if exist public (
    :: 如果 public 文件夹存在，移动其中的所有文件到当前目录
    echo Moving files from public directory...
    xcopy /E /H /Y public\* .\

    :: 删除 public 文件夹
    echo Deleting the public directory...
    rd /S /Q public
) else (
    echo No public folder found. Skipping file move and delete.
)

:: 提交并推送更改到 Git
echo Adding changes to Git...
git add .

:: 提交更改，使用自定义的提交信息
git commit -m "Moved files from public folder and deleted the folder."

:: 推送到远程仓库的 main 分支
echo Pushing changes to GitHub...
git push origin main

echo Files have been moved (if public folder existed), public folder has been deleted (if it existed), and changes have been pushed to GitHub.
pause