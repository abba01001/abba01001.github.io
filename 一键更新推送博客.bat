@echo off
:: 设置脚本所在目录为当前工作目录
cd /d %~dp0

:: 设置命令行编码为 UTF-8，避免中文乱码
chcp 65001

:: 输出当前路径
echo 当前工作目录: %cd%

:: 在新窗口中执行 hexo clean 命令并关闭窗口
echo 执行 hexo clean 清理命令...
start cmd /c "hexo clean"
:: 等待 3 秒钟，确保第一个命令有时间执行
timeout /t 3

:: 在新窗口中执行 hexo generate 生成命令并关闭窗口
echo 执行 hexo generate 生成命令...
start cmd /c "hexo g"
:: 等待 3 秒钟，确保第二个命令有时间执行
timeout /t 3

:: 切换到 main 分支（不使用新窗口）
echo 切换到 main 分支...
:: 先检查工作区是否干净，如果有更改则暂存
git diff --quiet || git stash

:: 切换到 main 分支
git checkout main
:: 等待 5 秒钟，确保切换分支命令有时间执行
timeout /t 5

:: 循环检测当前分支是否切换成功
echo 检查当前分支是否为 main...
:check_branch
:: 获取当前分支名
for /f "delims=" %%I in ('git rev-parse --abbrev-ref HEAD') do set current_branch=%%I

:: 如果当前分支是 main，则跳出循环
if "%current_branch%"=="main" (
    echo 已成功切换到 main 分支。
    goto :continue
)

:: 如果当前分支不是 main，则等待 1 秒钟后重试
timeout /t 1
goto :check_branch

:continue
:: 检查 public 文件夹是否存在
if exist public (
    :: 如果 public 文件夹存在，移动其中的所有文件到当前目录
    echo 移动 public 文件夹中的文件到当前目录...
    xcopy /E /H /Y public\* .\

    :: 删除 public 文件夹
    echo 删除 public 文件夹...
    rd /S /Q public
) else (
    echo 没有找到 public 文件夹，跳过文件移动和删除操作。
)

:: 获取当前时间戳
echo 获取当前时间戳...
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set timestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%

:: 提交并推送更改到 Git
echo 添加更改到 Git...
git add .

:: 提交更改，使用当前时间戳作为提交信息
echo 提交更改，使用时间戳作为提交信息...
git commit -m "%timestamp% - 更新博客"

:: 推送到远程仓库的 main 分支
echo 推送更改到 GitHub...
git push origin main

echo 文件已被移动（如果 public 文件夹存在），public 文件夹已被删除（如果它存在），并且更改已推送到 GitHub。
pause
