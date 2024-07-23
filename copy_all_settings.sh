lines=$(wc -l ~/.gitconfig | awk '{print $1}')
lines=$((lines - 3))

cp -v ~/.bash{_aliases,_profile,rc} ~/.bash-settings/ &&
cp -v ~/.gitcustom.sh ~/.bash-settings/ &&
tail -n $lines ~/.gitconfig > ~/.bash-settings/.gitconfig
echo ".gitconfig copy with <tail>"
