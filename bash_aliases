# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Based on http://stackoverflow.com/a/1796009
unalias ll 2>/dev/null
function ll() {
	ls -lha | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));if(k)printf("%0o ",k);print}'
}

alias ..='cd ..'

alias rm='rm -v'
