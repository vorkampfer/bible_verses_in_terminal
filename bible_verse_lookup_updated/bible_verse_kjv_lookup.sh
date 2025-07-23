#!/usr/bin/env bash

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
cyanColour="\e[0;36m\033[1m"
whiteColour="\e[0;37m\033[1m"

# Global Variables
dTime=$(timedatectl | grep -i universal | awk '{print $4,$5,$6}' FS=" ")
echo -e "${grayColour}Today's date: $dTime ${endColour}"


function ctrl_c(){
    echo -e "\n\n${redColour}[!] Exiting bible search script...${endColour}\n"
    exit 1
}

# Ctrl+C
trap ctrl_c SIGINT

if [ -z "$1" ]; then
    #/usr/bin/python2.7 /$HOME/python_projects/secRoot_banner.py
    echo -e "${yellowColour}Usage: ./bible_verse_kjv_lookup.sh <word or chapter to lookup> <argument>  ${endColour}"
	echo -e "${blueColour}-v,-vv,-vvv, --verbose (verbose), -vvvv,-vvvvvv, --very-verbose (very verbose), --no-verbose, -no, -wo, -nv, -n, --words-only (Remove verbosity)${endColour}"
	echo -e "${blueColour}-chapter, --chapter, -verse, --verse (only show the chapter & verse the word is in, no text) ${endColour}"
	echo -e "${yellowColour}Remove verbosity. Example: ${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh 'Jesus cried' --words-only${endColour}"
	echo -e "${yellowColour}View Table of Contents. Example: ${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh tableofcontents or ./bible_verse_kjv_lookup.sh --table ${endColour}"
	echo -e "${yellowColour}An optional way to search is by chapter and verse like this:${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh 119:135 --verbose${endColour}"
	echo -e "${yellowColour}Usage: You can search by chapter only like this:${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh 119 --verbose | grep -i 'word\ to\ look\ up' ${endColour}"
	echo -e "${yellowColour}Usage: If you are looking for multiple words and do not know the chapter just surround the words in single quotes:${endColour}${purpleColour}./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh'${endColour}"
	echo -e "${yellowColour}(--line-number,-ln,--line,-line) Usage: A more accurate and quicker way to narrow your search is to find the line number.:${endColour}${purpleColour}EXAMPLE: ./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh' --line-number${endColour}"
	echo -e "${yellowColour}(--count-words,--count,-count,-c,-cw,--words) Usage: If you just want to see how many times the word or words occur in the text.${endColour}${purpleColour}./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh' -count${endColour}"
	echo -e "${yellowColour}Usage: you can search by entire page number by typing the page followed by the argument --page, -page, --page-number:${endColour} ${purpleColour}Example: ./bible_verse_kjv_lookup.sh 119 --page | grep -i 'favour', Example2 ./bible_verse_kjv_lookup.sh '592' --page | grep -i 'glory to god'${endColour}"
	echo -e "${yellowColour}Usage: If you want the page number instead of the whole page, but can only remember the word or words try the argument --page-number, -pn, --pn, -number:${endColour} ${purpleColour}Example: ./bible_verse_kjv_lookup.sh 'sat like unto the Son of man' --page-number${endColour}"
	echo -e "${yellowColour}Usage: (--range|-r|-range) After finding what line your search is on you can look through a range of line numbers:${endColour} ${purpleColour}Example: ./bible_verse_kjv_lookup.sh -r 49001 49050${endColour}"
	# bible_verse_kjv_lookup.sh "Page 717" --very-verbose | grep "13:18" -A10 -B2
	echo -e "${yellowColour}Usage: Here is an example command if someone just gives you a chapter and verse to look up.  ${endColour} ${purpleColour}Example: [./bible_verse_kjv_lookup.sh "{13:18}" --page-number] then lookup the page number with [./bible_verse_kjv_lookup.sh \"Page 717\" --very-verbose | grep \"13:18\" -A10 -B2] and you can grep the verse again.${endColour}"
    exit 1
fi



if [[ $1 == @(-h|--help) ]]; then 
	#
	#
    echo -e "${yellowColour}Usage: ./bible_verse_kjv_lookup.sh <word or chapter to lookup> <argument>  ${endColour}"
	echo -e "${blueColour}-v,-vv,-vvv, --verbose (verbose), -vvvv,-vvvvvv, --very-verbose (very verbose), --no-verbose, -no, -wo, -nv, -n, --words-only (Remove verbosity)${endColour}"
	echo -e "${yellowColour}View Table of Contents. Example: ${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh tableofcontents or ./bible_verse_kjv_lookup.sh --table ${endColour}"
	echo -e "${blueColour}-chapter, --chapter, -verse, --verse (only show the chapter & verse the word is in, no text) ${endColour}"
	echo -e "${yellowColour}Remove verbosity. Example: ${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh 'Jesus cried' --words-only${endColour}"
	echo -e "${yellowColour}An optional way to search is by chapter and verse like this:${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh 119:135 --verbose${endColour}"
	echo -e "${yellowColour}Usage: You can search by chapter only like this:${endColour} ${purpleColour}./bible_verse_kjv_lookup.sh 119 --verbose | grep -i 'word\ to\ look\ up' ${endColour}"
	echo -e "${yellowColour}Usage: If you are looking for multiple words and do not know the chapter just surround the words in single quotes:${endColour}${purpleColour}./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh'${endColour}"
	echo -e "${yellowColour}(--line-number,-ln,--line,-line) Usage: A more accurate and quicker way to narrow your search is to find the line number.:${endColour}${purpleColour}EXAMPLE: ./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh' --line-number${endColour}"
	echo -e "${yellowColour}(--count-words,--count,-count,-c,-cw,--words) Usage: If you just want to see how many times the word or words occur in the text.${endColour}${purpleColour}./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh' -count${endColour}"
	echo -e "${yellowColour}Usage: You can search by entire page by typing the page followed by the argument --page, -page:${endColour} ${purpleColour}Example1: ./bible_verse_kjv_lookup.sh 119 --page | grep -i 'favour', Example2 ./bible_verse_kjv_lookup.sh '592' --page | grep -i 'glory to god'${endColour}"
	echo -e "${yellowColour}Usage: If you want the page number instead of the whole page, but can only remember the word or words try the argument --page-number, -pn, --pn, -number:${endColour} ${purpleColour}Example: ./bible_verse_kjv_lookup.sh 'sat like unto the Son of man' --page-number${endColour}"
	echo -e "${yellowColour}Usage: (--range|-r|-range) After finding what line your search is on you can look through a range of line numbers:${endColour} ${purpleColour}Example: ./bible_verse_kjv_lookup.sh -r 49001 49050${endColour}"
	echo -e "${yellowColour}Usage: Here is an example command if someone just gives you a chapter and verse to look up.  ${endColour} ${purpleColour}Example: [./bible_verse_kjv_lookup.sh "{13:18}" --page-number] then lookup the page number with [./bible_verse_kjv_lookup.sh \"Page 717\" --very-verbose | grep \"13:18\" -A10 -B2] and you can grep the verse again.${endColour}"
	exit 1
fi
echo
if [[ $1 == @(tableofcontents|--table) ]]; then 
	echo -e "${yellowColour}Table of Contents${endColour}"
	cat $HOME/Downloads/bible_project/output_1_line_while_loop.txt | grep -i 'Table of Contents' -A38 | sed -n -e '/10:/,/48:/ p'
# elif ! [[ $1 =~ '^[A-Z][a-z]+$' ]]; then 
# 	echo "nested"
# 	cat $HOME/Downloads/bible_project/akjv.txt | grep -i -A150 -B2 --color=always $1 2>/dev/null | grep "Page ${1}" -A150 -B4 2>/dev/null 
# 	wait
# 	sleep 1
# 	echo "nested"
elif [[ -n "$1" && "$2" == @() ]]; then
		cat $HOME/Downloads/bible_project/akjv.txt | grep -i --color=always -A5 -B2 "${1}" 2>/dev/null
elif [[ -n "$1" && "$2" == @(--page|-page) ]]; then 
	cat $HOME/Downloads/bible_project/akjv.txt | grep --color=always "Page\ \b${1}\b" -A73 -B2 2>/dev/null
elif [[ -n "$1" && "$2" == @(--page-number|-pn|--pn|-number) ]]; then 
	cat $HOME/Downloads/bible_project/akjv.txt | grep -i -A75 -B75 --color=always "${1}" | grep 'Page\ [0-9]'
elif [[ -n "$1" && "$2" == @(--no-verbose|-no|-wo|-nv|-n|--words-only) ]]; then 
	cat $HOME/Downloads/bible_project/akjv.txt | grep -i --color=always "${1}" 
elif [[ -n "$1" && "$2" == @(--verbose|-vvv|-vv|-v) ]]; then 
	cat $HOME/Downloads/bible_project/akjv.txt | grep -i -A20 -B10 --color=always "${1}" 
elif [[ -n "$1" && "$2" == @(--very-verbose|-vvvv|-vvvvv|-vvvvvv) ]]; then 
	cat $HOME/Downloads/bible_project/akjv.txt | grep -i -A60 -B40 --color=always "${1}" 
elif [[ -n "$1" && "$2" == @(--chapter|-chapter|--verse|-verse) ]]; then 
	echo -e "${yellowColour}Only showing the chapter number and verse, ${endColour} ${purpleColour}no text.${endColour}"
	echo
	wait
	cat $HOME/Downloads/bible_project/akjv.txt | grep -i $1 -A2 -B2 2>/dev/null | grep -oP "\{.*?\}" | sort -u
	#grep -oP '\[.*?\]'  | grep "\{.*?\}" | sort -u
elif [[ -n "$1" && "$2" == @(--line-number|-ln|--line|-line) ]]; then 
	cat $HOME/Downloads/bible_project/akjv.txt | grep -in --color=always "$1"
	#grep -in "${1}" $HOME/Downloads/bible_project/akjv.txt
	# grep -n "^love$" /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt
elif [[ -n "$1" && "$2" == @(--count-words|--count|-count|-c|-cw|--words|-w) ]]; then 
	#grep -o "${1}" $HOME/Downloads/bible_project/akjv.txt | wc -l
	cat $HOME/Downloads/bible_project/akjv.txt | grep -i "$1" | wc -l 
	wait
	# bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh' -count
elif [[ -n "$1" && "$1" == @(--range|-r|-range) ]]; then 
	cat $HOME/Downloads/bible_project/output_1_line_while_loop.txt | sed -n -e "/$2:/,/$3:/ p"
	# bible_verse_kjv_lookup.sh -r 49001 49050
else
    echo -e "${redColour}==>[!] Sorry:${endColour} ${yellowColour}That command was not found please try again, or type '--help' for more information.${endColour}"
fi 

