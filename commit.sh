#!/bin/bash
echo "step1"
git pull origin master
echo "step2"
git add ./
echo "step3"
git commit -m 'xxxx'
echo "step4"
git push -u origin master
echo "end"