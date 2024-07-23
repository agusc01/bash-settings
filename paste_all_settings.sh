mv -v ~/.bash_aliases{,.bak} &&
mv -v ~/.bash_profile{,.bak} &&
mv -v ~/.bashrc{,.bak} &&
mv -v ~/.gitcustom.sh{,.bak} &&
mv -v ~/.gitconfig{,.bak} &&

cp -v ~/.programming-settings/.bash{_aliases,_profile,rc} ~/ &&
cp -v ~/.programming-settings/.git{config,custom.sh} ~/