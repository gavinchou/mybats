# sed tmp file
# =
# N
# s/\n/\t/

# reverse lines
# 1!G
# h
# $!d

# tail -2, print last 2 lines
# $!N;$!D

# print the last line
# $!d
# or
# $p

# print last n lines, the number is n+1
# :a
# $q;N;4,$D;ba

# print the line immediately before a regexp, but not the line
# containing the regexp
#打印包含"regexp"那一行的上一行,但是不打印包含"regexp"的行.
# sed -n '/regexp/{g;1!p;};h' 

# grep for AAA or BBB or CCC (emulates "egrep")
#查找"AAA"或"BBB"或"CCC".(任意顺序)
# sed -e '/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d # most seds 
# /AAA\|BBB\|CCC/ip

### revserse words
# no more than 1 word, exit
/\S+\s\S+/! b
s/.*/&\n/
# replace \s \n, embedding newlines between words
s/\s/\n/g
:a
s/\n\n/\n/g
ta
# change the problem reverse words to reverse lines
:b
s/^(\w+)\n([\w\n]*)/\2 \1/
tb
s/\n//g
p
