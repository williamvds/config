num=$(($(checkupdates 2> /dev/null | wc -l) + $(cower -u 2> /dev/null | wc -l)))

((num < 1)) && echo '' && exit 0;

echo "%{F#bbb}$num"
