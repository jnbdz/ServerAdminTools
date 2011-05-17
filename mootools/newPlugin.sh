#!/bin/sh
mkdir $1
cd $1
git init
touch README.md
mkdir Source
touch Source/$1.js
touch Source/$1-yui-compressed.js
mkdir Docs
touch Docs/$1.md
touch package.yml
echo "name:  $1
author:  davidwalsh
current:  
category:  
tags:  []
docs:  
demo:  " >> package.yml;
cd $1
git add *
git commit -m "First Commit"
git remote add origin git@github.com:darkwing/$1.git
