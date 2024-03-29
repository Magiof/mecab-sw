#! /bin/bash


URL_MECAB=https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz
URL_MECAB_DIC=https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.1-20150920.tar.gz
DIR_MECAB=mecab-0.996-ko-0.9.2
DIR_MECAB_DIC=mecab-ko-dic-2.0.1-20150920

CURRENT=`pwd`
cd `dirname $0`/../
PROJECT_HOME=`pwd`
BUILD_PATH=$PROJECT_HOME/tmp

mkdir -p $BUILD_PATH

# install mecab
cd $BUILD_PATH
curl -OL $URL_MECAB
tar xfz $DIR_MECAB.tar.gz
cd $DIR_MECAB
./configure --prefix=$PROJECT_HOME/mecab
make
make install

# install mecab-dic
cd $BUILD_PATH
curl -OL $URL_MECAB_DIC
tar xfz $DIR_MECAB_DIC.tar.gz
cd $DIR_MECAB_DIC
export PATH=$PROJECT_HOME/mecab/bin:$PATH
./autogen.sh
./configure --prefix=$PROJECT_HOME/mecab
make
make install

# clean up
rm -rf $BUILD_PATH
cd $CURRENT