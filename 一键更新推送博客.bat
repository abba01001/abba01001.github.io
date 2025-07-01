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
