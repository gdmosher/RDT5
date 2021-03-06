#!/bin/bash
## Script that runs typical workflow when updating site
## Author: Gordon David Mosher
## Last update: July 12, 2016
## a variation of Girke's buildAll.sh

## (1) All changes should be made from gh-pages branch. Note, the script
##     should be run from the root directory of the repo.
#git checkout gh-pages

## (2) Edit existing pages and/or add new ones, usually in ./mydoc
## No automation for this one ... :).

## (3) Build site with changes you made
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}') # assures that no other jekyll process are running
clear
echo "Building Mydoc Designers website..."
jekyll build --config _config.yml
# jekyll serve --config _config.yml
echo "done"
echo "Finished building all the web outputs!!!"
echo "Now the builds are committed and pushed to github."

## (4) Commit edits made in gh-pages branch 
#git add -A :/
#git commit -am "some edits"
#git push -u origin gh-pages

#git add _site
#git commit --amend

git add .
git commit -m "temp for push gh-pages"

git push origin --delete gh-pages
#git subtree push --prefix _site origin gh-pages
git push origin HEAD:gh-pages

git reset HEAD~
echo "Committed/pushed changes to gh-pages branch on GitHub"
echo "Use this script to push up to gh-pages from whatever branch you are on without commiting anything!"
