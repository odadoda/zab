#!/bin/bash

#########################################
#   sub-routines
########################################

print_line(){

    	current_line=$(awk "NR==$current_row" "$FILE")
	current_line_char_count=${#current_line};
	total_line=`expr "$current_line_char_count" '+' "$width"`;
    	
	tput me
    	format=$1

    	case $format in
        	("bold") tput bold;;
    	esac

    	#printf "%*s\n\n" `expr "$total_line" "/" 2`  "$current_line"; 
	printf "%30s %s\n\n" ""  "$current_line";
}


## slide
slide(){
    tput cl;
    tput cup `expr "$height" "/" 4` 0; 
    next;
}

## bold
bold(){
    current_row=`expr $current_row '+' 1`;
    print_line bold;
}


## next: 
## update line number, get line, check line, if line is speciel line, do speciel line trix, then repeat
next(){

	current_row=`expr $current_row '+' 1`;
	current_line=$(awk "NR==$current_row" "$FILE");
	
	case $current_line in
		("::slide::") 
			slide;;

		("::b::") 
	        	bold;;
		( * ) 
			print_line;;
	esac

}


## prev: 
## go back to last "::slide::" point, and write 
prev(){
	lines_before_slide_mark=0;
	current_row=`expr $current_row '-' 1`;
	current_line=$(awk "NR==$current_row" "$FILE");	

	if [ "$current_line" '=' '::slide::' ]; then
		prev;
	fi
	
	while [ ! "$current_line" '=' "::slide::" ] && [ "$current_row" -gt 0 ]; do
                lines_before_slide_mark=`expr $lines_before_slide_mark '+' 1`;
  		current_row=`expr $current_row '-' 1`;
		current_line=$(awk "NR==$current_row" "$FILE");
	done

	if [ "$lines_before_slide_mark" -eq 1 ]; then
		current_line=`expr $current_line '-' 2`;
      		prev;
	else 
		slide;
	fi
}




#########################################
#   App Start: check input
########################################


if [ -z $1 ] ; then
    echo "Usage: ./zab [filename]"
    exit
else
    FILE="$1"
fi 

if [ ! -f $FILE ] ; then
   echo "File not found"
   exit
fi


# clear space and reset style
tput cl
tput reset

# reset style
tput me

# count lines
file_lines_count=`cat $FILE | wc -l`;

height=$(tput lines);
width=$(tput cols);

current_row=0
current_line="x";


######################################
#    Main loop
#####################################


## wait for input
read -n 1 -s INPUT

#  Valid input:
#  
#  m: next line / slide
#  n: previous slide
#  q: quit presenter

while [ "$INPUT" != "q" ]; do

    case "$INPUT" in
        ( "m" ) 
		next;;
        ( "n" ) 
		prev;;
    	( "*" ) 
		echo "wtf";;
    esac


    if [ "$current_row" -lt 0 ] ; then 
        current_row=0
    fi

    if [ "$current_row" -gt "$file_lines_count" ] ; then 
        current_row=$file_lines_count
    fi

    # next input
    read -n 1 -s INPUT

done
