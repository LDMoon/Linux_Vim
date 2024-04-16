iamlegend() {
    echo "stark <filename>   : Make a file executable and run it"
    echo "profane <filename> : Make a file executable"
    echo "sync333            : Sync the CS333 directory with the server"
    echo "syncmene           : Sync the EscapeWright directory with the raspberry pi"
    echo "python             : Use python3"
    echo "x, eixt, or exti   : Exit"
    echo "hosts              : List all hosts in my ssh config"
}

# Sync with the CS333 server
alias sync333='rsync -avz /home/lodomo/PSU/CS333/ lhaskins@babbage.cs.pdx.edu:/u/lhaskins/CS333'

# Sync with the raspberry pi
alias syncmene1='rsync -avz /home/lodomo/Lodomo.Dev/EscapeWright/ lodomo@mene.local:/home/lodomo/EscapeWright'
alias syncmene2='rsync -avz /home/lodomo/Lodomo.Dev/code_samurai/ lodomo@mene.local:/home/lodomo/code_samurai'
alias syncmene='syncmene1 && syncmene2'

alias python="python3"

# Make a file executable
alias profane='chmod a+x'

stark() {
    profane "$1" && ./"$1"
}

alias eixt="exit"
alias exti="exit"
alias x="exit"

# Prints all hosts in my config file.
alias hosts="grep '^Host ' ~/.ssh/config"
