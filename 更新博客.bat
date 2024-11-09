@echo off
:: 添加所有更改
git add .

:: 提交更改
git commit -m "Automated commit"

:: 推送所有分支的更改到远程仓库
git push --all

:: 打印成功消息
echo Push completed successfully!
pause
