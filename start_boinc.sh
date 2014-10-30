# Defaults.
PROJECT='www.gpugrid.net'
WEAK_KEY='60392_2214f23a8f948a0966c26928edb9e30d'

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

