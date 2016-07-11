# !/usr/bin/bash 

# Filters the current branch, removing all currently .gitignored files.


GITIGNORE=`sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g' .gitignore`
COMMANDSTRING="git rm -r --cached --ignore-unmatch ${GITIGNORE}"
INITIALCOMMIT=`git rev-list --max-parents=0 HEAD`

echo "Warning, Cowboy: Irreversible Git Action. Type 'yeehaw' to continue: "
read yeehaw

echo $yeehaw

[[ "$yeehaw" == "yeehaw" ]] && 
	git filter-branch -f --tag-name-filter cat --index-filter "$COMMANDSTRING"  $INITIALCOMMIT..HEAD && rm -rf .git/refs/original/ && git reflog expire --expire=now --all && git gc --prune=now && git gc --aggressive --prune=now || echo "Filter cancelled."
