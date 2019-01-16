#! /usr/bin/env bash
# Program provides a directory report.

if [ $# != 1 ]
then
	echo 'Usage: Enter directory path as argument.'
	exit
fi

fil=`ls -la $1 | grep '^-' | wc -l`
dir=`ls -la $1 | grep '^d' | wc -l`
max=`ls -pSa $1 | grep -v / | head -1`
new=`ls -pta $1 | grep -v / | head -1`
usr=`ls -la $1 | tail -n +2 | sed 's/\s\s*/ /g' | cut -d ' ' -f 3 | sort | uniq | paste -sd "," -`
echo Information about directory $1:
echo - contains $fil files
echo - contains $dir directories
echo - $max is the largest file
echo - $new is the most recently modified file
echo - active users in this directory are $usr
