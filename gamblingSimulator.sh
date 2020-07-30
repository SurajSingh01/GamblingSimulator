
#!/bin/bash
echo "Welcome to gambling Simulator"

#Intialization of variable 
stakePerDay=100
betPerGame=1
echo "Stakes per day would be \$$stakePerDay"
echo "Bet to be placed per game will be \$$betPerGame"

flip=$(( RANDOM % 2 ))
if [ $flip -eq 1 ]
then
	echo "You won the bet"
	((stakePerDay++))
else
	echo "You lost the bet"
	((stakePerDay--))
fi
echo "You are left with \$$stakePerDay"
