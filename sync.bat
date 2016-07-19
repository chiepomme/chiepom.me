cd /d %~dp0
chienote sync && chienote convert && git add -A && git commit -m "update" && git push origin master
pause