#A function for bash commands that aren't compatible with Fish. 
function bc
	set cmd $argv[1]
	switch $cmd
		case lpes
			set cmd 'expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg xorg; expac -l '\n' '%E' base; } | sort -u)) | sort -n'
		case lpn
			set cmd 'expac -H M "%-20n\t%10d" $(comm -23 <(pacman -Qqt | sort) <({ pacman -Qqg xorg; echo base; } | sort -u))'
		case lpp
			set cmd 'LC_ALL=C pacman -Qi | awk "/^Name/{name=$3} /^Installed Size/{print $4$5, name}" | sort -h'
		case lp
			set cmd 'expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg xorg; expac -l '\n' '%E' base; } | sort -u)) | sort -n'
		case lped
			set cmd 'awk "/\[ALPM\] installed/ { print $(NF-1) }" /var/log/pacman.log'
		case '*'
			return 1
	end
	#setsid
    bash -i -c $cmd
end
