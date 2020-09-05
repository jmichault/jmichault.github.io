#!/usr/bin/env sh
#################################################################
# skripto por aŭtomate traduki frazojn sen traduko en po-dosieron
#################################################################

src=eo

FIC=$1
BASEDIR=`dirname $0`
dst=`grep "^\"Language: .*\\n\"$" $FIC|sed "s/^\"Language: //;s/.n\"$//"`

#echo "cat $FIC|awk -v BASEDIR=$BASEDIR -v src=$src -v dst=$dst -f $BASEDIR/traduki_po.awk >$FIC.$$"
cat $FIC|awk -v BASEDIR=$BASEDIR -v src=$src -v dst=$dst -f $BASEDIR/traduki_po.awk >$FIC.$$
mv $FIC $FIC.old
mv $FIC.$$ $FIC