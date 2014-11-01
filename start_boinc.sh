# Defaults.
PROJECT='http://milkyway.cs.rpi.edu/milkyway/'
WEAK_KEY='1030352_7eb410c3bc96876f7eb90192ded60f26'

# Argument parsing.
while getopts ':p:w' flag
    
do
    case $flag in
        p) PROJECT=$OPTARG;;
        w) WEAK_KEY=$OPTARG;;
        \?) help; exit 2;;
    esac
done

# Start BOINC.
/usr/bin/boinc \
  --attach_project \
    $PROJECT \
    $WEAK_KEY \
  --no_priority_change

