#!/bin/bash
#
#  [ 3/6/2009 ]       Bash Crawler       Scubidus[at]darckoncepts.org
#
#  Parse all Passwords and  Usernames from cirt.net and put them into a file
# with the following  format.   :product:user:pass:
#
#
url='http://www.cirt.net/passwords'
output='pass.lst'
cfile='.cookies.txt'
buffer='.buffer.txt'
pbuf='.parseBuffer.txt'
#</code>
 
declare  vflag=0
 
function error {
echo "Failed To Parse Data, No  Content Was found."
}
 
trap "rm -f ${cfile} ${buffer} ${pbuf};  exit" 0 1
trap "echo ' Ctrl+C Detected, output deprecated.'; exit" 2 3
 
while  getopts ":av:" flag; do
case $flag in
a) echo '[+]  Default Router Password Parser, Coded By Scubidus[at]darckoncepts.org'  '&amp;&amp;' exit;;
*) vflag=1;;
#?) echo 'Usage: No  Parameters Are Needed; -a for an about, -v for verbose';;
esac
done
 
echo  -n &gt; "${buffer}"; echo -n &gt; "${output}"
 
wget -q -O -  ${url} --referer="${url}" --keep-session-cookies  --save-cookies="${cfile}" &gt; "${buffer}"
 
spos=`cat "${buffer}" |  grep -n "table width" | awk -F: '{ print $1 }'`
epos=`cat  "${buffer}" | grep -n "/table&gt;" | awk -F: '{ print $1 }'`
lineCount=$(($epos-$spos))
 
cat  ${buffer} | head -$((${epos})) | tail -$((${lineCount}-1)) &gt;  ${buffer}
 
count=1
for each in `grep vendor "${buffer}" | cut  -f 2 -d ? | cut -f 1 -d '"' | sed s/\ /+/g`; do
url_buf="${url}?${each}"
 
if [ $vflag -eq 1 ]; then
echo ${count}  ${url_buf}
fi
 
let count=$((${count}+1))
wget -q -O - ${url_buf} --referer="${url}" --load-cookies="${cfile}"  --keep-session-cookies --save-cookies="${cfile}" &gt; "${buffer}"
 
epos=`grep -n '&lt;div id="block-block-7"&gt;' "${buffer}" | awk -F: '{ print $1 }'`
spos=`grep  -n '&gt;1. &amp;nbsp;' "${buffer}" | awk -F: '{print $1}'`
 
head -$epos "${buffer}" | tail -$(($epos-$spos)) &gt; "${buffer}" ||  error
vals=`cat "${buffer}" | grep -n "&lt;/table&gt;" | awk -F:  '{print $1}'`
 
lastVal=0
for i in $vals; do
if [  ${lastVal} -eq 0 ]; then
head -$i ${buffer} &gt; "${pbuf}"
 
echo -n ":`grep 'Product' ${pbuf} | cut -f 2 -d % | cut -f 2 -d  \&gt; | cut -f 1 -d \&lt;`" &gt;&gt; ${output}
echo -n  ":`grep 'User ID' ${pbuf} | cut -f 2 -d % | cut -f 2 -d \&gt; | cut -f 1  -d \&lt;`" &gt;&gt; ${output}
echo ":`grep 'Password'  ${pbuf} | cut -f 2 -d % | cut -f 2 -d \&gt; | cut -f 1 -d \&lt;`:"  &gt;&gt; ${output}
 
lastVal=$i
else
head -$i ${buffer} | tail -$(($i-$lastVal)) &gt; "${pbuf}"
 
echo -n ":`grep 'Product' ${pbuf} | cut -f 2 -d % | cut -f 2 -d  \&gt; | cut -f 1 -d \&lt;`" &gt;&gt; ${output}
echo -n  ":`grep 'User ID' ${pbuf} | cut -f 2 -d % | cut -f 2 -d \&gt; | cut -f 1  -d \&lt;`" &gt;&gt; ${output}
echo ":`grep 'Password'  ${pbuf} | cut -f 2 -d % | cut -f 2 -d \&gt; | cut -f 1 -d \&lt;`"  &gt;&gt; ${output}
 
lastVal=$i
fi
done
done
