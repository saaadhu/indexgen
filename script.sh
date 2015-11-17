#! /bin/bash
files_and_pages=$(~/scripts/totalpages.sh | python ~/scripts/starting_page.py)
declare -A page_numbers
for fil_and_p in $files_and_pages
do
  fil=$(echo $fil_and_p | cut -d':' -f1)
  page=$(echo $fil_and_p | cut -d':' -f2)
  page_numbers[$fil]=$page
done
while read w 
do
   echo -n "$w "
   matches="$(pdfgrep "$w" *.pdf -i -np --color never)"
   pages=""
   for match in $matches
   do
     f=$(echo $match | cut -d':' -f1)
     page=$(echo $match | cut -d':' -f2)
     start_page=${page_numbers[$f]}
     page=$(($page + $start_page))
     pages="$pages$page "
   done

   bar=$(echo $pages | python /home/saaadhu/scripts/hyphenate.py)
   echo $bar
done < index
