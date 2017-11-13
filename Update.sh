#!/bin/sh -x
#
# ZFT Lab.  2017.10.16  v.0.2.1
#

PAGES="./content"



clear

(echo ""
echo "h3. Survey"
echo ""
echo "---"
echo ""
echo "h4. Список страниц (+ черновики)"
echo ""

for post in \
  `ls ${PAGES}/20*.textile | sort -r | tr '/.' ' ' | awk '{print $2}'`
    do
      #
      head=`awk -F "h3. " '/^h3./ {print $2}' ${PAGES}/${post}.textile`
      #
      #tags=`cat ${PAGES}/${post}.textile | grep -e "^h5. Tags:" | tr -d 'h5.'`
      #
      echo "* ${post} => \"${head} ${tags}\":/${post}"
      #
    done) >./content/survey.textile


git pull && git commit -m "AutoUpdate" -a && git push && git status
