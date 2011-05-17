#!/bin/sh

mkdir $1
cd $1
git init
git submodule add git://github.com/kohana/core.git system
git submodule add git://github.com/kohana/database.git modules/database
git submodule init
git commit -m 'Added initial submodules'
mkdir -p application/classes/{controller,model}
mkdir -p application/{config,views}
mkdir -m 0777 -p application/{cache,logs}
echo '[^.]*' > application/{logs,cache}/.gitignore
wget https://github.com/kohana/kohana/raw/3.1/master/index.php
wget https://github.com/kohana/kohana/raw/3.1/master/application/bootstrap.php -O application/bootstrap.php
git add application
git commit -m 'Added initial directory structure'

