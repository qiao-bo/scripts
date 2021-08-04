#!/bin/bash

prog=$1

# functions
function printValuesOfInterest {
	values=$(./$1 2>&1 | grep Kernel | tr "(" " " | awk '{ print $6 }') 
	echo $values 
}


RESULTS=""
NEWLINE=$'\n'
for i in {1..50..1}
do
	echo "ie $i"
	out=$(printValuesOfInterest $prog)
	RESULTS="$RESULTS$out$NEWLINE"
done

## get number of field in awk
#nrCol=$(echo "$RESULTS" | head -n 1 | awk '{print NF}')
#
##echo "the average execution time for each kernel: "
#for i in $(seq 1 $nrCol) 
#do
#	echo "$RESULTS" | awk '{ kernel += $i } END { print kernel/(NR-1) }'
#done

echo "$RESULTS" | awk '{ kernel1 += $1 } END { print kernel1/(NR-1) }'
echo "$RESULTS" | awk '{ kernel2 += $2 } END { print kernel2/(NR-1) }'
#echo "$RESULTS" | awk '{ kernel3 += $3 } END { print kernel3/(NR-1) }'
#echo "$RESULTS" | awk '{ kernel4 += $4 } END { print kernel4/(NR-1) }'
#echo "$RESULTS" | awk '{ kernel5 += $5 } END { print kernel5/(NR-1) }'
#echo "$RESULTS" | awk '{ kernel6 += $6 } END { print kernel6/(NR-1) }'
#echo "$RESULTS" | awk '{ kernel7 += $7 } END { print kernel7/(NR-1) }'
#echo "$RESULTS" | awk '{ kernel8 += $8 } END { print kernel8/(NR-1) }'
#echo "$RESULTS" | awk '{ kernel9 += $9 } END { print kernel9/(NR-1) }'

