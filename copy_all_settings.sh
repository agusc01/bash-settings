lines=$(wc -l ~/.gitconfig | awk '{print $1}')
lines=$((lines - 3))

cp -v ~/.bash{_aliases,_profile,rc} ~/.programming-settings/ &&
cp -v ~/.gitcustom.sh ~/.programming-settings/ &&
tail -n $lines ~/.gitconfig > ~/.programming-settings/.gitconfig
echo ".gitconfig copy with <tail>"
