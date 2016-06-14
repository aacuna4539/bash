#!/bin/bash
# (@)/ph
# Simple phone list
# To add a new number, type "ph new name number"
# To retrieve a number, type "ph name"

PHONELIST=~/.phonelist.txt

# If no params
if [ $# -lt 1 ] ; then
  echo "Whose number did you want?"
    exit 1
fi

# Add a number
if [ $1 = "new" ] ; then
  shift
    echo $* >> $PHONELIST
    echo $* added to database
    exit 0
fi

if [ ! -s $PHONELIST ] ; then
  echo "No names in list. "
  exit 1
else
  grep -i -q "$*" $PHONELIST	# search the file
  if [ $? -ne 0 ] ; then		  # anything found?
    echo "Sorry, I couldn't find that name."
    exit 1
  else
    grep -i "$*" $PHONELIST
  fi
fi

exit 0
