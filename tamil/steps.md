how to build the wordlist
==================


download the dump from wikipedia
------------------


for tamil the 'ta' will be used

[http://dumps.wikimedia.org](http://dumps.wikimedia.org "http://dumps.wikimedia.org")


for tamil wiktionary
[http://dumps.wikimedia.org/tawiktionary/20120902/](http://dumps.wikimedia.org/tawiktionary/20120902/ "http://dumps.wikimedia.org/tawiktionary/20120902/")


download all pages current versions only dump

	wget http://dumps.wikimedia.org/tawiktionary/20120902/tawiktionary-20120902-pages-meta-current.xml.bz2

size is 22.3 MB

extract the xml dump

	bunzip2 tawiktionary-20120902-pages-meta-current.xml.bz2



tamil codepage on unicode
------------------

	wget http://unicode.org/charts/PDF/U0B80.pdf



build the wordlist
------------------


you have to build a command list and connect them via pipe, if commands is complex or you want to see what is happening you can use tee or save the output to a file and try debugging

knowledge of following commands and ruby is assumed
head tail cut sort uniq 


dump the file in terminal

	cat tawiktionary-20120902-pages-meta-current.xml | tail



find only tamil characters
	cat tawiktionary-20120902-pages-meta-current.xml | tamil_io.rb >tamil.txt


put all the tamil sentences, convert them to words, sort them, identify uniq words with their count, sort but word frequency

	cat tamil.txt | words.rb | sort | uniq -c | sort -n -r > popular_tamil_words.txt

put all the popular words, remove all the leading spaces, remove all the numbers, first 25000 words, word length between 3 and 10 characters, sort them and save it infinal_wordlist.txt

	cat popular_tamil_words.txt | sed -e 's/^[ \t]*//' | cut -d' ' -f2| head -n25000 | word_length.rb |  sort >final_wordlist.txt