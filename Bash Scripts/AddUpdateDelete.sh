echo "How would you like to modify the data?"
echo "1) Add"
echo "2) Update"
echo "3) Delete"
echo "4) Quit previous"

counter=$((1))
read userselectionB
export userselectionB
#OPT 1 
if [ $userselectionA -eq "1" ]
    then
        sh ./AdminBookAuthor.sh
#OPT 2
elif [ $userselectionA -eq "2" ]
    then
        sh ./AdminPublisher.sh
#OPT 3
elif [ $userselectionA -eq "3" ]
    then
        sh ./AdminBranch.sh
        #OPT 3
elif [ $userselectionA -eq "4" ]
    then
        sh ./AdminBorrower.sh
else
        sh ./mainmenu.sh
fi