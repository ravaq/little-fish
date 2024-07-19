#A function for listing installed packages info in a few diffrent ways. 

function list-packages
	set isfish true
	set cmd $argv[1]
	switch $cmd
		case d
			set cmd 'expac --timefmt="%Y-%m-%d %T" -H M "%011l\t%-9m\t%-25n\t%10d" | sort -n'
		case f
			set cmd 'expac -H M "%-13m\t%-20n\t%10d" | sort -n'
		case l
			set cmd 'expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort | tail -n 20'
		case s
			set cmd 'expac -H M "%011m\t%-20n\t%10d" $(comm -23 (pacman -Qqen | sort | psub) (begin; pacman -Qqg xorg; expac -l '\n' '%E' base; end | sort -u | psub)) | sort -n'
		case n
			set cmd 'expac -H M "%-20n\t%10d" $(comm -23 <(pacman -Qqt | sort) <({ pacman -Qqg xorg; echo base; } | sort -u))'
			set isfish false
		case e
			set cmd 'awk "/\[ALPM\] installed/ { print $(NF-1) }" /var/log/pacman.log'
			set isfish false
		case t
			set cmd 'expac --timefmt="%Y-%m-%d %T"-H M "%011l\t%-11m\t%-25n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg xorg; expac -l "\n" "%E" base; } | sort -u)) | sort -n'
			set isfish false
		case p #not working
			set cmd 'LC_ALL=C pacman -Qi | awk "/^Name/{name=$3} /^Installed Size/{print $4$5, name}" | sort -h'
			set isfish false
		case '*'
			echo 'invalid option!'
			return 1
	end
	
	#setsid
	if $isfish
		fish -c $cmd
  else
		bsh $cmd
  end	
end
