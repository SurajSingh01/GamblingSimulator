
#!/bin/bash
echo "Welcome to gambling Simulator"

#Intialization of variable 
stakePerDay=100
betPerGame=1
echo "Stakes per day would be \$$stakePerDay"
echo "Bet to be placed per game will be \$$betPerGame"

while (( $stakePerDay >50 && $stakePerDay < 150 ))
do
	flip=$(( RANDOM % 2 ))
		if [ $flip -eq 1 ]
		then
			((stakePerDay++))
		else
			((stakePerDay--))
		fi
done
echo "You are left with \$$stakePerDay"
