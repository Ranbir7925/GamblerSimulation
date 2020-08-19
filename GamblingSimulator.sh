#!/bin/bash 

echo "************************************WELCOME TO THE GAMBLER'S SIMULATION**************************************************"

#VARIABLE
stake=100
win=0
loss=0

#CONSTANT
BET=1
MIN_STAKE_VALUE=$(( $stake * 50/100 ))
MAX_STAKE_VALUE=$(( $stake + $MIN_STAKE_VALUE ))

#Playing till stake value reaches to its limit
while (($stake<$MAX_STAKE_VALUE && $stake>$MIN_STAKE_VALUE ))
do
	if (( $((RANDOM%2)) == 1 ))
	then
		((win++))
		((stake++))
	else
		((loss++))
		((stake--))
	fi
done

