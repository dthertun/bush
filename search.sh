#!/bin/bash

url="http://www.google.com.mm/search?hl=en-SG&source=hp&q="
while read query
do
	content=$(curl "{$url}${query}")
	echo $query
	echo $content >> output.txt
done < query.txt
