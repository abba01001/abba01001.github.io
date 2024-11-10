@echo off
:: 设置脚本所在目录为当前工作目录
cd /d %~dp0

:: 输出当前路径
echo Current directory: %cd%

:: 创建临时脚本文件
echo Generating temporary script...

:: 将当前脚本内容复制到临时文件
(
    echo @echo off
    echo cd /d %cd%
    echo start cmd /c "hexo clean"
    echo timeout /t 1
    echo start cmd /c "hexo g"
    echo timeout /t 2
    echo git checkout main
    echo timeout /t 5
    echo if exist public (
    echo   xcopy /E /H /Y public\* .\
    echo   rd /S /Q public
    echo ) else (
    echo   echo No public folder found. Skipping file move and delete.
    echo )
    echo git add .
    echo git commit -m "Moved files from public folder and deleted the folder."
    echo git push origin main
    echo echo Files have been moved, public folder deleted, and changes pushed to GitHub.
    echo pause
) > "%TEMP%\temp_script.bat"

:: 执行临时脚本文件
echo Executing the temporary script...
start cmd /c "%TEMP%\temp_script.bat"

:: 删除临时脚本文件
echo Deleting temporary script...
del "%TEMP%\temp_script.bat"
