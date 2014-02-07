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

"::bold::" : make the appending line bold.


Example text in textfile:

::slide::<br/>
Bla bla bla bla<br/>
Bla bla pjatt pjatt<br/>
Bla bla bla<br/>
::slide::<br/>
Bla bla bla bla<br/>
Svada svada svada pjatt<br/>
Pjatt pjatt svada pjatt<br/>
Bla bla bla <br/>
::slide::<br/>
::bold::<br/>
Bla bla bla<br/>
Bla pjatt pjatt<br/>
::bold::<br/>
Pjatt svada svada<br/>
Svada tran og sana sol<br/>
Pjatt pjatt pjatt<br/>
