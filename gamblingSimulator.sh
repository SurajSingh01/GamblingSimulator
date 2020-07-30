
#!/bin/bash -x
echo "Welcome to gambling Simulator"

#Intialization of variable 
stakePerDay=100
betPerGame=1
daysPlayed=0
total=0
echo "Stakes per day would be \$$stakePerDay"
echo "Bet to be placed per game will be \$$betPerGame"

while (( $daysPlayed < 20 ))
do
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
	total=$(( $total + $stakePerDay))
	(( daysPlayed++ ))
done

echo "Total amount bet in the 20 days is \$$total"
if [ $total -ge 2000 ]
then
	echo "You are in profit in last 20 days "
	echo "Total profit is \$$(( $total - 2000 ))"
else
	echo "You are in loss in last 20 days "
	echo "Total loss is \$$(( 2000 - $total ))"
fi
