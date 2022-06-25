# Remove some default aliases
unalias ll la l alert 2>/dev/null

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# List all files in long format with numerical permissions
# Based on http://stackoverflow.com/a/1796009
function ll() {
	CLICOLOR_FORCE=1 \ls -lha ${LS_GNU:+--color=always --group-directories-first} "$@" \
	 | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));if(k)printf("%0o ",k);print}'
}

alias ~='cd ~'
alias ..='cd ..'

alias rm='rm -v'

alias igrep='grep -i'
