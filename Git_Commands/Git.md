# Git Commands

## Git Init:

		git init

## Git Add:

		git add .
		git add filename


## Git Status:


		git status


## Git ls:


		git ls-files


## Git Commit:


		git commit -m "MSG"
		git commit -m -a "MSG"



## Git Diff:

		git diff
		git diff master test
		git diff <source_commit_id> <destination_commit_id>

## Git Remove:

		git rm --cached
		git rm --cached file4.txt   ####  Remove Files Only from staging Area 

		git rm
		git rm file1.txt
		git rm -r .
		It will remove all file
 
 
## Git Merge:

		git merge
		git merge --squash feature
		git rebase master

		git checkout master
		git merge feature


## Git Rebase:


		git rebasae


## Git Stash:


		Stash for tracked files:

		git stash  

		Stash for Untracked files:

		git stash -a 

		git stash pop



## Git Remote Repo:

		git remote
		git push
		git clone
		git pull 
		git fetch


		git reset
		git reset file1.txt


## Git Log:


		git log
		git log --oneline
		git log file1.txt
		git log --since="5 minutes ago"
		git log --since="2020-05-17"
		git log --until="5 minutes ago"
		git log --before="2020-05-17"
		git log --author=Ravi
		git log --author=Ravi --oneline
		git log --oneline --graph





## Git Config:


		git config --global user.email "mridul.singh83@gmail.com"
		git config --global user.name "mridulsingh8390"
		git config --global --list



## Git Tag:


		git tag V-1.0.0
		git tag --list
		git tag --delete V-1.0.0
		git show V-1.0.0

.gitignore





$ git checkout master
$ git cherry-pick -n commitid1
$ git cherry-pick -n commitid2
$ git cherry-pick -n commitid3
$ git add .;git commit -m 'single commit for multiple cherry-pick options'
