export HISTTIMEFORMAT="%F %T "

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/ngg/script.sh ]; then
  . ~/ngg/script.sh
fi

if [ -f ~/.gitcustom.sh ]; then
  . ~/.gitcustom.sh

  build_prompt

  PROMPT_COMMAND="build_prompt; $PROMPT_COMMAND"    
fi
