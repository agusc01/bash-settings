# backup time !
mv -v ~/.bash_aliases{,.bak}
mv -v ~/.bash_profile{,.bak} 
mv -v ~/.bashrc{,.bak} 
mv -v ~/.gitcustom.sh{,.bak} 
mv -v ~/.gitconfig{,.bak} 

# paste time !
cp -v ~/.bash-settings/.bash{_aliases,_profile,rc} ~/ 
cp -v ~/.bash-settings/.git{config,custom.sh} ~/
