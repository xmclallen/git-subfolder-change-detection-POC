# HEAD@{1} -1 should give us the the HEAD that was before the most recent action
# In this case, that should be before we merged / did a PR
PREVIOUS_HEAD=`git rev-parse --short HEAD@{1} -1`

# Now use that prior HEAD to determine what files have been changed
FILE_LIST=`git diff --name-only $COMMIT_ID`

# Simplify that list to just the folders
AFFECTED_FOLDERS= `echo $FILE_LIST | awk -F'/' 'NF!=1{print $1}' | sort -u`

echo $AFFECTED_FOLDERS