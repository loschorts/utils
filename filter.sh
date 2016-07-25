# !/usr/bin/bash 

# Filters the current branch, removing all currently .gitignored files.

echo "Hold up, cowboy: This is irreversible. Type 'yeehaw' to continue: "
read yeehaw

if [[ "$yeehaw" == "yeehaw" ]]; then

	TO_DELETE="*/node_modules *.zip"
	COMMANDSTRING="git rm -r --cached --ignore-unmatch ${TO_DELETE}"
	INITIALCOMMIT=`git rev-list --max-parents=0 HEAD`

	git filter-branch -f --tag-name-filter cat --index-filter "$COMMANDSTRING"  $INITIALCOMMIT..HEAD && rm -rf .git/refs/original/ && git reflog expire --expire=now --all && git gc --prune=now && git gc --aggressive --prune=now 
else 
	echo "Filter cancelled."
fi
