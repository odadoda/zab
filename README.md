zab
===

A commandline presentationtool written bash script

Example use:
./zab.sh mytextfile.txt

The tool reads a textfile and output each new line when you push "m". The text will be horizontally centered and the first line for each "slide" will start 25% from the top.

There are two special formating tags that is available:

"::slide::" : defines a new slide. It will clear the screan and output next line.
"::bold::" : make the appending line bold
