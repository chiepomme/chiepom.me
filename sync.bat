call chienote sync
call chienote convert
call git add -A
call git commit --amend -C HEAD
call git push origin master -f