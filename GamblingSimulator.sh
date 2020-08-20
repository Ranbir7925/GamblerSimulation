#!/bin/bash

echo "************************************WELCOME TO THE GAMBLER'S SIMULATION**************************************************"

declare -A day
declare -A result

#VARIABLE
amount=0
tempStake=0


#CONSTANT
STAKE=100
BET=1
MIN_STAKE_VALUE=$(( $STAKE * 50 / 100 ))
MAX_STAKE_VALUE=$(( $STAKE + $MIN_STAKE_VALUE ))
MAX_GAMBLING_DAYS=30

#Function to play till the gambler either win or lose 50 percent of the stake
function gambling()
{
	for (( i=1;i<=MAX_GAMBLING_DAYS;i++ ))
	do
		#Storing the original stake value to compare the gain and losses
		tempStake=$STAKE
		while (( $tempStake < $MAX_STAKE_VALUE && $tempStake > $MIN_STAKE_VALUE ))
		do
			if (( $((RANDOM%2)) == $BET ))
			then
				tempStake=$(( tempStake + BET ))
			else
				tempStake=$(( tempStake - BET ))
			fi
		done
		dailyResult
	done
	wonOrLose
	totalAmount
}

#Function to check how much the amount the gambler has won or lost in that day
function dailyResult()
{
	if (( tempStake == MAX_STAKE_VALUE ))
	then
		echo "Total amount won at day $i is "$(( tempStake - STAKE  ))
		day[won]="${day[won]} $i"
		wins=$(( tempStake - STAKE))
		amount=$(( amount + wins ))

	else
		echo "Total amount lost at day $i is "$(( STAKE - tempStake))
		day[lost]="${day[lost]} $i"
		loss=$(( STAKE - tempStake ))
		amount=$(( amount - loss ))
	fi

	#Storing the days and the min and max amount it holds
	result[$i]=$amount
}


#Function to check total amount remaining at the end of the month
function totalAmount() 
{
	if (( amount>0 ))
	then
		echo "Amount won in a month is $amount"
	else
		echo "Amount lost in a month is $amount"
	fi

	#reinstating the updated value to zero for next simulation
	amount=0

	echo "The Luckiest Day and Amount is resp:"
	luckyOrunlucky head
	echo "The unLuckiest Day and Amount is resp:"
	luckyOrunlucky tail


}

#Function to check the days won and lost
function wonOrLose()
{
    for i in ${!day[@]}
    do
        echo "Days $i -------->${day[$i]}"
    done
}


#Function to determine the luckiest and unluckiest day
function luckyOrunlucky()
{
	for j in ${!result[@]}
	do
		echo "$j ${result[$j]}"
	done | sort -k2 -rn | $1 -1
}

read -p "Press 1 to Play: " choice
while ((choice == 1))
do
	gambling
	read -p "Press 1 to Play Agian: " choice
	unset day[won]
	unset day[lost]
done
echo "EXITING SIMULATION GOODBYE...!!!"
