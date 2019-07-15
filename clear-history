# Clear Git History

## Purpose
Removing old history and adding repo as "new" again. Serves to flatten history into a new "Initial Commit" allowing for changing Commit Message prefixes.

The following steps derived from [https://stackoverflow.com/a/13102849](https://stackoverflow.com/a/13102849)
 
> ```
> git checkout --orphan newBranch
> git add -A  # Add all files and commit them
> git commit
> git branch -D master  # Deletes the master branch
> git branch -m master  # Rename the current branch to master
> git push -f origin master  # Force push master branch to github
> git gc --aggressive --prune=all     # remove the old files
> 
> ```
