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
MAX_GAMBLING_DAYS=20

#Function to play till the gambler either win or lose 50 percent of the stake
function gambling()
{
	for (( i=1;i<=20;i++ ))
	do
		tempStake=$stake
		while (($stake<$MAX_STAKE_VALUE && $stake>$MIN_STAKE_VALUE ))
		do
			if (( $((RANDOM%2)) == 1 ))
			then
				((stake++))
			else
				((stake--))
			fi
		done
		dailyResult
	done
}

#Function to check how much the amount the gambler has won or lost in that day
function dailyResult()
{
	if (( stake == MAX_STAKE_VALUE ))
	then
		echo "Total amount won at day$i is $stake$"
	elif (( stake == MIN_STAKE_VALUE ))
	then
		echo "Total amount lost at day$i is $(( tempStake -stake ))$"
	fi
	stake=100
}

gambling
