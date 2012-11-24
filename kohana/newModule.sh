#!/bin/sh
YEAR=$( date +%Y )
PROJECTNAME=Kohana-$1
CLASSNAME=$1
LICENSE="
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
mkdir $PROJECTNAME
cd $PROJECTNAME
git init
echo "*.~
*.swp

# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
Icon?
ehthumbs.db
Thumbs.db" >> .gitignore
echo "Kohana-$1
===========



How to use
----------



-------


Copyright (C) 2012 Jean-Nicolas Boulay ([http://jean-nicolas.com/](http://jean-nicolas.com/))
$LICENSE" >> README.md
echo "Copyright (C) 2012 Jean-Nicolas Boulay http://jean-nicolas.com/
$LICENSE" >> LICENSE
mkdir classes
cd classes
mkdir kohana
mkdir model
echo "<?php defined('SYSPATH') or die('No direct script access.');

class $1 extends Kohana_$1 {}" >> $1.php
mkdir Source
cd Source
#touch Source/$1.js
echo "/**
 * $1
 *
 * @package     $1
 * @author      Jean-Nicolas Boulay
 * @copyright
*/

var $1 = new Class({});" >> $1.js
cd ..
touch Source/$1-yui-compressed.js
mkdir Docs
touch Docs/$1.md
touch package.yml
echo "name:  $1
author: jnbdz
current:  
category:  
tags:  []
docs:  
demo:  " >> package.yml;
cd $1
#git add *
#git commit -m "First Commit"
git remote add origin git@github.com:jnbdz/$1.git