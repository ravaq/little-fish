#besme-Allah

#if status is-interactive
    # Commands to run in interactive sessions can go here
#end

set -g EDITOR micro

## Aliases

alias sd='sudo '
alias sudo='sudo '

#Package manage
alias pmu='sudo pacman -Syu'    # Update the system and upgrade all system packages.
alias pin='sudo pacman -S'      # Install a specific package from repos added to the system
alias pmd='sudo pacman -U'      # Install specific package that has been downloaded to the local system
alias pir='pacman -Si'          # Display information about a given package located in the repositories
alias pil='pacman -Qi'          # Display information about a given package in the local database
alias pmss='pacman -Ss'         # Search for package or packages in the repositories
alias prr='sudo pacman -R'     # Remove the specified package but retain its configuration and deps
alias pr='sudo pacman -Rns'    # Remove package, its configuration and all unwanted dependencies
alias pmc='sudo pacman -Scc'
alias pq='pacman -Q'            # Query the package database
alias pqq='pacman -Qq'          # Query the package database, with less information
alias pqo='pacman -Qo'          # Query the package that owns FILE
alias pqe='pacman -Qqe'         # List explicitly installed packages
alias pqs='pacman -Qs'          # Search for package/packages in the local database
alias pqf='pacman -Qql'         # List the files owned by PACKAGE
alias pqro='pacman -Qtdq | sudo pacman -Rns -'
alias pqroo='pacman -Qtdq | sudo pacman -R -'


alias uu='yay'
alias uy='yay -Syua'       # Synchronize with repositories and upgrade packages, including AUR packages.
alias uui='yay -S'         # Install a specific package from repos added to the system.
alias uli='yay -U'         # Install specific package that has been downloaded to the local system
alias urr='yay -R'         # Remove package but retain configs and required dependencies
alias ur='yay -Rns'        # Remove package or packages, its configuration and all unwanted dependencies
alias yp='yay -Ps'         # Print system statistics.
alias ylu='yay -Pu'        # print update list
alias yc='yay -Yc'         # Clean unneeded dependencies.
alias ycs='yay -Sc'        # Remove packages from cache.
alias yip='yay -Si'        # Display information about a given package located in the repositories
alias ypb='yay -G'         # Download PKGBUILD from ABS or AUR.
alias yss='yay -Ss'        # Search for package or packages in the repositories
alias yl='yay -Qe'         # List installed packages, even those installed from AUR (they're tagged as "local")
alias yro='yay -Qtd'       # Remove orphans using yay
alias ydw='yay -Wu'        # Unvote for AUR package (Requires setting AUR_USERNAME and AUR_PASSWORD environment variables)
alias yup='yay -Wv'        # Vote for AUR package (Requires setting AUR_USERNAME and AUR_PASSWORD environment variables)

#List commands
alias lc='compgen -c | sort -u'
alias la='compgen -a | sort -u'
alias lb='compgen -b | sort -u'
alias lk='compgen -k | sort -u'
alias lf='compgen -A function | sort -u'
alias lA='compgen -A function -abck | sort -u'

alias mpi='makepkg -si'

#Package list

alias lpti='expac --timefmt="%Y-%m-%d %T"-H M "%011l\t%-11m\t%-25n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg xorg; expac -l "\n" "%E" base; } | sort -u)) | sort -n'
alias lpd='expac --timefmt="%Y-%m-%d %T" -H M "%011l\t%-9m\t%-25n\t%10d" | sort -n'
alias lpf='expac -H M "%-13m\t%-20n\t%10d" | sort -n'
alias lpl='expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort | tail -n 20'
alias lpes='expac -H M "%011m\t%-20n\t%10d" $(comm -23 (pacman -Qqen | sort | psub) (begin; pacman -Qqg xorg; expac -l '\n' '%E' base; end | sort -u | psub)) | sort -n'
alias lped='bc lped'
alias lp='bc lp'
alias lpp='bc lpp'
alias lpn='bc lpn'



alias g='git'
#Folders and files
alias gitf='cd ~/.git'
#alias gitg='getgit'
alias giti='getgit -i'

alias ficon='lite-xl ~/.config/fish/config.fish'

alias oh='xdg-open ./'
#alias suoh='gksudo xdg-open ./'
alias cachy='xdg-open /home/mhm/.cache/yay'
alias cachp='xdg-open /var/cache/pacman/pkg'
alias rcap='sudo rm /var/cache/pacman/pkg/*'
alias rcay='sudo rm -r /home/mhm/.cache/yay/*'
alias rcat='sudo rm -r /var/tmp/*'
alias cca='rcay && rcap && rcat'


#alias dus='du  * | sort -nr | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done'

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias cls='clear'

#web
alias arcdb='web_query --arch'
alias aurdb='web_query --aur'
alias google='web_query --ggl'
alias alts='web_query --alt'
alias gthb='web_query --gthb'
alias gourl='web_query --url'
alias compr='web_query --vs'

alias exiso='extract-xiso'


#Lite-xl plugin manager
alias lxpi='lpm install'
alias lxpr='lpm uninstall'
alias lxpu='lpm upgrade'

alias wshr='windowshare'
alias wshru='sudo umount  ~/Documents/windowshare'

alias ulock='sudo rm /var/lib/pacman/db.lck'
