
#!/bin/bash -x
echo "Welcome to gambling Simulator"

#Intialization of variable 
STAKE_PER_DAY=100
betPerGame=1
daysPlayed=1
total=0
totalDays=30
newStake=0
maxLost=0
maxWon=0
dayLost=0
dayWon=0
totalWon=0
totalLoss=0
investment=$(( $STAKE_PER_DAY * $totalDays ))

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
			#echo "Day $daysPlayed you have won by \$$minimumStake"
			totalWon=$(( $totalWon + $minimumStake))
			if [ $minimumStake -gt $maxWon ]
			then
				maxWon=$minimumStake
				dayWon=$daysPlayed
			fi
		else
			#echo "Day $dayPlayed you have lost by \$$minimumStake"
			totalLoss=$(( $totalLoss + $minimumStake ))
			if [ $minimumStake -gt $maxLost ]
			then
				maxLost=$minimumStake
				dayLost=$daysPlayed
			fi
	fi
		(( daysPlayed++ ))
done
	#echo "Day $dayWon is your luckiest day as you won \$$maxWon " 
	#echo "Day $dayLost is your unluckiest day as you have lost \$$maxLost"
	echo "***********************************Decision**********************************************"
	echo "Total amount invested in a month is \$$investment "
	echo "Total amount won in a month is \$$totalWon"
	echo "Total amount loss in a month is \$$totalLoss"

	if [ $totalWon -ge $investment ] && [ $totalLoss -lt $investment ]
	then
		echo "You are in profit of \$$(( $totalWon - $investment )) so you can continue "
	else
		echo "You are in loss of \$$(( $totalLoss - $investment )) so you should quit"
	fi
}
betPerDay

