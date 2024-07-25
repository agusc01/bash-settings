git() {
    if [[ "$1" == "reset" ]]; then
        if [[ "$2" == "--hard" ]]; then
            echo -e "\n${RED}Command not available${NC}"
            echo -e "\nYou can do:\n"
            echo -e "\t${YELLOW}git rhardh <hash>.${NC}"
            echo -e "\t${YELLOW}git rhardn <relative number>${NC}"
            echo -e "\nDon't forget that you can do:"
            echo -e "\t${GREEN}git backup"
            echo -e "\t${GREEN}git check-backup\n"
            return
        elif [[ "$2" == "--soft" ]]; then
            echo -e "\n${RED}Command not available${NC}"
            echo -e "\nYou can do:\n"
            echo -e "\t${YELLOW}git rsofth <hash>.${NC}"
            echo -e "\t${YELLOW}git rsoftn <relative number>${NC}"
            echo -e "\nDon't forget that you can do:"
            echo -e "\t${GREEN}git backup"
            echo -e "\t${GREEN}git check-backup\n"
            return
        elif [[ "$2" == "--mixed" ]]; then
            echo -e "\n${RED}Command not available${NC}"
            echo -e "\nYou can do:\n"
            echo -e "\t${YELLOW}git rmixedh <hash>.${NC}"
            echo -e "\t${YELLOW}git rmixedn <relative number>${NC}"
            echo -e "\nDon't forget that you can do:"
            echo -e "\t${GREEN}git backup"
            echo -e "\t${GREEN}git check-backup\n"
            return
        fi

    elif [[ "$1" == "commit" ]]; then
        if [[ "$2" == "--amend" ]]; then
            echo -e "\n${RED}Command not available${NC}"
            echo -e "\nYou can do:\n"
            echo -e "\t${YELLOW}git amend${NC}\n"
            return
        fi
    fi
    command git "$@"
}

build_prompt() {
    local user="${GREEN}\u${NC}"
    local date="${BLUE}$(date "+%Ths")${NC}"
    local directory="${YELLOW}\w${NC}"
    if is_git_repository; then
        local git_branch="${BLUE}($(git_current_branch))${NC}"
    fi
    local git_user=$(get_git_user)
    local data=$(echo -e "$user $date $directory $git_branch $git_user\n\$ ")
    export PS1="$data"
}


is_git_repository() {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        return 0  # It's a repository Git
    else
        return 1  # It isn't a repository Git
    fi
}

git_current_branch() {
   echo $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
}

get_git_user() {
    if is_git_repository; then
        local user_name_local=$(git config --local user.name)

        if [ -n "$user_name_local" ]; then
            echo -e "${GREEN}local: $user_name_local${NC}"
            return
        fi
    fi

    local user_name_global=$(git config --global user.name)
    if [ -n "$user_name_global" ]; then
        echo -e "${GREEN}global: $user_name_global${NC}"
        return
    fi

    echo -e "${RED}Not logged yet!${NC}";
    return
}
