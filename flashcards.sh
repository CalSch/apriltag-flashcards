#!/usr/bin/bash

TAGS=586
echo -n "How many tags? "
read TAGS

correct=0
incorrect=0

last_tag=0

print_tag() {
    fname=$(printf 'tag36h11/tag36_11_%05d.png' $1)
    timg $fname
}
get_random_tag() {
    t=$last_tag
    while [ "$t" = "$last_tag" ]; do
        t=$(($RANDOM % $TAGS + 1))
    done
    last_tag=$t
    echo $t
}
ask() {
    clear
    tag=$(get_random_tag)
    print_tag $tag
    echo -n "Tag ID: "
    read guess
    if [ "$guess" = "$tag" ]; then
        echo "Correct!"
        correct=$(($correct + 1))
        sleep 0.6
    else
        echo "Incorrect. The tag ID is $tag"
        echo "Press enter to continue"
        incorrect=$(($incorrect + 1))
        read
    fi
}

while true; do
    ask
done