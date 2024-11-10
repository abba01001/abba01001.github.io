@echo off

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
git push origin main

echo Files have been moved (if public folder existed), public folder has been deleted (if it existed), and changes have been pushed to GitHub.
pause
