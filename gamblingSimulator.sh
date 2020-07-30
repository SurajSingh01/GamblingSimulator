
#!/bin/bash -x
echo "Welcome to gambling Simulator"

#Intialization of variable 
STAKE_PER_DAY=100
betPerGame=1
daysPlayed=1
total=0
totalDays=30
newStake=0

echo "Stakes per day would be \$$STAKE_PER_DAY"
echo "Bet to be placed per game will be \$$betPerGame"

function betPerDay()
{
	while (( $daysPlayed <= $totalDays ))
	do
		newStake=$(( $newStake + $STAKE_PER_DAY ))
		minimumStake=$(( $newStake / 2 ))
		maximumStake=$(( $newStake + $minimumStake ))
		while (( $newStake > $minimumStake && $newStake < $maximumStake ))
		do
			flip=$(( RANDOM % 2 ))
			if [ $flip -eq 1 ]
			then
				(( newStake++ ))
			else
				(( newStake-- ))

			fi
		done
		if [ $newStake -eq $maximumStake ]
		then
			echo "On Day $daysPlayed you have won by $minimumStake "
		else
			echo "On Day $daysPlayed you have loss by $minimumStake"
		fi
		(( daysPlayed++ ))
	done
}

echo "********Daily win and loss ammount ******************"
betPerDay
