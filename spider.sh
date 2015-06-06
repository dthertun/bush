#! /bin/bash
 
for i in {1..10}
do
     # if TODO list is not empty then do the following
       if [ -s spider-to-do.txt ]
       then
 
          # get first LCCN from TODO list and store a copy
          lccn=$(head -n1 spider-to-do.txt)
 
          echo "Processing $i, $lccn"
 
          # remove LCCN from TODO list
          sed -i '1d' spider-to-do.txt
 
          # append LCCN to DONE list
          echo $lccn >> spider-done.txt
 
          # retrieve XML page for LCCN and save a local copy
          wget "http://www.worldcat.org/identities/"${lccn}"/identity.xml" -O ${lccn}.xml
 
          # get personal name for LCCN
          currname=$(xmlstarlet sel -T -t -m "/Identity/nameInfo" -o "\"" -v "rawName/suba" -o "\"" -n ${lccn}.xml | tr -d ' ')
 
          echo "Current name $currname"
 
          # pull out LCCNs for associated ids and get personal names
          associd=$(xmlstarlet sel -T -t -m "/Identity/associatedNames/name" -v "normName" -n ${lccn}.xml | grep 'lccn')
 
          echo "Associated LCCNs"
          echo $associd
 
          assocname=$(xmlstarlet sel -T -t -m "/Identity/associatedNames/name" -o "\"" -v "rawName/suba" -o "\"" -n ${lccn}.xml | tr -d ' ')
 
          echo "Associated names"
          echo $assocname
 
          # save links between LCCNs in GRAPH file
          for a in ${assocname[@]}
          do
               echo "  "${currname}" -> "${a}";" >> spider-graph.dot
          done
 
          # if LCCNs for assoc ids not in DONE list, add to TODO list
          for a in ${associd[@]}
          do
               if ! fgrep -q ${a} spider-done.txt
               then
                    echo ${a} >> spider-to-do.txt
               fi
          done
 
          sleep 2
     fi
done
