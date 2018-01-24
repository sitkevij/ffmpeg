#/bin/sh
cat $1 | sed 's/\ \ */\ /g' | sed 's/^ /  /' | sed 's/ *$//'
