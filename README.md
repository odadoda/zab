zab
===

A commandline presentationtool written bash script.

The tool reads a textfile and output each new line when you push "m". The text will be horizontally centered and the first line for each "slide" will start 25% from the top.

Example use:
./zab.sh mytextfile.txt

m: next line
n: go back to last slide
q: quit presentation


There are two special formating tags that are available:

"::slide::" : defines a new slide. It will clear the screan and output next line.
"::bold::" : make the appending line bold


Example text in textfile:

::slide::
Bla bla bla bla
Bla bla pjatt pjatt
Bla bla bla
::slide::
Bla bla bla bla
Svada svada svada pjatt
Pjatt pjatt svada pjatt
Bla bla bla 
::slide::
::bold::
Bla bla bla
Bla pjatt pjatt
::bold::
Pjatt svada svada
Svada tran og sana sol
Pjatt pjatt pjatt
