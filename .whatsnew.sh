#!/bin/bash
if [ -z "$(find -type f -mtime 0 -regex ".*\.\(mkv\|mp4\|avi\)" -exec ls -t {} \; )" ]; then
echo
else
echo -en '\n'>> .WHATSNEW.TXT
date '+%e-%m-%Y' >> .WHATSNEW.TXT
find -type f -mtime 0 -regex ".*\.\(mkv\|mp4\|avi\)" -printf '%f\n'  >> .WHATSNEW.TXT
iconv -c -f utf-8 -t ISO-8859-1 .WHATSNEW.TXT -o .WHATSNEW-conv.TXT
enscript .WHATSNEW-conv.TXT --header='Les Nouveautés !' -o - | ps2pdf - WHATSNEW.PDF
rm .WHATSNEW-conv.TXT

fi

