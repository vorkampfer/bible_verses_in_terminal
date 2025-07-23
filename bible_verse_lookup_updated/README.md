## Look up bible verses with this bash script. It has a good help menu. You may need to make adjustments to the bash script. Such as changing directories etc..

## Here is the help menu
$ bible_verse_kjv_lookup.sh --help

Today's date: 2025-07-23 05:16:19 UTC
Usage: ./bible_verse_kjv_lookup.sh word or chapter to lookup> <argument>
-v,-vv,-vvv, --verbose (verbose), -vvvv,-vvvvvv, --very-verbose (very verbose), --no-verbose, -no, -wo, -nv, -n, --words-only (Remove verbosity)
View Table of Contents. Example:  ./bible_verse_kjv_lookup.sh tableofcontents or ./bible_verse_kjv_lookup.sh --table
-chapter, --chapter, -verse, --verse (only show the chapter & verse the word is in, no text)
Remove verbosity. Example:  ./bible_verse_kjv_lookup.sh 'Jesus cried' --words-only
An optional way to search is by chapter and verse like this: ./bible_verse_kjv_lookup.sh 119:135 --verbose
Usage: You can search by chapter only like this: ./bible_verse_kjv_lookup.sh 119 --verbose | grep -i 'word\ to\ look\ up'
Usage: If you are looking for multiple words and do not know the chapter just surround the words in single quotes:./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh'
(--line-number,-ln,--line,-line) Usage: A more accurate and quicker way to narrow your search is to find the line number.:EXAMPLE: ./bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh' --line-number
(--count-words,--count,-count,-c,-cw,--words) Usage: If you just want to see how many times the word or words occur in the text../bible_verse_kjv_lookup.sh 'Jesus christ is come in the flesh' -count
Usage: You can search by entire page by typing the page followed by the argument --page, -page: Example1: ./bible_verse_kjv_lookup.sh 119 --page | grep -i 'favour', Example2 ./bible_verse_kjv_lookup.sh '592' --page | grep -i 'glory to god'
Usage: If you want the page number instead of the whole page, but can only remember the word or words try the argument --page-number, -pn, --pn, -number: Example: ./bible_verse_kjv_lookup.sh 'sat like unto the Son of man' --page-number
Usage: (--range|-r|-range) After finding what line your search is on you can look through a range of line numbers: Example: ./bible_verse_kjv_lookup.sh -r 49001 49050
