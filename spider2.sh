#!/bin/bash # 
# Crawls a domain # Retreives all visible URLs and their page titles 
# Saves to CSV 

# Text color variables 
txtund=$(tput sgr 0 1) 

# Underline 
txtbld=$(tput bold) 

# Bold 
bldred=${txtbld}$(tput setaf 1) 

# red 
bldblu=${txtbld}$(tput setaf 4) 

# blue 
bldgreen=${txtbld}$(tput setaf 2) 

# green 
bldwht=${txtbld}$(tput setaf 7) 

# white 
txtrst=$(tput sgr0) 

# Reset 
info=${bldwht}*${txtrst} 

# Feedback 
pass=${bldblu}*${txtrst}  
warn=${bldred}*${txtrst}  
ques=${bldblu}?${txtrst}  

printf "%s=== Crawling $1 === %s" "$bldgreen" "$txtrst"  

# wget in Spider mode, outputs to wglog file 
# -R switch to ignore specific file types (images, javascript etc.) 

wget --spider -r -l inf -w .25 -nc -nd $1 -R bmp,css,gif,ico,jpg,jpeg,js,mp3,mp4,pdf,png,swf,txt,xml,xls,zip 2>&1 | tee wglog v 

printf " %s========================================== " "$bldgreen"  
printf "%s=== Crawl Finished... ===%s " "$bldgreen" "$txtrst"  
printf "%s=== Begin retreiving page titles... ===%s " "$bldgreen" "$txtrst"  
printf "%s========================================== " "$bldgreen"  
printf "%s** Run tail -f $1.csv for progress%s " "$bldred" "$txtrst"  

# from wglog, grab URLs 
# curl each URL and grep title 
cat wglog | grep '^--' | awk '{print $3}' | sort | uniq | while read url; 
do {
  printf "%s* Retreiving title for: %s$url%s " "$bldgreen" "$txtrst$txtbld" "$txtrst" 
  printf ""${url}","`curl -# ${url} | sed -n -e 's!.*<title>(.*)</title>.*!1!p'`" " >> $1.csv 
  printf " "  
}; 
done  
# clean up log file  

rm wglog  
exit 

#- See more at: http://praxent.com/blog/roll-your-own-spider-bot#sthash.81XZM5nY.dpufdf
