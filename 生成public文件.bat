@echo off
:: 设置脚本所在目录为当前工作目录
cd /d %~dp0

:: 输出当前路径
echo Current directory: %cd%

:: 在新窗口中执行 hexo clean 命令并关闭窗口
start cmd /c "npx hexo clean"
:: 等待 1 秒钟，确保第一个命令有时间执行
timeout /t 1

:: 在新窗口中执行 hexo generate 命令并关闭窗口
start cmd /c "npx hexo g"
:: 等待 2 秒钟，确保第二个命令有时间执行
timeout /t 2

:: 等待 8 秒钟并倒计时
echo Waiting for 8 seconds...
for /L %%i in (8,-1,1) do (
    echo %%i...
    timeout /t 1 >nul
)

:: 确保 public 文件夹存在并执行上传脚本
echo Checking if 'public\上传博客文件.bat' exists...
if exist "public\上传博客文件.bat" (
    echo File exists! Executing upload script...
    start cmd /k "public\上传博客文件.bat"
) else (
    echo Error: 'public\上传博客文件.bat' not found!
)

:: 等待用户查看输出
pause
