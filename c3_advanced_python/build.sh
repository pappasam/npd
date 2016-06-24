#!/bin/bash
TPL=$1
CRS=`dirname $TPL`
CRS=${CRS#slides/}
SES=`basename $TPL`
SES=${SES%.tpl}
IFS=$'\n'
SUBS=($(grep -e '```python ((.*))' $TPL))
RESS=($(grep -e '```python <<.*>>' $TPL))
IFS=""
declare -A SUBCNT
declare -A SUBRES
for i in ${SUBS[@]}; do
  SRCF=${i#*python ((}
  SRCF=${SRCF%))}
  SUBCNT[${i/ *\`/\`\`\`}]=$(cat "python/$CRS/$SES/$SRCF" | sed -e 's/\\n/\\\\n/g' | sed -e ':a;N;$!ba;s/\n/\\n/g')
done

for k in ${RESS[@]}; do
  SRES=${k#*python <<}
  SRES=${SRES%>>}
  SUBRES[${k/ *\`/\`\`\`}]=$(python "python/$CRS/$SES/$SRES" 2>&1 | sed -e 's/\//\\\//g' | sed -e ':a;N;$!ba;s/\n/\\n>>> /g')
done

MDCNT=`cat $TPL`
for j in ${!SUBCNT[@]}; do
  MDCNT=$(sed -e "s/$j/\`\`\`python\n${SUBCNT[$j]}/" <<< "$MDCNT")
done

for l in ${!SUBRES[@]}; do
  MDCNT=$(sed -e "s/$l/\`\`\`python\n>>> ${SUBRES[$l]}/" <<< "$MDCNT")
done

echo $MDCNT > "${TPL%.tpl}.md"
