#!/bin/bash 

echo "************************************WELCOME TO THE GAMBLER'S SIMULATION**************************************************"

#VARIABLE
stake=100
win=0
loss=0

#CONSTANT
bet=1

if (( $((RANDOM%2)) == 1 ))
then
	((win++))
else
	((loss++))
fi
