#!/bin/bash
#http://www.cnblogs.com/shines77/p/3460274.html
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch .packages' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch build/*' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch android/local.properties' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch android/.gradle/*' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch ios/Flutter/flutter_assets/*' --prune-empty --tag-name-filter cat -- --all
#git push origin master --force --all
# $ rm -rf .git/refs/original/

# $ git reflog expire --expire=now --all

# $ git gc --prune=now

# Counting objects: 2437, done.
# # Delta compression using up to 4 threads.
# # Compressing objects: 100% (1378/1378), done.
# # Writing objects: 100% (2437/2437), done.
# # Total 2437 (delta 1461), reused 1802 (delta 1048)

# $ git gc --aggressive --prune=now