function paclist
	argparse 's/size' 'n/name' -- $argv

	alias listpac="pacman -Qi$argv | grep -E '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nk 2 | grep --color=never"
	listpac KiB
	listpac MiB
end

